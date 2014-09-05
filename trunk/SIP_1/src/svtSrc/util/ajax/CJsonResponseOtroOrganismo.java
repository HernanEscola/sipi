package conicet.apps.svt.util.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;
import conicet.framework.error.CException;

/**
 * Devuelve Otros organismos que coincidan con la descripcion
 * @author mgismondi
 *
 */
public class CJsonResponseOtroOrganismo extends CJsonResponse {
	
	protected static final String UD_CONICET_DESCRIPCION = "CONICET";

	@Override
	protected List find(HttpServletRequest request) throws CException {
		CEntidadBusquedaStruct entidadStruct = getBusquedaStruct();
		String descBusqueda = request.getParameter("match");
		
		entidadStruct.setTipo(new CTipoEntidad(CTipoEntidad.ID_TIPO_ENTIDAD_OTRO_ORGANISMO));
		entidadStruct.setDescripcion(descBusqueda);
		entidadStruct.setEstado("N");
		return (List<CEntidad>) CEntidadService.findEntidadesByCriterio(entidadStruct);
	}
	
	@Override
	protected JSONObject setear(Object o) {
		CEntidad entidad = (CEntidad)o;

		JSONObject json = new JSONObject();

		json.put("id", entidad.getId());
		json.put("nombre", entidad.getTipo().getDescripcionCorta() + " - " + entidad.getDescripcion());

		return json;
	}
	
	/**
	 * Para que las clases hijas puedan agregar filtros de busqueda
	 * @return
	 */
	protected CEntidadBusquedaStruct getBusquedaStruct() {
		return new CEntidadBusquedaStruct();
	}

}
