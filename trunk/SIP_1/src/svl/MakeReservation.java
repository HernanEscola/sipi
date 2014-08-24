package svl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.dto.*;

import app.Sistema;

public class MakeReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Sistema instance;

	public MakeReservation() {
		super();
		instance = Sistema.getInstance();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String hotelID = (String) request.getParameter("hotelId");
		String huespedes = (String) request.getParameter("hotelGuests");
		String checkInTimeDD = (String) request.getParameter("checkInTimeDD");
		String checkInTimeMM = (String) request.getParameter("checkInTimeMM");
		String checkInTimeYYYY = (String) request
				.getParameter("checkInTimeYYYY");
		String checkOutTimeDD = (String) request.getParameter("checkOutTimeDD");
		String checkOutTimeMM = (String) request.getParameter("checkOutTimeMM");
		String checkOutTimeYYYY = (String) request
				.getParameter("checkOutTimeYYYY");
		int roomID = Integer.valueOf(request.getParameter("roomID"));
		
		String name = (String) request.getParameter("name");
		String surname = (String) request.getParameter("surname");
		String document = (String) request.getParameter("document");
		String telephone = (String) request.getParameter("telephone");
		String email = (String) request.getParameter("email");
		String titular = (String) request.getParameter("titular");
		String tcType = (String) request.getParameter("tcType");
		String tcNumber = (String) request.getParameter("tcNumber");
		String vencimientoMM = (String) request.getParameter("vencimientoMM");
		String vencimientoYYYY = (String) request.getParameter("vencimientoYYYY");
		String direccion = (String) request.getParameter("direccion");
		String securityCode = (String) request.getParameter("securityCode");
		
		ReservaDTO reserva = null;

		try {
			Date checkIn = new Date(Integer.valueOf(checkInTimeYYYY) - 1900,
					Integer.valueOf(checkInTimeMM) - 1,
					Integer.valueOf(checkInTimeDD));
			Date checkOut = new Date(Integer.valueOf(checkOutTimeYYYY) - 1900,
					Integer.valueOf(checkOutTimeMM) - 1,
					Integer.valueOf(checkOutTimeDD));
			
			ClienteDTO cli = new ClienteDTO();
			cli.apellido = surname;
			cli.documento = document;
			cli.email = email;
			cli.nombre = name;
			cli.telefono = telephone;
			
			DatosPagoDTO dpDTO = new DatosPagoDTO();
			dpDTO.codigoSeguridad = securityCode;
			dpDTO.direccion = direccion;
			dpDTO.numeroTC = tcNumber;
			dpDTO.tc = tcType;
			dpDTO.titular = titular;
			Date venc = new Date(Integer.valueOf(vencimientoYYYY) - 1900,
					Integer.valueOf(vencimientoMM) - 1,
					Integer.valueOf(1));
			dpDTO.vencimiento = venc;
			
			List<HabitacionDTO> habResponse = instance
			.habitacionesDisponibleHotelConCantPersonas(
					Integer.valueOf(hotelID), checkIn, checkOut,
					Integer.valueOf(huespedes));
			
			HotelDTO hotel = instance.getHotelById(Integer.valueOf(hotelID));
			
			HabitacionDTO hDTO = null;
			for (HabitacionDTO h : habResponse) 
			{
				if (h.numeroHabitacion == roomID) {
					hDTO = h;
				}
			}
			
			reserva = instance.generarReserva(roomID, cli, checkIn, checkOut, (float)hotel.impuesto.porcentaje, hDTO.tarifa.currency, hDTO.tarifa.amount, dpDTO);
		
		} catch (Exception e) {
			System.out.print(e.getMessage() + "\n" + e.getStackTrace().toString()); 
		}
		
		String responseMessage  = "La <bold>Operaci&oacute;n</bold> fue procesada con <bold>&Eacute;xito!</bold> <br/><br/>" +
			"Su n&uacute;mero de <bold>Reserva</bold> es: <bold>" + reserva.numeroReserva + "</bold>";

		request.setAttribute("txtRespuesta", responseMessage);
		
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/jsp/RespuestaGenerica.jsp");
		dispatcher.forward(request, response);
	}

}
