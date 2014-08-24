package bean.dao;

import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class HotelDAO {

	private static HotelDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static HotelDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new HotelDAO();
		}
		return instancia;
	}

	private Session getSession() {
		if (session == null || !session.isOpen())
			session = sf.openSession();
		return session;
	}

	public void closeSession() {
		if (session.isOpen())
			session.close();
	}

	@SuppressWarnings("unchecked")
	public List<Hotel> getHoteles() {
		Session session = getSession();
		List<Hotel> hoteles = session.createQuery("from Hotel").list();
		return hoteles;
	}

	public Hotel getHotelByNumero(String num) {
		Session session = getSession();

		Hotel hotel = (Hotel) session.createQuery(
				"from Hotel h where h.numeroHotel like '" + String.valueOf(num)
						+ "'").uniqueResult();

		return hotel;
	}

	public Hotel getHotelByHabitacion(int habitacionID) {
		Session session = getSession();

		// Obtengo el ID del hotel que contiene esa habitación.
		int num = (Integer) session
				.createQuery(
						"Select h.numeroHotel from Hotel h join h.habitaciones h2 where h2.numeroHabitacion like '"
								+ String.valueOf(habitacionID) + "'")
				.uniqueResult();

		// Busco el hotel por el id que recibí antes.
		Hotel hotel = (Hotel) session.createQuery(
				"from Hotel h where h.numeroHotel like '" + String.valueOf(num)
						+ "'").uniqueResult();

		return hotel;
	}

	public int saveHotel(Hotel hotel) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(hotel);
			session.getTransaction().commit();
			session.flush();
			return hotel.getNumeroHotel();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updateHotel(Hotel hotel) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(hotel);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deleteHotel(Hotel hotel) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(hotel);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}
