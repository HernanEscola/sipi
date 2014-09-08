package model;

import java.sql.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import enumerates.EEstadoInscripcion;

@Entity
public class Inscripcion extends BaseEntity<Long> {
	private Date fechaInicio;
	private Date fechaCierre;
	@ManyToOne
	private Cuatrimestre cuatrimestre;
	@Enumerated
	private EEstadoInscripcion estado;
	@OneToMany(fetch=FetchType.EAGER) @JoinColumn
	private Set<Curso> cursos;
	@ManyToOne
	private Reporte reporte;

	@Id
	@GeneratedValue
	private Long id;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	
	public Inscripcion() {
		// TODO Auto-generated constructor stub
	}
	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Cuatrimestre getCuatrimestre() {
		return cuatrimestre;
	}

	public void setCuatrimestre(Cuatrimestre cuatrimestre) {
		this.cuatrimestre = cuatrimestre;
	}

	public void setEstado(EEstadoInscripcion estado) {
		this.estado = estado;
	}

	public EEstadoInscripcion getEstado() {
		return estado;
	}

	public Set<Curso> getCursos() {
		return cursos;
	}

	public void setCursos(Set<Curso> cursos) {
		this.cursos = cursos;
	}

	public Date getFechaCierre() {
		return fechaCierre;
	}

	public void setFechaCierre(Date fechaCierre) {
		this.fechaCierre = fechaCierre;
	}

	public Reporte getReporte() {
		return reporte;
	}

	public void setReporte(Reporte reporte) {
		this.reporte = reporte;
	}
	
	
	
	
}
