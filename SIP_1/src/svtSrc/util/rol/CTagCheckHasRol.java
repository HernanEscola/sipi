package conicet.apps.svt.util.rol;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;

 

public class CTagCheckHasRol extends TagSupport{

	private String rol;


	public CTagCheckHasRol() {
	}

	@Override
	public int doStartTag() throws JspException {

		HttpSession sesion = this.pageContext.getSession();
		IUsuarioObject usuario = (IUsuarioObject) sesion.getAttribute("iUsuario");

		if (usuario != null && usuario.getMainRol().equalsIgnoreCase(this.getRol())){
				return EVAL_BODY_INCLUDE;
		}
		return SKIP_BODY;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

}
