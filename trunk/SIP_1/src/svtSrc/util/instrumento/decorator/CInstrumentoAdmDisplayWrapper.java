package conicet.apps.svt.web.instrumento.decorator;

import conicet.apps.svt.object.instrumentoParte.CInstrumentoParte;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;

public class CInstrumentoAdmDisplayWrapper extends CInstrumentoParteDisplayWrapper {

	@Override
	public String getIndice() {
		int i = this.getListIndex() + 1;
		String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoInstrumentoParteAdmIndex(" + this.getListIndex() + ") value=\"" + i + "\">";
		return retorno;
	}

	@Override
	public String getRemove() {
		CInstrumentoParte c = (CInstrumentoParte) this.getCurrentRowObject();
		CInstrumentoForm form = (CInstrumentoForm) this.getPageContext().getSession().getAttribute(this.getPageContext().getRequest().getParameter("instrumentoForm"));
		Integer index = form.getAdministradoresInstrumento().indexOf(c);
		return "<a href='#' onclick='quitar(\"Adm\","+ index + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}

}
