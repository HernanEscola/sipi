package conicet.apps.svt.web.dispatcher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

public abstract class  CModificarDispatchAction extends CAutoCompleteDispatchAction {

	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.clear();
		inicializarAutoCompletes(form);
		inicializar(actionForm, request, response);
		armarBotones(form, request, response);
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		} else {
			form.setInput(null);
		}
		form.setAccion("modificar");
		return mapping.findForward("formulario");
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
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
			form.setAccion("confirmar");
			armarBotonesCfm(form,request,response);
			this.saveToken(request);
		} else {
			form.setAccion("modificar");
		}
		return mapping.findForward("formulario");
	}

	public ActionForward modificar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		//request.setAttribute("selected", form.getData());
		armarBotones(form,request,response);
		form.setAccion("modificar");
		return mapping.findForward("formulario");
	}

	public ActionForward grabar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (this.isTokenValid(request, true)) {
			Object obj = grabar(actionForm, request, response);
			request.setAttribute("precio", obj);
			if (null != form.getInput()) {
				return mapping.findForward(form.getInput());
			} else {
				return mapping.findForward("listado");
			}
		}
		return mapping.findForward("index");
	}

	public ActionForward volver(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		request.setAttribute("selected",form.getElementoSeleccionado());
		return mapping.findForward("detalle");
	}

	protected abstract Object grabar(ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws CException;

	protected abstract void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;

	protected abstract void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;

	/**
	 * Método a implementar para realizar la validación en registrar.<br>
	 * Aquí además de ser necesario, se cargan los ActionMessages y
	 * ActionErrors.
	 *
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws CException
	 */
	protected abstract boolean validar(ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws CException;


	protected void armarBotones(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
	form.getBotones().clear();
	form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.REGISTRAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
	form.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION));

	}

	protected void armarBotonesCfm(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
	form.getBotones().clear();
	form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.GRABAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
	form.getBotones().add(new CBoton(new Label(LABEL_VALUE.MODIFICAR), CBoton.NO_CHECK_FUNCTION));

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
		form.setAccion("modificar");
		return mapping.findForward("formulario");
	}


	/**
	 * <p>Implementar: la implmenetacion es del tipo siguiente donde jsonResponse es el CJSONReposne o CAutocomplete correspondiente a resolver la consulta</p>
	 * <p>form.agregarAutoComplete("tipo",new CJsonResponse());
	 * </p>
	 */
	public abstract void  inicializarAutoCompletes(CABMDispatchActionForm<?> form);


}
