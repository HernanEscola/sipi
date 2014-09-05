package conicet.apps.svt.web.dispatcher.action;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.web.asesoria.form.CAsesoriaSeleccionarActionForm;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion.POSICION;
import conicet.apps.svt.web.dispatcher.form.CSeleccionarActionForm;
import conicet.framework.error.CException;

public abstract class CSeleccionarAction extends CDispatchAction {

	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CSeleccionarActionForm<?> form = (CSeleccionarActionForm<?>) actionForm;
		form.clear();
		form.limpiar();
		if (request.getAttribute("lote")!= null){
			form.setAsignados(new LinkedList((Collection) request
				.getAttribute("lote")));
		}
		inicializar(actionForm, request, response);
		armarBotones(form,request,response);
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		} else {
			form.setInput(null);
		}
		return mapping.findForward("formulario");
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
		CSeleccionarActionForm<?> form = (CSeleccionarActionForm<?>) actionForm;
		form.clear();
		if (request.getAttribute("lote")!= null){
			form.setAsignados(new LinkedList((Collection) request
				.getAttribute("lote")));
		}
		inicializar(actionForm, request, response);
		armarBotones(form,request,response);
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		} else {
			form.setInput(null);
		}


		return mapping.findForward("formulario");
	}


	public ActionForward registrar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionErrors errors = new ActionErrors();
		CSeleccionarActionForm<?> form = (CSeleccionarActionForm<?>) actionForm;
		request.setAttribute("lote", form.getAsignados());

		this.saveToken(request);
		if (validar(form, form.getAsignados(),errors )) {
			if (form.getInput() != null) {
				request.setAttribute("input", form.getInput());
				return mapping.findForward(form.getInput());
			} else {
				form.setInput(null);
			}
		}
		saveErrors(request, errors);
		return mapping.findForward("formulario");

	}


	public ActionForward volver(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CSeleccionarActionForm<?> form = (CSeleccionarActionForm<?>) actionForm;
		request.setAttribute("lote", null);
		if (form.getInput() != null) {
			request.setAttribute("input", form.getInput());
			return mapping.findForward(form.getInput());
		} else {
			form.setInput(null);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CSeleccionarActionForm<?> form = (CSeleccionarActionForm<?>) actionForm;
		form.getNoAsignados().clear();
		form.setNoAsignados((buscar(form, request)) );
		return mapping.findForward("formulario");
	}

	public ActionForward asignar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CSeleccionarActionForm<?> form = (CSeleccionarActionForm<?>) actionForm;
		form.asignar();
		return mapping.findForward("formulario");
	}

	public ActionForward desasignar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CSeleccionarActionForm<?> form = (CSeleccionarActionForm<?>) actionForm;
		form.desasignar();
		return mapping.findForward("formulario");
	}

	protected abstract void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;


	protected void armarBotones(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		CSeleccionarActionForm<?> form = (CSeleccionarActionForm<?>) actionForm;
		form.getBotones().clear();
		form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.REGISTRAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));

	}

	protected abstract List<? extends Object> buscar(
			ActionForm actionForm,
			HttpServletRequest httpServletRequest) throws CException;

	/**
	 * Metodo a implementar para realizar validaciones sobre la lista de objetos seleccionados.
	 * @param CSeleccionarActionForm<?>
	 * @param List<? extends Object>
	 * @param ActionErrors
	 * @return boolean true
	 * @throws Exception
	 */
	protected boolean validar(CSeleccionarActionForm<?> actionForm, List<? extends Object> lista, ActionErrors errors)
	{
		return true;
	}

	
	public ActionForward detalle(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CAsesoriaSeleccionarActionForm form = (CAsesoriaSeleccionarActionForm) actionForm;
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		request.setAttribute("soloConsulta", "S");		
		request.setAttribute("selected", form.getElementoSeleccionado());
		return mapping.findForward("detalle");
	}
	
}
