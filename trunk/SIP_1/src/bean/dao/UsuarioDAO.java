package bean.dao;

import model.Usuario;

import org.hibernate.Query;
import org.hibernate.Session;

public class UsuarioDAO extends HibernateDao<Usuario> {

	
	protected static UsuarioDAO instancia = null;

	public static UsuarioDAO getInstancia() {
		if (instancia == null) {
			instancia = new UsuarioDAO();
		}
		return (UsuarioDAO) instancia;
	}
	
	private UsuarioDAO(){
		super();
	}
	
	public Usuario findUsuarioByUserNameAndPass(String user, String pass)throws Exception{
			try {
				Session session = getSession();
				Query query = session.createQuery("FROM " + Usuario.class.getName() + " u where u.nroDocumento = :doc and u.password = :pass");
				query.setParameter("doc", user);
				query.setParameter("pass", pass);
				Usuario list = (Usuario) query.uniqueResult();
				session.close();
				return list;
			} catch (Exception ex) {
				ex.printStackTrace();
				throw ex;
			}
	}
	
}
