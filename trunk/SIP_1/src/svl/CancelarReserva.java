package svl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.SystemService;

public class CancelarReserva extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SystemService instance;

	public CancelarReserva() {
		super();
		instance = SystemService.getInstance();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String reservaID = (String) request.getParameter("reservaID");

		try {
			instance.cancelarReserva(Integer.valueOf(reservaID));

			request.setAttribute("txtRespuesta", "Reserva " + reservaID
					+ " cancelada correctamente.");
		} catch (Exception e) {
			request.setAttribute("txtRespuesta",
					"Se produjo el siguiente error: " + e.getMessage());
		}

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/jsp/RespuestaGenerica.jsp");
		dispatcher.forward(request, response);
	}
}
