package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.convenio.CConvenio;
import conicet.apps.svt.object.instrumentoItemTramite.CInstrumentoItemTramite;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.web.instrumento.form.CConvenioItemTramiteForm;
import conicet.framework.error.CException;


public class CConvenioItemTramiteModificarAction extends CConvenioItemTramiteAMAction{

	@Override
	protected void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		super.inicializar(actionForm, request, response);
		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm) actionForm;
		form.setItemTramite((CInstrumentoItemTramite)request.getAttribute("itemTramiteSelected"));

		form.setData(CInstrumentoService.findInstrumentoItemTramiteById(form.getItemTramite().getId()));
	}

	@Override
	protected Object grabar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
	throws CException {
		CConvenioItemTramiteForm form = (CConvenioItemTramiteForm) actionForm;
		CInstrumentoItemTramite itemTramite = form.getData();
		HttpSession sesion = request.getSession();
		CUsuarioSvt usr = (CUsuarioSvt) sesion.getAttribute("usuarioSVT");

		itemTramite.setUsrMod(usr);
		itemTramite.setFechaMod(null);
		form.setInput("detalle");
		CInstrumentoService.actualizarConvenioItemTramite(itemTramite,(CConvenio)form.getElementoSeleccionado());
		request.setAttribute("selected", form.getElementoSeleccionado());
		return itemTramite;

	}

	@Override
	public EAccionesAction setearEAccionesAction() {
		// TODO Auto-generated method stub
		return EAccionesAction.modificar;
	}
}
