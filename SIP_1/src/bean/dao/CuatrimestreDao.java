package bean.dao;

import javax.persistence.NoResultException;

import model.Cuatrimestre;

import org.hibernate.Query;
import org.hibernate.Session;

public class CuatrimestreDao extends HibernateDao<Cuatrimestre>  {

	public static Cuatrimestre findCuatrimestreActual() throws Exception {
		try {
			Session session = getSession();
			Query query = session.createQuery("FROM " + Cuatrimestre.class.getName() + " c where c.activo = 1");
			Cuatrimestre ret = (Cuatrimestre) query.uniqueResult();
			session.close();
			return ret;
		}catch(NoResultException e){
			return null;
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}

}
