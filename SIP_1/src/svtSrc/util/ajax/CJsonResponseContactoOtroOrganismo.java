package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.contacto.CContactoOtroOrganismo;
import conicet.apps.svt.service.CContactoService;
import conicet.framework.error.CException;

public class CJsonResponseContactoOtroOrganismo extends CJsonResponse{

	/**
	 * El campo Descripcion es la sigla del organismo
	 */
	@Override
	protected JSONObject setear(Object o) {
		CContactoOtroOrganismo oo = (CContactoOtroOrganismo) o;
		JSONObject json = new JSONObject();
		json.put("id", oo.getId().toString());
		json.put("nombre", oo.getOrganismo().getDescripcion()+" - "+ oo.getOrganismo().getNombre()+" // "+oo.getApellido() +", "+ oo.getNombre());
		return json;
	}

	@Override
	protected List find(HttpServletRequest request) throws CException {
		List<CContactoOtroOrganismo> contactoOO = new ArrayList<CContactoOtroOrganismo>();
		contactoOO.addAll(CContactoService.findContactoOtrosOrganismosLikeDescripcion(request.getParameter("match")));
		return contactoOO;
	}

}
