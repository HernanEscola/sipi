package conicet.apps.svt.web.equipo.form;

import conicet.apps.svt.object.equipo.CEquipo;


public class CEquipoDetalleActionForm extends CEquipoForm {
	
	private String propietario;
	
	@Override
	public void setData(CEquipo equipo) {
		super.setData(equipo);
		if (equipo.getPropietario() != null) {
			propietario = equipo.getPropietario().getDescripcion(); 
		} else {
			propietario = null;
		}
	}

	// que provenga de un mapped property
	private String ocultarBotonesModificacion;

	public String getOcultarBotonesModificacion() {
		return ocultarBotonesModificacion;
	}

	public void setOcultarBotonesModificacion(String ocultarBotonesModificacion) {
		this.ocultarBotonesModificacion = ocultarBotonesModificacion;
	}
	
	public CEquipoDetalleActionForm() {
	}
	
	public String getPropietario() {
		return propietario;
	}

	public void setPropietario(String propietario) {
		this.propietario = propietario;
	}

}
