package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.entidad.COrganismo;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;

public class CAutoCompletePromotor extends CAutoComplete {

	CEntidadBusquedaStruct entidadBuscar;
	
	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		CEntidadBusquedaStruct entidadBuscar = this.entidadBuscar!= null? this.entidadBuscar: new CEntidadBusquedaStruct();
		entidadBuscar.setDescripcionODenominacion(request.getParameter("match"));
		entidadBuscar.setEstado("N");
		entidadBuscar.getTiposEntidad().add(new CTipoEntidad(5));
		List ret = new ArrayList<CEntidad>(CEntidadService.findEntidadesByCriterio(entidadBuscar));
		entidadBuscar.getTiposEntidad().clear();
		entidadBuscar.getTiposEntidad().add(new CTipoEntidad(4));
		entidadBuscar.setDescripcion("CONICET");
		ret.addAll(CEntidadService.findEntidadesByCriterio(entidadBuscar));
		
		return ret;
	}

	@Override
	protected JSONObject setear(Object o) {
		CEntidad c = (CEntidad)o;

		JSONObject json = new JSONObject();
		json.put("nombre", c.getDescripcion());
		if(c.getTipo().isLanais() || c.getTipo().isOtroOrganismo() || c.getTipo().isUD()){
			COrganismo org = (COrganismo) c;
			json.put("denominacion", org.getNombre());
		}
		
		
		json.put("id", c.getId().toString());
		return json;
	}
	
	public CAutoCompletePromotor(CEntidadBusquedaStruct entidadBuscar) {
		this.entidadBuscar = entidadBuscar;
	}
	
	public CAutoCompletePromotor(){
		
	}
}
