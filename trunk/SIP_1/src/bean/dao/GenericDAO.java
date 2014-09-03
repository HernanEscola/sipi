package bean.dao;

public class GenericDAO extends HibernateDao<Object> {

	
	protected static GenericDAO instancia = null;

	public static GenericDAO getInstancia() {
		if (instancia == null) {
			instancia = new GenericDAO();
		}
		return (GenericDAO) instancia;
	}
	
	private GenericDAO(){
		super();
	}
	
}
