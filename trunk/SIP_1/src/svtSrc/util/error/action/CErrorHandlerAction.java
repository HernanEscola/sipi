package conicet.apps.svt.web.error.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.svt.util.UEmail;
import conicet.apps.svt.web.error.form.CErrorHandlerActionForm;

public class CErrorHandlerAction extends Action {

	private String armarMail(CErrorHandlerActionForm form, IUsuarioObject usr) {
		String mail = " Se ha registrado el siguiente error por el usuario <em>" + usr.getLastName() + ", " + usr.getFirstName() + "</em><br>" + " con el mail " + usr.getEmail() + " <br><br>"
				+ " <strong>Descripción del entorno</strong>: " + "<br>" + form.getDescripcion() + "<br><br>" + " <strong>Error arrojado</strong>: " + "<br>" + form.getException();

		return mail;
	}

	public ActionForward execute(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CErrorHandlerActionForm errorHandlerForm = (CErrorHandlerActionForm) actionForm;
		HttpSession sesion = request.getSession();
		IUsuarioObject usr = (IUsuarioObject) sesion.getAttribute("iUsuario");

		if ("Enviar y Salir".equalsIgnoreCase(errorHandlerForm.getSubmit())) {
			UEmail.sendUsuarioHtmlMail(usr, "svt@conicet.gov.ar", "Error en SVT", this.armarMail(errorHandlerForm, usr));
			errorHandlerForm.clear();
			return actionMapping.findForward("index");
		} else {
			return actionMapping.findForward("index");
		}
	}
}
