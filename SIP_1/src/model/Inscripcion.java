package model;

import java.sql.Date;
//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : Inscripcion.java
//  @ Date : 28/08/2014
//  @ Author : 
//
//


import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class Inscripcion {
	private Date fechaInicio;
	private int duracionDiasPrioridad;
	@ManyToOne
	private Cuatrimestre cuatrimestre;
	private EEstadoInscripcion estado;

	public Inscripcion() {
		// TODO Auto-generated constructor stub
	}
	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public int getDuracionDiasPrioridad() {
		return duracionDiasPrioridad;
	}

	public void setDuracionDiasPrioridad(int duracionDiasPrioridad) {
		this.duracionDiasPrioridad = duracionDiasPrioridad;
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

	public EPrioridad darPrioridad(Alumno alumno) {
		return null;

	}

	public EEstado getEstado() {
		return null;

	}

	public Date getFechaInicioByPrioridad(EPrioridad p) {
		return fechaInicio;

	}
}