package conicet.apps.svt.util.validator;

import java.math.BigDecimal;
import java.util.List;

import conicet.apps.svt.object.tipoOferta.CTipoOferta;
import conicet.apps.svt.object.valorReferenciaConicet.CValorReferenciaConicet;
import conicet.framework.error.CException;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.validator.CValidator;

public class CValorReferenciaConicetValidator extends CValidator {

	/**
	 * Verifica que se seleccione para cada fila de la tabla un comparador
	 * y su porcentaje
	 *
	 *
	 * @throws CException
	 */
	public void validarSelectCompPorcentaje(List<CValorReferenciaConicet> valores) throws CException {
		String[] mensaje = new String[1];
		for (CValorReferenciaConicet valorRef : valores) {
			if(!CComboWrapper.isSeleccionado(valorRef.getTipoComparador().getId().toString()) || valorRef.getPorcentaje().compareTo(new BigDecimal("0.00")) == 0){
				mensaje[0] = "Debe seleccionar tanto el comparador como un valor para el porcentaje";
				this.addError("errors.dynamic", mensaje, true);
			}
		}
	}

	public void validarPorcentajeDistribucion(List<CValorReferenciaConicet> valores) throws CException {
		String[] mensaje = new String[1];
		BigDecimal totalDistribuirStan = new BigDecimal("0.00");
		BigDecimal totalDistribuirAI = new BigDecimal("0.00");
		for (CValorReferenciaConicet valorRef : valores) {
			if(((valorRef.getTipoEgreso().getCodigo().equalsIgnoreCase("PRO")||valorRef.getTipoEgreso().getCodigo().equalsIgnoreCase("INS")))
					&& CTipoOferta.isStan(valorRef.getTipoOferta())) {
				totalDistribuirStan = totalDistribuirStan.add(valorRef.getPorcentaje());
			}
			if(((valorRef.getTipoEgreso().getCodigo().equalsIgnoreCase("PRO")||valorRef.getTipoEgreso().getCodigo().equalsIgnoreCase("INS")))
					&& CTipoOferta.isAsesoriaInstitucional(valorRef.getTipoOferta())) {
				totalDistribuirAI = totalDistribuirAI.add(valorRef.getPorcentaje());
			}
		}
		if (totalDistribuirStan.compareTo(new BigDecimal("100.00"))!=0){
			mensaje[0] = "La suma de los valores de Productividad e Instituto para los STANs debe ser del 100%";
			this.addError("errors.dynamic", mensaje, true);
		}
		if (totalDistribuirAI.compareTo(new BigDecimal("100.00"))!=0){
			mensaje[0] = "La suma de los valores de Productividad e Instituto para las Asesorías Institucionales debe ser del 100%";
			this.addError("errors.dynamic", mensaje, true);
		}
	}

	public void validarPorcentajeComisiones(List<CValorReferenciaConicet> valores) throws CException {
		String[] mensaje = new String[1];
		BigDecimal totalComisionesUVTStan = new BigDecimal("0.00");
		BigDecimal totalComisionesUVTAI = new BigDecimal("0.00");
		for (CValorReferenciaConicet valorRef : valores) {
			if(((valorRef.getTipoEgreso().getCodigo().equalsIgnoreCase("CON")||valorRef.getTipoEgreso().getCodigo().equalsIgnoreCase("UVT")))
					&& CTipoOferta.isStan(valorRef.getTipoOferta())) {
				totalComisionesUVTStan = totalComisionesUVTStan.add(valorRef.getPorcentaje());
			}
			if(((valorRef.getTipoEgreso().getCodigo().equalsIgnoreCase("CON")||valorRef.getTipoEgreso().getCodigo().equalsIgnoreCase("UVT")))
					&& CTipoOferta.isAsesoriaInstitucional(valorRef.getTipoOferta())) {
				totalComisionesUVTAI = totalComisionesUVTAI.add(valorRef.getPorcentaje());
			}
		}
		if (totalComisionesUVTStan.compareTo(new BigDecimal("100.00"))>0){
			mensaje[0] = "La suma de los valores de Comisiones para los STANs debe ser menores o iguales al 100%";
			this.addError("errors.dynamic", mensaje, true);
		}
		if (totalComisionesUVTAI.compareTo(new BigDecimal("100.00"))>0){
			mensaje[0] = "La suma de los valores de Comisiones para las Asesorías Institucionales debe ser menores o iguales al 100%";
			this.addError("errors.dynamic", mensaje, true);
		}
	}
}
