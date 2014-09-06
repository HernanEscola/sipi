package model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;

import enumerates.EDia;

@Entity
public class ItemHorarioCursada extends BaseEntity<Long> {
	@Enumerated
	private EDia dia;
	@ManyToMany
	private Set<HoraCatedra> horasCatedra;
	@Id
	@GeneratedValue
	private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ItemHorarioCursada() {
		// TODO Auto-generated constructor stub
	}

	public EDia getDia() {
		return dia;
	}

	public void setDia(EDia dia) {
		this.dia = dia;
	}

	public Set<HoraCatedra> getHorasCatedra() {
		return horasCatedra;
	}

	public void setHorasCatedra(Set<HoraCatedra> horasCatedra) {
		this.horasCatedra = horasCatedra;
	}

	@Transient
	public HoraCatedra getHoraCatedraInicio() {
		HoraCatedra ret = null;

		for (HoraCatedra h : this.horasCatedra) {
			if (ret == null || h.getNro() < ret.getNro()) {
				ret = h;
			}
		}

		return ret;
	}

	@Transient
	public HoraCatedra getHoraCatedraFin() {
		HoraCatedra ret = null;

		for (HoraCatedra h : this.horasCatedra) {
			if (ret == null || h.getNro() > ret.getNro()) {
				ret = h;
			}
		}

		return ret;
	}
	
	@Transient
	public int getCantidadHorasCatedra() {
		return this.horasCatedra.size();
	}


}
