package bean.dao;

import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class ImpuestoDAO {

	private static ImpuestoDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static ImpuestoDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new ImpuestoDAO();
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
	public List<Impuesto> getImpuestos() {
		Session session = getSession();
		List<Impuesto> impuestos = session.createQuery("from Impuesto").list();
		return impuestos;
	}

	public Impuesto getImpuestoByNumero(int num) {
		Session session = getSession();

		Impuesto impuesto = (Impuesto) session.createQuery(
				"from Impuesto i where i.numeroImpuesto like '" + String.valueOf(num) + "'")
				.uniqueResult();

		return impuesto;
	}

	public int saveImpuesto(Impuesto impuesto) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(impuesto);
			session.getTransaction().commit();
			session.flush();
			return impuesto.getNumeroImpuesto();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updateImpuesto(Impuesto impuesto) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(impuesto);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deleteImpuesto(Impuesto impuesto) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(impuesto);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}
