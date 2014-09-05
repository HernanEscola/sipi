package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.service.CGlobalService;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.framework.error.CException;
import conicet.framework.hibernate3.object.localidad.CLocalidad;
import conicet.framework.hibernate3.object.pais.CPais;
import conicet.framework.hibernate3.object.partido.CPartido;
import conicet.framework.hibernate3.object.provincia.CProvincia;
import conicet.framework.http.CSessionManager;

public class CJsonResponseProvincia extends CJsonResponse {

	private CPais pais;

	public CJsonResponseProvincia(CPais pais) {
		this.pais = pais;
	}

	public CJsonResponseProvincia(HttpServletRequest request) {
		this.pais= new CPais(request.getParameter("codSelect"));
	}

	@Override
	public List find(HttpServletRequest request) throws CException {
		if (pais == null) {
			return new ArrayList<CProvincia>();
		}
		List<CProvincia> lc = new ArrayList<CProvincia>(CGlobalService.findProvinciasByPais(pais));


		String tipo = request.getParameter("tipoCombo");
		CSessionManager sessionManager = CSessionManager.getInstance(request);

		//lc = CGlobalWrapper.ordenarProvinciaByAlfabeto(lc);
		sessionManager.setAttribute("comboProvincia" + tipo, CGlobalWrapper.getComboProvincia(lc));
		sessionManager.setAttribute("comboPartido" + tipo, CGlobalWrapper.getComboPartido(new LinkedList<CPartido>()));
		sessionManager.setAttribute("comboLocalidad" + tipo, CGlobalWrapper.getComboLocalidad(new LinkedList<CLocalidad>()));
		return lc;
	}

	public CPais getPais() {
		return pais;
	}

	public void setPais(CPais pais) {
		this.pais = pais;
	}

	@Override
	protected JSONObject setear(Object o) {
		CProvincia provincia = (CProvincia)o;

		JSONObject json = new JSONObject();

		json.put("codigo", provincia.getCodigo());
		json.put("descripcion", provincia.getDescripcion());

		return json;
	}

}
