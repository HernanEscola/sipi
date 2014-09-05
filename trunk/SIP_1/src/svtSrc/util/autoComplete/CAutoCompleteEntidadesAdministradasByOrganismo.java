package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.admPrestadores.CEntidadOrganismoAdm;
import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.entidad.COrganismo;
import conicet.apps.svt.service.CAdministracionService;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;

public class CAutoCompleteEntidadesAdministradasByOrganismo extends CAutoComplete {

	private CEntidadBusquedaStruct entidadBuscar;
	private CEntidad entidad;
	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		CEntidadBusquedaStruct entidadBuscar = this.entidadBuscar!= null? this.entidadBuscar: new CEntidadBusquedaStruct();
		entidadBuscar.setDescripcionODenominacion(request.getParameter("match"));
		entidadBuscar.setEstado("N");
		List resultados = new LinkedList();
		for(CEntidadOrganismoAdm eoa :CAdministracionService.findPrestadoresAdministradosByOrganismo(this.entidad)){
			resultados.add(eoa.getPrestador());
		}
		if (entidad.getDescripcion().toLowerCase().matches(".*" + request.getParameter("match").toLowerCase() + ".*")) {			
			resultados.add(this.entidad);
		}
		
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
	
	public CAutoCompleteEntidadesAdministradasByOrganismo(CEntidad entidad) {
		this.entidad = entidad;
	}
	
}
