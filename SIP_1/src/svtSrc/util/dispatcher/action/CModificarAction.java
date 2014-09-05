package conicet.apps.svt.web.dispatcher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.web.dispatcher.form.CModificarActionForm;
import conicet.framework.error.CException;

public abstract class  CModificarAction extends CDispatchAction {

	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CModificarActionForm<?> form = (CModificarActionForm<?>) actionForm;
		form.clear();
		inicializar(form, request, response);
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		} else {
			form.setInput(null);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CModificarActionForm<?> form = (CModificarActionForm<?>) actionForm;
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
		CModificarActionForm<?> form = (CModificarActionForm<?>) actionForm;
		if (validar(form,request,response)){
			form.setAccion("confirmar");
			this.saveToken(request);
		} else {
			form.setAccion("registrar");
		}
		return mapping.findForward("formulario");
	}

	public ActionForward modificar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CModificarActionForm<?> form = (CModificarActionForm<?>) actionForm;
		request.setAttribute("selected", form.getData());
		form.setAccion("modificar");
		return mapping.findForward("modificar");
	}

	public ActionForward grabar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CModificarActionForm<?> form = (CModificarActionForm<?>) actionForm;
		if (this.isTokenValid(request, true)) {
			Object obj = grabar(form, request, response);
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
		CModificarActionForm<?> form = (CModificarActionForm<?>) actionForm;
		request.setAttribute("selected",form.getElementoSeleccionado());
		return mapping.findForward("detalle");
	}

	protected abstract Object grabar(CModificarActionForm<?> form, HttpServletRequest request,
			HttpServletResponse response) throws CException;

	protected abstract void inicializar(CModificarActionForm<?> actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;

	protected abstract void cargarElemento(CModificarActionForm<?> actionForm,
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
	protected abstract boolean validar(CModificarActionForm<?> form,
			HttpServletRequest request, HttpServletResponse response)
			throws CException;

}
