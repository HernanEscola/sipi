package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.util.archivo.CArchivoUtil;
import conicet.apps.svt.util.valida.CManejadorErrorSVT;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Label.LABEL_VALUE;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion.POSICION;
import conicet.apps.svt.web.dispatcher.action.CAMDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.instrumento.decorator.CInstrumentoWrapper;
import conicet.apps.svt.web.instrumento.form.CConvenioItemTramiteForm;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;

public class CConvenioItemTramiteAMAction extends CAMDispatchAction{

	@Override
	protected Object grabar(ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm) actionForm;
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		//form.setInput("detalle");
		//HttpSession s = request.getSession();
		form.setElementoSeleccionado(request.getAttribute("selected"));
		sessionManager.setAttribute("cboEvento", CInstrumentoWrapper.getComboEventos());
		form.limpiar();


	}

	@Override
	protected void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		// TODO Auto-generated method stub

	}

	@Override
	protected boolean validar(ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws CException {
		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm)actionForm;
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

	@Override
	public EAccionesAction setearEAccionesAction() {
		// TODO Auto-generated method stub
		return null;
	}

	public ActionForward quitararchivo(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {

		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm) actionForm;
		form.borrarArchivo();

		return mapping.findForward("formulario");
	}

	public ActionForward validararchivo(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {

		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm) actionForm;

		ActionErrors er = form.validarArchivo();

		if(!er.isEmpty())
		{
			saveErrors(request, er);
			quitararchivo(mapping, actionForm, request,response);
		}

		return mapping.findForward("formulario");
	}

	public void descargar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		 	CConvenioItemTramiteForm f = (CConvenioItemTramiteForm)actionForm;
		 	CArchivoUtil.descargarArchivo(request, response, f.getArchivo());
	}

	@Override
	protected void armarBotones(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm) actionForm;
		form.getBotones().clear();
		form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.REGISTRAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		form.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));


	}

	@Override
	public void inicializarAutoCompletes(CABMDispatchActionForm<?> form) {
		// TODO Auto-generated method stub
		
	}

}
