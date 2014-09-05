package conicet.apps.svt.web.instrumento.decorator;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

import conicet.apps.svt.object.instrumentoParticipacion.CInstrumentoParticipacion;
import conicet.apps.svt.web.instrumento.form.CInstrumentoParticipacionForm;

public class CInstrumentoParticipacionDisplayWrapper extends TableDecorator implements DecoratesHssf {

	public CInstrumentoParticipacionDisplayWrapper() {
	}

	public String getIndice() {
		int i = this.getListIndex()+1;
		//String retorno = "<a href='#' onclick='submitAction(\"?method=alta De Participacion&index="+i+"\")'>"+(i+1)+"</a>";
		return i+"";
	}

	public String getDuracion() {
		CInstrumentoParticipacion c = (CInstrumentoParticipacion) this.getCurrentRowObject();
		return c.getDuracionCompleta();
	}
	
	public String getDedicacion() {
		CInstrumentoParticipacion c = (CInstrumentoParticipacion) this.getCurrentRowObject();
		return c.getPorcentaje().setScale(2).toString();
	}

	public String getRemove() {
		CInstrumentoParticipacion c = (CInstrumentoParticipacion) this.getCurrentRowObject();
		CInstrumentoParticipacionForm form = (CInstrumentoParticipacionForm) this.getPageContext().getSession().getAttribute(this.getPageContext().getRequest().getParameter("form"));
		Integer index = form.getParticipaciones().indexOf(c);
		return "<a href='#' onclick='quitar(\"Participacion\","+ index + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}


	@Override
	public String finishRow() {
		String scriptAltaParticipacion ="";
		if(this.isLastRow()){
		}
		
		
		return scriptAltaParticipacion;
	}

	@Override
	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}
}
