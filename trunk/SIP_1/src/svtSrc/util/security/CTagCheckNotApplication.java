package conicet.apps.svt.util.security;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class CTagCheckNotApplication extends TagSupport {

	private String application;

	public CTagCheckNotApplication() {
	}

	public int doStartTag() throws JspException {
		if (this.application.equalsIgnoreCase("ALL"))
			return EVAL_BODY_INCLUDE;
		String webapp = this.pageContext.getServletContext().getServletContextName();
		String[] applications;

		applications = this.getApplication().split(",");
		for (int i = 0; i < applications.length; i++) {
			if (webapp.equalsIgnoreCase(applications[i])) {
				return SKIP_BODY;
			}
		}
		return EVAL_BODY_INCLUDE;

	}

	public String getApplication() {
		return application;
	}

	public void setApplication(String funcion) {
		this.application = funcion;
	}

}
