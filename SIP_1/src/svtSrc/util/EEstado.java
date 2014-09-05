package conicet.apps.svt.util;

import conicet.apps.svt.object.IEnumPersistible;
import conicet.apps.svt.util.collection.UCollection;
import conicet.apps.svt.util.interfaces.IIdentityDescripcion;

public enum EEstado implements IIdentityDescripcion<String>, IEnumPersistible {
	N("N", "Nuevo"), D("D", "Deshabilitado"), E("E", "Eliminado");
	
	private String id;
	private String descripcion;
	
	EEstado(String id, String descripcion) {
		this.id = id;
		this.descripcion = descripcion;
	}
	
	@Override
	public String getId() {
		return this.id;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public static EEstado getTipo(String id) {
		EEstado estados[] = EEstado.values();
		EEstado estado = (EEstado) UCollection.obtenerObjectSelected(estados, id);
		return estado;
	}
	
	@Override
	public EEstado getInstance(String id) {
		return EEstado.getTipo(id);
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
