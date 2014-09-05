package conicet.apps.svt.util.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.gestor.CUvt;
import conicet.apps.svt.object.tipoGestor.CTipoGestor;
import conicet.apps.svt.service.CGestorService;
import conicet.apps.svt.struct.busqueda.CGestorBusquedaStruct;
import conicet.framework.error.CException;

public class CJsonResponseUvtConConvenio extends CJsonResponse {
	
	private CEntidad entidad;

	@Override
	protected List find(HttpServletRequest request) throws CException {
		CGestorBusquedaStruct gStruct = new CGestorBusquedaStruct();
		CTipoGestor tipoGestor = new CTipoGestor(CTipoGestor.TIPO_GESTOR_UVT);
		gStruct.setTipoGestor(tipoGestor);
		gStruct.setTieneConvenioMarcoODeTrabajo(true);
		gStruct.setEntidadConvenio(entidad);
		gStruct.setDescripcion((String) request.getParameter("match"));
		gStruct.setSigla((String) request.getParameter("match"));
		return CGestorService.findGestorByCriterio(gStruct);
	}

	@Override
	protected JSONObject setear(Object o) {
		CUvt uvt = (CUvt)o;

		JSONObject json = new JSONObject();

		json.put("id", uvt.getId().toString());
		json.put("descripcion", uvt.getSigla() + " - " + uvt.getDescripcion());
		json.put("nombre", uvt.getSigla() + " - " + uvt.getDescripcion());
		return json;
	}

	public CEntidad getEntidad() {
		return entidad;
	}

	public void setEntidad(CEntidad entidad) {
		this.entidad = entidad;
	}
	
	

}
