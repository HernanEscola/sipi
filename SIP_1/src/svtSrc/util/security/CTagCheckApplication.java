package conicet.apps.svt.util.security;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;

 

public class CTagCheckApplication extends TagSupport {

	private String application;


  public CTagCheckApplication() {
  }

  @Override
public int doStartTag() throws JspException {
	if (this.application.equalsIgnoreCase("ALL")) {
		return EVAL_BODY_INCLUDE;
	}

	HttpSession sesion = this.pageContext.getSession();
	IUsuarioObject usuario = (IUsuarioObject) sesion.getAttribute("iUsuario");

    String webapp = this.pageContext.getServletContext().getServletContextName();
// ESTO LO HAGO PARA NO TENER QUE MODIFICAR TODOS LOS JSP Y QUE SIUVT SE TRATE COMO SI FUERA SVTP
//    String[] applications = this.getAttribute(EUsuarioObjectAttr.APLICACION.name()).split(",");

    String[] applications ;
    if (this.application.equalsIgnoreCase("SIUVT") && !webapp.equalsIgnoreCase("SIUVT")){
    	applications=("SIUVT").split(",");
    }else{
    	applications =this.getApplication().split(",");
    }
    for (int i = 0; i < applications.length; i++) {
      if (webapp.equalsIgnoreCase(applications[i])) {
		return EVAL_BODY_INCLUDE;
	}
    }
    return SKIP_BODY;
  }

  public String getApplication() {
    return application;
  }


  public void setApplication(String funcion) {
    this.application = funcion;
  }

}
