package conicet.apps.svt.util.security;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class CTagCheckApplicationNew extends TagSupport {
	
	private String application;
  
  
  public CTagCheckApplicationNew() {
  }

  public int doStartTag() throws JspException {
	if (this.application.equalsIgnoreCase("ALL"))
		return EVAL_BODY_INCLUDE;
    String webapp = this.pageContext.getServletContext().getServletContextName();

    String[] applications = this.getApplication().split(",");
    for (int i = 0; i < applications.length; i++) {
      if (webapp.equalsIgnoreCase(applications[i]))
				return EVAL_BODY_INCLUDE;
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
