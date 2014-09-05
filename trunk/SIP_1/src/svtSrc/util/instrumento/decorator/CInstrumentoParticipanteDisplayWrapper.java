package conicet.apps.svt.web.instrumento.decorator;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

import conicet.apps.svt.object.instrumentoParticipante.CInstrumentoParticipante;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;
import conicet.framework.util.cuit.CCuit;

public class CInstrumentoParticipanteDisplayWrapper extends TableDecorator implements DecoratesHssf {

	public CInstrumentoParticipanteDisplayWrapper() {
	}

	public String getIndice() {
		int i = this.getListIndex();
		String retorno = "<a href='#' onclick='submitAction(\"?method=participacion Seleccionada&index="+i+"\")'>"+(i+1)+"</a>";
		return retorno;
	}

	public String getRolParticipante() {
		CInstrumentoParticipante c = (CInstrumentoParticipante) this.getCurrentRowObject();
		return c.getRolParticipante().getDescripcion();
	}

	public String getRemove() {
		CInstrumentoParticipante c = (CInstrumentoParticipante) this.getCurrentRowObject();
		CInstrumentoForm form = (CInstrumentoForm) this.getPageContext().getSession().getAttribute(this.getPageContext().getRequest().getParameter("instrumentoForm"));
		Integer index = form.getParticipantesInstrumento().indexOf(c);
		int indexPantalla = getListIndex();
		return "<a href='#' onclick='quitar(\"Participante\","+ index + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}

	public String getNombre() {
		CInstrumentoParticipante c = (CInstrumentoParticipante) this.getCurrentRowObject();
			return c.getParticipante().getDescripcion();
	}

	public String getCuit() {
		CInstrumentoParticipante c = (CInstrumentoParticipante) this.getCurrentRowObject();
		if(c.getParticipante().getCuit()!=null){
				return CCuit.stringSinGuionesToStringConGuiones( c.getParticipante().getCuit());
		}
		return "";
	}
	
	public String getCategoria() {
		CInstrumentoParticipante c = (CInstrumentoParticipante) this.getCurrentRowObject();
		
		if(c.getParticipante().getCategoria()!=null){
			String escalafon = c.getParticipante().getCategoria().getEscalafon().getDescripcion();
			String categoria = c.getParticipante().getCategoria().getDescripcion();
			if(StringUtils.isNotEmpty(escalafon) && StringUtils.isNotEmpty(categoria)){
					return categoria + "/" + escalafon; 
			}else if(StringUtils.isNotEmpty(categoria)){
				return categoria;
			}else if(StringUtils.isNotEmpty(escalafon)){
				return escalafon;
			}
		}
		return "";
	}
	
	public String getParticipacion() {
		CInstrumentoParticipante c = (CInstrumentoParticipante) this.getCurrentRowObject();
		if(c.getParticipaciones().isEmpty()){
			return "NO";
		}
		return "SI";
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
