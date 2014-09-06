package errors;

public enum ETipoError {
	FechaInvalida("La fecha es Invalida.");
	
	private String desc;
	ETipoError(String desc){
		this.desc = desc;
	}
	public String getDescripcion() {
		return desc;
	}
	
	
}
