package conicet.apps.svt.util;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CLogManager {
  private HttpSession session;
  private Collection resultados;
  private String accion="mostrar";

  public HttpSession getSession() {
    return session;
  }

  public void setSession(HttpSession session) {
    this.session = session;
  }

  public void setResultados(Collection resultados) {
    this.resultados = resultados;
  }

  public void setAccion(String accion) {
    this.accion = accion;
  }

  public Collection getResultados() {
    return resultados;
  }

  public String getAccion() {
    return accion;
  }

  public CLogManager() {
  }

  public CLogManager(HttpServletRequest request) {
  this.session = request.getSession(true);
}

public static CLogManager getInstance(HttpServletRequest request) {
  HttpSession session = request.getSession(true);
  CLogManager logManager = (CLogManager)session.getAttribute("logManager");
  if (logManager != null) {
    return logManager;
  } else {
    logManager= new CLogManager(request);
    session.setAttribute("logManager",logManager);
    return logManager;
  }
}



}
