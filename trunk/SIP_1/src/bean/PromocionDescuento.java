package bean;

import javax.persistence.Entity;

@Entity
public class PromocionDescuento extends Promocion {

	private static final long serialVersionUID = 1L;

	private float porcentajeDescuento;

	public PromocionDescuento(float porcentaje) {
		this.setPorcentajeDescuento(porcentaje);
	}

	public float getPorcentajeDescuento() {
		return porcentajeDescuento;
	}
	public void setPorcentajeDescuento(float porcentajeDescuento) {
		this.porcentajeDescuento = porcentajeDescuento;
	}

	public void modificarPromocion(float porcentaje) {
		this.porcentajeDescuento = porcentaje;
	}
}
