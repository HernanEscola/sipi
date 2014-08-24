package bean;

import java.util.List;
import java.util.Vector;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Hoteles")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Hotel {
	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue
	private int numeroHotel;
	
	@Column
	private String descripcion;
	
	@Column
	private int categoria;
	
	@OneToMany
	private List<Habitacion> habitaciones;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Impuesto impuesto;
	
	public Hotel(String desc) {
		this.setDescripcion(desc);
		this.habitaciones = new Vector<Habitacion>();
	}

	public int getNumeroHotel() {
		return numeroHotel;
	}

	public void setNumeroHotel(int numeroHotel) {
		this.numeroHotel = numeroHotel;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public int getCategoria() {
		return categoria;
	}

	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}

	public List<Habitacion> getHabitaciones() {
		return habitaciones;
	}

	public void setHabitaciones(List<Habitacion> habitaciones) {
		this.habitaciones = habitaciones;
	}

	public Impuesto getImpuesto() {
		return impuesto;
	}

	public void setImpuesto(Impuesto impuesto) {
		this.impuesto = impuesto;
	}

	public Habitacion buscarHabitacion(int numHabitacion) {
		for (Habitacion h : this.habitaciones)
			if (h.getNumeroHabitacion() == numHabitacion)
				return h;

		return null;
	}

	public void modificarEstadoHabitacion(Habitacion habitacion) {
		for (Habitacion h : this.habitaciones)
			if (h.equals(habitacion))
				h.setActiva(true);
	}
}
