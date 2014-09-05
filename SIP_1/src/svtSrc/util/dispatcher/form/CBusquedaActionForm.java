package conicet.apps.svt.web.dispatcher.form;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import conicet.apps.svt.util.valida.CManejadorErrorSVT;
import conicet.framework.error.CException;
import conicet.framework.object.IIdentity;


public abstract class CBusquedaActionForm<T> extends CAutoCompleteDispatchActionForm<T> {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private List resultados = new LinkedList<Object>();
	private Object elementoSeleccionado;
	private boolean existeBusqueda;
	private Collection<IIdentity> objetosBuscadosAutocomplete = new ArrayList<IIdentity>();
	private String actionName;

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}


	public String getActionName() {
		return actionName;
	}

	@Override
	public IIdentity getObjetoBuscadoById(Object id, Class clase) {
		return getObjetoBuscadoById(id, clase, objetosBuscadosAutocomplete);
	}

	public IIdentity getObjetoBuscadoById(Object id, Class clase, Collection<IIdentity> coleccion) {
		for (IIdentity i : coleccion) {
			if ((i.getId() == null && id == null) ||  i.getId().equals(id) || i.getId().toString().equals(id.toString())) {
				Class actual = i.getClass();
				if (clase.isAssignableFrom(actual)) {
					return i;
				}
			}
		}
		return null;
	}

	public void setResultados(List resultados) {
		this.resultados = resultados;
	}
	public List getResultados() {
		return resultados;
	}
	public void setElementoSeleccionado(Object elementoSeleccionado) {
		this.elementoSeleccionado = elementoSeleccionado;
	}
	public Object getElementoSeleccionado() {
		return elementoSeleccionado;
	}
	@Override
	public void limpiar(){
		super.limpiar();
		this.objetosBuscadosAutocomplete.clear();
		this.resultados.clear();
	}


	@Override
	public void clear() {
		this.resultados.clear();
		this.elementoSeleccionado = null;
	}


	@Override
	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		ActionErrors ae = new ActionErrors();
		ActionMessages am = new ActionMessages();
		if ("Buscar".equalsIgnoreCase(this.getBtnSubmit()) ){
			try {
				this.validarFields(ae, am, new CManejadorErrorSVT());
			} catch (CException ex) {
				ae.add("busqueda", new ActionMessage(ex.getMessage()));
				ex.printStackTrace();
			}
		}
		return ae;
	}




	public void setElementoSeleccionadoIndex(String index, String value) {
		int indexInt = Integer.parseInt(index);
		Object test = (this.getResultados()
				.get(indexInt));
		this.setElementoSeleccionado(test);
		this.setBtnSubmit("detalle");
		this.setMethod("detalle");
	}

	public void setElementoSeleccionadoId(String id, String value) {
		Object test = (getObjetoBuscadoById(id, Object.class, this.getResultados()));
		this.setElementoSeleccionado(test);
		this.setBtnSubmit("detalle");
		this.setMethod("detalle");
	}

	public void setExisteBusqueda(boolean existeBusqueda) {
		this.existeBusqueda = existeBusqueda;
	}
	public boolean getExisteBusqueda() {
		return existeBusqueda;
	}

	@Override
	public void setObjetosBuscadosAutocomplete(Collection<IIdentity> objetosBuscadosAutocomplete) {
		this.objetosBuscadosAutocomplete = objetosBuscadosAutocomplete;
	}

	@Override
	public Collection<IIdentity> getObjetosBuscadosAutocomplete() {
		return objetosBuscadosAutocomplete;
	}

}
