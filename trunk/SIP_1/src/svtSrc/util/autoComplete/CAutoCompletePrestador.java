package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.entidad.COrganismo;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;

public class CAutoCompletePrestador extends CAutoComplete {

	CEntidadBusquedaStruct entidadBuscar;
	
	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		CEntidadBusquedaStruct entidadBuscar = this.entidadBuscar!= null? this.entidadBuscar: new CEntidadBusquedaStruct();
		entidadBuscar.setDescripcionODenominacion(request.getParameter("match"));
		entidadBuscar.setEstado("N");
		return new ArrayList<CEntidad>(CEntidadService.findEntidadesByCriterio(entidadBuscar));
	}

	@Override
	protected JSONObject setear(Object o) {
		CEntidad c = (CEntidad)o;

		JSONObject json = new JSONObject();
		json.put("nombre", c.getDescripcion());
//		if(c.getTipo().isLanais() || c.getTipo().isOtroOrganismo() || c.getTipo().isUD()) {
		if (c instanceof COrganismo) {
			COrganismo org = (COrganismo) c;
			json.put("denominacion", org.getNombre());
		}
		
		
		json.put("id", c.getId().toString());
		return json;
	}
	
	public CAutoCompletePrestador(CEntidadBusquedaStruct entidadBuscar) {
		this.entidadBuscar = entidadBuscar;
	}
	
	public CAutoCompletePrestador(){
		
	}
}
