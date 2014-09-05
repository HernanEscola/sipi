package conicet.apps.svt.util.web;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import conicet.apps.svt.web.moduloPrestador.form.COfertaTecnologicaAceptarModificacionesActionForm;

public class CTagAceptacionRechazoProperty extends TagSupport{
	private String form;
	private String property;
	
	public void setProperty(String property) {
      this.property = property;
	}
	
	public void setForm(String form) {
      this.form = form;
	}
	
	public int doStartTag() throws JspException {
		StringBuffer str = new StringBuffer("");
		str.append("<td colspan=\"2\" width=\"100%\">")
           .append("<div class=\"aceptarBar aceptarLabel\" style=\"width: 19%;\"><p class=\"aceptarP\">Aceptar:&nbsp;</p></div>")
		   .append("<div class=\"aceptarBar aceptarOption\" style=\"width: 40%;\">")
		   .append("<input type=\"checkbox\" ")
		   .append("id=\""+property+"Aceptar\" name=\"aceptarModificacion("+property+")\" ")
		   .append("value=\""+property+"\" ")
		   .append(this.getCheckedAceptar()+" ")
		   .append("onclick=\"aceptarProperty('"+property+"')\"/> ") 
		   .append("</div>")
		   .append("<div class=\"aceptarBar aceptarLabel\" style=\"width: 30%;\">")
		   .append("<p class=\"aceptarP\">Rechazar:&nbsp;</p>")
		   .append("</div>")
		   .append("<div class=\"aceptarBar aceptarOption\" style=\"width: 10%;\">")
		   .append("<input type=\"checkbox\" ")
		   .append("id=\""+property+"Rechazar\" name=\"rechazarModificacion("+property+")\" ")
		   .append("value=\""+property+"\" ")
		   .append(this.getCheckedRechazar()+" ")
		   .append("onclick=\"rechazarProperty('"+property+"')\"/> ")
		   .append("</div>")
		   .append("</td>");
		try {
	         pageContext.getOut().print(str.toString());
	      } catch (IOException ioe) {
	         throw new JspException();
	      }
	      return SKIP_BODY;
	}
	
	private String getCheckedAceptar(){
		if ("cOfertaTecnologicaAceptarModificacionesActionForm".equalsIgnoreCase(form)){
			COfertaTecnologicaAceptarModificacionesActionForm formulario = (COfertaTecnologicaAceptarModificacionesActionForm)this.pageContext.getSession().getAttribute(form);
			return formulario.getIsAccepted(property);
		} else
			return "";
	}
	
	private String getCheckedRechazar(){
		if ("cOfertaTecnologicaAceptarModificacionesActionForm".equalsIgnoreCase(form)){
			COfertaTecnologicaAceptarModificacionesActionForm formulario = (COfertaTecnologicaAceptarModificacionesActionForm)this.pageContext.getSession().getAttribute(form);
			return formulario.getIsRejected(property);
		} else
			return "";
	}
}
