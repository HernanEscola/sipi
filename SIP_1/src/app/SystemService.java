package app;

import hbt.HibernateUtil;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import model.Alumno;
import model.AlumnoCurso;
import model.AlumnoPlan;
import model.Curso;
import model.Inscripcion;
import model.Materia;
import model.Usuario;
import util.FechaUtil;
import bean.dao.CursoDAO;
import bean.dao.GenericDAO;
import bean.dao.InscripcionDAO;
import bean.dao.UsuarioDAO;
import enumerates.EEstadoInscripcion;
import enumerates.EEstadoCursada;
import errors.ETipoError;
import errors.ErrorException;

public class SystemService implements Serializable {

	private static final long serialVersionUID = 1L;

	private static final SystemService sistemaGDS = new SystemService();


	final static int CANTIDAD_PRIORIDADES = 5;
	final static int cantidadDiasLuegoDeLaUltimaPrioridad = 8;
	final static int DURACION_PRIORIDAD_DEFAULT = 3;
	
	private UsuarioDAO usuarioDao;
	private CursoDAO cursoDao;
	private InscripcionDAO inscripcionDao;
	
	public static void main(String[] args) {
		HibernateUtil.getSession();
		
		PersistenciaFake.EjecutarFakes();
		System.out.println("joya");
	}
	
	public boolean hayInscripcionesAbiertas(){
		//verifica si existe una inscripcion abierta
		return true;
	}
	
	public Inscripcion darInscripcionActual(){
		
		return null;
	}
	
	public Usuario login(String nroDoc, String pass) throws Exception{
		return findUsuarioByUserNameAndPassword(nroDoc, pass);
	}
	
	public Usuario findUsuarioByUserNameAndPassword(String nroDoc, String pass) throws Exception{
		return usuarioDao.findUsuarioByUserNameAndPass(nroDoc, pass);
	}
	
	public void abrirInscripciones(Date fechaInicio, Date fechaCierre)throws Exception{
		List<Alumno> alumnos = GenericDAO.findAll(Alumno.class);
		
		//calculo Las prioridades de los alumnos
		for(Alumno a : alumnos){
			a.setPrioridad(caclularPrioridadDeAlumno(a));
		}
		
		Inscripcion inscripcion = new Inscripcion();
		//
		inscripcion.setCuatrimestre(CuatrimestreDao.findCuatrimestreActual());
		/*if(fechaCierre == null){
			
		}*/
		inscripcion.setFechaCierre(fechaCierre);
		inscripcion.setEstado(EEstadoInscripcion.Abierta);
		inscripcion.setFechaInicio(fechaInicio);
		
		/*// abro los cursos
		Grilla grilla = null;
		*/
		List<Curso> cursos = cursoDao.findCursosByCuatrimestre(inscripcion.getCuatrimestre());
		inscripcion.setCursos(new HashSet(cursos));
		//Informo a los alumnos
			
		inscripcionDao.registrarAperturaInscripcion(inscripcion, alumnos);
	}
	
	public boolean validarFechasInscripcion(String fechaInicio, String fechaCierre) throws ErrorException{
			Date inicio = FechaUtil.getSqlDateFromString(fechaInicio);
			if(inicio == null){
				throw new ErrorException(ETipoError.FechaInvalida);
			}
			
			if(fechaCierre!=null){
				Date cierre = FechaUtil.getSqlDateFromString(fechaCierre);
				if(cierre==null){
					throw new ErrorException(ETipoError.FechaInvalida);
				}
				
				if(FechaUtil.diferenciaDeDias(inicio, cierre) % CANTIDAD_PRIORIDADES != 0){
					throw new ErrorException("La duracion de la inscripcion debe ser multiplo de " + CANTIDAD_PRIORIDADES);
				}
			}
			
			return true;
	}
	
	public List<Curso> darOfertaDeCursosParaAlumno(Alumno alumno){
		Inscripcion inscripcion = darInscripcionActual();
		List<Curso> cursos = new LinkedList<Curso>();
		Set<Materia> materiasCursables = new HashSet<Materia>();
		// genero un mapa con todas las materias que puede cursar el alumno
		for(AlumnoPlan alumnoPlan : alumno.getAlumnoPlanes()){
			for(Materia materia : alumnoPlan.getPlan().getMaterias()){
				materiasCursables.add(materia);
			}
		}
		//le saco las materias que ya se encuentras aprobadas tanto Cursada como Final
		materiasCursables.removeAll(alumno.getMateriasAprobadas());
		materiasCursables.removeAll(alumno.getMateriasCursando());
		for(Curso curso: inscripcion.getCursos()){
			if(curso.getCapacidad() > curso.getAlumnos().size() && materiasCursables.contains(curso.getMateria())){
				cursos.add(curso);
			}
		}
		
		return cursos;
		
	}
	
	public String generarAdvertenciasPreInscripcion(Alumno a, Curso c){
		
		boolean adeudaCorrelativas = false;
		String mensaje = "Adeuda correlativas de la materia " +c.getMateria().getNombre()+ ": ";
			Set<Materia> materiasAprobadas = a.getMateriasAprobadas();
				
		for(Materia m:c.getMateria().getCorrelativas()){
			if(!materiasAprobadas.contains(m)){
				adeudaCorrelativas = true;
				mensaje+= m.getNombre()+ ", ";
			}
		}
		mensaje = mensaje.substring(0, mensaje.length()-2) + ".";
			
		return mensaje;
	}
	
	public boolean validarInscripcionACursos(Alumno alumno, List<Curso> cursos){
		return false;
		// nose pisen horarios y dias, y no haya cursos de la misma materia
	}
	
	public Object inscribirAlumnoACursos(Alumno alumno, List<Curso> cursos) throws Exception{
		
		inscripcionDao.inscribirAlumnoACursos(alumno,  cursos);

		

		
		return null;
	}
	
	public String darFechaCierreByFechaInicio(String fechaInicio) throws ErrorException{
		return darFechaCierreByFechaInicioYDuracionPrioridad(fechaInicio, DURACION_PRIORIDAD_DEFAULT);
	}
	
	public String darFechaCierreByFechaInicioYDuracionPrioridad(String fechaInicio, Integer duracionPrioridad) throws ErrorException{
		Date inicio = FechaUtil.getSqlDateFromString(fechaInicio);
		if(inicio == null){
			throw new ErrorException(ETipoError.FechaInvalida);
		}
		
		return FechaUtil.getStringFromDate(FechaUtil.agregarDias(inicio, (CANTIDAD_PRIORIDADES*duracionPrioridad)+cantidadDiasLuegoDeLaUltimaPrioridad));
	}
	
	public int darPrioridadInscripcion(Inscripcion i){
		int duracion = FechaUtil.diferenciaDeDias(i.getFechaInicio(), i.getFechaCierre());
		int duracionPrioridad = duracion/CANTIDAD_PRIORIDADES;
		Date hoy = FechaUtil.getHoy();
		int diaActualDeInscripcion= FechaUtil.diferenciaDeDias(i.getFechaInicio(), hoy);
		
		int prioridad = (diaActualDeInscripcion/duracionPrioridad)+1;
		return prioridad;
	}
	
	

	private Integer caclularPrioridadDeAlumno(Alumno a){
			Float porcentajeMax = 0F;

			for (AlumnoPlan ap : a.getAlumnoPlanes()) {
				Float porcentaje;
				int cantidadAprobada = 0;
				for (AlumnoCurso ac : a.getAlumnoCursos()) {
					if (ac.getEstado().equals(EEstadoCursada.FinalAprobado)
							&& ap.getPlan().getMaterias()
									.contains(ac.getCurso().getMateria())) {
						cantidadAprobada++;
					}
				}
				porcentaje = (ap.getPlan().getMaterias().size() / cantidadAprobada) * 100F;
				if (porcentaje > porcentajeMax) {
					porcentajeMax = porcentaje;
				}
			}

			if(porcentajeMax >= 80){
				return 1;
			}else if(porcentajeMax < 80 && porcentajeMax >= 60){
				return 2;
			}else if(porcentajeMax < 60 && porcentajeMax >= 40){
				return 3;
			}else if(porcentajeMax < 40 && porcentajeMax >= 20){
				return 4;
			}else{
				return 5;
			}
		}
		
	
	protected SystemService() {

		try {
			//PersistenciaFake.EjecutarFakes();

			// ---- SOLO PRUEBAS DE METODOS!!!! ----
			// altaPromocionNochesLibres(1, 2, 10);
			// altaPromocionDescuento(1, ((float) (0.1)));
			//
			// List<HabitacionDTO> resp =
			// habitacionesDisponibleHotelConCantPersonas(1, new Date(2012 -
			// 1900,
			// 0, 1), new Date(2012 - 1900, 0, 16), 3);
			//
			// ReservaDTO r = generarReserva(1, "35275265", new Date(2012 -
			// 1900,
			// 0, 1), new Date(2012 - 1900, 0, 16), ((float) (0.25)),
			// "ARS", (buscarHabitacion(1).getTarifa().getAmount() * 15),
			// new DatosPagoDTO());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SystemService getInstance() {
		return sistemaGDS;
	}

}
