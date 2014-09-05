package conicet.apps.svt.util.autoComplete;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.service.CEntidadService;

public class CAutoCompleteGrupo extends CAutoComplete {

	@SuppressWarnings("rawtypes")
	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		String denominacion = request.getParameter("match");
		return CEntidadService.findEntidadesLikeDescripcionByTipo(denominacion, new CTipoEntidad(CTipoEntidad.ID_TIPO_ENTIDAD_GRUPO));
	}

	@SuppressWarnings("unchecked")
	@Override
	protected JSONObject setear(Object o) {
		CEntidad c = (CEntidad)o;

		JSONObject json = new JSONObject();
		json.put("nombre", c.getDescripcion());
		json.put("id", c.getId().toString());
		
		return json;
	}

}
