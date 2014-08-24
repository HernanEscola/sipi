package bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name = "Disponibilidades")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Disponibilidad {
	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue
	private int numeroDisponiblidad;

	@Column(nullable = false)
	private Date fecha;

	@Column(nullable = false)
	private int stock;
	
	public Disponibilidad(int stock)
	{
		this.fecha = new Date();
		this.stock = stock;
	}
	public Disponibilidad(Date fecha, int stock)
	{
		this.fecha = fecha;
		this.stock = stock;
	}

	public int getNumeroDisponibilidad() {
		return this.numeroDisponiblidad;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
}
