package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.dao.hibernate.tipoPersonaJuridica.CTipoPersonaJuridicaJDAO;
import conicet.apps.svt.object.tipoPersonaJuridica.CTipoPersonaJuridica;
import conicet.framework.error.CException;

public class CJsonResponsePersonaJuridica extends CJsonResponse {

	@Override
	public List find(HttpServletRequest request) throws CException {
		List<CTipoPersonaJuridica> col = new ArrayList<CTipoPersonaJuridica>();
		col.addAll(CTipoPersonaJuridicaJDAO.findHijos(Long.parseLong(request.getParameter("tipoPersonaId"))));

		return col;
	}

	@Override
	protected JSONObject setear(Object o) {
		CTipoPersonaJuridica tipo = (CTipoPersonaJuridica) o;
		JSONObject json = new JSONObject();
		
		json.put("codigo", tipo.getId());
		json.put("descripcion", tipo.getDescripcion());
		json.put("nombre", tipo.getDescripcion());
		return json;
	}

}
