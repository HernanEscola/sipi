package model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : Carrera.java
//  @ Date : 28/08/2014
//  @ Author : 
//
//

@Entity
public class Carrera {
	public String nombre;
	@OneToMany
	public List<Plan> curricula;

	public Carrera() {
		// TODO Auto-generated constructor stub
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Plan> getCurricula() {
		return curricula;
	}

	public void setCurricula(List<Plan> curricula) {
		this.curricula = curricula;
	}

}