package conicet.apps.svt.web.equipo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;

import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.equipo.CEquipo;
import conicet.apps.svt.service.CEquipoService;
import conicet.apps.svt.web.equipo.form.CEquipoForm;
import conicet.apps.svt.web.util.action.CComboPaisAction;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;
import conicet.framework.util.UFecha;

public class CEquipoAltaAction extends CEquipoAMAction {

	@Override
	protected Object grabar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		HttpSession sesion = request.getSession();
		CEquipoForm form = (CEquipoForm) actionForm;
		IUsuarioObject usr = (IUsuarioObject) sesion.getAttribute("iUsuario");
		CEquipo equipo = form.getData();
		CEquipoService.registrarEquipo(equipo, UFecha.hoy(), new Long(usr
				.getKey()));
		return equipo;
	}

	@Override
	protected void inicializar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoForm form = (CEquipoForm) actionForm;
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		super.inicializar(actionForm, request, response);
		if ("limpiarBusqueda".equalsIgnoreCase(form.getBtnSubmit())) {
			sessionManager.removeAttribute("cEquipoBuscarActionForm");
		}		
		
		CComboPaisAction.setearCombosEnSesion(request);
		
		form.setTab("tabEquipo");		
	}

	/**
	 * Este metodo redefine la vuelta con el botón volver para que el input sea distinto a cuando 
	 * vuelve desde el botón grabar
	 */
	@Override
	protected String getInputGrabar(String input) {
	
		if ("cEquipoBuscarAction".equalsIgnoreCase(input)){
			return "listadoRecientes";
		}
		return input;
	}
	
	@Override
	protected void cargarElemento(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public EAccionesAction setearEAccionesAction() {
		// TODO Auto-generated method stub
		return EAccionesAction.alta;
	}
	
}
