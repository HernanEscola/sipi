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

import app.SystemService;

import bean.dto.*;

public class GenerarReporteReservas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SystemService instance;

	public GenerarReporteReservas() {
		super();
		instance = SystemService.getInstance();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		FileWriter fichero = null;
		PrintWriter pw = null;
		try {

			List<ReservaDTO> reservas = instance.generarReporteReservas();
			if (!reservas.isEmpty()) {
				fichero = new FileWriter("C://Reportes//ReporteReservas.csv");
				pw = new PrintWriter(fichero);

				crearCabecera(pw);

				for (ReservaDTO r : reservas) {
					imprimirLinea(pw, r);
				}
			} else {
				request.setAttribute("txtRespuesta",
						"No existen reservas cargadas en el Sistema.");
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
		pw.println("Numero Reserva; Nombre Cliente; Apellido Cliente; Documento Cliente;"
				+ "Descripción Hotel; Categoría Hotel; Numero Pago; Descripción Habitación;"
				+ "Régimen Habitación; Capacidad Habitación; Fecha Creación Reserva; Check In;"
				+ "Check Out; Precio; Impuestos; Moneda; Estado Reserva");
	}

	private void imprimirLinea(PrintWriter pw, ReservaDTO r) {
		pw.println(r.numeroReserva + ";" + r.cliente.nombre + ";"
				+ r.cliente.apellido + ";" + r.cliente.documento + ";"
				+ r.hotel.descripcion + ";" + r.hotel.categoria + ";"
				+ r.datosPago.numeroPago + ";" + r.habitacion.descripcion + ";"
				+ r.habitacion.regimen + ";" + r.habitacion.capacidad + ";"
				+ r.fechaCreacion.toString() + ";" + r.checkin.toString() + ";"
				+ r.checkout.toString() + ";" + r.totalAmountWithoutTaxes + ";"
				+ r.taxes + ";" + r.currency  + ";"
				+ ((r.activa == true) ? "Activa" : "Inactiva"));
	}
}
