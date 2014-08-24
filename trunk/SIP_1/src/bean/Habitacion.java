package bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.persistence.*;

import common.CommonUtils;

@Entity
@Table(name = "Habitaciones")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Habitacion implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue
	private int numeroHabitacion;

	@Column(nullable = false, length = 50)
	private String descripcion;

	@Column(nullable = false, length = 60)
	private String regimen;

	@Column(nullable = false)
	private int capacidad;

	@Column(nullable = false)
	private boolean activa;

	@OneToMany(cascade = CascadeType.ALL)
	private List<Disponibilidad> disponibilidades;

	@OneToOne(cascade = CascadeType.ALL)
	private Tarifa tarifa;

	public Habitacion(Date fecha, float amount, String currency,
			String descripcion, String regimen, int capacidad, boolean activa,
			int stock) throws Exception {
		Tarifa tarifa = new Tarifa(fecha, amount, currency);
		this.tarifa = tarifa;
		this.descripcion = descripcion;
		this.regimen = regimen;
		this.capacidad = capacidad;
		this.activa = activa;
		this.disponibilidades = new Vector<Disponibilidad>();
		inicializarDisponibilidad(stock);
	}

	public int getNumeroHabitacion() {
		return numeroHabitacion;
	}

	public void setNumeroHabitacion(int numeroHabitacion) {
		this.numeroHabitacion = numeroHabitacion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getRegimen() {
		return regimen;
	}

	public void setRegimen(String regimen) {
		this.regimen = regimen;
	}

	public int getCapacidad() {
		return capacidad;
	}

	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}

	public boolean isActiva() {
		return activa;
	}

	public void setActiva(boolean activa) {
		this.activa = activa;
	}

	public Tarifa getTarifa() {
		return tarifa;
	}

	public void setTarifa(Tarifa tarifa) {
		this.tarifa = tarifa;
	}

	public boolean getDisponibilidades(Date fechaDesde, Date fechaHasta) {
		if (this.activa == true) {
			for (Disponibilidad d : disponibilidades) {
				if ((d.getFecha().after(fechaDesde))
						&& (d.getFecha().before(fechaHasta))) {
					if (d.getStock() <= 0)
						return false;
				}
			}
			return true;
		}
		return false;
	}

	public List<Disponibilidad> getDisponibilidadesAll() {
		return this.disponibilidades;
	}

	public void setDisponibilidadMenos(Date fechaDesde, Date fechaHasta)
			throws Exception {
		if (this.activa == true) {
			for (Disponibilidad d : disponibilidades) {
				if ((d.getFecha().after(fechaDesde))
						&& (d.getFecha().before(fechaHasta))) {
					if (d.getStock() > 0)
						d.setStock(d.getStock() - 1);
					else
						throw new Exception(
								"Hay conflictos con la Disponibilidad. La habitación no estaba disponible para todos los días solicitados");
				}
			}
		}
	}

	public void setDisponibilidadMas(Date fechaDesde, Date fechaHasta)
			throws Exception {
		if (this.activa == true) {
			for (Disponibilidad d : disponibilidades) {
				if ((d.getFecha().after(fechaDesde))
						&& (d.getFecha().before(fechaHasta)))
					d.setStock(d.getStock() + 1);
			}
		}
		else
			throw new Exception("La habitación de la reserva no se encuentra Activa");
	}

	@SuppressWarnings("deprecation")
	public void inicializarDisponibilidad(int stock) throws Exception {
		Date fechaDesde = new Date(2011 - 1900, 11, 1);
		int dias = 600;

		for (int i = 0; i < dias; i++) {
			Disponibilidad d = new Disponibilidad(CommonUtils.addDays(fechaDesde, i), stock);
			disponibilidades.add(d);
		}
	}

	

}
