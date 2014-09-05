package conicet.apps.svt.util.validator;

import conicet.apps.svt.object.asesoria.CAsesoria;
import conicet.framework.error.CException;
import conicet.framework.validator.CValidator;

public class CAsesoriaImpresionResolucionValidator extends CValidator {

	public void validarDatosNecesarios(CAsesoria asesoria) throws CException {
		String[] mensaje = new String[1];
		if (asesoria.getExpedienteNumero() == null || asesoria.getExpedienteAnio() == null){
			mensaje[0] = "Debe completar el n�mero y a�o del expediente para poder imprimir la resoluci�n";
			this.addError("errors.dynamic", mensaje, true);
		}

	}

}
