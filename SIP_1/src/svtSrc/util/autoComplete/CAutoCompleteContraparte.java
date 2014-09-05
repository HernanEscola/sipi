package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.COrganismo;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.service.CEntidadService;

public class CAutoCompleteContraparte extends CAutoComplete {


	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		COrganismo organismoBuscar = new COrganismo();
		organismoBuscar.setTipo(new CTipoEntidad(5));
		organismoBuscar.setDescripcion(request.getParameter("match"));
		organismoBuscar.setNombre(request.getParameter("match"));
								
		ArrayList<COrganismo> lc = new ArrayList<COrganismo>(CEntidadService.findOrganismosLikeDescripcionNombre(organismoBuscar));
		return lc;
	}

	@Override
	protected JSONObject setear(Object o) {
		
		COrganismo c = (COrganismo)o;
		
		JSONObject json = new JSONObject();
		json.put("nombre", c.getNombre()+" - "+c.getDescripcion());
		json.put("id", c.getId().toString());

		return json;
	}

}
