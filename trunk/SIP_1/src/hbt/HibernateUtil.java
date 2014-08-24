package hbt;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import bean.*;

public class HibernateUtil {
	private static final SessionFactory sessionFactory;
	static {
		try {
			AnnotationConfiguration config = new AnnotationConfiguration();
			config.addAnnotatedClass(Cliente.class);
			config.addAnnotatedClass(DatosPago.class);
			config.addAnnotatedClass(Habitacion.class);
			config.addAnnotatedClass(Hotel.class);
			config.addAnnotatedClass(Impuesto.class);
			config.addAnnotatedClass(Promocion.class);
			config.addAnnotatedClass(PromocionDescuento.class);
			config.addAnnotatedClass(PromocionNochesLibres.class);
			config.addAnnotatedClass(Tarifa.class);
			config.addAnnotatedClass(Reserva.class);
			config.addAnnotatedClass(Disponibilidad.class);
			sessionFactory = config.buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static Session getSession() throws HibernateException {
		return sessionFactory.openSession();
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}