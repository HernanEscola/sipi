package conicet.apps.svt.web.dispatcher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
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

public abstract class CDetalleDispatchAction extends CDocumentoDispatchAction {


	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.clear();
		form.setEAccionesAction(setearEAccionesAction());
		inicializar(actionForm, request, response);
		armarBotones(form,request,response);
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		} else {
			form.setInput(null);
		}
		form.setAccion(form.getEAccionesAction().getValue());
		form.setActionName(mapping.getPath().substring(1, mapping.getPath().length()));

		return mapping.findForward("formulario");
	}

	protected EAccionesAction setearEAccionesAction()
	{
		return EAccionesAction.detalle;
	}

	public ActionForward salir(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("salir");
	}

	public ActionForward modificar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		this.cargarElemento(form, request, response);
		return mapping.findForward("modificar");
	}

	public ActionForward eliminar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionErrors errors = new ActionErrors();

		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if(validarEliminable(errors, form, request)) {
			this.cargarElemento(form, request, response);
			return mapping.findForward("eliminar");
		} else {
			saveErrors(request, errors);
			return mapping.findForward("formulario");
		}
	}

	/**
	 * Se debe implementar en el caso de que exsitan validaciones que impidan la eliminacion.
	 * Retorna TRUE si es eliminable.
	 * @param request
	 * @param form
	 * @param ActionErrors
	 * @return boolean
	 */
	protected abstract boolean validarEliminable(ActionErrors errors, CABMDispatchActionForm<?> form, HttpServletRequest request);

	public ActionForward copiar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		this.cargarElemento(form, request, response);
		return mapping.findForward("altaCopia");
	}

	public ActionForward habilitar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionErrors errors = new ActionErrors();

		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if(validarHabilitable(errors, form, request)) {
			this.cargarElemento(form, request, response);
			return mapping.findForward("habilitar");
		} else {
			saveErrors(request, errors);
			return mapping.findForward("formulario");
		}


	//	CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
	//	this.cargarElemento(form, request, response);
	//	return mapping.findForward("habilitar");
	}



	public ActionForward anular(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		this.cargarElemento(form, request, response);
		return mapping.findForward("anular");
	}

	public ActionForward deshabilitar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionErrors errors = new ActionErrors();
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if(validarHabilitable(errors, form, request)) {
			this.cargarElemento(form, request, response);
			return mapping.findForward("deshabilitar");
		} else {
			saveErrors(request, errors);
			return mapping.findForward("formulario");
		}

	/*	CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		this.cargarElemento(form, request, response);
		return mapping.findForward("deshabilitar");*/
	}


	/**
	 * Se debe implementar en el caso de que existan validaciones que impidan la habilitacion/deshabilitacion
	 * Retorna TRUE si es habilitable
	 * @param request
	 * @param form
	 * @param ActionErrors
	 * @return boolean
	 */
	protected boolean validarHabilitable(ActionErrors errors, CABMDispatchActionForm<?> form, HttpServletRequest request){
		return true;
	}

	public ActionForward volver(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (StringUtils.isNotEmpty(form.getInput())) {
			request.setAttribute("input", form.getInput());
			return mapping.findForward(form.getInput());
		} else {
			form.setInput(null);
		}
		return mapping.findForward("listado");
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
		form.setEAccionesAction(setearEAccionesAction());
		armarBotones(form,request,response);
		form.setAccion(form.getEAccionesAction().getValue());
		form.setActionName(mapping.getPath().substring(1, mapping.getPath().length()));
		return mapping.findForward("formulario");
	}



	protected abstract void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;

	protected abstract void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;







	protected void armarBotones(CABMDispatchActionForm<?> actionForm,
				HttpServletRequest request, HttpServletResponse response) {
		actionForm.getBotones().clear();
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.MODIFICAR), CBoton.CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.ELIMINAR), CBoton.CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		actionForm.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION));
	}


}
