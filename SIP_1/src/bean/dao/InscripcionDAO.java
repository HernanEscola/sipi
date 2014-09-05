package bean.dao;

import java.util.List;

import model.Alumno;
import model.Inscripcion;
import model.Usuario;

import org.hibernate.Query;
import org.hibernate.Session;

public class InscripcionDAO extends HibernateDao<Inscripcion> {

	
	protected static InscripcionDAO instancia = null;

	public static InscripcionDAO getInstancia() {
		if (instancia == null) {
			instancia = new InscripcionDAO();
		}
		return (InscripcionDAO) instancia;
	}
	
	private InscripcionDAO(){
		super();
	}

	public void registrarAperturaInscripcion(Inscripcion inscripcion,
			List<Alumno> alumnos) {
		beginTransaction();
		
		commitTransaction(session);
	}
	
	
}
