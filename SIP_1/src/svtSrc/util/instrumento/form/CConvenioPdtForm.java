package conicet.apps.svt.web.instrumento.form;

import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.instrumento.EEstadoInstrumento;
import conicet.apps.svt.util.valida.CValidaFecha;
import conicet.framework.error.CException;
import conicet.framework.validator.CValidator;
import conicet.framework.validator.decorator.IValidable;


public class CConvenioPdtForm extends CConvenioForm{

	@Override
	public void validarTipoConvenio(CValidator cargadorErrores, IValidable validator) throws CException {
	}

	@Override
	public void validarObjeto(CValidator cargadorErrores, IValidable validator) throws CException {
	}

	@Override
	public void validarPartesInstrumento(CValidator cargadorErrores, IValidable validator) throws CException {

	}
	@Override
	public void validarFechaIngresoDVTS(CValidator cargadorErrores, IValidable validator) throws CException {
	}

	@Override
	public void validarNumeroResolucion(CValidator cargadorErrores, IValidable validator) throws CException {
		if (EEstadoInstrumento.EJE.equals(this.getEstado())) {
			validator.validar(cargadorErrores);

			/*if (this.resoluciones.isEmpty()) {
				String[] mensaje = { StringEscapeUtils.escapeHtml("Al menos una Resolución es necesario si el estado es EN EJECUCION") };
				cargadorErrores.addError("errors.dynamic", mensaje, true);
			}*/
		}
	}

	@Override
	public void validarResponsable(CValidator cargadorErrores, IValidable validator) throws CException {
	}


	@Override
	public void validarFechaInicio(CValidator cargadorErrores, IValidable validator) throws CException {
		if (!StringUtils.isEmpty(this.getFechaInicio()) || !StringUtils.isEmpty(this.getFechaFin()) ){
			CValidaFecha.validaFormatoDDMMAAAAYComparaFechas(this.getFechaInicio(), this.getFechaFin(),cargadorErrores, "La Fecha de Inicio","La Fecha de Finalización");
		}
	}

	@Override
	public void validarFechaFin(CValidator cargadorErrores, IValidable validator) throws CException {
	}



	@Override
	public CInstrumento getData() {
		//this.setEsPDT(true);
		return super.getData();
	}

	@Override
	public void limpiar() {
		// TODO Auto-generated method stub
		super.limpiar();

	}


}

