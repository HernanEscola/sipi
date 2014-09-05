package conicet.apps.svt.web.instrumento.decorator;


import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

import conicet.apps.svt.object.instrumentoMonto.CInstrumentoMonto;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;

public class CInstrumentoMontoDisplayWrapper extends TableDecorator implements DecoratesHssf {
	public CInstrumentoMontoDisplayWrapper() {
	}

	public String getIndice() {
		int i = this.getListIndex() + 1;
		//String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndex(" + this.getListIndex() + ") value=\"" + i + "\">";
		return ""+i;
	}

	
	public String getTipoMoneda() {
		CInstrumentoMonto c = (CInstrumentoMonto) this.getCurrentRowObject();
		return c.getTipoMoneda().getDescripcion() +" ( " + c.getTipoMoneda().getSimbolo() +" )";
	}
	
	public String getMonto() {
		CInstrumentoMonto c = (CInstrumentoMonto) this.getCurrentRowObject();
		return c.getMonto().setScale(2).toString();
	}
	
	public String getObservacionMonto() {
		CInstrumentoMonto c = (CInstrumentoMonto) this.getCurrentRowObject();
		return c.getObservacion();
	}
	
	public String getTipoMonto() {
		CInstrumentoMonto c = (CInstrumentoMonto) this.getCurrentRowObject();
		return c.getTipoMonto().getDescripcion();
	}
	
	public String getRemove() {
		CInstrumentoMonto c = (CInstrumentoMonto) this.getCurrentRowObject();
		CInstrumentoForm form = (CInstrumentoForm) this.getPageContext().getSession().getAttribute((String)this.getPageContext().getRequest().getParameter("instrumentoForm"));
		Integer index = form.getMontosInstrumento().indexOf(c);
		int indexPantalla = getListIndex();
		return "<a href='#' onclick='quitar(\"Monto\","+ index + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}
	
	public String getParteNombre() {
		CInstrumentoMonto c = (CInstrumentoMonto) this.getCurrentRowObject();
		return "";
	}

	@Override
	public String finishRow() {
		return "";
	}

	@Override
	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}

}
