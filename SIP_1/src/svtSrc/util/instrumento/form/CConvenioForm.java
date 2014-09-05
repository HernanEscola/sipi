package conicet.apps.svt.web.instrumento.form;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.object.convenio.CConvenio;
import conicet.apps.svt.object.convenio.ETipoAlcanceConvenio;
import conicet.apps.svt.object.convenio.ETipoConvenio;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.instrumento.ETipoInstrumento;
import conicet.framework.error.CException;
import conicet.framework.validator.CValidator;
import conicet.framework.validator.annotation.AField;
import conicet.framework.validator.decorator.IValidable;

public class CConvenioForm extends CInstrumentoForm{


	@AField(required = true, label = "El Alcance del Convenio", ordenValidacion = 8)
	protected  ETipoAlcanceConvenio alcanceConvenio;
	@AField(required = true, label = "El Tipo del Convenio",extraValidation = true, ordenValidacion = 7)
	protected  ETipoConvenio tipoConvenio;


	private boolean esPreConvenio;

	public void setEsPreConvenio(boolean esPreConvenio) {
		this.esPreConvenio = esPreConvenio;
	}

	public boolean isEsPreConvenio() {
		return esPreConvenio;
	}

	public void setTipoConvenio(String tipoConvenio) {
		this.tipoConvenio = ETipoConvenio.getTipo(tipoConvenio);
	}

	public String getTipoConvenio() {
		return getIdFromEnumIdentity(tipoConvenio);
	}

	public void setAlcanceConvenio(String alcanceConvenio) {
		this.alcanceConvenio = ETipoAlcanceConvenio.getTipo(alcanceConvenio);
	}

	public String getAlcanceConvenio() {
		return getIdFromEnumIdentity(alcanceConvenio);
	}

	@Override
	public void setData(CInstrumento i) {
		// TODO Auto-generated method stub
		super.setData(i);
		if (i.getClass().getName().equalsIgnoreCase(CConvenio.class.getName()) ){
			CConvenio c = (CConvenio) i;
			this.alcanceConvenio = c.getAlcance();
			this.tipoConvenio = c.getTipoConvenio();
			this.esPreConvenio = c.getEsPreConvenio();
		}
	}


	@Override
	public CInstrumento getData() {
		CConvenio c = (CConvenio) getInstrumento();
		if(c== null){
			c = new CConvenio();
			setInstrumento(c);
		}
		c.setAlcance(alcanceConvenio);
		c.setTipoConvenio(tipoConvenio);
		c.setEsPreConvenio(esPreConvenio);
		super.getData();

		if(this.getTienePatente() && StringUtils.isNotEmpty(this.getPatente())){
			c.setPatente(this.getPatente());
		}else{
			c.setPatente(null);
		}
		return c;
	}

	@Override
	public void limpiar() {
		// TODO Auto-generated method stub
		super.limpiar();
		setTipo(ETipoInstrumento.CON.getId());
		tipoConvenio = null;
		alcanceConvenio = null;
		esPreConvenio = false;
	}

	public void setTienePatente(boolean tienePatente) {
	}

	public boolean getTienePatente() {
		return (ETipoConvenio.I_Y_D_LICENCIA.equals(this.tipoConvenio) ||  ETipoConvenio.CONFIDENCIALIDAD.equals(this.tipoConvenio)   || ETipoConvenio.CONVENIO_PARA_SOLICITUD_DE_PATENTE.equals(this.tipoConvenio) || ETipoConvenio.LICENCIA.equals(this.tipoConvenio));
	}



	/**
	 * SI EL ESTADO ES EN EJECUCION Y EL TIPO DE CONVENIO ES ALGUNO DE LOS MENCIONADOS, DEBE CARGAR AL MENOS UN PARTICIPANTE
	 * @param cargadorErrores
	 * @param validator
	 * @throws CException
	 */
	public void validarTipoConvenio(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
		if (this.getParticipantesInstrumento().isEmpty()){
				if (this.estado!=null && getEnEjecucion() && this.tipoConvenio!=null &&
						(ETipoConvenio.I_Y_D_LICENCIA.equals(this.tipoConvenio)
						|| ETipoConvenio.I_Y_D.equals(this.tipoConvenio)
						|| ETipoConvenio.SERVICIOS.equals(this.tipoConvenio)
						|| ETipoConvenio.CAPP.equals(this.tipoConvenio)
						|| ETipoConvenio.ASISTENCIA_TECNICA.equals(this.tipoConvenio)
						|| ETipoConvenio.PLATAFORMA_TECNOLOGICA.equals(this.tipoConvenio) ) ){

					String[] mensaje = { StringEscapeUtils.escapeHtml("Debe seleccionar al menos un participante para el convenio") };
					cargadorErrores.addError("errors.dynamic", mensaje, true);
				}
		}
	}


}
