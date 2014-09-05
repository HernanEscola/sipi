package conicet.apps.svt.web.equipo.action;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import conicet.apps.svt.object.bitacora.ETipoBitacora;
import conicet.apps.svt.object.equipo.CEquipo;
import conicet.apps.svt.service.CBitacoraService;
import conicet.apps.svt.service.CEquipoService;
import conicet.apps.svt.service.CLogService;
import conicet.apps.svt.util.CBitacoraManager;
import conicet.apps.svt.util.CLogManager;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.dispatcher.action.CDetalleDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.equipo.form.CEquipoDetalleActionForm;
import conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaWrapper;
import conicet.apps.svt.web.util.action.CComboPaisAction;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;

public class CEquipoDetalleAction extends CDetalleDispatchAction {

	public CEquipoDetalleAction() {
	}

	protected Object getEquipo(CEquipoDetalleActionForm form) {
		return form.getEquipo();
	}

	/**
	 * validar si existen PRE OFERTAS PRESENTADAS relacionadas con el equipo a
	 * modificar
	 *
	 * @param cFichaActionForm
	 *            CFichaActionForm
	 * @param request
	 *            HttpServletRequest
	 */
	protected boolean validarPresentado(CEquipoDetalleActionForm form, HttpServletRequest request) throws CException {
		/* creo un actionmessage */
		ActionMessages errors = new ActionMessages();
		CEquipo equipo = (CEquipo) request.getAttribute("selected");
		/*
		 * llamo al service de Equipo para que se fije si ese Equipo esta
		 * asignado a una OT; sino tira error
		 */
		if (CEquipoService.findPreOfertasPresentadasByEquipo(equipo)) {
			errors.add("bajaEquipo", new ActionMessage("errors.dynamic", "El equipamiento se encuentra seleccionado en una Oferta Tecnológica en estado presentado."));
			form.setBloquearDatos("SI");

		}
		/* guarda el error y si no hay errores devuelve true */
		saveErrors(request, errors);
		return errors.isEmpty();
	}

	@Override
	protected void armarBotones(CABMDispatchActionForm<?> actionForm, HttpServletRequest request, HttpServletResponse response) {

		actionForm.getBotones().clear();
		CEquipoDetalleActionForm form = (CEquipoDetalleActionForm) actionForm;
		if (form.getOcultarBotonesModificacion().equalsIgnoreCase("no")) {
			form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.MODIFICAR), CBoton.CHECK_FUNCTION, CBoton.Aplicacion.ALL));
			form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.ELIMINAR), CBoton.CHECK_FUNCTION, CBoton.Aplicacion.ALL));
		}
		form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION));
	}

	/*
	 * @Override protected boolean validarEliminable(ActionErrors errors) { //
	 * TODO Auto-generated method stub return false; }
	 */

	@Override
	protected void inicializar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);

		CEquipo equipo = (CEquipo) request.getAttribute("selected");
		CEquipoDetalleActionForm form = (CEquipoDetalleActionForm) actionForm;
		form.limpiar();
		form.setElementoSeleccionado(equipo);
		if (null == request.getAttribute("skipSearch")) {
			equipo = CEquipoService.findEquipoById(equipo);
		}

		form.setData(equipo);

		if (sessionManager.getAttribute("ocultarBotonesModificacion") != null) {
			if (((String) sessionManager.getAttribute("ocultarBotonesModificacion")).equalsIgnoreCase("si")) {
				form.setOcultarBotonesModificacion("si");
			} else {
				form.setOcultarBotonesModificacion("no");
			}
		} else {
			form.setOcultarBotonesModificacion("no");
		}
		if(equipo.getDomicilio() !=null){
			CComboPaisAction.setearCombosEnSesionByLocalidad(request, "", equipo.getDomicilio().getLocalidad());
		}else{
			CComboPaisAction.setearCombosEnSesion(request);
		}
		if (sessionManager.getAttribute("comboNombres") == null) {
			sessionManager.setAttribute("comboNombres", COfertaTecnologicaWrapper.getComboNombres());
		}

		CBitacoraManager.getInstance(request, CBitacoraService.darBitacora(equipo), ETipoBitacora.Equipo);
		CLogManager lmg = CLogManager.getInstance(request);
		lmg.setResultados(CLogService.findLogEquipo(equipo));
	}

	@Override
	protected void cargarElemento(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoDetalleActionForm form = (CEquipoDetalleActionForm) actionForm;
		request.setAttribute("selected", form.getElementoSeleccionado());
	}

	@Override
	public ActionForward modificar(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (validarPresentado((CEquipoDetalleActionForm) form, request)) {
			this.cargarElemento(form, request, response);
			return mapping.findForward("modificar");
		} else {
			return mapping.findForward("formulario");
		}
	}

	@Override
	protected boolean validarEliminable(ActionErrors errors, CABMDispatchActionForm<?> actionForm, HttpServletRequest request) {
		CEquipoDetalleActionForm form = (CEquipoDetalleActionForm) actionForm;
		CEquipo equipo = (CEquipo) request.getAttribute("selected");
		/*
		 * llamo al service de Equipo para que se fije si ese Equipo esta
		 * asignado a una OT; sino tira error
		 */try {
			Collection col = CEquipoService.findOfertasYPreofertasVinculadasAlEquipo(equipo);
			// TODO: handle exception

			if (col != null && !col.isEmpty()) {
				errors.add("bajaEquipo", new ActionMessage("errors.dynamic", "El equipamiento se encuentra seleccionado en una Oferta Tecnológica."));
				form.setBloquearDatos("SI");
			}
		} catch (Exception e) {
			return true;
		}
		/* guarda el error y si no hay errores devuelve true */
		return errors.isEmpty();
	}


}
