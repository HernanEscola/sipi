package conicet.apps.svt.web.instrumento.decorator;


import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

import conicet.apps.svt.object.instrumentoParte.CInstrumentoParte;
import conicet.apps.svt.util.CDocumento;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;
import conicet.framework.util.cuit.CCuit;

public class CInstrumentoParteDisplayWrapper extends TableDecorator implements DecoratesHssf {
	public CInstrumentoParteDisplayWrapper() {
	}

	public String getIndice() {
		int i = this.getListIndex() + 1;
		String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoInstrumentoParteIndex(" + this.getListIndex() + ") value=\"" + i + "\">";
		return retorno;
	}

	public String getFuncion() {
		CInstrumentoParte c = (CInstrumentoParte) this.getCurrentRowObject();
		return c.getFuncion().getDescripcion();
	}
	
	public String getRemove() {
		CInstrumentoParte c = (CInstrumentoParte) this.getCurrentRowObject();
		CInstrumentoForm form = (CInstrumentoForm) this.getPageContext().getSession().getAttribute((String)this.getPageContext().getRequest().getParameter("instrumentoForm"));
		Integer index = form.getPartesInstrumento().indexOf(c);
		int indexPantalla = getListIndex();
		return "<a href='#' onclick='quitar(\"Parte\","+ index + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}
	
	public String getParteNombre() {
		CInstrumentoParte c = (CInstrumentoParte) this.getCurrentRowObject();
		return StringUtils.isNotEmpty(c.getNombreCompleto()) ? c.getNombreCompleto() : "--" ;
	}
	
	public String getParteCuitDoc() {
		CInstrumentoParte c = (CInstrumentoParte) this.getCurrentRowObject();
		if(c.getDocumento()!=null){
			return CDocumento.formatearDocumento(c.getDocumento());
		}else{
			if(c.getCuit()!=null)
				return CCuit.stringSinGuionesToStringConGuiones( c.getCuit());
			return "--";
		}
	}
	
	public String getParteSigla() {
		CInstrumentoParte c = (CInstrumentoParte) this.getCurrentRowObject();
		return StringUtils.isNotEmpty(c.getDescripcion()) ? c.getDescripcion() : "--";
	}

	@Override
	public String finishRow() {
/*
	    if (this.isLastRow()){
	        totales = "<tr class=\"tableRowFooter\">";
	        totales +="<td class=\"tableCell\" colspan='2' style=\"text-align:right\" >" +
	        		"<select id='tipoParte' name='tipoParteAgregar' onchange='cambiarTipoParte()'>";
	        for(){
	        	totales+="<html:options name='form' collection='comboTiposParte' property='value' labelProperty='label' />";
	        }	
	        totales +="</html:select></td>";
	        totales += "<td  headerClass=\"tableCellHeader\" colspan='2' style=\"text-align:right; width: 100px;\">";
	        totales += "</td> <td  headerClass=\"tableCellHeader\" style=\"text-align:right; width: 100px;\">";
	        totales += "<div id='autoCompletePrestadorDescripcion'><label id='autoCompletePrestadorTexto'> </label>" +
	        		"<a href='#' onclick='remove(this,'Prestador')'><img src='./imagenes/close.png' align='top' /> </a>" +
	        		"</div> " +
	        		"<input type='text' name='autoCompletePrestador' id='autoCompletePrestador' width='200' />" +
	        		"<div id='autoCompletePromotorDescripcion'><label id='autoCompletePromotorTexto'> </label> " +
	        		"<a href='#' onclick='remove(this,'Promotor')'><img src='./imagenes/close.png' align='top' /> </a>" +
	        		"</div> <input type='text' name='autoCompletePromotor' id='autoCompletePromotor' width='200' />" +
	        		"<div id='autoCompleteUvtDescripcion'>" +
	        		"<label id='autoCompleteUvtTexto'> </label> <a href='#' onclick='remove(this,'Uvt')'><img src='./imagenes/close.png' align='top' /> </a>" +
	        		"</div> <input type='text' name='autoCompleteUvt' id='autoCompleteUvt' width='200' />" +
	        		"<div id='autoCompleteContratanteDescripcion'>" +
	        		"<label id='autoCompleteContratanteTexto'> </label> <a href='#' onclick='remove(this,'Contratante')'><img src='./imagenes/close.png' align='top' /> </a>" +
	        		"</div> <input type='text' name='autoCompleteContratante' id='autoCompleteContratante' width='200' /></td>" +
	        		"<td class='CformDato'><html:submit styleId='btnAgregarParte' property='btnSubmit' value='Agregar Parte' styleClass='CformBoton' /></td>";
	        totales += "</td> <td  headerClass=\"tableCellHeader\" style=\"text-align:right; width: 100px;\">";
	        
	        totales +=" </td></tr>";
	    }
	    return totales;*/
		return "";
	}

	@Override
	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}

}
