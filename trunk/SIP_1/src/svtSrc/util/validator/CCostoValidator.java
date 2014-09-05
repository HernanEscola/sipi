package conicet.apps.svt.util.validator;

import java.util.List;

import conicet.apps.svt.object.precioOferta.CCostoPrecio;
import conicet.apps.svt.object.stanCosto.CStanCosto;
import conicet.apps.svt.service.CContratacionService;
import conicet.framework.error.CException;
import conicet.framework.validator.CValidator;

public class CCostoValidator extends CValidator {

	/**
	 * Dado un costo muestra un error si existen precios sugeridos y/o presupuestos activos relacionados  con dicho costo
	 * @param costo
	 * @return
	 * @throws CException
	 */
	public void validarAsociacionPrecios(CStanCosto costo) throws CException {
		if (costo.getId()!=null){
			List<CCostoPrecio> costoPrecio = CContratacionService.findPreciosRelacionadosACosto(costo);
			if (costoPrecio.size() != 0){
				String[] mensaje = new String[1];
				mensaje[0] = "El costo se encuentra seleccionado en un Presupuesto y/o Precio Sugerido";
				this.addError("errors.dynamic", mensaje, true);
			}
		}
	}

}