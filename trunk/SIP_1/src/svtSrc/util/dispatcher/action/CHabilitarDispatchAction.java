package conicet.apps.svt.web.dispatcher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Label.LABEL_VALUE;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion.POSICION;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.framework.error.CException;

public abstract class CHabilitarDispatchAction extends CDispatchAction {

	protected EAccionesAction setearEAccionesAction()
	{
		return EAccionesAction.inhabilitar;
	}

	
	public ActionForward init(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.clear();
		basicInit(mapping, actionForm, request, response);

		return mapping.findForward("formulario");
	}

	private void basicInit(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		saveToken(request);
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.setEAccionesAction(setearEAccionesAction());
		inicializar(actionForm, request, response);
		form.setActionName(mapping.getPath().substring(1, mapping.getPath().length()));
		armarBotones(form, request, response);
		form.setAccion(form.getEAccionesAction().getValue());
	}

	public ActionForward initFromDetalle(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		basicInit(mapping, actionForm, request, response);
		return mapping.findForward("formulario");
	}
	
	public ActionForward salir(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("salir");
	}

	public ActionForward grabar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (this.isTokenValid(request)) {
			resetToken(request);
			Object obj = grabar(actionForm, request, response);
			request.setAttribute("object", obj);
			return mapping.findForward("listado");
		}
		return mapping.findForward("index");
	}

	protected abstract Object grabar(ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws CException;


	public ActionForward volver(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		request.setAttribute("selected",form.getElementoSeleccionado());
		return mapping.findForward("detalle");
	}

	/**
	 * LEVANTA NUEVAMENTE LA PANTALLA DE CONSULTA
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward refrescar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		return mapping.findForward("formulario");
	}

	protected abstract void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;

	protected abstract void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;


	protected void armarBotones(CABMDispatchActionForm<?> actionForm,
				HttpServletRequest request, HttpServletResponse response) {

		actionForm.getBotones().clear();
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.GRABAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		actionForm.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION));

	}

}
