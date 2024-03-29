package model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
public class Carrera extends BaseEntity<Long> {
	private String nombre;
	@OneToMany(fetch=FetchType.EAGER) @JoinColumn
	private Set<Plan> curricula;
	@Id
	@GeneratedValue
	private Long id;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	
	public Carrera() {
		// TODO Auto-generated constructor stub
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Set<Plan> getCurricula() {
		return curricula;
	}

	public void setCurricula(Set<Plan> curricula) {
		this.curricula = curricula;
	}

}
