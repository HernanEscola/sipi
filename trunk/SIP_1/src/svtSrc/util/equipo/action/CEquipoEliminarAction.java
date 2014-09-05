package conicet.apps.svt.web.equipo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.svt.service.CEquipoService;
import conicet.apps.svt.web.dispatcher.action.CEliminarDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.equipo.form.CEquipoForm;
import conicet.framework.error.CException;

public class CEquipoEliminarAction  extends CEliminarDispatchAction {

	@Override
	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		//form.clear();
		form.setInput("");
		form.setMethod("");

		saveToken(request);
		form.setEAccionesAction(setearEAccionesAction());
		//inicializar(actionForm, request, response);

		armarBotones(form,request,response);
		form.setAccion(form.getEAccionesAction().getValue());
		return mapping.findForward("formulario");
	}

	@Override
	protected void inicializar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub

	}

	@Override
	protected Object grabar(ActionForm form, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoForm uform = (CEquipoForm) form;
		HttpSession sesion = request.getSession();
		IUsuarioObject u = (IUsuarioObject) sesion.getAttribute("iUsuario");

		CEquipoService.eliminar(uform.getEquipo(), new Long(u.getKey()));
		return uform.getEquipo();
	}

	@Override
	protected void cargarElemento(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
	}


}
