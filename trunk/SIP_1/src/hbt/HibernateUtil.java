package hbt;

import javax.persistence.EntityTransaction;
import javax.persistence.RollbackException;

import model.Alumno;
import model.AlumnoCurso;
import model.AlumnoPlan;
import model.Carrera;
import model.Cuatrimestre;
import model.Curso;
import model.DatosAlumno;
import model.Inscripcion;
import model.ItemHorarioCursada;
import model.ItemListaDeEspera;
import model.Materia;
import model.Nota;
import model.Plan;
import model.Profesor;
import model.Regente;
import model.Reporte;
import model.Usuario;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {
	private static final SessionFactory sessionFactory;
	static {
		try {
			AnnotationConfiguration config = new AnnotationConfiguration();
			config.addAnnotatedClass(Alumno.class);
			config.addAnnotatedClass(AlumnoCurso.class);
			config.addAnnotatedClass(AlumnoPlan.class);
			config.addAnnotatedClass(Carrera.class);
			config.addAnnotatedClass(Cuatrimestre.class);
			config.addAnnotatedClass(Curso.class);
			config.addAnnotatedClass(DatosAlumno.class);
			config.addAnnotatedClass(Inscripcion.class);
			config.addAnnotatedClass(ItemHorarioCursada.class);
			config.addAnnotatedClass(ItemListaDeEspera.class);
			config.addAnnotatedClass(Materia.class);
			config.addAnnotatedClass(Nota.class);
			config.addAnnotatedClass(Plan.class);
			config.addAnnotatedClass(Profesor.class);
			config.addAnnotatedClass(Regente.class);
			config.addAnnotatedClass(Reporte.class);
			config.addAnnotatedClass(Usuario.class);
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
	

	/**
	 * 
	 * @return CTransaction
	 * @throws Exception
	 */
	public static Transaction beginTransaction() throws Exception {
		Transaction entityTransaction = getSessionFactory().getCurrentSession()
				.beginTransaction();
		return entityTransaction;
	}

	/**
	 * Hace efectiva la transaccio
	 * 
	 * @param tx
	 * @throws Exception
	 * @throws CVersionException
	 */
	public static void commitTransaction(EntityTransaction tx) throws Exception {
		try {
			if (tx != null && tx.isActive()) {
				tx.commit();
			} else {
				throw new Exception("Transaccion inexistente");
			}
		} catch (RollbackException ex) {
			// si tira ESTE TIPO DE EXCEPCION, se ejecuta automaticamente el
			// ROLLBACK por lo q no ha neceisdad de llamarlo, sino ocurrir
			// excepcion de "transaccion inexistente" que no refleja el error
			// real.
			ex.printStackTrace();
			throw ex;
		} catch (Exception ex) {
			ex.printStackTrace();
			rollbackTransaction(tx);
			throw ex;
		}
		return;
	}

	/**
	 * Si hubo algun error, se cancela la transaccion, logrando que la misma no
	 * impacte sobre la base de datos
	 * 
	 * @param tx
	 * @throws Exception
	 */
	public static void rollbackTransaction(EntityTransaction tx)
			throws Exception {
		if (tx != null && tx.isActive()) {
			tx.rollback();
		} else {
			throw new Exception("Transaccion inexistente");
		}
		return;
	}

	public static void detach(Object o) throws Exception {
		getSessionFactory().getCurrentSession().evict(o);
	}

	public static void clear() throws Exception {
		getSessionFactory().getCurrentSession().clear();
	}

	public static void flush() throws Exception {
		getSessionFactory().getCurrentSession().flush();
	}

	public static void refresh(Object o) throws Exception {
		getSessionFactory().getCurrentSession().refresh(o);
	}
}