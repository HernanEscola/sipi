package bean;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "Impuestos")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Impuesto implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue
	private int numeroImpuesto;

	@Column
	private double porcentaje;
	
	@Column(nullable = false, length = 20)
	private String concepto;
	
	public Impuesto (double porcentaje, String concepto) {
		this.porcentaje = porcentaje;
		this.concepto = concepto;
	}

	public int getNumeroImpuesto() {
		return numeroImpuesto;
	}
	public void setNumeroImpuesto(int numeroImpuesto) {
		this.numeroImpuesto = numeroImpuesto;
	}
	public double getPorcentaje() {
		return porcentaje;
	}
	public void setPorcentaje(double porcentaje) {
		this.porcentaje = porcentaje;
	}
	public String getConcepto() {
		return concepto;
	}
	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}
}
