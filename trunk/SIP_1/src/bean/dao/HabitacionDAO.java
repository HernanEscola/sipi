package bean.dao;

import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class HabitacionDAO {

	private static HabitacionDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static HabitacionDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new HabitacionDAO();
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
	public List<Habitacion> getHabitaciones() {
		Session session = getSession();
		List<Habitacion> habitaciones = session.createQuery("from Habitacion").list();
		return habitaciones;
	}

	public Habitacion getHabitacionByNumero(int numeroHabitacion) {
		Session session = getSession();

		Habitacion habitacion = (Habitacion) session.createQuery(
				"from Habitacion h where h.numeroHabitacion = " + numeroHabitacion)
				.uniqueResult();

		return habitacion;
	}

	public int saveHabitacion(Habitacion habitacion) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(habitacion);
			session.getTransaction().commit();
			session.flush();
			return habitacion.getNumeroHabitacion();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updateHabitacion(Habitacion habitacion) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(habitacion);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deleteHabitacion(Habitacion habitacion) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(habitacion);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}
