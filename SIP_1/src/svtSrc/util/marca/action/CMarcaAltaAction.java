package conicet.apps.svt.web.marca.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.service.CMarcaEquipoService;
import conicet.apps.svt.web.marca.form.CMarcaForm;
import conicet.framework.error.CException;

public class CMarcaAltaAction extends CMarcaAMAction {

	@Override
	protected void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		CMarcaForm form = (CMarcaForm) actionForm;
		form.limpiar();
	}
	
	@Override
	public void persistir(CMarcaEquipo marca) throws CException {
		CMarcaEquipoService.registrar(marca);
	}

	@Override
	public EAccionesAction setearEAccionesAction() {
		return EAccionesAction.alta;
	}

}
