package bean.dao;

import hbt.HibernateUtil;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.RollbackException;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public abstract class HibernateDao<T> {

	protected static SessionFactory sf = null;
	protected Class<T> persistentClass;
	
	
	@SuppressWarnings("unchecked")
	public HibernateDao() {
		sf = HibernateUtil.getSessionFactory();
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	protected  static Session getSession() throws Exception{
		return HibernateUtil.getSessionFactory().getCurrentSession();
	}

	protected Class<T> getPersistentClass() {
		return persistentClass;
	}


	protected Session beginTransaction(){
		Session session = sf.openSession();
		session.beginTransaction();
		return session;
	}
	
	protected void commitTransaction(Session session){
		session.getTransaction().commit();
		session.close();
	}
	
	protected void commitTransaction() throws Exception{
		getSession().getTransaction().commit();
		getSession().close();
	}
	
	protected void rollbackTransaction(Exception e){
		try{
			e.printStackTrace();
			throw e;
		}catch(RollbackException e2){
			
		}catch (Exception e2) {
			Session session = sf.getCurrentSession();
			session.getTransaction().rollback();
		}
		
		
	}
	
	public void registrar(T o) throws Exception {
		try {
			Session session = sf.openSession();
			session.beginTransaction();
			session.persist(o);
			session.flush();
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void update(T o) throws Exception {
		try {
			Session session = sf.openSession();
			session.beginTransaction();
			//session.clear();
			session.merge(o);
			session.flush();
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void delete(T o) throws Exception {
		try {
			Session session = sf.openSession();
			session.beginTransaction();
			session.delete(o);
			session.flush();
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public List<T> findAll() throws Exception {
		try {
			Session session = getSession();
			String clase = getPersistentClass().getName();
			Query query = getSession().createQuery("FROM " + clase);
			List<T> list = query.list();
			
			session.close();
			return list;
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}
	
	public T findById(Serializable id) throws Exception {
		try{
			Session session = getSession();
			T ret = (T) getSession().get(getPersistentClass(), id);
			session.close();
			return ret;
		}catch (NoResultException e) {
				return null;
			}
	}
	
	public static Object findById(Class c, Serializable id) throws Exception {
		try{
			Session session = getSession();
			Object ret = (Object) getSession().get(c, id);
			session.close();
			return ret;
		}catch (NoResultException e) {
				return null;
			}
	}
	
	public static List findAll(Class c) throws Exception {
		try {
			Session session = getSession();
			String clase = c.getName();
			Query query = getSession().createQuery("FROM " + clase);
			List list = query.list();
			session.close();
			return list;
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}
	

}
