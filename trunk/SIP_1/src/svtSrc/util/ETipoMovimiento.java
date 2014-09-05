package conicet.apps.svt.util;

import conicet.apps.svt.object.IEnumPersistible;
import conicet.apps.svt.util.collection.UCollection;
import conicet.apps.svt.util.interfaces.IIdentityDescripcion;

/**
 * UTILIZADO PARA ORDENAR EN LOS REPORTES
 * @author mabbiati
 *
 */
public enum ETipoMovimiento implements IIdentityDescripcion<String>, IEnumPersistible {
	FACTURADO("1", "FACTURADO"), SALDO_ANTERIOR("2", "SALDO ANT"),COBRADO("C", "COBRADO"), EGRESOS("E", "EGRESOS"),SALDO_INICIO("0","SDO.INICIO"),OTRO("O","OTROS");

	private String id;
	private String descripcion;

	ETipoMovimiento(String id, String descripcion) {
		this.id = id;
		this.descripcion = descripcion;
	}

	@Override
	public String getId() {
		return this.id;
	}

	@Override
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public void setId(String id) {
		this.id = id;
	}

	public static ETipoMovimiento getTipo(String id) {
		ETipoMovimiento tipoMovimientos[] = ETipoMovimiento.values();
		ETipoMovimiento tipoMovimiento = (ETipoMovimiento) UCollection.obtenerObjectSelected(tipoMovimientos, id);
		return tipoMovimiento;
	}

	@Override
	public ETipoMovimiento getInstance(String id) {
		return ETipoMovimiento.getTipo(id);
	}

	@Override
	public String toString() {
		return this.id;
	}

	@Override
	public String getValue() {
		return this.id;
	}

}
