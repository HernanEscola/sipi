package conicet.apps.svt.web.instrumento.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import conicet.apps.siuvt.service.CIngresoService;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.service.COfertaTecnologicaService;
import conicet.apps.svt.util.archivo.CArchivoUtil;
import conicet.apps.svt.web.dispatcher.action.CHabilitarDispatchAction;
import conicet.apps.svt.web.instrumento.decorator.CInstrumentoWrapper;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;
import conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaWrapper;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;
import conicet.framework.util.UFecha;

public class CInstrumentoHabilitarAction  extends CHabilitarDispatchAction{

	@Override
	protected Object grabar(ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		HttpSession sesion = request.getSession();
		CUsuarioSvt usr = (CUsuarioSvt) sesion.getAttribute("usuarioSVT");
		CInstrumento i = form.getInstrumento();
		i.setUsrMod(usr);
		i.setFechaMod(UFecha.hoy());
		
		CInstrumentoService.deshabilitarHabilitarInstrumento(i);
		return i;
	}

	@Override
	protected void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	throws CException {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		HttpSession sesion = request.getSession();
		CSessionManager sessionManager = CSessionManager.getInstance(request);

		form.limpiar();
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		}
		inicializarCombos(request);
		
		form.setUsuario((CUsuarioSvt)sesion.getAttribute("usuarioSVT"));
		
		form.getTiposItems().addAll(CIngresoService.findTipoItemFacturacionParaDistribucionFactura());
		form.inicializarDistribucion();
		
		form.setElementoSeleccionado(request.getAttribute("selected"));
		form.setData(CInstrumentoService.findInstrumentoById(((CInstrumento)form.getElementoSeleccionado()).getId()));
	}

	private void inicializarCombos(HttpServletRequest request) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		if (sessionManager.getAttribute("comboResponsablesConvenio") == null)
			sessionManager.setAttribute("comboResponsablesConvenio", CInstrumentoWrapper.getComboResponsablesBusqueda());
		if (sessionManager.getAttribute("comboResponsables") == null)
			sessionManager.setAttribute("comboResponsables", CInstrumentoWrapper.getComboResponsables());
		if (sessionManager.getAttribute("comboEstados") == null)
			sessionManager.setAttribute("comboEstados", CInstrumentoWrapper.getComboEstados());
		if (sessionManager.getAttribute("comboAlcanceConvenio") == null)
			sessionManager.setAttribute("comboAlcanceConvenio", CInstrumentoWrapper.getComboAlcanceConvenio());
		if (sessionManager.getAttribute("comboTipoConvenios") == null)
			sessionManager.setAttribute("comboTipoConvenios", CInstrumentoWrapper.getComboTipoConvenios());
		if (sessionManager.getAttribute("comboAños") == null)
			sessionManager.setAttribute("comboAños", CInstrumentoWrapper.getComboAños());
		if (sessionManager.getAttribute("comboCategoriaPDT") == null)
			sessionManager.setAttribute("comboCategoriaPDT", CInstrumentoWrapper.getComboCategoriaPDT());
		if (sessionManager.getAttribute("comboTipoMoneda") == null)
			sessionManager.setAttribute("comboTipoMoneda", COfertaTecnologicaWrapper.getComboTipoMonedaSinPesos(COfertaTecnologicaService.findTipoMoneda()));
		//if (sessionManager.getAttribute("comboTiposParte") == null)
			sessionManager.setAttribute("comboTiposParte", CInstrumentoWrapper.getComboTipoPartes());
	}
	
	@Override
	protected void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		request.setAttribute("selected", form.getElementoSeleccionado());
	}
	
	public void descargarplandetrabajo(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		CInstrumentoForm f = (CInstrumentoForm)actionForm;
	 	
	 	CArchivoUtil.descargarArchivo(request, response, f.getPlanDeTrabajo());
		 	
	}

}
