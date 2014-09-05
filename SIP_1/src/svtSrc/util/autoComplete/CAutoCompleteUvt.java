package conicet.apps.svt.util.autoComplete;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.gestor.CUvt;
import conicet.apps.svt.object.tipoGestor.CTipoGestor;
import conicet.apps.svt.service.CGestorService;
import conicet.apps.svt.struct.busqueda.CGestorBusquedaStruct;

public class CAutoCompleteUvt extends CAutoComplete {

	private CGestorBusquedaStruct struct ;

	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		CGestorBusquedaStruct struct = this.struct!= null? this.struct: new CGestorBusquedaStruct();

		String uvt = request.getParameter("match");
		struct.setTipoGestor(new CTipoGestor(1));
		struct.setDescripcion(uvt);
		//struct.setSigla(uvt);
		return CGestorService.findGestorByCriterio(struct);
	}

	public CAutoCompleteUvt(CGestorBusquedaStruct struct) {
		this.struct = struct;
	}

	public CAutoCompleteUvt() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected JSONObject setear(Object o) {
		CUvt c = (CUvt)o;

		JSONObject json = new JSONObject();
		json.put("nombre", c.getDescripcion());
		json.put("sigla", c.getSigla());
		json.put("id", c.getId().toString());
		return json;
	}

}
