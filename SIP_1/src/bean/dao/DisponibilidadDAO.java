package bean.dao;

import java.util.Date;
import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class DisponibilidadDAO {

	private static DisponibilidadDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static DisponibilidadDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new DisponibilidadDAO();
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
	public List<Disponibilidad> getDisponiblidad() {
		Session session = getSession();
		List<Disponibilidad> disponiblidad = session.createQuery("from Disponiblidad").list();
		return disponiblidad;
	}

	public Disponibilidad getDisponibilidadByFecha(Date fecha) {
		Session session = getSession();

		Disponibilidad disponibilidad = (Disponibilidad) session.createQuery(
				"from Disponibilidad d where d.fecha = '" + String.valueOf(fecha) + "'")
				.uniqueResult();

		return disponibilidad;
	}

	public int saveDisponibilidad(Disponibilidad disponibilidad) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(disponibilidad);
			session.getTransaction().commit();
			session.flush();
			return disponibilidad.getNumeroDisponibilidad();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updateDisponibilidad(Disponibilidad disponibilidad) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(disponibilidad);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deleteDisponibilidad(Disponibilidad disponibilidad) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(disponibilidad);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}

