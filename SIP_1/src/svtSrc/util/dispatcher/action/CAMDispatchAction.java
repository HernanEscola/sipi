package conicet.apps.svt.web.dispatcher.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Label.LABEL_VALUE;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion.POSICION;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.framework.error.CException;

public abstract class CAMDispatchAction extends CAutoCompleteDispatchAction {


	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.clear();


		form.setEAccionesAction(setearEAccionesAction());
		inicializarAutoCompletes(form);
		inicializar(actionForm, request, response);	
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		} else if(request.getParameter("input")!=null && !request.getParameter("input").equalsIgnoreCase("null")){
			form.setInput(request.getParameter("input"));
		}else{
			form.setInput(null);
		}
		form.setActionName(mapping.getPath().substring(1, mapping.getPath().length()));
		form.setAccion(form.getEAccionesAction().getValue());
		armarBotones(form,request,response);
		return mapping.findForward("formulario");
	}
	
	public ActionForward ini(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return init(mapping, actionForm, request, response);
	}

	public ActionForward volver(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		// si vuelve del alta
		if (form.getEAccionesAction().getValue().equalsIgnoreCase(EAccionesAction.alta.toString())){
			if (!StringUtils.isEmpty(form.getInput())) {
				return mapping.findForward(form.getInput());
			}
			return mapping.findForward("index");
		// si vuelve de la modificacion
		}else{
			request.setAttribute("selected",form.getElementoSeleccionado());
			return mapping.findForward("detalle");
		}
	}


	public ActionForward limpiar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.limpiar();
		return mapping.findForward("formulario");
	}

	public ActionForward salir(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("index");
	}


	public ActionForward registrar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (validar(form,request,response)){
			form.setAccion("confirmar"); // puse confirmar para altaCfm y confirmar de modificacion
			armarBotonesCfm(form,request,response);
			this.saveToken(request);

		} else {
			form.setAccion(form.getEAccionesAction().getValue());
		}
		return mapping.findForward("formulario");
	}

	public ActionForward modificar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.setAccion(form.getEAccionesAction().getValue());
		armarBotones(form,request,response);
		return mapping.findForward("formulario");
	}


	public ActionForward grabar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		if (this.isTokenValid(request, true)) {
			Object obj = grabar(actionForm, request, response);
			request.setAttribute("object", obj);
			//limpio para q no quede ocupando memoria sin necesidad
			form.getObjetosBuscadosAutocomplete().clear();
			if (StringUtils.isNotEmpty(form.getInput())) {
				return mapping.findForward(getInputGrabar(form.getInput()));
			} else {
				if (form.getEAccionesAction().getValue().equalsIgnoreCase(EAccionesAction.alta.toString())){
					return mapping.findForward("listadoRecientes");
				}else{
					return mapping.findForward("listado");
				}
			}
		}

		return mapping.findForward("index");
	}

	/**
	 * SI SE DESEA QUE EL PATH PARA VOLVER SEA DIFERENTE QUE EL PATH PARA GRABAR, SE PUEDE MODIFICAR 
	 * EL TEXTO DEL INPUT REDEFINIENDO ESTE METODO
	 * @param input
	 * @return mismo texto o texto modificado si se redefine
	 */
	protected String getInputGrabar(String input){
		return input;
	}

	

	protected abstract Object grabar(ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws CException;

	protected abstract void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;

	protected abstract void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException;


	protected void armarBotones(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.getBotones().clear();
		form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.REGISTRAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		if (form.getEAccionesAction().getValue().equalsIgnoreCase(EAccionesAction.modificar.toString())){
			form.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION));
		}

	}


	protected void armarBotonesCfm(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
	form.getBotones().clear();
	form.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.GRABAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
	form.getBotones().add(new CBoton(new Label(LABEL_VALUE.MODIFICAR), CBoton.NO_CHECK_FUNCTION));

	}

	protected abstract boolean validar(ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws CException;


	public ActionForward refrescar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		form.setAccion(form.getEAccionesAction().getValue());
		return mapping.findForward("formulario");

	}
		/**
		 * SE DEBE SELECCIONAR SI ESTA LLAMADO DESDE ALTA O MODIFICACION
		 * @return
		 */
	public abstract EAccionesAction setearEAccionesAction();

	protected void remove(List col, HttpServletRequest request) {
		try{
			col.remove(Integer.parseInt(request.getParameter("removeIndex")));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * <p>Implementar: la implmenetacion es del tipo siguiente donde jsonResponse es el CJSONReposne o CAutocomplete correspondiente a resolver la consulta</p>
	 * <p>form.agregarAutoComplete("tipo",new CJsonResponse());
	 * </p>
	 */
	public abstract void  inicializarAutoCompletes(CABMDispatchActionForm<?> form);
}
