package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.service.CGlobalService;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.framework.error.CException;
import conicet.framework.hibernate3.object.localidad.CLocalidad;
import conicet.framework.hibernate3.object.partido.CPartido;
import conicet.framework.http.CSessionManager;

public class CJsonResponseLocalidad extends CJsonResponse {
	
	private CPartido partido;
	
	public CJsonResponseLocalidad(CPartido partido) {
		this.partido = partido;
	}
	
	public CJsonResponseLocalidad(HttpServletRequest request) {
		this.partido= new CPartido(request.getParameter("codSelect"));
	}

	@Override
	public List find(HttpServletRequest request) throws CException {
		List<CLocalidad> todosLasLocalidades = new ArrayList<CLocalidad>(CGlobalService.findLocalidades());
		List<CLocalidad> localidadesBuscadas = new ArrayList<CLocalidad>();
		for (CLocalidad localidad : todosLasLocalidades) {
			if (localidad.getPartido().getCodigo().equalsIgnoreCase(partido.getCodigo())) {
				localidadesBuscadas.add(localidad);
			}
		}
		
		String tipo = request.getParameter("tipoCombo");
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		
		localidadesBuscadas = CGlobalWrapper.ordenarLocalidadByAlfabeto(localidadesBuscadas);
		sessionManager.setAttribute("comboLocalidad" + tipo, CGlobalWrapper.getComboLocalidad(localidadesBuscadas));
		
		return localidadesBuscadas;
	}

	@Override
	protected JSONObject setear(Object o) {
		CLocalidad localidad = (CLocalidad) o;

		JSONObject json = new JSONObject();

		json.put("codigo", localidad.getCodigo());
		json.put("descripcion", localidad.getLocDescrip());

		return json;
	}

	public CPartido getPartido() {
		return partido;
	}

	public void setPartido(CPartido partido) {
		this.partido = partido;
	}

}
