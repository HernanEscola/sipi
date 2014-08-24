package bean;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "Promociones")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public abstract class Promocion implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue
	private int numeroPromocion;
	
	@OneToOne(cascade = CascadeType.REFRESH)
	private Hotel hotel;

	public int getNumeroPromocion() {
		return numeroPromocion;
	}
	public void setNumeroPromocion(int numeroPromocion) {
		this.numeroPromocion = numeroPromocion;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
}