package conicet.apps.svt.util.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;
import conicet.framework.error.CException;

public class CJsonResponseOtroOrganismoYUD extends CJsonResponseOtroOrganismo {
	
	@Override
	protected List find(HttpServletRequest request) throws CException {
		List<CEntidad> resultados = super.find(request);
		
		String descBusqueda = request.getParameter("match");
		CEntidadBusquedaStruct entidadStruct = new CEntidadBusquedaStruct();
		entidadStruct.setTipo(new CTipoEntidad(CTipoEntidad.ID_TIPO_ENTIDAD_UD));
		entidadStruct.setDescripcion(descBusqueda);
		entidadStruct.setEstado("N");
		resultados.addAll(CEntidadService.findEntidadesByCriterio(entidadStruct));
		
		return resultados;
	}
	
	@Override
	protected CEntidadBusquedaStruct getBusquedaStruct() {
		CEntidadBusquedaStruct entidadStruct = new CEntidadBusquedaStruct();
		entidadStruct.setExcluirDescripcion(CJsonResponseOtroOrganismo.UD_CONICET_DESCRIPCION);
		return entidadStruct;
	}

}
