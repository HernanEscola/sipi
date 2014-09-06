package bean.dao;

import java.util.List;

import model.Alumno;
import model.AlumnoCurso;
import model.Curso;
import model.Inscripcion;
import enumerates.EEstadoCursada;
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
	
	
}
