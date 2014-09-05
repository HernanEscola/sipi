package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.framework.hibernate3.object.lugarDeTrabajo.CLugarDeTrabajo;
import conicet.framework.hibernate3.service.ltr.CLugarDeTrabajoService;

public class CAutoCompleteLugarDeTrabajo extends CAutoComplete{

	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		
		return new ArrayList<CLugarDeTrabajo>(CLugarDeTrabajoService.findByDescripcion(request.getParameter("match")));
	}

	@Override
	protected JSONObject setear(Object o) {
		CLugarDeTrabajo c = (CLugarDeTrabajo)o;
		
		JSONObject json = new JSONObject();
		json.put("nombre", c.getLtrDescrip());
		json.put("id", c.getLtrCodigo());
		return json;
	}

}
