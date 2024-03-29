package model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : Curso.java
//  @ Date : 28/08/2014
//  @ Author : 
//
//
@Entity
public class Curso extends BaseEntity<String> {
	@ManyToOne
	private Profesor profesor;
	private String aula;
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn
	private Set<AlumnoCurso> alumnos;
	@ManyToOne
	private Cuatrimestre cuatrimestre;
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn
	private Set<ItemListaDeEspera> listaDeEspera;
	private int Capacidad;
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn
	private Set<ItemHorarioCursada> horarioCursada;
	@ManyToOne
	private Materia materia;

	@Id
	@GeneratedValue
	private String codigo;

	public String getId() {
		return codigo;
	}

	public void setId(String id) {
		this.codigo = id;
	}

	public Curso() {
		// TODO Auto-generated constructor stub
	}

	public Profesor getProfesor() {
		return profesor;
	}

	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}

	public String getAula() {
		return aula;
	}

	public void setAula(String aula) {
		this.aula = aula;
	}

	public Set<AlumnoCurso> getAlumnos() {
		return alumnos;
	}

	public void setAlumnos(Set<AlumnoCurso> alumnos) {
		this.alumnos = alumnos;
	}

	public Cuatrimestre getCuatrimestre() {
		return cuatrimestre;
	}

	public void setCuatrimestre(Cuatrimestre cuatrimestre) {
		this.cuatrimestre = cuatrimestre;
	}

	public Set<ItemListaDeEspera> getListaDeEspera() {
		return listaDeEspera;
	}

	public void setListaDeEspera(Set<ItemListaDeEspera> listaDeEspera) {
		this.listaDeEspera = listaDeEspera;
	}

	public int getCapacidad() {
		return Capacidad;
	}

	public void setCapacidad(int capacidad) {
		Capacidad = capacidad;
	}

	public Set<ItemHorarioCursada> getHorarioCursada() {
		return horarioCursada;
	}

	public void setHorarioCursada(Set<ItemHorarioCursada> horarioCursada) {
		this.horarioCursada = horarioCursada;
	}

	public Materia getMateria() {
		return materia;
	}

	public void setMateria(Materia materia) {
		this.materia = materia;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

}
