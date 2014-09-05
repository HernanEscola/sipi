package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.contacto.CContactoContratante;
import conicet.apps.svt.object.contratanteRelacion.CContratanteRelacion;
import conicet.apps.svt.service.CContratanteService;
import conicet.apps.svt.struct.busqueda.CContactoBusquedaStruct;
import conicet.framework.error.CException;

public class CAutoCompleteContactoContratanteCF extends
		CAutoCompleteContactoContratante {

	public CAutoCompleteContactoContratanteCF(CContactoBusquedaStruct cbs) {
		super(cbs);
	}

	@Override
	protected Collection find(HttpServletRequest request) throws CException {
		CContactoBusquedaStruct contactoBuscar = this.contactoBuscar!= null? this.contactoBuscar: new CContactoBusquedaStruct();
		contactoBuscar.setDescripcionBusqueda(request.getParameter("match"));
		ArrayList<CContactoContratante> contactos= new ArrayList<CContactoContratante>(CContratanteService.findContactoByCriterio(contactoBuscar));
		contactoBuscar.setTipoContratante("0"); // le indico que busque las relaciones con contratantes cf
		
		List<CContratanteRelacion> contRel=CContratanteService.findContratanteRelacionByCriterio(contactoBuscar);
		for (CContratanteRelacion consFinal : contRel) {
			contactos.add(new CContactoContratante(consFinal));
		}
		
		return contactos;
	}
	
	@Override
	protected JSONObject setear(Object o) {
		CContactoContratante contacto = (CContactoContratante) o;
		if (contacto.getId() == null) {
			contacto.setId((long) 0);
		}
		
		JSONObject resultado = super.setear(o);
		
		// BUSCARA POR ID DE CONTRATANTE CONS.FINAL O POR ID DEL CONTACTO
		if (contacto.getId() == 0) {
			resultado.put("id", "CF" + contacto.getContratanteRelacion().getContratante().getId().toString());
		} else {
			resultado.put("id", contacto.getId().toString());
		}
		
		return resultado;
	}

}
