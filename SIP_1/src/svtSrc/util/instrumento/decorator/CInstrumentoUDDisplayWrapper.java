package conicet.apps.svt.web.instrumento.decorator;

import conicet.apps.svt.object.instrumentoParte.CInstrumentoParte;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;

public class CInstrumentoUDDisplayWrapper extends CInstrumentoParteDisplayWrapper {
	
	@Override
	public String getRemove() {
		CInstrumentoParte c = (CInstrumentoParte) this.getCurrentRowObject();
		CInstrumentoForm form = (CInstrumentoForm) this.getPageContext().getSession().getAttribute((String)this.getPageContext().getRequest().getParameter("instrumentoForm"));
		Integer index = form.getUdsInstrumento().indexOf(c);
		return "<a href='#' onclick='quitar(\"UD\","+ index + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}

}
