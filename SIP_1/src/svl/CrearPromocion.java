package svl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.SystemService;

public class CrearPromocion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SystemService instance;

	public CrearPromocion() {
		super();
		instance = SystemService.getInstance();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String minNoches = (String) request.getParameter("minNoches");
		String nochesFree = (String) request.getParameter("nochesFree");
		String porcentaje = (String) request.getParameter("porcentaje");

		if (porcentaje.isEmpty()) {
			try {
				String hotelID = (String) request.getParameter("hotelID");
				instance.altaPromocionNochesLibres(Integer.valueOf(hotelID),
						Integer.valueOf(nochesFree), Integer.valueOf(minNoches));
				request.setAttribute("txtRespuesta",
						"Promoción <bold>Noches Libres</bold> agregada correctamente al Hotel: <bold>"
								+ hotelID + "</bold>");
			} catch (Exception e) {
				request.setAttribute("txtRespuesta", e.getMessage());
			}
		} else if (minNoches.isEmpty()) {
			try {
				String hotelID = (String) request.getParameter("hotelID2");
				instance.altaPromocionDescuento(Integer.valueOf(hotelID),
						(Float.valueOf(porcentaje)/100));
				request.setAttribute("txtRespuesta",
						"Promoción <bold>Descuento</bold> agregada correctamente al Hotel: <bold>"
								+ hotelID + "</bold>");
			} catch (Exception e) {
				request.setAttribute("txtRespuesta", e.getMessage());
			}
		} else {
			request.setAttribute("txtRespuesta",
					"Por favor, ingrese los datos correctamente");
		}

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/jsp/RespuestaGenerica.jsp");
		dispatcher.forward(request, response);
	}

}
