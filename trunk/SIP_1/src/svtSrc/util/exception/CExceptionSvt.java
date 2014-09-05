package conicet.apps.svt.util.exception;

import java.io.PrintStream;

import conicet.framework.error.CConsola;
import conicet.framework.error.CException;

public class CExceptionSvt extends CException{

	private String causeInfo = "";
	
	public CExceptionSvt(int error, Exception ex) {
		super(error, ex);
		/* Esto se hace normalmente cuando se ejecuta el printStackTrace pero de esta forma las causas se ven todas juntas
		y luego mas abajo se encuentran detalladas con sus respectivos stackTrace.
		*/
		generarCauseInfo();
	}
	
	public CExceptionSvt(String causeInfo) {
		super(1,new Exception(causeInfo));
	}
	
	public CExceptionSvt(int error, Exception ex, String causeInfo) {
		super(error, ex);
	}

	
	
	
	private void generarCauseInfo() {
		Exception e =  getException();
		String mensaje = "ERROR : "+ e.getMessage()+".";
		Throwable t = e;
		int n =  0;
		while( t!=null){
			if(t.equals(t.getCause()) || t.getCause() == null ){
				break;
			}else{
				n++;
				t = t.getCause();
				if(t.getLocalizedMessage()!=null){
					mensaje += "\n Causa "+n+" : "+ t.getLocalizedMessage() +". ";
				}
				if(t.getMessage()!=null && t.getMessage().compareToIgnoreCase(t.getLocalizedMessage())!=0){
					mensaje += "\n Mensaje "+n+" : "+ t.getMessage() +". ";
				}
			}
		}
		this.causeInfo = mensaje;
	}

	@Override
	public String toString() {
		CConsola consola = new CConsola();
		PrintStream s = new PrintStream(consola);
		s.println(causeInfo);
		getException().printStackTrace(new PrintStream(consola));
		String ret = consola.toString();
		return ret;
	}
	
	
	public String getCauseInfo() {
		return causeInfo;
	}

	public void setCauseInfo(String causeInfo) {
		this.causeInfo = causeInfo;
	}
	
	
	

}
