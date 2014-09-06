package model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import enumerates.ETurno;

@Entity
public class HoraCatedra extends BaseEntity<Long> {
	private String horarioInicio;
	private String horarioFin;
	@Enumerated(EnumType.ORDINAL)
	private ETurno turno;

	@Id
	@GeneratedValue
	private Long nro;

	public Long getId() {
		return nro;
	}

	public void setId(Long id) {
		this.nro = id;
	}

	public HoraCatedra() {
		// TODO Auto-generated constructor stub
	}

	public String getHorarioInicio() {
		return horarioInicio;
	}

	public void setHorarioInicio(String horarioInicio) {
		this.horarioInicio = horarioInicio;
	}

	public String getHorarioFin() {
		return horarioFin;
	}

	public void setHorarioFin(String horarioFin) {
		this.horarioFin = horarioFin;
	}

	public Long getNro() {
		return nro;
	}

	public void setNro(Long nro) {
		this.nro = nro;
	}

	public ETurno getTurno() {
		return turno;
	}

	public void setTurno(ETurno turno) {
		this.turno = turno;
	}

	
	
}
