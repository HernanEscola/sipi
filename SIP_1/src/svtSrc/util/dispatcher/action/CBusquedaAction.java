package conicet.apps.svt.web.dispatcher.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.displaytag.tags.TableTagParameters;
import org.displaytag.util.ParamEncoder;

import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion.POSICION;
import conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;

public abstract class CBusquedaAction extends CAutoCompleteDispatchAction {



	/**
	 *
	 * Quizá este metodo sea lo mejor dejar a que sea implementado en las clases
	 * descendientes, para poder hacerlo mas flexible.
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CBusquedaActionForm<?> form = (CBusquedaActionForm<?>) actionForm;
		form.limpiar();
		armarBotones(form, request, response);
		form.setActionName(mapping.getPath().substring(1, mapping.getPath().length()));
		inicializar(mapping,form, request, response);
		return mapping.findForward("formulario");
	}



	/**
	 * Este metodo se usa despues de hacer una modificación
	 * Busca y ordena por el criterio anterior
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return {@link ActionForward}
	 * @throws Exception
	 */


	public ActionForward refrescar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CBusquedaActionForm<?> form = (CBusquedaActionForm<?>) actionForm;

		form.getResultados().clear();
		form.setResultados(buscar(form, request));
		criterioBusqueda(form,request);
		ordenarLista(request, form);
		inicializarRefrescar(mapping,form, request, response);
		return mapping.findForward("formulario");
	}

	public void inicializarRefrescar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * Este metodo se usa despues de hacer un alta desde el index
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return {@link ActionForward}
	 * @throws Exception
	 */
	public ActionForward altasdeldia(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CBusquedaActionForm<?> form = (CBusquedaActionForm<?>) actionForm;
		form.limpiar();
		armarBotones(form, request, response);
		inicializar(mapping,form, request, response);
		form.getResultados().clear();
		form.setResultados(buscarAltasDelDia(form, request));
		criterioBusqueda(form,request);
		return mapping.findForward("formulario");
	}


	/**
	 * Este método es ejecutado únicamente cuando se presiona el boton buscar
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward buscar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CBusquedaActionForm<?> form = (CBusquedaActionForm<?>) actionForm;
		//form.getResultados().clear();
		form.setResultados(buscar(form, request));
		criterioBusqueda(form,request);
		ordenarLista(request, form);
		return mapping.findForward("formulario");
	}

	/**
	 * Este método es ejecutado cuando se va hacia la registro
	 * (Ver de poner el input aca cosa de que quede menos libre)
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward ingresarNuevo(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		return mapping.findForward("alta");
	}
	/**
	 * Se ejecuta al hacer click en el índice del listado
	 * (Ver tambien de poner el input aca)
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward detalle(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CBusquedaActionForm<?> form = (CBusquedaActionForm<?>) actionForm;
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		request.setAttribute("selected", form.getElementoSeleccionado());
		return mapping.findForward("detalle");
	}

	public ActionForward salir(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("index");
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CBusquedaActionForm<?> form = (CBusquedaActionForm<?>) actionForm;
		form.limpiar();
		return mapping.findForward("formulario");
	}

	public ActionForward sort(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CBusquedaActionForm<?> form = (CBusquedaActionForm<?>) actionForm;
		ordenarLista(request, form);
		return mapping.findForward("formulario");
	}

	/**
	 * Este método obtiene los parametros de ordenamiento enviados desde el jsp
	 * @param request
	 * @param nombreListado: se le pasa el prefijo del id de la tabla
	 * @param tipo: se obtiene la property por la que se esta ordenando
	 * @param order: se obtiene el orden de ordenamiento
	 */
	protected void getSortParameters(HttpServletRequest request,
			String nombreListado, StringBuffer order, StringBuffer tipo) {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		String ID_TABLE = nombreListado + "BuscarTabla";
		String SESSION_TIPO_SORT = nombreListado + "BuscarTipoSort";
		String SESSION_ORDER_SORT = nombreListado + "BuscarOrderSort";
		ParamEncoder encoder = new ParamEncoder(ID_TABLE);
		//Primero busco los parametros en la request si no estan los cargo de la session

		if (null != request.getParameter(encoder.encodeParameterName(TableTagParameters.PARAMETER_SORT))) {
			tipo.append(request.getParameter(encoder.encodeParameterName(TableTagParameters.PARAMETER_SORT)));
		} else if (sessionManager.contains(SESSION_TIPO_SORT)) {
			tipo.append(sessionManager.getAndRemoveAttribute(SESSION_TIPO_SORT));
		}
		if (null != request.getParameter(encoder.encodeParameterName(TableTagParameters.PARAMETER_ORDER))) {
			order.append(request.getParameter(encoder.encodeParameterName(TableTagParameters.PARAMETER_ORDER)));
		} else if (sessionManager.contains(SESSION_ORDER_SORT)) {
			order.append(sessionManager.getAndRemoveAttribute(SESSION_ORDER_SORT));
		}
		//Ahora pongo en session los parametros de ordenamiento
		//para ser usados cuando se vuelve de la modificación a la búsqueda
		sessionManager.setAttribute(SESSION_ORDER_SORT, order.toString());
		sessionManager.setAttribute(SESSION_TIPO_SORT, tipo.toString());
	}

	protected abstract List<? extends Object> buscar(
			CBusquedaActionForm<?> cBusquedaActionForm,
			HttpServletRequest httpServletRequest) throws CException;


	protected abstract void ordenarLista(HttpServletRequest request,
			CBusquedaActionForm<?> form) throws CException;

	protected abstract List<? extends Object> buscarAltasDelDia(
			CBusquedaActionForm<?> cBusquedaActionForm,
			HttpServletRequest httpServletRequest) throws CException;

	protected abstract void inicializar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;

	/**
	 * si se desea mostrar el criterio de busqueda COMPLETAR TEXTO CRITERIO DE BUSQUEDA.
	 * lUEGO, criterioBusqueda	está llamado este metodo en
	 * buscar,refrescar y altas del día
	 * @param actionForm
	 * @param request HACER @Override PARA CARGAR EL METODO
	 */
	protected String textoCriterioBusqueda(CBusquedaActionForm<?> actionForm, HttpServletRequest request) {
		return "";
	}
	
	protected void criterioBusqueda(CBusquedaActionForm<?> actionForm,
			HttpServletRequest request) {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		sessionManager.setAttribute("criterioBusqueda", textoCriterioBusqueda(actionForm, request));
	}
	
	

	protected void armarBotones(CBusquedaActionForm<?> actionForm,
			HttpServletRequest request, HttpServletResponse response) {

		actionForm.getBotones().clear();
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.BUSCAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.LIMPIAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.INGRESAR_NUEVO), CBoton.CHECK_FUNCTION, CBoton.Aplicacion.ALL, "registro", new Posicion(POSICION.INFERIOR)));
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.SALIR), CBoton.NO_CHECK_FUNCTION, CBoton.Aplicacion.ALL, new Posicion(POSICION.INFERIOR)));

	}

	public ActionForward volver(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		return mapping.findForward("formulario");
	}
}
