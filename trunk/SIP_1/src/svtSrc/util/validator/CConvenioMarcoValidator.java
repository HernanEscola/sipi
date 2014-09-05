package conicet.apps.svt.util.validator;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.object.convenioMarco.CConvenioMarco;
import conicet.apps.svt.object.convenioMarcoItem.CConvenioMarcoItem;
import conicet.apps.svt.object.entidad.COrganismo;
import conicet.apps.svt.object.gestor.CUvt;
import conicet.apps.svt.service.CConvenioMarcoService;
import conicet.framework.error.CException;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.validator.CValidator;

public class CConvenioMarcoValidator extends CValidator {

	public void validarDenominacion(String denominacion) throws CException {
		String[] mensaje = new String[1];
		if (StringUtils.isEmpty(denominacion)) {
			mensaje[0] = "La Denominación";
			this.addError("errors.required", mensaje, true);
	    }
	}

	public void validarTipoServicio(String tipoServicio) throws CException {
		String[] mensaje = new String[1];
		if (!CComboWrapper.isSeleccionado(tipoServicio)){
			mensaje[0] = "El tipo de servicio";
			this.addError("errors.required", mensaje, true);
	    }
	}

	public void validarTipoConvenio(String tipoConvenioSelected) throws CException {
		String[] mensaje = new String[1];
		if (!CComboWrapper.isSeleccionado(tipoConvenioSelected)){
			mensaje[0] = "El tipo de convenio";
			this.addError("errors.required", mensaje, true);
	    }
	}

	public void validarUvtLote(Collection<CUvt> uvtLote) throws CException {
		String[] mensaje = new String[1];
		if (uvtLote ==null || uvtLote.size()==0){
			mensaje[0] = "Debe seleccionar al menos una UVT";
			this.addError("errors.dynamic", mensaje, true);
	    }
	}

	public void validarOrganismosYRoles(Collection organismosLote, String tipoConvenioSelected,
			Map mapaTipoOrganismoMapped, List<CConvenioMarcoItem> colDistribucion, List colPorcentajes,List<CConvenioMarcoItem> colDistribucionAI, List colPorcentajesAI) throws CException {
		boolean existeUniversidad = false;
	    boolean existeInstituto = false;
	    boolean existeUnidad = false;
	    boolean existeRol = true;
		if (organismosLote == null) {
			String[] mensaje = new String[1];
			mensaje[0] = "Seleccionar organismos";
			this.addError("errors.required", mensaje, true);
	    }
	    else if (CComboWrapper.isSeleccionado(tipoConvenioSelected)){
	          //validacion de que se halla seleccionado un rol y que uno sea universidad y otro instituto
	          //además si el tipo de convenio es univ/persona no valido que existe un instituto
	          for (Iterator iter = organismosLote.iterator(); iter.hasNext(); ) {
	        	  COrganismo item = (COrganismo) iter.next();
	        	  if ("-1".equalsIgnoreCase((String)mapaTipoOrganismoMapped.get(item.getId().toString())) ||
	                ("-2".equalsIgnoreCase((String)mapaTipoOrganismoMapped.get(item.getId().toString())))) {
	        		  existeRol = false;
	        	  }
	            //if (this.getTipoConvenioSelected().equalsIgnoreCase("1")){
	        	  if ("I".equalsIgnoreCase((String)mapaTipoOrganismoMapped.get(item.getId().toString()))){
	            		existeInstituto = true;
	        	  }
	            //}
	        	  if ("V".equalsIgnoreCase((String)mapaTipoOrganismoMapped.get(item.getId().toString()))) {
					existeUniversidad = true;
				}
	            //esto lo hago para validar luego que se ponga un porcentaje y un comparador sobre la U Acad
	            //(VER más abajo!!!!)
	        	  if ("U".equalsIgnoreCase((String)mapaTipoOrganismoMapped.get(item.getId().
	                    toString()))) {
					existeUnidad = true;
				}
	          }

	          if (!existeRol) {
	        	  String[] mensaje = new String[1];
	        	  mensaje[0] = "El rol del organismo";
	        	  this.addError("errors.required", mensaje, true);
	          }
	          if (tipoConvenioSelected.equalsIgnoreCase("1")){
	        	  if (!existeInstituto) {
	        		  String[] mensaje = new String[1];
	        		  mensaje[0] = "Uno de los organismos debe ser un Instituto.";
		        	  this.addError("errors.dynamic", mensaje, true);
	        	  }
	          }
	          if (!existeUniversidad) {
	        	  String[] mensaje = new String[1];
	        	  mensaje[0] = "Uno de los organismos debe ser un Inst. Contraparte.";
	        	  this.addError("errors.dynamic", mensaje, true);
	          }
	          //si el tipo de convenio es univ-persona no permito que ninguno de los intervinientes sea UAcademica.
	          if (tipoConvenioSelected.equalsIgnoreCase("2")){
	        	  if (existeUnidad || existeInstituto){
	        		  String[] mensaje = new String[1];
	        		  mensaje[0] = "El interviniente no coincide con el tipo de Convenio Marco.";
		        	  this.addError("errors.dynamic", mensaje, true);
	        	  }
	          }
	    }
		validarPorcentajeComparadorYOrganismoSeleccionado(colDistribucion,existeUniversidad,existeInstituto,existeUnidad,colPorcentajes,"Distribución Serv.") ;
		validarPorcentajeComparadorYOrganismoSeleccionado(colDistribucionAI,existeUniversidad,existeInstituto,existeUnidad,colPorcentajesAI,"Distribución Ases.");

	}

	public void validarPorcentajeDistribucion(List<CConvenioMarcoItem> colDistribucion,List colPorcentajes,String dondeEsElError) throws CException {
		BigDecimal totalDistribuirStan = new BigDecimal("0.00");
		BigDecimal totalComisionesStan = new BigDecimal("0.00");
		BigDecimal porcentaje = null;
		//Iterator<String> iterPorcentajes = colPorcentajes.iterator();
		for (CConvenioMarcoItem item : colDistribucion) {
			/*if (esAlta){
				String porcentajeString = iterPorcentajes.next();
	        	if (StringUtils.isNotEmpty(porcentajeString)) {
					porcentaje = new BigDecimal(porcentajeString);
				}
			}
			else{*/
				porcentaje = item.getPorcentaje();
			//}
			if((item.getTipoEgreso().getCodigo().equalsIgnoreCase("PRO")||item.getTipoEgreso().getCodigo().equalsIgnoreCase("INS"))&&
					porcentaje!=null){
				totalDistribuirStan = totalDistribuirStan.add(porcentaje);
			}
			else if (porcentaje!=null){
				totalComisionesStan = totalComisionesStan.add(porcentaje);
			}
		}
		if (totalDistribuirStan.compareTo(new BigDecimal("100.00"))!=0){
			String[] mensaje = new String[1];
			mensaje[0] = "La suma de los valores de Productividad e Instituto no es igual al 100%, en "+dondeEsElError;
			this.addError("message.dynamic", mensaje, false);
		}
		if (totalComisionesStan.compareTo(new BigDecimal("100.00"))>0 || totalComisionesStan.compareTo(new BigDecimal("0.00"))==0){
			String[] mensaje = new String[1];
			mensaje[0] = "La suma de los valores de las comisiones debe ser mayor a 0% y menor o igual al 100%, en "+dondeEsElError;
			this.addError("errors.dynamic", mensaje, true);
		}
	}

	private void validarPorcentajeComparadorYOrganismoSeleccionado(List<CConvenioMarcoItem> colDistribucion
			, boolean existeUniversidad, boolean existeInstituto, boolean existeUnidad, List colPorcentajes,String dondeEsElError) throws CException {
	    //para saber si completo tanto el porcentaje como el comparador
	    boolean existePorcentajeComp = true;
	    //es para ver si selecciono alguno de los porcentajes y el comparador
	    int contador = 0;
	    BigDecimal ceroBigDecimal = new BigDecimal(0);
	    BigDecimal porcentaje = null;
		//validacion de que se seleccione un comparador y su porcentaje
        //y que al menos una de las parte tenga algo seleccionado
        //Iterator<String> iterPorcentajes = colPorcentajes.iterator();
        for (Iterator iter = colDistribucion.iterator(); iter.hasNext() && existePorcentajeComp != false; ) {
        	CConvenioMarcoItem item = (CConvenioMarcoItem) iter.next();
        	/*if (esAlta){
				String porcentajeString = iterPorcentajes.next();
	        	if (StringUtils.isNotEmpty(porcentajeString)) {
					porcentaje = new BigDecimal(porcentajeString);
				}
			}
			else{*/

        		porcentaje = item.getPorcentaje();

			//}
        	if(porcentaje != null && !(porcentaje.compareTo(ceroBigDecimal) <= 0)){
        		// si eligio un porcentaje comparador
        		if (!("-1".equalsIgnoreCase(item.getTipoComparador().getId().toString())) &&
	                ! ("-2".equalsIgnoreCase(item.getTipoComparador().getId().toString()))) {
        			existePorcentajeComp = true;
        		}
        		else{
        			//tiene seleccionado porcentaje pero no tiene comparador
        			existePorcentajeComp = false;
        		}
	            //si tiene seleccionado comparador y porcentaje
	            if (existePorcentajeComp){
	            	//si tiene seleccionado comparador y porcentaje, verifico que si completo el procentaje y el
	                //comparador de universidad o unidad o inst, haya seleccionado un organismo como ese tipo.
	            	if(item.getTipoEgreso().getCodigo().equalsIgnoreCase("UAC") && !existeUnidad ){
	            		String[] mensaje = new String[1];
	 	      			mensaje[0] = "Debe seleccionar a algún organismo como Unidad Académica, si completó el porcentaje y el comparador correspondiente, en "+dondeEsElError;
	 	      			this.addError("errors.dynamic", mensaje, true);
	 	          	}
	 	            //si es instituto el que no tiene porcentaje y comparador
	 	            //y existe instituto seleccionado en el lote de organismos
	 	            if(item.getTipoEgreso().getCodigo().equalsIgnoreCase("INS") && !existeInstituto){
	 	            	String[] mensaje = new String[1];
	 	            	mensaje[0] = "Debe seleccionar a algún organismo como Instituto, si completó el porcentaje y el comparador correspondiente, en "+dondeEsElError;
	 	      			this.addError("errors.dynamic", mensaje, true);
	 	            }
	 	            //si es universidad el que no tiene porcentaje y comparador
	 	            //y existe universidad seleccionado en el lote de organismos
	 	            if(item.getTipoEgreso().getCodigo().equalsIgnoreCase("ICO") && !existeUniversidad ){
	 	            	String[] mensaje = new String[1];
	 	            	mensaje[0] = "Debe seleccionar a algún organismo como Inst. Contraparte, si completó el porcentaje y el comparador correspondiente, en "+dondeEsElError;
	 	      			this.addError("errors.dynamic", mensaje, true);
	 	            }
	            }
        	}
        	//veo si tiene seleccionado algun comparador y el porcentaje está vacío
        	else if(! ("-1".equalsIgnoreCase(item.getTipoComparador().getId().toString())) &&
        			! ("-2".equalsIgnoreCase(item.getTipoComparador().getId().toString()))){
                  	existePorcentajeComp = false;
            }
           	else{
                 //incremento el contador
                 contador=contador+1;

                 //validar que si no selecciono comparador y porcentaje para un organismo no lo tenga seleccionado
 	             //pregunto si es el item unidad ejecutora y me fijo que si existe organismo seleccionado como unidad academica
 	             if(item.getTipoEgreso().getCodigo().equalsIgnoreCase("UAC") && existeUnidad ){
 	            	String[] mensaje = new String[1];
 	      			mensaje[0] = "Si seleccionó algún organismo como Unidad Académica, debe completar el porcentaje correspondiente, en "+dondeEsElError;
 	      			this.addError("errors.dynamic", mensaje, true);
 	          	 }
 	             //si es instituto el que no tiene porcentaje y comparador
 	             //y existe instituto seleccionado en el lote de organismos
 	             if(item.getTipoEgreso().getCodigo().equalsIgnoreCase("INS") && existeInstituto){
 	            	String[] mensaje = new String[1];
 	            	mensaje[0] = "Si seleccionó algún organismo como Instituto, debe completar el porcentaje correspondiente, en "+dondeEsElError;
 	      			this.addError("errors.dynamic", mensaje, true);
 	             }
 	             //si es universidad el que no tiene porcentaje y comparador
 	             //y existe universidad seleccionado en el lote de organismos
 	             if(item.getTipoEgreso().getCodigo().equalsIgnoreCase("ICO") && existeUniversidad ){
 	            	String[] mensaje = new String[1];
 	            	mensaje[0] = "Si seleccionó algún organismo como Inst.Contraparte, debe completar el porcentaje correspondiente, en "+dondeEsElError;
 	      			this.addError("errors.dynamic", mensaje, true);
 	             }
 	             //si es UVT DEBE existir porcentaje
 	             if(item.getTipoEgreso().getCodigo().equalsIgnoreCase("UVT") ){
 	            	String[] mensaje = new String[1];
 	            	mensaje[0] = "El porcentaje de distribución de la UVT es necesario/a, en "+dondeEsElError;
 	      			this.addError("errors.dynamic", mensaje, true);
 	             }


           	}
        }
        //pregunto si el contador es mayor o igual a 6 para ver si paso por todos los comparadores
        //y porcentajes y ninguno tenía nada seteado
        if (!existePorcentajeComp) {
        	String[] mensaje = new String[1];
        	mensaje[0] = "Debe completarse tanto el comparador como el porcentaje, en "+dondeEsElError;
 			this.addError("errors.dynamic", mensaje, true);
        }
        if (contador >= 6) {
        	String[] mensaje = new String[1];
          	mensaje[0] = "Debe seleccionarse al menos un comparador y un porcentaje para alguna de las partes, en "+dondeEsElError;
 			this.addError("errors.dynamic", mensaje, true);
        }


    }

	//si es un instituto busco si ya existe un convenio marco de ese mismo organismo y con ese mismo tipo de servicio
	public void existeConvenioInstitutoYTipoServicio(Collection organismosLote, String tipoServicio, Map mapaTipoOrganismoMapped, Long idConvenio) throws CException{
		if (organismosLote != null){
			for (Iterator<COrganismo> iterator = organismosLote.iterator(); iterator.hasNext();) {
				COrganismo organismo = iterator.next();
				//si es un instituto busco si ya existe un convenio marco de ese mismo organismo y con ese mismo tipo de servicio
				if ("I".equalsIgnoreCase((String)mapaTipoOrganismoMapped.get(organismo.getId().toString()))){
		    		CConvenioMarco convenio = CConvenioMarcoService.findConvenioByEntidadTipoServicio(organismo, tipoServicio);
		    		if (convenio != null){
		    			String[] mensaje = new String[1];
		    			mensaje[0] = "El Interviniente "+organismo.getDescripcion()+" tiene habilitado un Convenio Marco para el Tipo Servicio seleccionado.";
		    			//es MODIFICACION. Me fijo (en el caso de la modificacion) que el encontrado no sea el mismo que estoy modificando!
		    			if (idConvenio != null && convenio.getId().compareTo(idConvenio)!=0){
			     			this.addError("errors.dynamic", mensaje, true);
		    			}
		    			//es ALTA
		    			else if (idConvenio == null){
			     			this.addError("errors.dynamic", mensaje, true);
		    			}
		    		}
		    	}
			}
		}

	}
}

