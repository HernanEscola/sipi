package model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : Grilla.java
//  @ Date : 28/08/2014
//  @ Author : 
//
//

@Entity
public class Grilla {
	public String a�o;
	public String cuatrimestre;
	@OneToMany
	public List<ItemGrilla> grilla;

	public Grilla() {
		// TODO Auto-generated constructor stub
	}

	public String getA�o() {
		return a�o;
	}

	public void setA�o(String a�o) {
		this.a�o = a�o;
	}

	public String getCuatrimestre() {
		return cuatrimestre;
	}

	public void setCuatrimestre(String cuatrimestre) {
		this.cuatrimestre = cuatrimestre;
	}

	public List<ItemGrilla> getGrilla() {
		return grilla;
	}

	public void setGrilla(List<ItemGrilla> grilla) {
		this.grilla = grilla;
	}

}
