package bean;

import javax.persistence.Entity;

@Entity
public class PromocionNochesLibres extends Promocion {

	private static final long serialVersionUID = 1L;

	private int minimoNoches;
	private int nochesLibres;

	public PromocionNochesLibres(int minNoche, int nocLibre) {
		this.setMinimoNoches(minNoche);
		this.setNochesLibres(nocLibre);
	}

	public int getMinimoNoches() {
		return minimoNoches;
	}

	public void setMinimoNoches(int minimoNoches) {
		this.minimoNoches = minimoNoches;
	}

	public int getNochesLibres() {
		return nochesLibres;
	}

	public void setNochesLibres(int nochesLibres) {
		this.nochesLibres = nochesLibres;
	}
}
