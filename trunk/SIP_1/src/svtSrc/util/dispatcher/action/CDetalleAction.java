package conicet.apps.svt.web.dispatcher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.web.dispatcher.form.CDetalleActionForm;
import conicet.framework.error.CException;

public abstract class CDetalleAction extends CDispatchAction {


	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CDetalleActionForm<?> form = (CDetalleActionForm<?>) actionForm;
		form.clear();
		inicializar(form, request, response);
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		} else {
			form.setInput(null);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward salir(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("salir");
	}

	public ActionForward modificar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CDetalleActionForm<?> form = (CDetalleActionForm<?>) actionForm;
		if (form.getInput() != null) {
			request.setAttribute("input", form.getInput());
		}
		this.cargarElemento(form, request, response);
		return mapping.findForward("modificar");
	}

	public ActionForward eliminar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CDetalleActionForm<?> form = (CDetalleActionForm<?>) actionForm;
		return mapping.findForward("eliminar");
	}

	public ActionForward copiar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CDetalleActionForm<?> form = (CDetalleActionForm<?>) actionForm;
		return mapping.findForward("altaCopia");
	}

	public ActionForward habilitar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CDetalleActionForm<?> form = (CDetalleActionForm<?>) actionForm;
		return mapping.findForward("activar");
	}

	public ActionForward volver(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CDetalleActionForm<?> form = (CDetalleActionForm<?>) actionForm;
		if (form.getInput() != null) {
			request.setAttribute("input", form.getInput());
			return mapping.findForward(form.getInput());
		} else {
			form.setInput(null);
		}
		return mapping.findForward("formulario");
	}


	protected abstract void inicializar(CDetalleActionForm<?> actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;

	protected abstract void cargarElemento(CDetalleActionForm<?> actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;




}
