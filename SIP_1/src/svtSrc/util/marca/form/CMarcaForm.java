package conicet.apps.svt.web.marca.form;

import java.lang.reflect.Field;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.framework.error.CException;
import conicet.framework.validator.CValidator;
import conicet.framework.validator.annotation.AField;
import conicet.framework.validator.decorator.IValidable;

public class CMarcaForm extends CABMDispatchActionForm {
	
	private Long id;
	private String estado;

	@AField(ordenValidacion = 1, required = true, label = "El Nombre", extraValidation = true)
	private String nombre;
	
	@Override
	public void limpiar() {
		super.limpiar();
		this.nombre = null;
		this.id = null;
		this.estado = "";
	}

	@Override
	public Object getData() {
		CMarcaEquipo marca = new CMarcaEquipo();
		marca.setNombre(getNombre());
		marca.setId(getId());
		marca.setEstado(getEstado());
		return marca;
	}

	@Override
	public void setData(Object object) {
		CMarcaEquipo marca = (CMarcaEquipo) object;		
		setNombre(marca.getNombre());
		setId(marca.getId());
		setEstado(marca.getEstado());
	}

	@Override
	public void validarField(AField annotation, Field attr, ActionErrors ae)
			throws Exception {

	}
	
	public void validarNombre(CValidator cargadorErrores, IValidable validator) throws CException {
	}
	
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		EAccionesAction accion = getEAccionesAction();
		
		if (!getMethod().equals("init") && 
			(accion.equals(EAccionesAction.alta) || accion.equals(EAccionesAction.modificar)) &&
			getBtnSubmit().equalsIgnoreCase("Registrar")) {
			
			if (!StringUtils.isNotEmpty(getNombre())) {
				errors.add("altaEquipo", new ActionMessage("errors.required", "El Nombre"));
			}
		}
		return errors;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}
