package bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "DatosPago")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class DatosPago implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(unique = true, nullable = false)
	private int numeroPago;

	@Column(nullable = false, length = 2)
	private String tc;

	@Column(nullable = false, length = 30)
	private String numeroTC;

	@Column(nullable = false)
	private Date vencimiento;

	@Column(nullable = false, length = 4)
	private String codigoSeguridad;

	@Column(nullable = false, length = 30)
	private String titular;

	@Column(nullable = false, length = 40)
	private String direccion;

	public int getNumeroPago() {
		return numeroPago;
	}

	public void setNumeroPago(int numeroPago) {
		this.numeroPago = numeroPago;
	}

	public String getTc() {
		return tc;
	}

	public void setTc(String tc) {
		this.tc = tc;
	}

	public String getNumeroTC() {
		return numeroTC;
	}

	public void setNumeroTC(String numeroTC) {
		this.numeroTC = numeroTC;
	}

	public Date getVencimiento() {
		return vencimiento;
	}

	public void setVencimiento(Date vencimiento) {
		this.vencimiento = vencimiento;
	}

	public String getCodigoSeguridad() {
		return codigoSeguridad;
	}

	public void setCodigoSeguridad(String codigoSeguridad) {
		this.codigoSeguridad = codigoSeguridad;
	}

	public String getTitular() {
		return titular;
	}

	public void setTitular(String titular) {
		this.titular = titular;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

}
