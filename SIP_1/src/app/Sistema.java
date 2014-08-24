package app;

import java.io.Serializable;
import java.util.List;
import java.util.Date;
import java.util.Vector;

import common.CommonUtils;

import bean.*;
import bean.dao.*;
import bean.dto.*;

public class Sistema implements Serializable {

	private static final long serialVersionUID = 1L;

	private static final Sistema sistemaGDS = new Sistema();

	protected static ClienteDAO clienteDAO;
	protected static DatosPagoDAO datosPagoDAO;
	protected static HabitacionDAO habitacionDAO;
	protected static HotelDAO hotelDAO;
	protected static ImpuestoDAO impuestoDAO;
	protected static PromocionDAO promocionDAO;
	protected static ReservaDAO reservaDAO;
	protected static TarifaDAO tarifaDAO;
	protected static DisponibilidadDAO disponibilidadDAO;

	protected Sistema() {
		clienteDAO = ClienteDAO.getInstancia();
		datosPagoDAO = DatosPagoDAO.getInstancia();
		habitacionDAO = HabitacionDAO.getInstancia();
		hotelDAO = HotelDAO.getInstancia();
		impuestoDAO = ImpuestoDAO.getInstancia();
		promocionDAO = PromocionDAO.getInstancia();
		reservaDAO = ReservaDAO.getInstancia();
		tarifaDAO = TarifaDAO.getInstancia();
		disponibilidadDAO = DisponibilidadDAO.getInstancia();

		try {
			PersistenciaFake.EjecutarFakes();

			// ---- SOLO PRUEBAS DE METODOS!!!! ----
			// altaPromocionNochesLibres(1, 2, 10);
			// altaPromocionDescuento(1, ((float) (0.1)));
			//
			// List<HabitacionDTO> resp =
			// habitacionesDisponibleHotelConCantPersonas(1, new Date(2012 -
			// 1900,
			// 0, 1), new Date(2012 - 1900, 0, 16), 3);
			//
			// ReservaDTO r = generarReserva(1, "35275265", new Date(2012 -
			// 1900,
			// 0, 1), new Date(2012 - 1900, 0, 16), ((float) (0.25)),
			// "ARS", (buscarHabitacion(1).getTarifa().getAmount() * 15),
			// new DatosPagoDTO());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Sistema getInstance() {
		return sistemaGDS;
	}

	protected Cliente buscarClienteByDoc(String dni) {
		return clienteDAO.getClienteByDoc(dni);
	}

	protected Cliente buscarClienteByNumero(int numero) {
		return clienteDAO.getClienteByNumero(numero);
	}

	protected static Habitacion buscarHabitacion(int habitacionID) {
		return habitacionDAO.getHabitacionByNumero(habitacionID);
	}

	protected static Hotel buscarHotel(int hotelID) {
		return hotelDAO.getHotelByNumero(String.valueOf(hotelID));
	}

	protected static Hotel buscarHotelPorHabitacion(int habitacionID) {
		return hotelDAO.getHotelByHabitacion(habitacionID);
	}

	protected Reserva buscarReserva(int reservaID) {
		return reservaDAO.getReservaByNumero(reservaID);
	}

	protected static Impuesto buscarImpuesto(int impuestoID) {
		return impuestoDAO.getImpuestoByNumero(impuestoID);
	}

	protected Promocion buscarPromocion(int promocionID) {
		return promocionDAO.getPromocionByNumero(String.valueOf(promocionID));
	}

	protected List<Promocion> buscarPromocionPorHotel(int hotelID) {
		return promocionDAO.getPromocionByHotel(hotelID);
	}

	public List<HabitacionDTO> habitacionesDisponibleHotel(int idHotel,
			Date fechaDesde, Date fechaHasta) throws Exception {
		Hotel h = buscarHotel(idHotel);
		if (h == null)
			throw new Exception("Hotel no encontrado.");

		List<HabitacionDTO> habDisp = new Vector<HabitacionDTO>();
		for (Habitacion h2 : h.getHabitaciones()) {
			if (h2.getDisponibilidades(fechaDesde, fechaHasta)) {
				habDisp.add(CommonUtils.habitacionToDTO(h2));
			}
		}

		int cantDias = CommonUtils.compararEnDiasDate(fechaDesde, fechaHasta);

		if (habDisp.isEmpty()) {
			throw new Exception(
					"El Hotel ingresado no contiene Habitaciones disponibles.");
		}
		else {
			for (HabitacionDTO h3 : habDisp) {
				h3.tarifa.amount = CalcularPromocion(h, h3.tarifa.amount,
						cantDias);
			}
		}

		return habDisp;
	}

	public List<HabitacionDTO> habitacionesDisponibleHotelConCantPersonas(
			int idHotel, Date fechaDesde, Date fechaHasta, int cantidadPersonas)
			throws Exception {
		Hotel h = buscarHotel(idHotel);
		if (h == null) {
			throw new Exception("Hotel no encontrado.");
		}

		List<HabitacionDTO> habDisp = new Vector<HabitacionDTO>();
		for (Habitacion h2 : h.getHabitaciones()) {
			if (h2.getDisponibilidades(fechaDesde, fechaHasta)
					&& (h2.getCapacidad() == cantidadPersonas)) {
				habDisp.add(CommonUtils.habitacionToDTO(h2));
			}
		}

		int cantDias = CommonUtils.compararEnDiasDate(fechaDesde, fechaHasta);

		if (habDisp.isEmpty()) {
			throw new Exception(
					"El Hotel ingresado no contiene Habitaciones disponibles.");
		} else {
			for (HabitacionDTO h3 : habDisp) {
				h3.tarifa.amount = CalcularPromocion(h, h3.tarifa.amount,
						cantDias);
			}
		}

		return habDisp;
	}

	private float CalcularPromocion(Hotel h2, float totalSinImpuesto,
			int cantDias) throws Exception {
		List<Promocion> promociones = buscarPromocionPorHotel(h2
				.getNumeroHotel());
		
		totalSinImpuesto = totalSinImpuesto * cantDias;
		
		if (promociones != null && promociones.size() > 0) {
			Promocion p = promociones.get(0);

			if (p.getClass() == PromocionDescuento.class) {
				totalSinImpuesto = totalSinImpuesto
						- (totalSinImpuesto * ((PromocionDescuento) p)
								.getPorcentajeDescuento());
			} else if (p.getClass() == PromocionNochesLibres.class) {
				PromocionNochesLibres pnl = (PromocionNochesLibres) p;
				if (cantDias > pnl.getMinimoNoches()) {
					totalSinImpuesto = ((totalSinImpuesto / cantDias) * (cantDias - pnl
							.getNochesLibres()));
				}
			}
		}
		return totalSinImpuesto;
	}

	public ReservaDTO generarReserva(int habitacionID, ClienteDTO cli,
			Date checkIn, Date checkOut, float impuesto, String moneda,
			float totalSinImpuesto, DatosPagoDTO dpDTO) throws Exception {
		Habitacion h = buscarHabitacion(habitacionID);
		if (h == null)
			throw new Exception("Habitación no encontrada.");
		else if (h.isActiva() == false)
			throw new Exception("Habitación no activa.");
		else if (!h.getDisponibilidades(checkIn, checkOut))
			throw new Exception(
					"No hay suficiente stock de la Habitacion ingresada.");

		Cliente c = this.buscarClienteByDoc(cli.documento);
		if (c == null) {
			c = new Cliente();
			c.setApellido(cli.apellido);
			c.setDocumento(cli.documento);
			c.setEmail(cli.email);
			c.setNombre(cli.nombre);
			c.setTelefono(cli.telefono);
			clienteDAO.saveCliente(c);
		}

		Hotel h2 = buscarHotelPorHabitacion(h.getNumeroHabitacion());
		if (h2 == null)
			throw new Exception(
					"Error al buscar hotel relacionado a la habitación ingresada.");
		
		DatosPago d = new DatosPago();
		d.setTitular(dpDTO.titular);
		d.setCodigoSeguridad(dpDTO.codigoSeguridad);
		d.setDireccion(dpDTO.direccion);
		d.setNumeroPago(dpDTO.numeroPago);
		d.setNumeroTC(dpDTO.numeroTC);
		d.setTc(dpDTO.tc);
		d.setVencimiento(dpDTO.vencimiento);

		impuesto = totalSinImpuesto * impuesto;

		Reserva r = new Reserva();
		r.setCheckin(checkIn);
		r.setCheckout(checkOut);
		r.setCliente(c);
		r.setDatosPago(d);
		r.setFechaCreacion(new Date());
		r.setHabitacion(h.getNumeroHabitacion());
		r.setHotel(h2);
		r.setTaxes(impuesto);
		r.setTotalAmountWithoutTaxes(totalSinImpuesto);
		r.setTotalAmount(totalSinImpuesto + impuesto);
		r.setActiva(true);
		r.setCurrency(moneda);

		h.setDisponibilidadMenos(checkIn, checkOut);

		habitacionDAO.updateHabitacion(h);
		datosPagoDAO.saveDatosPago(d);
		reservaDAO.saveReserva(r);

		return CommonUtils.reservaToDTO(r);
	}

	public void cancelarReserva(int reservaID) throws Exception {
		Reserva r = buscarReserva(reservaID);
		if (r == null)
			throw new Exception("Reserva no encontrada.");

		if (r != null) {
			r.setActiva(false);

			Habitacion h = buscarHabitacion(r.getHabitacion());
			h.setDisponibilidadMas(r.getCheckin(), r.getCheckout());

			habitacionDAO.updateHabitacion(h);
			reservaDAO.updateReserva(r);
		}
	}

	public List<ReservaDTO> generarReporteReservas() {
		List<ReservaDTO> reservasDTO = new Vector<ReservaDTO>();
		List<Reserva> reservas = reservaDAO.getReservas();

		for (Reserva r : reservas) {
			ReservaDTO rDTO = CommonUtils.reservaToDTO(r);

			reservasDTO.add(rDTO);
		}

		return reservasDTO;
	}

	public List<HabitacionDTO> generarReporteHabitacion(int hotelID)
			throws Exception {
		Hotel h = buscarHotel(hotelID);
		if (h == null)
			throw new Exception("Hotel no encontrado.");

		List<HabitacionDTO> hsDTO = new Vector<HabitacionDTO>();

		for (Habitacion h2 : h.getHabitaciones())
			hsDTO.add(CommonUtils.habitacionToDTO(h2));

		return hsDTO;
	}

	public PromocionDTO altaPromocionDescuento(int hotelID, float porcentaje)
			throws Exception {
		Promocion p = new PromocionDescuento(porcentaje);

		Hotel h = buscarHotel(hotelID);
		if (h == null)
			throw new Exception("Hotel no encontrado.");

		p.setHotel(h);

		promocionDAO.savePromocion(p);

		return CommonUtils.promocionToDTO(p);
	}

	public PromocionDTO altaPromocionNochesLibres(int hotelID,
			int nochesLibres, int minimoNoches) throws Exception {
		Promocion p = new PromocionNochesLibres(minimoNoches, nochesLibres);

		Hotel h = buscarHotel(hotelID);
		if (h == null)
			throw new Exception("Hotel no encontrado.");

		p.setHotel(h);

		promocionDAO.savePromocion(p);

		return CommonUtils.promocionToDTO(p);
	}

	public HotelDTO getHotelById(int hotelId) {
		return CommonUtils.hotelToDTO(buscarHotel(hotelId));
	}

	public boolean validarExistenciaClienteByNumero(int clienteID) {
		return (buscarClienteByNumero(clienteID) != null);
	}

	public boolean validarExistenciaClienteByDoc(int doc) {
		return (buscarClienteByDoc(String.valueOf(doc)) != null);
	}
}
