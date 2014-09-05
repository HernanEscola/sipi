package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.instrumentoParticipante.CInstrumentoParticipante;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Label.LABEL_VALUE;
import conicet.apps.svt.web.dispatcher.action.CDetalleDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.instrumento.form.CInstrumentoParticipacionForm;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;

public class CInstrumentoParticipacionDetalleAction extends CDetalleDispatchAction{
	

	@Override
	protected void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		CInstrumentoParticipacionForm form = (CInstrumentoParticipacionForm) actionForm;
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		form.limpiar();
		form.setElementoSeleccionado(request.getAttribute("selected"));
		form.setInput((String) request.getAttribute("input"));
		//hacer FIND BY ID DEL PARTICIPANTE 
		form.setData((CInstrumentoParticipante) form.getElementoSeleccionado());
	}

	@Override
	public EAccionesAction setearEAccionesAction() {
		// TODO Auto-generated method stub
		return EAccionesAction.detalle;
	}


	@Override
	protected void cargarElemento(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected boolean validarEliminable(ActionErrors errors, CABMDispatchActionForm<?> actionForm, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

	
	protected void armarBotones(CABMDispatchActionForm<?> actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		
	actionForm.getBotones().clear();
	actionForm.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION));
}
}
