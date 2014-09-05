package conicet.apps.svt.util.security;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import conicet.apps.commons.users.model.impl.EUsuarioObjectAttr;
import conicet.apps.svt.service.CAdministracionService;
import conicet.framework.error.CException;
import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;

 

public class CtagCheckFuncion extends TagSupport {
  private String funcion;
  private String valido = "true";

  public CtagCheckFuncion() {
  }

  public int doStartTag() throws JspException {
    HttpSession ses = this.pageContext.getSession();
    IUsuarioObject us = (IUsuarioObject)ses.getAttribute("iUsuario");
    Map funcionesRol = (Map) us.getAttribute(EUsuarioObjectAttr.FUNCIONES_ROL.name());
	/*try {
		funcionesRol = (Map)CAdministracionService.darFuncionesUsuarioMap(us);
	} catch (CException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		throw new JspException("Error intentando conseguir las funciones del rol " + us.getMainRol() + " del usuario " + us.getLastName() + ", " + us.getFirstName());
	}*/
    String[] funciones = this.getFuncion().split(",");
    for (int i = 0; i < funciones.length; i++) {
      if ((funcionesRol.containsKey(funciones[i]) && valido.equals("true")) || (!funcionesRol.containsKey(funciones[i]) && valido.equals("false")))
        return this.EVAL_BODY_INCLUDE;
    }
    return this.SKIP_BODY;
  }
  public String getFuncion() {
    return funcion;
  }

  public String getValido() {
    return valido;
  }

  public void setFuncion(String funcion) {
    this.funcion = funcion;
  }

  public void setValido(String valido) {
    this.valido = valido;
  }

}
