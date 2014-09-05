package conicet.apps.svt.util.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.gestor.CUvt;
import conicet.apps.svt.object.tipoGestor.CTipoGestor;
import conicet.apps.svt.service.CGestorService;
import conicet.apps.svt.struct.busqueda.CGestorBusquedaStruct;
import conicet.framework.error.CException;

public class CJsonResponseInstrumentoAdmDeFondos extends CJsonResponse {

	@Override
	protected List find(HttpServletRequest request) throws CException {
		String uvt = request.getParameter("match");
		CGestorBusquedaStruct struct = new CGestorBusquedaStruct();
		struct.setTipoGestor(new CTipoGestor(1));
		struct.setDescripcion(uvt);
		struct.setSigla(uvt);
		return CGestorService.findGestorByCriterio(struct);
	}

	@Override
	protected JSONObject setear(Object o) {
		CUvt c = (CUvt)o;
		JSONObject json = new JSONObject();
		json.put("nombre", c.getDescripcion()+"//"+c.getSigla());
		json.put("id", c.getId().toString());
		return json;
	}

}
