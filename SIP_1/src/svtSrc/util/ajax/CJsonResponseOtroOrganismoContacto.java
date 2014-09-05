package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.COtroOrganismo;
import conicet.apps.svt.service.CContactoService;
import conicet.framework.error.CException;

public class CJsonResponseOtroOrganismoContacto extends CJsonResponse{
	
	@Override
	protected JSONObject setear(Object o) {
		COtroOrganismo oo = (COtroOrganismo) o;
		JSONObject json = new JSONObject();
		json.put("id", oo.getId().toString());
		json.put("nombre", oo.getNombre());
		return json;
	}

	@Override
	protected List find(HttpServletRequest request) throws CException {
		List<COtroOrganismo> otrosOrganismos = new ArrayList<COtroOrganismo>();
		otrosOrganismos.addAll(CContactoService.findOtrosOrganismosLikeDescripcion(request.getParameter("match")));
		return otrosOrganismos;
	}

}
