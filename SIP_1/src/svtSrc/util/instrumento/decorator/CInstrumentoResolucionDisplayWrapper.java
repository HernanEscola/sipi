package conicet.apps.svt.web.instrumento.decorator;


import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

import conicet.apps.svt.object.instrumentoResolucion.CInstrumentoResolucion;
import conicet.apps.svt.object.instrumentoResolucion.ETipoActividadPDT;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;

public class CInstrumentoResolucionDisplayWrapper extends TableDecorator implements DecoratesHssf {
	public CInstrumentoResolucionDisplayWrapper() {
	}

	public String getIndice() {
		int i = this.getListIndex() + 1;
		//String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndex(" + this.getListIndex() + ") value=\"" + i + "\">";
		return ""+i;
	}


	public String getAño() {
		CInstrumentoResolucion c = (CInstrumentoResolucion) this.getCurrentRowObject();
		return c.getAño().toString();
	}

	public String getPdt() {
		CInstrumentoResolucion c = (CInstrumentoResolucion) this.getCurrentRowObject();
		if (c.getPdt()==null){
			return ETipoActividadPDT.A.getDescripcion();
		}
		return c.getPdt().getDescripcion();
	}

	public String getRemove() {
		CInstrumentoResolucion c = (CInstrumentoResolucion) this.getCurrentRowObject();
		CInstrumentoForm form = (CInstrumentoForm) this.getPageContext().getSession().getAttribute(getFormAttributeName());
		Integer index = form.getResoluciones().indexOf(c);
		return "<a href='#' onclick='quitar(\"Resolucion\","+ index + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}

	public String getNumero() {
		CInstrumentoResolucion c = (CInstrumentoResolucion) this.getCurrentRowObject();
		return c.getNumeroYTipo();
	}

	public String getNumeroConDisposicion() {
		CInstrumentoResolucion c = (CInstrumentoResolucion) this.getCurrentRowObject();
		return c.getNumeroYTipo();
	}


	@Override
	public String finishRow() {
		return "";
	}

	@Override
	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}

	public String getFormAttributeName() {
		return this.getPageContext().getRequest().getParameter("instrumentoForm");
	}


}
