package conicet.apps.svt.web.marca.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.service.CMarcaEquipoService;
import conicet.apps.svt.web.dispatcher.action.CBusquedaAction;
import conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm;
import conicet.apps.svt.web.marca.form.CMarcaBuscarActionForm;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;

public class CMarcaBuscarAction extends CBusquedaAction {

	@Override
	protected List<? extends Object> buscar(
			CBusquedaActionForm<?> cBusquedaActionForm,
			HttpServletRequest httpServletRequest) throws CException {
		
		CMarcaBuscarActionForm form = (CMarcaBuscarActionForm) cBusquedaActionForm;
		return (List<? extends Object>) CMarcaEquipoService.findByNombre(form.getNombreBusqueda());
	}

	@Override
	protected void ordenarLista(HttpServletRequest request,
			CBusquedaActionForm<?> form) throws CException {
		// TODO Auto-generated method stub

	}

	@Override
	protected List<? extends Object> buscarAltasDelDia(
			CBusquedaActionForm<?> cBusquedaActionForm,
			HttpServletRequest httpServletRequest) throws CException {
		
		return new ArrayList<Object>();
	}

	@Override
	protected void inicializar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		
		CMarcaBuscarActionForm form = (CMarcaBuscarActionForm) actionForm;
		form.getResultados().clear();
	}
	
	@Override
	public void criterioBusqueda(CBusquedaActionForm<?> actionForm,
			HttpServletRequest request) {

		CSessionManager sessionManager = CSessionManager.getInstance(request);
		CMarcaBuscarActionForm form = (CMarcaBuscarActionForm) actionForm;
		sessionManager.setAttribute("criterioBusqueda", "Nombre: " + form.getNombreBusqueda());
	}
	
	public ActionForward modificar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CBusquedaActionForm<?> form = (CBusquedaActionForm<?>) actionForm;
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		request.setAttribute("selected", form.getElementoSeleccionado());
		return mapping.findForward("modificar");
	}
	
	@Override
	public void inicializarRefrescar(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.inicializarRefrescar(mapping, actionForm, request, response);
		armarBotones((CBusquedaActionForm<?>) actionForm, request, response);
	}

}
