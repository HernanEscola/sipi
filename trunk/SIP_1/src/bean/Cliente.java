package bean;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "Clientes")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Cliente implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue
	private int numeroCliente;

	@Column(nullable = false, length = 40)
	private String nombre;

	@Column(nullable = false, length = 30)
	private String apellido;

	@Column(nullable = false, length = 30)
	private String documento;

	@Column(nullable = false, length = 30)
	private String telefono;

	@Column(nullable = false, length = 40)
	private String email;

	public int getNumeroCliente() {
		return numeroCliente;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
