package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;

import conicet.apps.siuvt.object.proveedor.CProveedor;
import conicet.apps.siuvt.service.CEgresoService;
import conicet.framework.error.CException;
import conicet.framework.util.cuit.CCuit;

public class CJsonResponseProveedor extends CJsonResponse {

	@Override
	protected JSONObject setear(Object o) {
		CProveedor prov = (CProveedor)o;
		JSONObject json = new JSONObject();
		json.put("id", prov.getId().toString());
		json.put("nombre", prov.getDescripcion() + 
				(StringUtils.isEmpty(prov.getCuit()) ? "" : " / "+CCuit.stringSinGuionesToStringConGuiones(prov.getCuit())));
		return json;
	}

	@Override
	protected List find(HttpServletRequest request) throws CException {
		List<CProveedor> proveedores = new ArrayList<CProveedor>();
		proveedores.addAll(CEgresoService.findProveedorLikeCuitDescripcion(request.getParameter("match")));
		return proveedores;
	}

}
