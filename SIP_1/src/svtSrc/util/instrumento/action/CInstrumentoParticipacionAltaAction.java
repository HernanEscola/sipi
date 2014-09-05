package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.instrumentoParticipante.CInstrumentoParticipante;
import conicet.apps.svt.object.unidadDeTiempo.EUnidadDeTiempo;
import conicet.apps.svt.util.valida.CManejadorErrorSVT;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Label.LABEL_VALUE;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion.POSICION;
import conicet.apps.svt.web.dispatcher.action.CAMDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.apps.svt.web.instrumento.form.CInstrumentoParticipacionForm;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;

public class CInstrumentoParticipacionAltaAction extends CAMDispatchAction{

	@Override
	public ActionForward registrar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoParticipacionForm form = (CInstrumentoParticipacionForm) actionForm;
		//con esto se setean todos los cambiso
		form.getData();
		return mapping.findForward(form.getInput());
	}
	

	@Override
	protected void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		CInstrumentoParticipacionForm form = (CInstrumentoParticipacionForm) actionForm;
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		form.limpiar();
		form.setElementoSeleccionado(request.getAttribute("selected"));
		form.setInput((String) request.getAttribute("input"));
		
		if (sessionManager.getAttribute("comboUnidades") == null) {
			sessionManager.setAttribute("comboUnidades", CGlobalWrapper.getComboByIdentityDesc(EUnidadDeTiempo.values()));
		}
		
		form.setData((CInstrumentoParticipante) request.getAttribute("selected"));
	}
	



	@Override
	protected boolean validar(ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws CException {
		CInstrumentoParticipacionForm form = (CInstrumentoParticipacionForm)actionForm;
		ActionErrors errors = new ActionErrors();
		ActionMessages am = new ActionMessages();

		form.validarFields(errors, am, new CManejadorErrorSVT());
		if(!errors.isEmpty()){
			saveErrors(request, errors);
			return false;
		}else{
			saveMessages(request, am);
		}

		return true;
	}

	
	public ActionForward agregar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoParticipacionForm form = (CInstrumentoParticipacionForm) actionForm;
		ActionMessages errors = new ActionMessages();
		if(!form.agregarParticipacion(errors)){
			saveErrors(request, errors);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward removeParticipacion(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoParticipacionForm form = (CInstrumentoParticipacionForm) actionForm;
		remove(form.getParticipaciones(), request);
		return mapping.findForward("formulario");
	}
	
	@Override
	public EAccionesAction setearEAccionesAction() {
		return EAccionesAction.alta;
	}

	@Override
	protected void armarBotones(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		CInstrumentoParticipacionForm form = (CInstrumentoParticipacionForm) actionForm;
		form.getBotones().clear();
		form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.REGISTRAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		form.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		
	}

	@Override
	protected void cargarElemento(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected Object grabar(ActionForm form, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void inicializarAutoCompletes(CABMDispatchActionForm<?> form) {
		// TODO Auto-generated method stub
		
	}
}
