package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;

import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;
 
import conicet.framework.error.CException;
import conicet.framework.util.UFecha;

public class CInstrumentoModificarAction extends CInstrumentoAMAction {

	@Override
	protected Object grabar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CInstrumento instrumento =form.getData();
		HttpSession sesion = request.getSession();
		IUsuarioObject usr = (IUsuarioObject) sesion.getAttribute("iUsuario");
		instrumento.setFechaMod(UFecha.hoy());
		instrumento.setUsrMod((CUsuarioSvt)sesion.getAttribute("usuarioSVT"));
		
		CInstrumentoService.modificarInstrumento(instrumento);
		
		return instrumento;
	}

	@Override
	public EAccionesAction setearEAccionesAction() {
		return EAccionesAction.modificar;
	}

	@Override
	protected void inicializar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		super.inicializar(actionForm, request, response);
		form.setElementoSeleccionado(request.getAttribute("selected"));
		form.setData(CInstrumentoService.findInstrumentoById(((CInstrumento)form.getElementoSeleccionado()).getId()));
	}
}
