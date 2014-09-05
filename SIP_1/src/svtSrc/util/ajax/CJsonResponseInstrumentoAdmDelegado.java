package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.service.CEntidadService;
import conicet.framework.error.CException;

public class CJsonResponseInstrumentoAdmDelegado extends CJsonResponse {

	@Override
	protected List find(HttpServletRequest request) throws CException {
		List<CEntidad> entidades = new ArrayList<CEntidad>();
		entidades.addAll(CEntidadService.findEntidadesByTipoLikeDescripcion(new CTipoEntidad(CTipoEntidad.ID_TIPO_ENTIDAD_UD), request.getParameter("match").toString()));
		return entidades;
	}

	@Override
	protected JSONObject setear(Object o) {
		CEntidad e = (CEntidad)o;
		JSONObject json = new JSONObject();
		json.put("id", e.getId().toString());
		json.put("nombre", e.getDescripcion());
		return json;
	}

}
