package conicet.apps.svt.web.dispatcher.form;

import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.util.interfaces.IIdentityDescripcion;

public abstract class CABMDispatchActionForm<T> extends CDocumentoDispatchActionForm<T> {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Object elementoSeleccionado;
	private EAccionesAction eAccionesAction;
	private String actionName;
	@Override
	public void clear() {
		super.clear();
		this.setInput("");
		this.setMethod("");
	}

	@Override
	public void limpiar() {
		super.limpiar();
	}


	public void setElementoSeleccionado(Object elementoSeleccionado) {
		this.elementoSeleccionado = elementoSeleccionado;
	}

	public Object getElementoSeleccionado() {
		return elementoSeleccionado;
	}

	@Override
	public abstract T getData();

	@Override
	public abstract void setData(T arg0);

	public void setEAccionesAction(EAccionesAction eAccionesAction) {
		this.eAccionesAction = eAccionesAction;
	}

	public EAccionesAction getEAccionesAction() {
		return eAccionesAction;
	}

	public String getValueEAccion() {
		return eAccionesAction.getValue();
	}
	
	public String getTitleNameEAccion() {
		return eAccionesAction.getTitleName();
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getActionName() {
		return actionName;
	}


	public String getIdFromEnumIdentity(IIdentityDescripcion e) {
		if (e != null) {
			if ((eAccionesAction.equals(EAccionesAction.alta) || eAccionesAction.equals(EAccionesAction.modificar))
					&& (StringUtils.isNotEmpty(getAccion()) && !getAccion().equalsIgnoreCase("confirmar")))
				return e.getId().toString();
			else {
				return e.getDescripcion();
			}
		}
		return "";
	}
	
}