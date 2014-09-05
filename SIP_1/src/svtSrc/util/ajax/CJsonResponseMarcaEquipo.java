package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.service.CMarcaEquipoService;
import conicet.framework.error.CException;

public class CJsonResponseMarcaEquipo extends CJsonResponse {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected List find(HttpServletRequest request) throws CException {
		return new ArrayList(CMarcaEquipoService.findByNombre((String) request.getParameter("match")));
	}

	@SuppressWarnings("unchecked")
	@Override
	protected JSONObject setear(Object o) {
		JSONObject json = new JSONObject();
		CMarcaEquipo marcaEquipo = (CMarcaEquipo) o;		
		
		json.put("id", marcaEquipo.getId());
		json.put("nombre", marcaEquipo.getNombre());
		
		return json;
	}

}
