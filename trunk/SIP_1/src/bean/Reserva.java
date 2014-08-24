package bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "Reservas")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Reserva implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue
	private int numeroReserva;

	@ManyToOne(cascade = CascadeType.REFRESH)
	private Cliente cliente;

	@OneToOne(cascade = CascadeType.REFRESH)
	private Hotel hotel;

	@OneToOne(cascade = CascadeType.ALL)
	private DatosPago datosPago;

	@Column(nullable = false)
	private int habitacion;

	@Column(nullable = false)
	private Date fechaCreacion;

	@Column(nullable = false)
	private Date checkin;

	@Column(nullable = false)
	private Date checkout;

	@Column(nullable = false)
	private float totalAmount;

	@Column(nullable = false)
	private float totalAmountWithoutTaxes;

	@Column(nullable = false)
	private float taxes;

	@Column(nullable = false, length = 3)
	private String currency;
	
	@Column(nullable = false)
	private boolean activa;

	public int getNumeroReserva() {
		return numeroReserva;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public DatosPago getDatosPago() {
		return datosPago;
	}

	public void setDatosPago(DatosPago datosPago) {
		this.datosPago = datosPago;
	}

	public int getHabitacion() {
		return habitacion;
	}

	public void setHabitacion(int habitacion) {
		this.habitacion = habitacion;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public float getTotalAmountWithoutTaxes() {
		return totalAmountWithoutTaxes;
	}

	public void setTotalAmountWithoutTaxes(float totalAmountWithoutTaxes) {
		this.totalAmountWithoutTaxes = totalAmountWithoutTaxes;
	}

	public float getTaxes() {
		return taxes;
	}

	public void setTaxes(float taxes) {
		this.taxes = taxes;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public boolean isActiva() {
		return activa;
	}

	public void setActiva(boolean activa) {
		this.activa = activa;
	}
}
