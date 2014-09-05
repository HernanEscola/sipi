package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.service.CGlobalService;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.framework.error.CException;
import conicet.framework.hibernate3.object.partido.CPartido;
import conicet.framework.hibernate3.object.provincia.CProvincia;
import conicet.framework.http.CSessionManager;

public class CJsonResponsePartido extends CJsonResponse {

	private CProvincia provincia;
	
	public CJsonResponsePartido(CProvincia provincia) {
		this.provincia = provincia;
	}
	
	public CJsonResponsePartido(HttpServletRequest request) {
		this.provincia= new CProvincia(request.getParameter("codSelect"));
	}

	@Override
	public List find(HttpServletRequest request) throws CException {	
		List<CPartido> todosLosPartidos = new ArrayList<CPartido>(CGlobalService.findPartidos());
		List<CPartido> partidosBuscados = new ArrayList<CPartido>();
		for (CPartido partido : todosLosPartidos) {
			if (partido.getProvincia().getCodigo().equalsIgnoreCase(provincia.getCodigo())) {
				partidosBuscados.add(partido);
			}
		}
		
		String tipo = request.getParameter("tipoCombo");
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		
		partidosBuscados = CGlobalWrapper.ordenarPartidoByAlfabeto(partidosBuscados);
		sessionManager.setAttribute("comboPartido" + tipo, CGlobalWrapper.getComboPartido(partidosBuscados));

		return partidosBuscados;
	}

	public CProvincia getProvincia() {
		return provincia;
	}

	public void setProvincia(CProvincia provincia) {
		this.provincia = provincia;
	}

	@Override
	protected JSONObject setear(Object o) {		
		CPartido partido = (CPartido)o;

		JSONObject json = new JSONObject();

		json.put("codigo", partido.getCodigo());
		json.put("descripcion", partido.getDescripcion());

		return json;
	}

}
