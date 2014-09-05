package conicet.apps.svt.util.security;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import conicet.apps.commons.users.model.impl.EUsuarioObjectAttr;
import conicet.apps.svt.service.CAdministracionService;
import conicet.framework.error.CException;
import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;

 

public class CtagCheckNoFunction extends TagSupport {

	private static final long serialVersionUID = 149192853765975212L;
	private String funcion;

	public CtagCheckNoFunction() {
	}

	@SuppressWarnings("rawtypes")
	public int doStartTag() throws JspException {
		HttpSession ses = this.pageContext.getSession();
		IUsuarioObject us = (IUsuarioObject) ses.getAttribute("iUsuario");
		Map funcionesRol = (Map) us.getAttribute(EUsuarioObjectAttr.FUNCIONES_ROL.name());
		/*Map funcionesRol;
		try {
			funcionesRol = (Map)CAdministracionService.darFuncionesUsuarioMap(us);
		} catch (CException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new JspException("Error intentando conseguir las funciones del rol " + us.getMainRol() + " del usuario " + us.getLastName() + ", " + us.getFirstName());
		}*/
		String[] funciones = this.getFuncion().split(",");
		for (int i = 0; i < funciones.length; i++) {
			if ((funcionesRol.containsKey(funciones[i])))
				return Tag.SKIP_BODY;
		}
		return Tag.EVAL_BODY_INCLUDE;
	}

	public String getFuncion() {
		return funcion;
	}
	
	public void setFuncion(String funcion) {
		this.funcion = funcion;
	}


}
