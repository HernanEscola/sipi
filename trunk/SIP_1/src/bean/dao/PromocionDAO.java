package bean.dao;

import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class PromocionDAO {

	private static PromocionDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static PromocionDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new PromocionDAO();
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
	public List<Promocion> getPromociones() {
		Session session = getSession();
		List<Promocion> promociones = session.createQuery("from Promocion").list();
		return promociones;
	}

	public Promocion getPromocionByNumero (String cod) {
		Session session = getSession();

		Promocion promocion = (Promocion) session.createQuery(
				"from Promocion p where p.numeroPromocion like '" + cod + "'")
				.uniqueResult();

		return promocion;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Promocion> getPromocionByHotel(int hotelID) {
		Session session = getSession();

		// Obtengo los ids de las Promociones
		List list = (List) session
				.createQuery(
						"Select p from Promocion p join p.hotel h where h.numeroHotel like '"
								+ String.valueOf(hotelID) + "'")
				.list();
		
		List<Promocion> resp = list;

		return resp;
	}

	public int savePromocion(Promocion promocion) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(promocion);
			session.getTransaction().commit();
			session.flush();
			return promocion.getNumeroPromocion();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updatePromocion(Promocion promocion) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(promocion);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deletePromocion(Promocion promocion) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(promocion);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}
