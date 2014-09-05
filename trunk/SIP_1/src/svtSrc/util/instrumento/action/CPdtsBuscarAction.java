package conicet.apps.svt.web.instrumento.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.struct.busqueda.CInstrumentoBusquedaStruct;
import conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm;
import conicet.apps.svt.web.instrumento.decorator.CInstrumentoWrapper;
import conicet.apps.svt.web.instrumento.form.CInstrumentoBuscarActionForm;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;
import conicet.framework.util.UFecha;


public class CPdtsBuscarAction extends CInstrumentoBuscarAction {

	@Override
	public void inicializar(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {

		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) actionForm;
		HttpSession sesion = request.getSession();
		CUsuarioSvt usr = ((CUsuarioSvt)sesion.getAttribute("usuarioSVT"));
		inicializarCombos(request,usr);
		form.setTipoBusqueda("pdts");
		form.limpiar();

	}

	@Override
	protected void inicializarCombos(HttpServletRequest request, CUsuarioSvt usr) throws CException {
		super.inicializarCombos(request, usr);
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		sessionManager.setAttribute("comboClasificacionPDT", CInstrumentoWrapper.getComboClasificacionPDT(CInstrumentoService.findClasificacionPDTPadre()));		
	}
	
	@Override
	protected List<? extends Object> buscar(CBusquedaActionForm<?> cBusquedaActionForm, HttpServletRequest request) throws CException {
		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) cBusquedaActionForm;
		form.setExisteBusqueda(true);
		form.setEsPdt(true);
		CInstrumentoBusquedaStruct  ibs = armarCriterioBusqueda(form, request);
		return CInstrumentoService.findInstrumentoByCriterio(ibs);
	}

	@Override
	protected List<? extends Object> buscarAltasDelDia(CBusquedaActionForm<?> cBusquedaActionForm, HttpServletRequest request) throws CException {
		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) cBusquedaActionForm;
		HttpSession sesion = request.getSession();
		CUsuarioSvt usr = ((CUsuarioSvt)sesion.getAttribute("usuarioSVT"));
		form.setEsPdt(true);
		inicializarCombos(request,usr);
		CInstrumentoBusquedaStruct bs = new CInstrumentoBusquedaStruct();
		bs.setFechaAlta(UFecha.hoy());
		bs.setEsPdt(true);
		form.setTipoBusqueda("pdts");
		return CInstrumentoService.findInstrumentoByCriterio(bs);
	}



}