package conicet.apps.svt.web.util.decorator;


import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

public abstract class CAgregableDisplayWrapper extends TableDecorator implements DecoratesHssf {
	
	private String tipo;
	private ETipoSubmit tipoSubmit = ETipoSubmit.method;
	
	public enum ETipoSubmit {
		btnSubmit("btnSubmit"), method("method");
		
		private final String tipo;
		ETipoSubmit(String tipo) {
			this.tipo = tipo;
		}
		
		String getTipo() {
			return this.tipo;
		}
	}
	
	public CAgregableDisplayWrapper(String tipo, ETipoSubmit tipoSubmit) {
		this.tipo = tipo;
		this.tipoSubmit = tipoSubmit;
	}
	
	public CAgregableDisplayWrapper(String tipo) {
		this(tipo, ETipoSubmit.method);
	}

//	public String getIndice() {
//		int i = this.getListIndex() + 1;
//		//String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndex(" + this.getListIndex() + ") value=\"" + i + "\">";
//		return ""+i;
//	}
	
	public String getIndice() {
		return Integer.toString(this.getListIndex() + 1);
	}

	
	public String getRemove() {
		int indexPantalla = getListIndex();
		return "<a href='#' onclick=\"removeFromDisplayWrapper('" + tipo + "'," + indexPantalla + ", '" + tipoSubmit.getTipo() + "')\"><img src='./imagenes/close.png' align='top'/></a>";
	}
}
