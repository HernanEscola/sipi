package model;

public abstract class Usuario {
	private String password;
	private String nroDocumento;
	private String rol;
	private String nombre ;
	private String apellido ;
	private String mail;
	private String tipoDocumento;
	
	abstract public String getRol();
	}
}
