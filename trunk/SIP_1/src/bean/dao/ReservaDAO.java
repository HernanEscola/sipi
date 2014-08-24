package bean.dao;

import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class ReservaDAO {

	private static ReservaDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static ReservaDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new ReservaDAO();
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
	public List<Reserva> getReservas() {
		Session session = getSession();
		List<Reserva> reservas = session.createQuery("from Reserva").list();
		return reservas;
	}

	public Reserva getReservaByNumero(int numeroReserva) {
		Session session = getSession();

		Reserva reserva = (Reserva) session.createQuery(
				"from Reserva r where r.numeroReserva = " + numeroReserva)
				.uniqueResult();

		return reserva;
	}

	public int saveReserva(Reserva reserva) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(reserva);
			session.getTransaction().commit();
			session.flush();
			return reserva.getNumeroReserva();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updateReserva(Reserva reserva) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(reserva);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deleteReserva(Reserva reserva) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(reserva);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}
