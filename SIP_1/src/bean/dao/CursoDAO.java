package bean.dao;

import java.util.List;

import model.Cuatrimestre;
import model.Curso;
import model.Usuario;

import org.hibernate.Query;
import org.hibernate.Session;

public class CursoDAO extends HibernateDao<Curso> {

	
	protected static CursoDAO instancia = null;

	public static CursoDAO getInstancia() {
		if (instancia == null) {
			instancia = new CursoDAO();
		}
		return (CursoDAO) instancia;
	}
	
	private CursoDAO(){
		super();
	}
	
	public List<Curso> findCursosByCuatrimestre(Cuatrimestre cuatri)throws Exception{
			try {
				Session session = getSession();
				Query query = session.createQuery("FROM " + Curso.class.getName() + " c where c.cuatrimestre = :cuatri");
				query.setParameter("cuatri", cuatri);
				List<Curso> list = (List<Curso> ) query.list();
				session.close();
				return list;
			} catch (Exception ex) {
				ex.printStackTrace();
				throw ex;
			}
	}
	
}
