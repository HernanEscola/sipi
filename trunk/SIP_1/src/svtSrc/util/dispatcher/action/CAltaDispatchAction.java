package conicet.apps.svt.web.dispatcher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Label.LABEL_VALUE;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion.POSICION;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.framework.error.CException;

public abstract class CAltaDispatchAction extends CDispatchAction {


	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.clear();
		inicializar(actionForm, request, response);
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		} else {
			form.setInput(null);
		}
		armarBotones(form,request,response);

		form.setAccion("alta");
		return mapping.findForward("formulario");
	}

	public ActionForward volver(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (!StringUtils.isEmpty(form.getInput())) {
			return mapping.findForward(form.getInput());
		}
		return mapping.findForward("index");

	}


	public ActionForward limpiar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		//String input = form.getInput();
		form.limpiar();
		return mapping.findForward("formulario");
	}

	public ActionForward salir(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("index");
	}

	public ActionForward registrar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (validar(form,request,response)){
			form.setAccion("altaCfm");
			armarBotonesCfm(form,request,response);
			this.saveToken(request);

		} else {
			form.setAccion("alta");
		}
		return mapping.findForward("formulario");
	}

	public ActionForward modificar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.setAccion("alta");
		armarBotones(form,request,response);
		return mapping.findForward("formulario");
	}

	public ActionForward grabar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (this.isTokenValid(request, true)) {
			Object obj = grabar(actionForm, request, response);
			request.setAttribute("object", obj);
			if (null != form.getInput()) {
				return mapping.findForward(form.getInput());
			} else {
				return mapping.findForward("listadoRecientes");
			}
		}
		return mapping.findForward("index");
	}

	protected abstract Object grabar(ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws CException;

	protected abstract void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;


	protected void armarBotones(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.getBotones().clear();
		form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.REGISTRAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		/*if (form.getInput() != null) {
			form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		}*/


	}

	protected void armarBotonesCfm(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
	form.getBotones().clear();
	form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.GRABAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
	form.getBotones().add(new CBoton(new Label(LABEL_VALUE.MODIFICAR), CBoton.NO_CHECK_FUNCTION));

	}

	protected abstract boolean validar(ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws CException;


	public ActionForward refrescar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.setAccion("alta");
		return mapping.findForward("formulario");

	}

}
