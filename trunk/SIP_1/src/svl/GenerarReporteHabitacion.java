package svl;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.dto.HabitacionDTO;
import bean.dto.HotelDTO;

import app.Sistema;

public class GenerarReporteHabitacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Sistema instance;

	public GenerarReporteHabitacion() {
		super();
		instance = Sistema.getInstance();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String hotelID = (String) request.getParameter("hotelID");

		FileWriter fichero = null;
		PrintWriter pw = null;

		try {
			HotelDTO h2 = instance.getHotelById(Integer.valueOf(hotelID));

			List<HabitacionDTO> habitaciones = instance
					.generarReporteHabitacion(Integer.valueOf(hotelID));
			if (!habitaciones.isEmpty()) {
				fichero = new FileWriter(
						"C://Reportes//ReporteHabitaciones.csv");
				pw = new PrintWriter(fichero);

				crearCabecera(pw);

				for (HabitacionDTO h : habitaciones) {
					imprimirLinea(pw, h, h2);
				}
			} else {
				request.setAttribute("txtRespuesta",
						"No existen habitaciones cargadas en el Sistema con el Hotel ingresado.");
			}

		} catch (Exception e) {
			request.setAttribute("txtRespuesta", e.getMessage());
		} finally {
			try {
				if (null != fichero) {
					fichero.close();
					request.setAttribute("txtRespuesta",
							"El reporte se ha creado exitosamente en el directorio C://Reportes");
				}
			} catch (Exception e2) {
				request.setAttribute("txtRespuesta", e2.getMessage());
			}

		}

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/jsp/RespuestaGenerica.jsp");
		dispatcher.forward(request, response);
	}

	private void crearCabecera(PrintWriter pw) {
		pw.println("Hotel; Número Habitación; Descripción Habitación; Régimen Habitación;"
				+ "Capacidad Habitación; Estado Habitación; Precio Habitación; Impuestos Hotel");
	}

	private void imprimirLinea(PrintWriter pw, HabitacionDTO h, HotelDTO h2) {
		pw.println(h2.descripcion + ";" + h.numeroHabitacion + ";"
				+ h.descripcion + ";" + h.regimen + ";" + h.capacidad + ";"
				+ ((h.activa == true) ? "Activa" : "Inactiva") + ";"
				+ h.tarifa.amount + ";" + h2.impuesto.porcentaje + "%");
	}

}
