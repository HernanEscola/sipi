package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;

import conicet.apps.svt.object.contacto.CContactoContratante;
import conicet.apps.svt.object.contratante.CContratanteCF;
import conicet.apps.svt.object.contratante.CContratanteOtro;
import conicet.apps.svt.service.CContratanteService;
import conicet.apps.svt.struct.busqueda.CContactoBusquedaStruct;
import conicet.framework.error.CException;
import conicet.framework.object.IIdentity;

public class CAutoCompleteContactoContratante extends CAutoComplete {

	CContactoBusquedaStruct contactoBuscar;

	/**
	 * COLLECION DE CONTACTOS CON CONTACTOS RELACIONADOS CON DV Y CONTRATANTES CF RELACIONADOS CON DV(SIN CONTACTO)
	 * SE DEBE IMPLEMENTAR EL METODO CAutoCompleteContactoContratante.getObjetoBuscadoByContratanteCF
	 * PARA OBTENER EL CONTACTO SELECCIONADO EN EL FORMULARIO
	 */
	@Override
	protected Collection find(HttpServletRequest request) throws CException {
		CContactoBusquedaStruct contactoBuscar = this.contactoBuscar!= null? this.contactoBuscar: new CContactoBusquedaStruct();
		contactoBuscar.setDescripcionBusqueda(request.getParameter("match"));
		return new ArrayList<CContactoContratante>(CContratanteService.findContactoByCriterio(contactoBuscar));
	}

	@Override
	protected JSONObject setear(Object o) {
		CContactoContratante c = (CContactoContratante)o;

		JSONObject json = new JSONObject();
		if(StringUtils.isEmpty(c.getApellido()) || StringUtils.isEmpty(c.getNombre())) {
			json.put("nombre", c.getContratanteRelacion().getContratante().getDescripcion()+ " ");
		} else {
			json.put("nombre", c.getContratanteRelacion().getContratante().getDescripcion()+ " // " +
					c.getApellido() + ", " + c.getNombre());
		}

		if (!c.getContratanteRelacion().getContratante().esConsumidorFinal()) {
			CContratanteOtro otro = (CContratanteOtro) c.getContratanteRelacion().getContratante();
			if(StringUtils.isNotEmpty(otro.getNombreFantasia())) {
				json.put("nombreFantasia", otro.getNombreFantasia());
			}

			if(StringUtils.isNotEmpty(otro.getCuitCentral())) {
				json.put("cuit", otro.getCuitCentral());
			}
		} else {
			CContratanteCF cf = (CContratanteCF) c.getContratanteRelacion().getContratante();
			if(StringUtils.isNotEmpty(cf.getDocumento())) {
				json.put("documento",cf.getDocumento());
			}

		}

		json.put("id", c.getId().toString());
		return json;
	}

	public CAutoCompleteContactoContratante(CContactoBusquedaStruct contactoBuscar) {
		this.contactoBuscar = contactoBuscar;
	}

	public CAutoCompleteContactoContratante(){

	}

	/**
	 * ESTE METODO SE UTILIZA PARA PODER LEVANTAR DE LA COLECCION DE CONTACTOS LOS CONTACTOS Y LOS CONS.FINALES.
	 * DEVUELVE SIEMPRE UN OBJETO CONTACTO
	 * @param idSeleccionado
	 * @param clase (ccontacto)
	 * @param coleccion (getObjetosBuscadosAutocomplete() )
	 * @return
	 */
	
	public static IIdentity getObjetoBuscadoByContactoContratanteCF(String idSeleccionado,Collection<IIdentity> coleccion ) {
		Class clase = CContactoContratante.class;
		if (idSeleccionado.contains("CF")){
			idSeleccionado= idSeleccionado.substring(2);
			for (IIdentity i : coleccion) {
				if ((new Long(0)).equals(i.getId())) {
					Class actual = i.getClass();
					if (clase.isAssignableFrom(actual) &&  ((CContactoContratante)i).getContratanteRelacion().getContratante().getId().equals(new Long(idSeleccionado)) ){
							return i;	
					}
				}
			}	
		}else{
			for (IIdentity i : coleccion) {
				if (!(new Long(0)).equals(i.getId())){ 
					Class actual = i.getClass();
					if (clase.isAssignableFrom(actual) && (new Long(idSeleccionado).equals(i.getId())) ) return i;
				}
			}
		}
		return null;
	}

	
	
}
