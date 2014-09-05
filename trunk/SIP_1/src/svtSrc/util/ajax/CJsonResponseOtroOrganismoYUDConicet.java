package conicet.apps.svt.util.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.entidad.COrganismo;
import conicet.apps.svt.object.entidad.CUnidadEjecutora;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;
import conicet.framework.error.CException;

/**
 * Busca Otros organismos y CONICET Unidad Ejecutora
 * @author mgismondi
 *
 */
public class CJsonResponseOtroOrganismoYUDConicet extends CJsonResponseOtroOrganismo {

	@Override
	@SuppressWarnings("unchecked")
	public List find(HttpServletRequest request) throws CException {
		List<CEntidad> resultados = (List<CEntidad>) super.find(request);
		if (UD_CONICET_DESCRIPCION.toLowerCase().matches(".*" + request.getParameter("match").toLowerCase() + ".*")) {			
			CUnidadEjecutora ue = new CUnidadEjecutora();
			ue.setDescripcion(UD_CONICET_DESCRIPCION);
			ue.setTipo(new CTipoEntidad(CTipoEntidad.ID_TIPO_ENTIDAD_UD));
			COrganismo conicet = CEntidadService.existeEntidadBySiglaTipo(ue);
			
			if(conicet !=null)
				resultados.add(conicet);
		}
		return resultados;
	}
	
	@Override
	protected CEntidadBusquedaStruct getBusquedaStruct() {
		CEntidadBusquedaStruct entidadStruct = new CEntidadBusquedaStruct();
		entidadStruct.setExcluirDescripcion(UD_CONICET_DESCRIPCION);
		return entidadStruct;
	}

}
