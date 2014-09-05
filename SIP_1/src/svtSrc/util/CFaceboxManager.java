package conicet.apps.svt.util;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CFaceboxManager {

	private HttpSession session;
	private Collection<Object> resultados;
	private String accion = "mostrar";

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public void setResultados(Collection<Object> resultados) {
		this.resultados = resultados;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}

	public Collection<Object> getResultados() {
		return resultados;
	}

	public String getAccion() {
		return accion;
	}

	public CFaceboxManager(HttpServletRequest request) {
		this.session = request.getSession(true);
	}

	public static CFaceboxManager getInstance(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		CFaceboxManager faceboxManager = (CFaceboxManager) session
				.getAttribute("faceboxManager");
		if (faceboxManager != null) {
			return faceboxManager;
		} else {
			faceboxManager = new CFaceboxManager(request);
			session.setAttribute("faceboxManager", faceboxManager);
			return faceboxManager;
		}
	}

}
