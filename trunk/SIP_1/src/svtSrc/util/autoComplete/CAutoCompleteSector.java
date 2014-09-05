package conicet.apps.svt.util.autoComplete;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.gestor.CGestor;
import conicet.apps.svt.object.gestor.CUvt;
import conicet.apps.svt.object.tipoGestor.CTipoGestor;
import conicet.apps.svt.service.CGestorService;
import conicet.apps.svt.struct.busqueda.CGestorBusquedaStruct;

public class CAutoCompleteSector extends CAutoComplete {

	private CGestorBusquedaStruct struct ;

	@Override
	protected Collection find(HttpServletRequest request) throws Exception {
		CGestorBusquedaStruct struct = this.struct!= null? this.struct: new CGestorBusquedaStruct();

		String desc = request.getParameter("match");
		struct.setTipoGestor(new CTipoGestor(CTipoGestor.TIPO_GESTOR_SECTOR));
		struct.setDescripcion(desc);
		struct.setSigla(desc);
		struct.setHabilitado("S");
		return CGestorService.findGestorByCriterio(struct);
	}

	public CAutoCompleteSector(CGestorBusquedaStruct struct) {
		this.struct = struct;
	}

	public CAutoCompleteSector() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected JSONObject setear(Object o) {
		CGestor c = (CGestor)o;

		JSONObject json = new JSONObject();
		json.put("nombre", c.getDescripcion());
		json.put("sigla", c.getSigla());
		json.put("id", c.getId().toString());
		return json;
	}

}
