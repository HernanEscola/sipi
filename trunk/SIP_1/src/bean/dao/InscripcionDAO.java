package bean.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Query;
import org.hibernate.Session;

import model.Alumno;
import model.AlumnoCurso;
import model.Curso;
import model.Inscripcion;
import model.Usuario;
import enumerates.EEstadoCursada;
import enumerates.EEstadoInscripcion;
import errors.ErrorException;

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
			List<Alumno> alumnos) throws Exception {
		beginTransaction();
		//registra la inscripcion
		registrar(inscripcion);
		for(Alumno a: alumnos){
			//actualiza las prioridades de los alumnos
			UsuarioDAO.getInstancia().update(a);
		}
		commitTransaction();
	}

	public  void inscribirAlumnoACursos(Alumno alumno, List<Curso> cursos) throws Exception {
		beginTransaction();
		for(Curso c: cursos){
			c = findById(Curso.class, c.getId());
			
			AlumnoCurso ac = new AlumnoCurso();
			ac.setCurso(c);
			ac.setEstado(EEstadoCursada.Inscripto);
			alumno.getAlumnoCursos().add(ac);
			c.getAlumnos().add(ac);
			c.setCapacidad(c.getCapacidad()-1);
			if(c.getCapacidad() <0){
				throw new ErrorException("Uno de los cursos no posee vacantes");
			}
			GenericDAO.getInstancia().update(c);
		}
		
		UsuarioDAO.getInstancia().update(alumno);
		
		commitTransaction();
	}
	
	
	public Inscripcion findInscripcionActual()throws Exception{
		try {
			Session session = getSession();
			Query query = session.createQuery("FROM " + Inscripcion.class.getName() + " i  where i.estado :estado ");
			query.setParameter("estado", EEstadoInscripcion.Finalizada);
			Inscripcion list = (Inscripcion) query.uniqueResult();
			session.close();
			return list;
		}catch(NoResultException e){
			return null;
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
}
	
	
}
