package conicet.apps.svt.web.marca.decorator;

import org.displaytag.decorator.TableDecorator;

import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.web.marca.form.CMarcaBuscarActionForm;

public class CMarcaDisplayWrapper extends TableDecorator {
	
	public String getIndice() {
		int i = this.getListIndex() + 1;
		CMarcaBuscarActionForm form = (CMarcaBuscarActionForm) this.getPageContext().getSession().getAttribute("cMarcaBuscarActionForm");
		Integer index = form.getResultados().indexOf(this.getCurrentRowObject());
		String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndex(" + index + ") value=\"" + i + "\">";
		return retorno;		
	}
	
	public String getNombre() {
		CMarcaEquipo marcaEquipo = (CMarcaEquipo) this.getCurrentRowObject();
		return marcaEquipo.getNombre();
	}

}
