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

public class SearchAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Sistema instance;

	public SearchAvailability() {
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

		HabitacionDTO[] habitaciones = null;
		HotelDTO hotel = null;

		try {
			Date checkIn = new Date(Integer.valueOf(checkInTimeYYYY) - 1900,
					Integer.valueOf(checkInTimeMM) - 1,
					Integer.valueOf(checkInTimeDD));
			Date checkOut = new Date(Integer.valueOf(checkOutTimeYYYY) - 1900,
					Integer.valueOf(checkOutTimeMM) - 1,
					Integer.valueOf(checkOutTimeDD));

			List<HabitacionDTO> habResponse = instance
					.habitacionesDisponibleHotelConCantPersonas(
							Integer.valueOf(hotelID), checkIn, checkOut,
							Integer.valueOf(huespedes));

			habitaciones = (HabitacionDTO[]) habResponse
					.toArray(new HabitacionDTO[habResponse.size()]);

			hotel = instance.getHotelById(Integer.valueOf(hotelID));

			// String respuesta = "Resultado: \n";
			// for (HabitacionDTO h : habitaciones) {
			// respuesta += h.numeroHabitacion + "\n" + h.descripcion + "\n"
			// + h.capacidad + "\n";
			// respuesta += "---------------- \n";
			// }
			// request.setAttribute("txtRespuesta", respuesta);

		} catch (Exception e) {
			request.setAttribute(
					"txtRespuesta",
					"Se ha producido el siguiente error al intentar buscar Habitaciones Disponibles: \n"
							+ e.getMessage());
		}

		request.setAttribute("availabilityResponse", habitaciones);
		request.setAttribute("hotelInfo", hotel);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/jsp/AvailabilityResponse.jsp");
		dispatcher.forward(request, response);
	}

}
