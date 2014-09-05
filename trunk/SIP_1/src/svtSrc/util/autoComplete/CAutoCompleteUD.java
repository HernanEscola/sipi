package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;

public class CAutoCompleteUD extends CAutoComplete{

	CEntidadBusquedaStruct entidadBuscar;

	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		CEntidadBusquedaStruct entidadBuscar = this.entidadBuscar!= null? this.entidadBuscar: new CEntidadBusquedaStruct();

		//CEntidadBusquedaStruct entidadBuscar = new CEntidadBusquedaStruct();
		entidadBuscar.setTipo(new CTipoEntidad(4));
		if (request.getParameter("match")!=null){
			entidadBuscar.setDescripcion(request.getParameter("match"));
		}

		return new ArrayList<CEntidad>(CEntidadService.findEntidadesByCriterio(entidadBuscar));
	}

	@Override
	protected JSONObject setear(Object o) {
		CEntidad c = (CEntidad)o;

		JSONObject json = new JSONObject();
		json.put("nombre", c.getDescripcion());
		json.put("id", c.getId().toString());
		return json;
	}

	public CAutoCompleteUD(){

	}

	public CAutoCompleteUD(CEntidadBusquedaStruct entidadBuscar) {
		this.entidadBuscar = entidadBuscar;
	}



}
