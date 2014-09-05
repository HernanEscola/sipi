package conicet.apps.svt.web.instrumento.decorator;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.object.clasificacionPDT.CClasificacionPDT;
import conicet.apps.svt.object.contratante.CContratante;
import conicet.apps.svt.object.contratante.CContratanteCF;
import conicet.apps.svt.object.contratante.CContratanteOtro;
import conicet.apps.svt.object.convenio.ETipoAlcanceConvenio;
import conicet.apps.svt.object.convenio.ETipoConvenio;
import conicet.apps.svt.object.gestor.CGestor;
import conicet.apps.svt.object.instrumento.ECategoriaPDT;
import conicet.apps.svt.object.instrumento.EEstadoInstrumento;
import conicet.apps.svt.object.instrumento.EEstadoTramiteInstrumento;
import conicet.apps.svt.object.instrumento.ETipoInstrumento;
import conicet.apps.svt.object.instrumento.ETipoProrroga;
import conicet.apps.svt.object.instrumentoItemTramite.EEventoTramite;
import conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento;
import conicet.apps.svt.object.instrumentoResolucion.ETipoActividadPDT;
import conicet.apps.svt.object.rol.CRol;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.service.CUsuarioService;
import conicet.apps.svt.util.interfaces.IIdentityDescripcion;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.framework.error.CException;
import conicet.framework.hibernate3.object.campoAplicacion.CCampoAplicacion;
import conicet.framework.hibernate3.object.persona.CPersona;
import conicet.framework.util.UFecha;
import conicet.framework.util.combo.COptionComboDisabled;
import conicet.framework.web.COptionCombo;

public class CInstrumentoWrapper {


	public static  Collection getComboActividadPDT() {
			return CGlobalWrapper.getComboByIdentityDesc(ETipoActividadPDT.values());
	}




	public static Collection getComboResponsablesBusqueda() {
		Collection colCombo = CGlobalWrapper.getComboSeleccionar();


		String[] nombres = { "A designar", "Ayanian, Laura", "Barral, Valeria", "Bobrovsky, Hernán", "Brambilla, Lucia", "Calcagno, Horacio", "Cancio, Alejandra", "Cardozo, Natalia",
				"Casagrande, Nicolás", "de Souza, Gabriela", "Duchowicz, Zelma", "Espiño, Miguel Ángel", "Ferrari, Paola", "Gallardo, Florencia", "Gómez, Javier", "Maida, Magali",
				"Mitidiero, Ignacio", "Musitane Basabe, Alfredo", "Navarro, Guillermo", "Nazar de la Vega, Gonzalo", "Rassiga, Fernando", "Rodriguez, Pablo", "Scorrani, Malena",
				"van Domselaar, Ezequiel", "Villa, Santiago" };

		String[] cuits = { null, "27281786119", "27256596976", "20279359160", "27298558411", "20116475783", "27228258976", "27234239258", "20292839252", "27243654179", "27281279136",
				"20173334789", "27225471105", "27243651277", "20178130030", "27289518172", "23272172749", "20264734607", "20259895031", "20305934152", null, "20270380876", "27336916998",
				"23244098169", "23274665629", };

		List<CPersona> users = new ArrayList<CPersona>();

		Collection<CRol> roles = new LinkedList<CRol>();
		roles.add(new CRol("CCO"));
		roles.add(new CRol("ACO"));
		try {
			Collection<CUsuarioSvt> responsables = CUsuarioService.findUsuariosByRoles(roles);

			for (CUsuarioSvt i : responsables) {
				colCombo.add(new COptionCombo(i.getUsrRegistrado().getLastName() + ", " + i.getUsrRegistrado().getFirstName(), i.getUsrRegistrado().getKey().toString()));
			}

			for(int i=0; i<nombres.length ; i++){
				String s = nombres[i];
				boolean agregar = true;
				for(CUsuarioSvt usr : responsables){
					if(usr.getUsrRegistrado().getCuit().equals(cuits[i])){
						agregar = false;
						break;
					}
				}
				if(agregar) {
					colCombo.add(new COptionCombo(s, s));
				}
			}

		} catch (CException e) {
			e.printStackTrace();
		}


		return colCombo;
	}

	public static  Collection getComboAños() {
		Collection colCombo = CGlobalWrapper.getComboSeleccionar();

		for(Integer i = Integer.valueOf(UFecha.anioActual()); i>= 1960 ;i--){
			colCombo.add(new COptionCombo(i.toString(), i.toString()));
		}

		return colCombo;
	}

	public static  Collection getComboTipos() {
		return CGlobalWrapper.getComboByIdentityDesc(ETipoInstrumento.values());
	}

	public static  Collection getComboTipoConvenios() {
		return CGlobalWrapper.getComboByIdentityDesc(ETipoConvenio.values());
	}


	public static Collection getComboCategoriaPDT() {
		return CGlobalWrapper.getComboByIdentityDesc(ECategoriaPDT.values());
	}

	public static Collection getComboEstados() {
		return CGlobalWrapper.getComboByIdentityDescActivos(EEstadoInstrumento.values());
	}
	public static Collection getComboEstadosSinDeshabilitado() {

		return getComboByIdentityDescSinDeshabilitado(EEstadoInstrumento.values());
	}

	/**
	 * muestra todos menos el deshabilitado y el estado eliminado
	 * @param val
	 * @return
	 */
	public static List<COptionCombo> getComboByIdentityDescSinDeshabilitado(IIdentityDescripcion[] val ) {
		List<COptionCombo> colCombo = CGlobalWrapper.getComboSeleccionar();
		for(IIdentityDescripcion i : val){
			if(i.getId().toString().equals("-1") || i.getId().equals("0") || i.getId().equals(EEstadoInstrumento.DES.getId()) || i.getId().equals("E"))  {
				continue;
			}

			colCombo.add(new COptionCombo(i.getDescripcion(), i.getId().toString()));
		}

		return colCombo;
	}

	public static Collection getComboEstadosTramite() {
		return CGlobalWrapper.getComboByIdentityDesc(EEstadoTramiteInstrumento.values());
	}

	public static Collection getComboAlcanceConvenio() {
		return CGlobalWrapper.getComboByIdentityDesc(ETipoAlcanceConvenio.values());
	}

	public static Collection getComboResponsables() {
		Collection colCombo = CGlobalWrapper.getComboSeleccionar();

		Collection<CRol> roles = new LinkedList<CRol>();
		roles.add(new CRol("CCO"));
		roles.add(new CRol("CCL"));
		roles.add(new CRol("ACO"));
		try {
			Collection<CUsuarioSvt> responsables = CUsuarioService.findUsuariosByRoles(roles);

			for (CUsuarioSvt i : responsables) {
				colCombo.add(new COptionCombo(i.getUsrRegistrado().getLastName() + ", " + i.getUsrRegistrado().getFirstName(), i.getUsrRegistrado().getKey().toString()));
			}

		} catch (CException e) {
			e.printStackTrace();
		}

		return colCombo;
	}

	public static Collection getComboEventos() {
		return CGlobalWrapper.getComboByIdentityDesc(EEventoTramite.values());
	}

	public static Collection getComboProrrogas() {
		return CGlobalWrapper.getComboByIdentityDesc(ETipoProrroga.values());
	}



	public static Collection getComboTipoPartes() {
		return CGlobalWrapper.getComboByIdentityDesc(EFuncionParteInstrumento.values());
	}

	/**
	 * no se puede elegir CPR PARA DAR ALTAS O PARA MODIFICAR
	 * @return
	 */

	public static Collection<COptionCombo> getComboTipoPartesElegibles() {

		List<COptionCombo> colCombo = CGlobalWrapper.getComboSeleccionar();
		for(EFuncionParteInstrumento e : EFuncionParteInstrumento.getValuesTipoPartes()){
			colCombo.add(new COptionCombo(e.getDescripcion(), e.getId().toString()));
		}
		return colCombo;
	}

	public static Collection getComboClasificacionPDT(Collection<CClasificacionPDT> datos) {
		List<COptionCombo> colCombo = new LinkedList<COptionCombo>();
		colCombo.add(new COptionCombo("Seleccionar", "-1"));
		colCombo.add(new COptionCombo("-----------", "-2"));

		for(CClasificacionPDT i : datos){
			String desc = i.getCodigo()+"-"+i.getDescripcion();
			if(desc.length()>160) {
				desc = desc.substring(0,157) +"...";
			}
			colCombo.add(new COptionCombo(desc, i.getId().toString()));

		}

		return colCombo;
	}

	public static Collection getComboCampoAplicacion(Collection<CCampoAplicacion> datos) {
		List<COptionCombo> colCombo = new LinkedList<COptionCombo>();
		colCombo.add(new COptionCombo("Seleccionar", "-1"));
		colCombo.add(new COptionCombo("-----------", "-2"));

		for(CCampoAplicacion i : datos){
			String desc = i.getCodigo()+"-"+i.getDescripcion();
			if(desc.length()>160) {
				desc = desc.substring(0,157) +"...";
			}
			if(i.getCodigo().length()>2){
				colCombo.add(new COptionComboDisabled(desc, i.getCodigo().toString()));
			}else{
				colCombo.add(new COptionCombo(desc, i.getCodigo().toString()));
			}

		}

		return colCombo;
	}

	public static Collection<COptionCombo> getComboContratantes(Collection<CContratante> contratantes) {
		contratantes = ordenarContratanteByRazonSocialNombreFantasia(contratantes);

		Collection<COptionCombo> colCombo = CGlobalWrapper.getComboSeleccionar();
		colCombo.add(new COptionCombo("Nuevo", "0"));
		colCombo.add(new COptionCombo("Nueva Búsqueda", "-5"));

		for (CContratante contratante : contratantes) {
			String datos = armarDescripcionContratante(contratante);
			colCombo.add(new COptionCombo(datos,contratante.getId().toString()));
		}

		return colCombo;
	}

	private static List<CContratante> ordenarContratanteByRazonSocialNombreFantasia(Collection<CContratante> col) {
		List<CContratante> list = new LinkedList<CContratante>();
		list.addAll(col);
		Collections.sort(list, new Comparator<CContratante>() {
			@Override
			public int compare(CContratante obj1, CContratante obj2) {
				String ord1,ord2;
				if(obj1.esConsumidorFinal())
				{
					ord1 = ((CContratanteOtro)obj1).getRazonSocial();
				}else{
					ord1 =((CContratanteCF)obj1).getApellido();
				}

				if(obj2.esConsumidorFinal())
				{
					 ord2 = ((CContratanteOtro)obj2).getRazonSocial();
				}else{
					 ord2 =((CContratanteCF)obj2).getApellido();
				}

				int ret = ord1.compareTo(ord2);
				if (ret == 0) {
					//nombrefantasia no es obligatorio por lo tanto puede ser null y esto trae errores
					ord1 = obj1.esConsumidorFinal() ? ((CContratanteCF)obj1).getNombre() : ((CContratanteOtro)obj1).getNombreFantasia();
					ord2 = obj2.esConsumidorFinal() ? ((CContratanteCF)obj2).getNombre() : ((CContratanteOtro)obj2).getNombreFantasia();
					ret = ord1.compareTo(ord2);
				}
				return ret;
			}
		});
		return list;
	}

	private static String armarDescripcionContratante(CContratante contratante) {
		if(contratante.esConsumidorFinal())
		{
			CContratanteCF cf = (CContratanteCF)contratante;
			return cf.getApellido() + ", " + cf.getNombre();
		}else{
			CContratanteOtro co = (CContratanteOtro)contratante;
			if (StringUtils.isNotEmpty(co.getNombreFantasia())) {
				return co.getRazonSocial() + " - " + co.getNombreFantasia();
			} else {
				return co.getRazonSocial();
			}
		}
	}

	public static Collection<COptionCombo> getComboTipoAdministradoresDescCorta() {
		Collection<COptionCombo> colCombo = CGlobalWrapper.getComboSeleccionar();
		for (EFuncionParteInstrumento e : EFuncionParteInstrumento.getValuesAdministradores()) {
			colCombo.add(new COptionCombo(e.getDescripcionCorta(), e.getValue()));
		}
		return colCombo;
	}

	public static Collection<COptionCombo> getComboTipoContactos() {
		Collection<COptionCombo> colCombo = CGlobalWrapper.getComboSeleccionar();
		for (EFuncionParteInstrumento e : EFuncionParteInstrumento.getValuesContactos()) {
			colCombo.add(new COptionCombo(e.getDescripcion(), e.getValue()));
		}
		return colCombo;
	}




	public static Object getComboResponsablesBySector(CGestor gestor) throws CException {
		Collection colCombo = CGlobalWrapper.getComboSeleccionar();

		Collection<CRol> roles = new LinkedList<CRol>();
		roles.add(new CRol("CCO"));
		roles.add(new CRol("CCL"));
		roles.add(new CRol("ACO"));
		try {
			Collection<CUsuarioSvt> responsables = CUsuarioService.findUsuariosByRolesSector(roles,gestor);

			for (CUsuarioSvt i : responsables) {
				colCombo.add(new COptionCombo(i.getUsrRegistrado().getLastName() + ", " + i.getUsrRegistrado().getFirstName(), i.getUsrRegistrado().getKey().toString()));
			}

		} catch (CException e) {
			e.printStackTrace();
		}

		return colCombo;
	}

}
