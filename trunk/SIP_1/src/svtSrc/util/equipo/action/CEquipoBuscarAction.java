package conicet.apps.svt.web.equipo.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.equipo.CEquipo;
import conicet.apps.svt.service.CEquipoService;
import conicet.apps.svt.web.dispatcher.action.CBusquedaAction;
import conicet.apps.svt.web.equipo.form.CEquipoBuscarActionForm;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;
import conicet.framework.util.UFecha;


public class CEquipoBuscarAction extends CBusquedaAction {

	/** este es un comentario**/
	@Override
	protected String textoCriterioBusqueda(conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm<?> cBusquedaActionForm, HttpServletRequest request) {
		CEquipoBuscarActionForm form = (CEquipoBuscarActionForm) cBusquedaActionForm;
		String criterio = "";

		if (!StringUtils.isEmpty(form.getDescripcionBusqueda())) {
			criterio = criterio + " Descripción:"
					+ form.getDescripcionBusqueda();
		}
		if (!StringUtils.isEmpty(form.getMarcaBusqueda())) {
			criterio = criterio + " Marca:" + form.getMarcaBusqueda();
		}
		if (!StringUtils.isEmpty(form.getNroSerie())) {
			criterio = criterio + " Nro Serie:" + form.getNroSerie();
		}
		if (!StringUtils.isEmpty(form.getNombre())) {
			criterio = criterio + " Nombre:" + form.getNombre();
		}
		if (!StringUtils.isEmpty(form.getTipo())) {
			criterio = criterio + " Tipo:" + form.getTipo();
		}

		if (StringUtils.isEmpty(criterio))
			return "Todos";

		return criterio;
	}



	@Override
	protected List<? extends Object> buscar(
			conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm<?> cBusquedaActionForm,
			HttpServletRequest httpServletRequest) throws CException {
		CEquipoBuscarActionForm form = (CEquipoBuscarActionForm) cBusquedaActionForm;
		
		return (List)CEquipoService.findEquiposByCriterio((CEquipo)form.getData());
	}

	@Override
	protected void ordenarLista(HttpServletRequest request,
			conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm<?> form)
			throws CException {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected List<? extends Object> buscarAltasDelDia(
			conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm<?> cBusquedaActionForm,
			HttpServletRequest httpServletRequest) throws CException {
			return (List) CEquipoService.findEquiposRegistradosEnFecha(UFecha.hoy());
	}

	@Override
	protected void inicializar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		CEquipoBuscarActionForm form = (CEquipoBuscarActionForm) actionForm;
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		

     	sessionManager.removeAttribute("ocultarBotonesModificacion");
		
	}

}
