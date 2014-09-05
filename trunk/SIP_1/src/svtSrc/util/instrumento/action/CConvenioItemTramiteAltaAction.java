package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.convenio.CConvenio;
import conicet.apps.svt.object.instrumentoItemTramite.CInstrumentoItemTramite;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.web.instrumento.form.CConvenioItemTramiteForm;
import conicet.framework.error.CException;
import conicet.framework.util.UFecha;

public class CConvenioItemTramiteAltaAction extends CConvenioItemTramiteAMAction{

	@Override
	protected Object grabar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
	throws CException {
		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm) actionForm;
		CInstrumentoItemTramite itemTramite = form.getData();
		HttpSession sesion = request.getSession();
		CUsuarioSvt usr = (CUsuarioSvt) sesion.getAttribute("usuarioSVT");

		itemTramite.setUsrAlta(usr);
		itemTramite.setFechaAlta(UFecha.hoy());
		form.setInput("detalle");
		CInstrumentoService.registrarConvenioItemTramite(itemTramite,(CConvenio)form.getElementoSeleccionado());
		request.setAttribute("selected", form.getElementoSeleccionado());
		return itemTramite;

	}

	@Override
	public EAccionesAction setearEAccionesAction() {
		// TODO Auto-generated method stub
		return EAccionesAction.alta;
	}

	@Override
	public ActionForward volver(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm) actionForm;
		request.setAttribute("selected",form.getElementoSeleccionado());
		return mapping.findForward("detalle");

	}

}
