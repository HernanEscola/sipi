package app;

import hbt.HibernateUtil;

import java.util.Date;





import org.hibernate.Session;

import bean.dao.GenericDAO;
import model.Alumno;


public class PersistenciaFake extends Sistema {
	
	protected PersistenciaFake() throws NumberFormatException, Exception {
	}

	private static final long serialVersionUID = 1L;
	

	public static void EjecutarFakes(){

		creacionAlumno();
	}

	private static void creacionAlumno() {
		// 1
		Alumno a = new Alumno();
		a.setApellido("Escola");
		a.setDireccion("Mi casa abs");
		a.setNroDocumento("35156910");
		GenericDAO dao = GenericDAO.getInstancia();
		try {
			dao.registrar(a);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	

	}

	private static void creacionHotelesFake() {
		// 1
		Hotel h = new Hotel("Hilton");
		h.setCategoria(3);
		hotelDAO.saveHotel(h);

		// 2
		h = new Hotel("Four Season");
		h.setCategoria(4);
		hotelDAO.saveHotel(h);

		// 3
		h = new Hotel("Sheraton");
		h.setCategoria(5);
		hotelDAO.saveHotel(h);

		// 4
		h = new Hotel("Universal");
		h.setCategoria(3);
		hotelDAO.saveHotel(h);

		// 5
		h = new Hotel("Minotel");
		h.setCategoria(4);
		hotelDAO.saveHotel(h);
		
		// 6
		h = new Hotel("Alberdi");
		h.setCategoria(2);
		hotelDAO.saveHotel(h);

		// 7
		h = new Hotel("Gran Buenos Aires");
		h.setCategoria(4);
		hotelDAO.saveHotel(h);

		// 8
		h = new Hotel("La Suite");
		h.setCategoria(5);
		hotelDAO.saveHotel(h);
	}

	public static void relacionHotelesImpuesto() {
		Hotel h;
		Impuesto i  = new Impuesto((double)0.21, "IVA");
		Impuesto i2  = new Impuesto((double)0.15, "Restriccion AFIP");
		Impuesto i3  = new Impuesto((double)0.35, "Imp Personales");
		Impuesto i4  = new Impuesto((double)0.01, "Otros Impuestos");
		Impuesto i5  = new Impuesto((double)0.04, "Atencion Medica");

		// 1
		h = buscarHotel(1);
		h.setImpuesto(i);
		hotelDAO.updateHotel(h);

		// 2
		h = buscarHotel(2);
		h.setImpuesto(i);
		hotelDAO.updateHotel(h);
		
		// 4
		h = buscarHotel(4);
		h.setImpuesto(i2);
		hotelDAO.updateHotel(h);

		// 3
		h = buscarHotel(3);
		h.setImpuesto(i2);
		hotelDAO.updateHotel(h);

		// 5
		h = buscarHotel(5);
		h.setImpuesto(i3);
		hotelDAO.updateHotel(h);
		
		// 6
		h = buscarHotel(6);
		h.setImpuesto(i4);
		hotelDAO.updateHotel(h);

		// 7
		h = buscarHotel(7);
		h.setImpuesto(i5);
		hotelDAO.updateHotel(h);

		// 8
		h = buscarHotel(8);
		h.setImpuesto(i4);
		hotelDAO.updateHotel(h);
	}

	public static void creacionHabitacionesFake() throws NumberFormatException, Exception {
		// 1
		Habitacion h = new Habitacion(new Date(), Float.valueOf("450"), "ARS",
				"Habitación King Bed", "Media Pensión", 2, true, 5);
		habitacionDAO.saveHabitacion(h);

		// 2
		h = new Habitacion(new Date(), Float.valueOf("700"), "ARS",
				"Habitación Twin Beds", "All Inclusive", 1, true, 10);
		habitacionDAO.saveHabitacion(h);

		// 3
		h = new Habitacion(new Date(), Float.valueOf("430.5"), "ARS",
				"Habitación Simple", "Pensión Completa", 2, true, 15);
		habitacionDAO.saveHabitacion(h);

		// 4
		h = new Habitacion(new Date(), Float.valueOf("150"), "ARS",
				"Suite Vista Parque", "Sin Pensión", 1, true, 10);
		habitacionDAO.saveHabitacion(h);

		// 5
		h = new Habitacion(new Date(), Float.valueOf("500"), "ARS",
				"Habitación Twin Vista", "Media Pensión", 2, true, 7);
		habitacionDAO.saveHabitacion(h);

		// 6
		h = new Habitacion(new Date(), Float.valueOf("700"), "ARS",
				"Suite Deluxe", "Media Pensión", 3, true, 4);
		habitacionDAO.saveHabitacion(h);

		// 7
		h = new Habitacion(new Date(), Float.valueOf("470"), "ARS",
				"Habitación base triple", "Sin Pensión", 3, true, 5);
		habitacionDAO.saveHabitacion(h);

		// 8
		h = new Habitacion(new Date(), Float.valueOf("1000"), "ARS",
				"Suite Cuádruple", "Media Pensión", 4, true, 10);
		habitacionDAO.saveHabitacion(h);

		// 9
		h = new Habitacion(new Date(), Float.valueOf("600"), "ARS",
				"Habitación Cuádruple", "Sin Pensión", 4, true, 3);
		habitacionDAO.saveHabitacion(h);

		// 10
		h = new Habitacion(new Date(), Float.valueOf("1400"), "ARS",
				"Suite Cuádruple", "All Inclusive", 4, true, 5);
		habitacionDAO.saveHabitacion(h);

		// 11
		h = new Habitacion(new Date(), Float.valueOf("1300"), "ARS",
				"Quintuple 5 Beds", "Media Pensión", 5, true, 7);
		habitacionDAO.saveHabitacion(h);

		// 12
		h = new Habitacion(new Date(), Float.valueOf("1150.8"), "ARS",
				"Suite Quintuple", "Media Pensión", 5, true, 3);
		habitacionDAO.saveHabitacion(h);

		// 13
		h = new Habitacion(new Date(), Float.valueOf("1045"), "ARS",
				"Habitación Quintuple", "Sin Pensión", 5, true, 15);
		habitacionDAO.saveHabitacion(h);

		// 14
		h = new Habitacion(new Date(), Float.valueOf("159"), "ARS",
				"Habitación Single", "Sin Pensión", 1, true, 25);
		habitacionDAO.saveHabitacion(h);

		// 15
		h = new Habitacion(new Date(), Float.valueOf("700"), "ARS",
				"Twin Bed Simple", "Media Pensión", 2, true, 5);
		habitacionDAO.saveHabitacion(h);
		
		// 16
		h = new Habitacion(new Date(), Float.valueOf("1800"), "ARS",
				"Suite Simple", "All Inclusive", 1, true, 10);
		habitacionDAO.saveHabitacion(h);

		// 17
		h = new Habitacion(new Date(), Float.valueOf("1300"), "ARS",
				"Habitacion Single", "All Inclusive", 1, true, 7);
		habitacionDAO.saveHabitacion(h);

		// 18
		h = new Habitacion(new Date(), Float.valueOf("2500.8"), "ARS",
				"Suite Quintuple", "Pensión Completa", 5, true, 2);
		habitacionDAO.saveHabitacion(h);

		// 19
		h = new Habitacion(new Date(), Float.valueOf("1100.9"), "ARS",
				"Habitación Cuádruple", "Sin Pensión", 4, true, 12);
		habitacionDAO.saveHabitacion(h);

		// 20
		h = new Habitacion(new Date(), Float.valueOf("250"), "ARS",
				"Habitación Single", "Media Pensión", 1, true, 22);
		habitacionDAO.saveHabitacion(h);

		// 21
		h = new Habitacion(new Date(), Float.valueOf("900"), "ARS",
				"Habitación Doble", "Media Pensión", 2, true, 8);
		habitacionDAO.saveHabitacion(h);
		
		// 22
		h = new Habitacion(new Date(), Float.valueOf("235.5"), "ARS",
				"Habitación Single", "Sin Pensión", 1, true, 12);
		habitacionDAO.saveHabitacion(h);

		// 23
		h = new Habitacion(new Date(), Float.valueOf("1700"), "ARS",
				"Suite Doble", "All Inclusive", 2, true, 2);
		habitacionDAO.saveHabitacion(h);

		// 24
		h = new Habitacion(new Date(), Float.valueOf("1548.9"), "ARS",
				"Suite Single", "Pensión Completa", 1, true, 18);
		habitacionDAO.saveHabitacion(h);

		// 25
		h = new Habitacion(new Date(), Float.valueOf("998.9"), "ARS",
				"Twin Bed Simple", "Pensión Completa", 2, true, 3);
		habitacionDAO.saveHabitacion(h);

		// 26
		h = new Habitacion(new Date(), Float.valueOf("149"), "ARS",
				"Habitación Single", "Sin Pensión", 1, true, 22);
		habitacionDAO.saveHabitacion(h);

		// 27
		h = new Habitacion(new Date(), Float.valueOf("700"), "ARS",
				"Twin Bed Simple", "Media Pensión", 2, true, 5);
		habitacionDAO.saveHabitacion(h);
		
		// 28
		h = new Habitacion(new Date(), Float.valueOf("1200"), "ARS",
				"Twin Bed Simple", "Pensión Completa", 2, true, 3);
		habitacionDAO.saveHabitacion(h);

		// 29
		h = new Habitacion(new Date(), Float.valueOf("459"), "ARS",
				"Habitación Single", "Media Pensión", 1, true, 13);
		habitacionDAO.saveHabitacion(h);

		// 30
		h = new Habitacion(new Date(), Float.valueOf("1200"), "ARS",
				"Habitación Triple", "Media Pensión", 3, true, 9);
		habitacionDAO.saveHabitacion(h);
	}

	public static void relacionHotelesHabitaciones() {
		Hotel h;
		Habitacion h2;
		
		//1-3-6-7
		h = buscarHotel(1);
		h2 = buscarHabitacion(1);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(3);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(6);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(7);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
		
		//2-11-15
		h = buscarHotel(2);
		h2 = buscarHabitacion(2);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(11);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(15);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
		
		//4-8-13
		h = buscarHotel(3);
		h2 = buscarHabitacion(4);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(8);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(13);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
		
		//5-9-10
		h = buscarHotel(4);
		h2 = buscarHabitacion(5);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(9);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(10);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
		
		//12-14-16
		h = buscarHotel(5);
		h2 = buscarHabitacion(12);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(14);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(16);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
		
		//17-18-19
		h = buscarHotel(6);
		h2 = buscarHabitacion(17);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(18);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(19);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
		

		//20-21-22
		h = buscarHotel(7);
		h2 = buscarHabitacion(20);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(21);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(22);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
		

		//23-24-25
		h = buscarHotel(8);
		h2 = buscarHabitacion(23);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(24);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(25);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
		

		//26-27-28
		h = buscarHotel(1);
		h2 = buscarHabitacion(26);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(27);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(28);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);

		//29 - 30
		h = buscarHotel(2);
		h2 = buscarHabitacion(29);
		h.getHabitaciones().add(h2);
		h2 = buscarHabitacion(30);
		h.getHabitaciones().add(h2);
		hotelDAO.updateHotel(h);
	}
}
