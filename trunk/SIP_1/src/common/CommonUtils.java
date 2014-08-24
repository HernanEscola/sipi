package common;

import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import bean.*;
import bean.dto.*;

public class CommonUtils {
	public static ClienteDTO clienteToDTO(Cliente c) {
		ClienteDTO cDTO = new ClienteDTO();

		cDTO.apellido = c.getApellido();
		cDTO.documento = c.getDocumento();
		cDTO.email = c.getEmail();
		cDTO.nombre = c.getNombre();
		cDTO.numeroCliente = c.getNumeroCliente();
		cDTO.telefono = c.getTelefono();

		return cDTO;
	}

	public static DatosPagoDTO datosPagoToDTO(DatosPago d) {
		DatosPagoDTO dDTO = new DatosPagoDTO();

		dDTO.codigoSeguridad = d.getCodigoSeguridad();
		dDTO.direccion = d.getDireccion();
		dDTO.numeroPago = d.getNumeroPago();
		dDTO.numeroTC = d.getNumeroTC();
		dDTO.tc = d.getTc();
		dDTO.titular = d.getTitular();
		dDTO.vencimiento = d.getVencimiento();

		return dDTO;
	}

	public static HabitacionDTO habitacionToDTO(Habitacion h) {
		HabitacionDTO hDTO = new HabitacionDTO();

		hDTO.activa = h.isActiva();
		hDTO.capacidad = h.getCapacidad();
		hDTO.numeroHabitacion = h.getNumeroHabitacion();
		hDTO.descripcion = h.getDescripcion();
		hDTO.regimen = h.getRegimen();
		hDTO.disponibilidad = new Vector<DisponibilidadDTO>();
		for (Disponibilidad d : h.getDisponibilidadesAll()) {
			hDTO.disponibilidad.add(disponibilidadToDTO(d));
		}

		hDTO.tarifa = tarifaToDTO(h.getTarifa());

		return hDTO;
	}

	public static TarifaDTO tarifaToDTO(Tarifa t) {
		TarifaDTO tDTO = new TarifaDTO();

		tDTO.amount = t.getAmount();
		tDTO.codigoTarifa = t.getCodigoTarifa();
		tDTO.currency = t.getCurrency();
		tDTO.fecha = t.getFecha();

		return tDTO;
	}

	public static HotelDTO hotelToDTO(Hotel h) {
		HotelDTO hDTO = new HotelDTO();

		hDTO.descripcion = h.getDescripcion();
		hDTO.categoria = h.getCategoria();
		hDTO.habitaciones = new Vector<HabitacionDTO>();
		for (Habitacion h2 : h.getHabitaciones()) {
			hDTO.habitaciones.add(habitacionToDTO(h2));
		}
		hDTO.impuesto = impuestoToDTO(h.getImpuesto());
		hDTO.numeroHotel = h.getNumeroHotel();

		return hDTO;
	}

	public static ImpuestoDTO impuestoToDTO(Impuesto i) {
		ImpuestoDTO iDTO = new ImpuestoDTO();
		iDTO.porcentaje = i.getPorcentaje();
		iDTO.concepto = i.getConcepto();
		iDTO.numeroImpuesto = i.getNumeroImpuesto();
		return iDTO;
	}

	public static ReservaDTO reservaToDTO(Reserva r) {
		ReservaDTO rDTO = new ReservaDTO();

		rDTO.activa = r.isActiva();
		rDTO.checkin = r.getCheckin();
		rDTO.checkout = r.getCheckout();
		rDTO.cliente = clienteToDTO(r.getCliente());
		rDTO.currency = r.getCurrency();
		rDTO.datosPago = datosPagoToDTO(r.getDatosPago());
		rDTO.fechaCreacion = r.getFechaCreacion();
		rDTO.habitacion = habitacionToDTO(r.getHotel().buscarHabitacion(
				r.getHabitacion()));
		rDTO.hotel = hotelToDTO(r.getHotel());
		rDTO.numeroReserva = r.getNumeroReserva();
		rDTO.taxes = r.getTaxes();
		rDTO.totalAmount = r.getTotalAmount();
		rDTO.totalAmountWithoutTaxes = r.getTotalAmountWithoutTaxes();

		return rDTO;
	}

	public static PromocionDTO promocionToDTO(Promocion p) {
		PromocionDTO pDTO = new PromocionDTO();

		pDTO.numeroPromocion = p.getNumeroPromocion();
		pDTO.hotel = hotelToDTO(p.getHotel());

		if (p.getClass() == PromocionDescuento.class) {
			PromocionDescuento pD = (PromocionDescuento) p;
			pDTO.A_porcentajeDescuento = pD.getPorcentajeDescuento();
		} else {
			PromocionNochesLibres pN = (PromocionNochesLibres) p;
			pDTO.B_minimoNoches = pN.getMinimoNoches();
			pDTO.B_nochesLibres = pN.getNochesLibres();
		}

		return pDTO;
	}

	public static DisponibilidadDTO disponibilidadToDTO(Disponibilidad d) {
		DisponibilidadDTO dDTO = new DisponibilidadDTO();
		dDTO.fecha = d.getFecha();
		dDTO.numeroDisponiblidad = d.getNumeroDisponibilidad();
		dDTO.stock = d.getStock();

		return dDTO;
	}

	public static Date addDays(Date date, int days) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		return cal.getTime();
	}

	@SuppressWarnings("deprecation")
	public static int compararEnDiasDate(Date first, Date second)
			throws Exception {
		if (first.before(second)) {
			Date aux = (Date) first.clone();
			int count = 0;
			while (aux.compareTo(second) != 0) {
				aux.setDate(aux.getDate() + 1);
				count++;
			}
			return count;
		} else
			throw new Exception(
					"Error en las fechas ingresadas. First debe ser anterior a Second");
	}
}
