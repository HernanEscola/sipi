package bean.dto;

import java.util.Date;

public class ReservaDTO {
	public int numeroReserva;
	public ClienteDTO cliente;
	public HotelDTO hotel;
	public DatosPagoDTO datosPago;
	public HabitacionDTO habitacion;
	public Date fechaCreacion;
	public Date checkin;
	public Date checkout;
	public float totalAmount;
	public float totalAmountWithoutTaxes;
	public float taxes;
	public String currency;
	public boolean activa;
}
