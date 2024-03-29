package model;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import enumerates.EEstadoCursada;

//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : AlumnoCurso.java
//  @ Date : 28/08/2014
//  @ Author : 
//
//

@Entity
public class AlumnoCurso extends BaseEntity<Long> {

	@Enumerated
	private EEstadoCursada estado;
	@ManyToOne
	private Curso curso;
	@ManyToOne
	private Nota nota;

	@Id
	@GeneratedValue
	private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Nota getNota() {
		return nota;
	}

	public void setNota(Nota nota) {
		this.nota = nota;
	}

	public AlumnoCurso() {
		// TODO Auto-generated constructor stub
	}

	public EEstadoCursada getEstado() {
		return estado;
	}

	public void setEstado(EEstadoCursada estado) {
		this.estado = estado;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	@Override
	protected boolean dataEquals(Object other) {
		// TODO Auto-generated method stub
		return false;
	}

}
