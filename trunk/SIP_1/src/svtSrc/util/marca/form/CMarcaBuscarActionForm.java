package conicet.apps.svt.web.marca.form;

import java.lang.reflect.Field;

import org.apache.struts.action.ActionErrors;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm;
import conicet.framework.validator.annotation.AField;

public class CMarcaBuscarActionForm extends CBusquedaActionForm {
	
	private String nombreBusqueda;

	@Override
	public void setData(Object objectModel) {
		CMarcaEquipo marcaEquipo = (CMarcaEquipo) objectModel;
		this.nombreBusqueda = marcaEquipo.getNombre();
	}
	
	@Override
	public void limpiar() {
		super.limpiar();
		this.nombreBusqueda = "";
	}
	
	@Override
	public Object getData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void validarField(AField annotation, Field attr, ActionErrors ae)
			throws Exception {
		// TODO Auto-generated method stub

	}
	
	@Override
	public void setElementoSeleccionadoIndex(String index, String value) {
		int indexInt = Integer.parseInt(index);
		Object test = (Object) (this.getResultados().get(indexInt));
		this.setElementoSeleccionado(test);
		this.setBtnSubmit(EAccionesAction.modificar.toString());
		this.setMethod(EAccionesAction.modificar.toString());
	}

	public String getNombreBusqueda() {
		return nombreBusqueda;
	}

	public void setNombreBusqueda(String nombreBusqueda) {
		this.nombreBusqueda = nombreBusqueda;
	}
}
