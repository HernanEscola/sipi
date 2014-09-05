package conicet.apps.svt.web.instrumento.form;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import conicet.apps.svt.object.instrumentoParticipacion.CInstrumentoParticipacion;
import conicet.apps.svt.object.instrumentoParticipante.CInstrumentoParticipante;
import conicet.apps.svt.object.unidadDeTiempo.EUnidadDeTiempo;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.framework.error.CException;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.validator.CValidator;
import conicet.framework.validator.annotation.AField;
import conicet.framework.validator.decorator.IValidable;

public class CInstrumentoParticipacionForm extends CABMDispatchActionForm<CInstrumentoParticipante>{


	private CInstrumentoParticipante participante;
	private List<CInstrumentoParticipacion> participaciones =  new ArrayList<CInstrumentoParticipacion>();
	private Integer duracion;
	@AField(required = true, label = "El Porcentaje", ordenValidacion = 1)
	private BigDecimal porcentaje;
	private EUnidadDeTiempo unidad ;
	
	@Override
	public void limpiar() {
		super.limpiar();
		this.participante = null;
		this.participaciones.clear();
		this.duracion = null;
		this.porcentaje = BigDecimal.ZERO.setScale(2);
		this.unidad = null;
	}


	@Override
	public void validarField(AField arg0, Field arg1, ActionErrors arg2)
			throws Exception {
		// TODO Auto-generated method stub

	}


	@Override
	public CInstrumentoParticipante getData() {
		this.participante.getParticipaciones().clear();
		this.participante.getParticipaciones().addAll(this.participaciones);
		return this.participante;
	}


	@Override
	public void setData(CInstrumentoParticipante participante) {
		this.participante = participante;
		this.participaciones.addAll(participante.getParticipaciones());
		
	}


	public String getUnidad() {
		return getIdFromEnumIdentity(unidad);
	}

	public void setUnidad(String unidad) {
		this.unidad = EUnidadDeTiempo.getTipo(unidad);
	}


	public void setPorcentaje(BigDecimal porcentaje) {
		this.porcentaje = porcentaje;
	}


	public BigDecimal getPorcentaje() {
		return porcentaje;
	}


	public CInstrumentoParticipante getParticipante() {
		return participante;
	}


	public void setParticipante(CInstrumentoParticipante participante) {
		this.participante = participante;
	}


	public List<CInstrumentoParticipacion> getParticipaciones() {
		return participaciones;
	}


	public void setParticipaciones(List<CInstrumentoParticipacion> participaciones) {
		this.participaciones = participaciones;
	}


	public Integer getDuracion() {
		return duracion;
	}


	public void setDuracion(Integer duracion) {
		this.duracion = duracion;
	}
	
	public void validarPorcentaje(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
	}

	
	public boolean agregarParticipacion(ActionMessages errors) {
		CInstrumentoParticipacion ip = null;

		if(!CComboWrapper.isSeleccionado(this.unidad)){
			errors.add("instrumentoParticipacion", new ActionMessage("errors.dynamic", "Es la unidad de tiempo es necesaria."));
		}
		if(this.porcentaje == null || this.porcentaje.compareTo(BigDecimal.ZERO) <= 0) {
			errors.add("instrumentoParticipacion", new ActionMessage("errors.dynamic", "El porcentaje de dedicación es necesario"));
		}else if( this.porcentaje.compareTo(new BigDecimal(100)) > 0) {
			errors.add("instrumentoParticipacion", new ActionMessage("errors.dynamic", "El porcentaje de dedicación no puede ser mayor a 100%"));
		}
		
		if(this.duracion == null || duracion<=0) {
			errors.add("instrumentoParticipacion", new ActionMessage("errors.dynamic", "El la duración es necesaria"));
		}

		if (errors.isEmpty()) {
			ip =  new  CInstrumentoParticipacion();
			ip.setDuracion(duracion);
			ip.setPorcentaje(porcentaje);
			ip.setUnidad(unidad);
			this.participaciones.add(ip);
			//limpio
			duracion = null;
			porcentaje = BigDecimal.ZERO.setScale(2);
			unidad = null;
			return true;
		}else{
			return false;
		}
	}
	
	public String getNombreParticipante(){
		return participante.getParticipante().getDescripcion();
	}
	
	public String getRolParticipante(){
		return participante.getRolParticipante().getDescripcion();
	}
	
}
