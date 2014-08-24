package bean.dao;

import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class DatosPagoDAO {

	private static DatosPagoDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static DatosPagoDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new DatosPagoDAO();
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
	public List<DatosPago> getDatosPago() {
		Session session = getSession();
		List<DatosPago> datosPago = session.createQuery("from DatosPago").list();
		return datosPago;
	}

	public DatosPago getDatosPagoByNumero(int numeroPago) {
		Session session = getSession();

		DatosPago datosPago = (DatosPago) session.createQuery(
				"from DatosPago d where d.numeroPago = " + numeroPago)
				.uniqueResult();

		return datosPago;
	}

	public int saveDatosPago(DatosPago datosPago) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(datosPago);
			session.getTransaction().commit();
			session.flush();
			return datosPago.getNumeroPago();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updateDatosPago(DatosPago datosPago) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(datosPago);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deleteDatosPago(DatosPago datosPago) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(datosPago);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}
