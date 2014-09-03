package model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import enumerates.EEstado;

//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : AlumnoPlan.java
//  @ Date : 28/08/2014
//  @ Author : 
//
//

@Entity
public class AlumnoPlan {
	@ManyToOne
	private Plan plan;
	@ManyToOne
	private Alumno alumno;
	@Enumerated
	private EEstado estado;
	private Date fechaAlta;
	private Date fechaFin;

	@Id
	@GeneratedValue
	private Long id;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	
	public AlumnoPlan() {
		// TODO Auto-generated constructor stub
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public Alumno getAlumno() {
		return alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	public EEstado getEstado() {
		return estado;
	}

	public void setEstado(EEstado estado) {
		this.estado = estado;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

}
