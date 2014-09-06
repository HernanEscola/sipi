package errors;

public class ErrorException extends Exception {

	public ErrorException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ErrorException(String arg0, Throwable arg1) {
		super(arg0, arg1);
		// TODO Auto-generated constructor stub
	}

	public ErrorException(String arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}
	
	public ErrorException(ETipoError error) {
		super(error.getDescripcion());
		// TODO Auto-generated constructor stub
	}

	public ErrorException(Throwable arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}

	
}
