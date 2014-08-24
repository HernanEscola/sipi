package bean.dao;

import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class TarifaDAO {

	private static TarifaDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static TarifaDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new TarifaDAO();
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
	public List<Tarifa> getTarifas() {
		Session session = getSession();
		List<Tarifa> tarifas = session.createQuery("from Tarifa").list();
		return tarifas;
	}

	public Tarifa getTarifaByCodigo (String cod) {
		Session session = getSession();

		Tarifa tarifa = (Tarifa) session.createQuery(
				"from Tarifa t where t.codigoTarifa like '" + cod + "'")
				.uniqueResult();

		return tarifa;
	}

	public int saveTarifa(Tarifa tarifa) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(tarifa);
			session.getTransaction().commit();
			session.flush();
			return tarifa.getCodigoTarifa();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updateTarifa(Tarifa tarifa) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(tarifa);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deleteTarifa(Tarifa tarifa) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(tarifa);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}
