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

public class CEquipoModificarAction extends CEquipoAMAction {

	public String INI = "ini";
	public String MODIFICAR = "modificar";
	public String CONFIRMAR = "confirmar";
	public String SALIR = "index";
	public String VOLVER = "volver";
	public String ERROR_FATAL = "error_fatal";
	public String LISTADO = "listado";
	public String SELECCIONAR = "seleccionEntidad";
	public String DETALLE = "detalleEquipo";
	public String DETALLEINI = "detalleIni";
	public String REFRESCAR = "refrescar";
	public String REFRESCAREQUIPO = "refrescarEquipo";
	public String VOLVERDETALLE = "volverDetalle";

	@Override
	protected Object grabar(ActionForm form, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoForm uform = (CEquipoForm) form;
		HttpSession sesion = request.getSession();
		IUsuarioObject usr = (IUsuarioObject) sesion.getAttribute("iUsuario");
		//NO SE PORQUE BORRA ESTO, LO DEJE IGUAL POR LAS DUDAS
		sesion.removeAttribute("previoPrestador");
		CEquipo equipo = uform.getData();
		// envia entidad inicial, para ver al grabar si cambió o no el prestador. Si es necesario da de alta al nuevo prestador
		CEquipoService.modificarEquipo(equipo, UFecha.hoy(),
				new Long(usr.getKey()));
		return equipo;
	}

	@Override
	protected void inicializar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoForm form = (CEquipoForm) actionForm;
		super.inicializar(actionForm, request, response);
		CEquipo equipo = (CEquipo) request.getAttribute("selected");
		form.setElementoSeleccionado(equipo);
		HttpSession sesion = request.getSession();
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		IUsuarioObject usr = (IUsuarioObject) sesion.getAttribute("iUsuario");
		equipo = CEquipoService.findEquipoById(equipo);
		form.setData(equipo);
		if(equipo.getDomicilio() !=null){
			CComboPaisAction.setearCombosEnSesionByLocalidad(request, "", equipo.getDomicilio().getLocalidad());
		}else{
			CComboPaisAction.setearCombosEnSesion(request);
		}
		
		form.setTab("tabEquipo");
		form.setInput("equipoModificar");
		form.setMappedForward("equipoModificar");
		
	}

	@Override
	public EAccionesAction setearEAccionesAction() {
		// TODO Auto-generated method stub
		return EAccionesAction.modificar;
	}

}
