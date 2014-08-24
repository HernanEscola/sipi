package bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "Tarifas")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Tarifa implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue
	private int codigoTarifa;

	@Column
	private Date fecha;
	
	@Column(nullable = false)
	private float amount;
	
	@Column(nullable = false, length = 3)
	private String currency;
	
	public Tarifa (Date fecha, float amount, String currency) {
		this.fecha = fecha;
		this.amount = amount;
		this.currency = currency;
	}

	public int getCodigoTarifa() {
		return codigoTarifa;
	}
	public void setCodigoTarifa(int codigoTarifa) {
		this.codigoTarifa = codigoTarifa;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
}
