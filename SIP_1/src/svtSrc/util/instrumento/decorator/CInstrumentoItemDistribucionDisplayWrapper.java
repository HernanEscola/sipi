package conicet.apps.svt.web.instrumento.decorator;


import java.math.BigDecimal;
import java.util.List;

import javax.servlet.jsp.PageContext;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;
import org.displaytag.model.TableModel;

import conicet.apps.svt.struct.CInstrumentoItemDistribucionStruct;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;

public class CInstrumentoItemDistribucionDisplayWrapper extends TableDecorator implements DecoratesHssf {
	private CInstrumentoForm form;
	private BigDecimal totalImporte = BigDecimal.ZERO;
	private BigDecimal totalPorcentaje = BigDecimal.ZERO;
	private BigDecimal totalImporteOtraMoneda = BigDecimal.ZERO;
	
	public CInstrumentoItemDistribucionDisplayWrapper() {
	}
	
	@Override
	public void init(PageContext pageContext, Object decorated, TableModel tableModel) {
		// TODO Auto-generated method stub
		super.init(pageContext, decorated, tableModel);
		this.form = (CInstrumentoForm) this.getPageContext().getSession().getAttribute((String)this.getPageContext().getRequest().getParameter("instrumentoForm"));
		
	}
	
	public String getIndice() {
		int i = this.getListIndex() + 1;
		//String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndex(" + this.getListIndex() + ") value=\"" + i + "\">";
		return ""+i;
	}

	public String getTipo() {
		CInstrumentoItemDistribucionStruct c = (CInstrumentoItemDistribucionStruct) this.getCurrentRowObject();
		return c.getTipoItem().getDescripcion();
	}
	
	
	public String getImporte() { CInstrumentoItemDistribucionStruct c = (CInstrumentoItemDistribucionStruct) this.getCurrentRowObject();
		return c.getImporte().toString();
	}
	
	
	public String getImporteOtraMoneda() {
		CInstrumentoItemDistribucionStruct c = (CInstrumentoItemDistribucionStruct) this.getCurrentRowObject();
	/*	BigDecimal importe;
		if(form.getEAccionesAction().equals(EAccionesAction.ALTA) || form.getEAccionesAction().equals(EAccionesAction.MODIFICAR))
			importe =  c.importePorcentaje(this.form.getMontoOtraMoneda());
			
		else{
			importe =  c.getImporte();
		}
		this.totalImporteOtraMoneda = this.totalImporteOtraMoneda.add(importe);*/
		return "";
	}
	
	public String getPorcentaje() {
		CInstrumentoItemDistribucionStruct c = (CInstrumentoItemDistribucionStruct) this.getCurrentRowObject();
		this.totalPorcentaje = this.totalPorcentaje.add(c.getPorcentaje());
		return c.getPorcentaje().toString();
	}
	
	public String getImporteLabel() {
		CInstrumentoItemDistribucionStruct c = (CInstrumentoItemDistribucionStruct) this.getCurrentRowObject();
		String id ="";
		String style = "";
		String name = "";
		String value = "";
		String clase = "";
		int indexPantalla = getListIndex();
		Integer index = indexPantalla;
		//String index = form.getin.toString();
		
	    	id = "id=\"importe_" + indexPantalla +"\"";
	    	style="style=\"text-align:right\"";
	    	clase = "class=\"CformTextDisabled\"";	
		
	    	return " <label "+id+" >"+value+"<label/>";
		//return " <input type=\"text\" "+ id +" "+ clase +" "+ style +" size=\"10\" maxlength=\"12\" "+ name +" "+ value +"  readonly=\"readonly\" />" ;
	
	}
	
	
	public String getImporteOtraMonedaLabel() {
		CInstrumentoItemDistribucionStruct c = (CInstrumentoItemDistribucionStruct) this.getCurrentRowObject();
		String id ="";
		String style = "";
		String name = "";
		String value = "";
		String clase = "";
		int indexPantalla = getListIndex();
		Integer index = indexPantalla;
		//String index = form.getin.toString();
		
	    	id = "id=\"importeOtraMoneda_" + indexPantalla +"\"";
	    	style="style=\"text-align:right\"";
	    	clase = "class=\"CformTextDisabled\"";
	    	
	    	return " <label "+id+" >"+value+"<label/>";
		/*
		return " <input type=\"text\" "+ id +" "+clase+" "+ style +" size=\"10\" maxlength=\"12\" "+ name +" "+ value +"  readonly=\"readonly\" />" ;
	*/
	}
	
	public String getPorcentajeInput() {
		CInstrumentoItemDistribucionStruct c = (CInstrumentoItemDistribucionStruct) this.getCurrentRowObject();
		String id ="";
		String style = "";
		String name = "";
		String value = "";
		String script = "";
		int indexPantalla = getListIndex();
		Integer index = indexPantalla;
		//String index = form.getin.toString();
		
	    	id = "id=\"porcentaje_" + indexPantalla +"\"";
	    	style="style=\"text-align:right\"";
	    	name = "name=\"porcentajeMapped("+index+")\"";
	    	value = "value=\""+ form.getPorcentajeMapped(index.toString())+"\"";
	    	script = "onblur=\"formatImporte(this),calcularDistribucion()\"";
		return " <input type=\"text\" "+ id +" "+ style +" size=\"10\" maxlength=\"12\" "+ name +" "+ value +" "+ script +"/>" ;
	}
	

	@Override
	public String finishRow() {
	    String totales = "";
	    
		  if (null != form) {
			  CInstrumentoItemDistribucionStruct dist = (CInstrumentoItemDistribucionStruct)this.getCurrentRowObject();
				
				
				if (dist.getTipoItem().getCodigo().equalsIgnoreCase("ICO")){
	 				/*totales = "<tr class=\"headTabla\">";
	  	  	        totales +="<td class=\"tableCell\" style=\"text-align:left\" ><b> Total Comisiones</b></td>";
	  	  	        totales +="<td class=\"tableCell\" colspan=1 style=\"text-align:left\" ></td>";
					totales +="<td class=\"tableCell\" colspan=1 style=\"text-align:right\" >";
					totales += "<input readonly=\"true\" type=\"text\" id=\"totalParcialComisiones\" style=\"text-align:right\" class=\"textDisabled\" size=\"12\" maxlength=\"12\" name=\"totalParcialComisiones\" value=\""+form.getTotalParcialComisiones()+"\" />" ;
					//totales += "<label id='totalParcialComisiones' >"+ form.getTotalParcialComisiones() +"<label/>";
					totales += "</td>" ;
	  		        totales += "<td  headerClass=\"tableCellHeader\" style=\"text-align:right; width: 100px;\">";		
	  		        totales += "</tr>";*/
	  		        
				}/* else if (dist.getTipoItem().getCodigo().equalsIgnoreCase("COS")){
					String estiloLineaCeleste = "text-align:left;background-color:#dfefff;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 11px;";
					String estiloLineaCelesteDerecha="text-align:right;background-color:#dfefff;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 11px;";
					totales = "<tr>";
	  	  	        totales +="<td style=\""+estiloLineaCeleste+"\" >Saldo a Distribuir</td>";
	  	  	        totales +="<td colspan=1 style=\""+estiloLineaCeleste+"\" ></td>";
					totales +="<td colspan=1 style=\""+estiloLineaCelesteDerecha+"\" >";
					totales += "<input readonly=\"true\" type=\"text\" id=\"saldoADistribuir\" style=\"text-align:right\" class=\"textDisabled\" size=\"12\" maxlength=\"12\" name=\"saldoADistribuir\" value=\""+form.getSaldoADistribuir()+"\" />" ;
					//totales += "<label id='saldoADistribuir' >"+ form.getSaldoADistribuir() +"<label/>";
	  		        totales += "</td>" ;
	  		        totales += "<td style=\"text-align:right; width: 100px;background-color:#dfefff;\"><b>";		
	  		        totales += "</tr>";

					totales += "<tr class=\"tableCellHeader\">";
			        totales +="<td class=\"tableCell\" colspan=1 style=\"text-align:left\" ><b> Descripción</b></td>";
			        totales +="<td ></td>";
			        totales +="<td class=\"tableCell\" colspan=1 style=\"text-align:left\" ><b> % Saldo a Distribuir</b></td>";
			        //totales +="<td class=\"tableCell\" colspan=1 style=\"text-align:left\" ><b> Importe ($)</b></td>";
	  	  	        totales +="<td class=\"tableCell\" colspan=1 style=\"text-align:left\" ></td>";

			        totales += "</tr>";
				}*/
		}
		return totales;
	}

	
	
	
	
	public String getPorcentajeComision(){
		String index = new Integer(this.getListIndex()).toString();
		CInstrumentoItemDistribucionStruct dist = (CInstrumentoItemDistribucionStruct)this.getCurrentRowObject();
		if ( dist.getTipoItem().isCostos() || dist.getTipoItem().isUnidadDivisional() ||
				dist.getTipoItem().isProductividad() ){
			String id ="";
			String style = "";
			String classStyle = "";
			String name = "";
			String value = "";
			String script = "";
			if (null != form) {
		    	id = "id=\"porcentajeDistribucion_" + index +"\"";
		    	style="style=\"text-align:right\"";
		    	name = "name=\"porcentajeComisionMapped("+this.getListIndex()+")\"";
		    	value = "value=\""+ form.getPorcentajeComisionMapped(index)+"\"";
		    	script = "onblur=\"formatImporte(this), calcularImporteDesdePorcentaje(this,"+index+")\"";
		    	
		    	if(dist.getTipoItem().isCostos() ){
		    		// Lo deshabilito porque no va mas de esta formma classStyle="class=\"textDisabled\"" + "readonly=\"true\"";
		    		id = "id=\"porcentajeDistribucionRecupero_" + index +"\"";
		    		script = ""; //		script = "onblur=\"return calcularImporteRecuperoDesdePorcentaje(this,"+index+")\"";
		    	}	
			}
			return " <input type=\"text\" "+ id +" "+ style +" "+ classStyle +"  size=\"12\"  maxlength=\"12\" "+ name +" "+ value +" "+ script +" />" ;

		} else{
				String id ="";
				String style = "";
				String classStyle = "";
				String name = "";
				String value = "";
				String script = "";
				if (null != form) {
			    	id = "id=\"porcentajeDistribucion_" + index +"\"";
			    	style="style=\"text-align:right\"";
			    	classStyle="class=\"porcentajeComision\"";
			    	name = "name=\"porcentajeComisionMapped("+this.getListIndex()+")\"";
			    	value = "value=\""+form.getPorcentajeComisionMapped(index)+"\"";
			    	script = "onblur=\" formatImporte(this), calcularImporteDesdePorcentaje(this,"+index+")";
			    	if ( dist.getTipoItem().getCodigo().equalsIgnoreCase("ICO") ){
			    		id = "id=\"porcentajeDistribucionComision_" + index +"\"";
			    		script = "onblur=\"formatImporte(this), calcularImporteComisionDesdePorcentaje(this,"+index+")";
			    		//script+=",mostrarUniversidad("+index+")";
			    	}else if (dist.getTipoItem().getGrupoItem().getValue().equalsIgnoreCase("COM")){
				    	id = "id=\"porcentajeDistribucionComision_" + index +"\"";
			    		script = "onblur=\"formatImporte(this), calcularImporteComisionDesdePorcentaje(this,"+index+")";
			    	}
			    	script+="\"";
			    }
				return " <input type=\"text\" "+ id +" "+ style +" "+ classStyle +" size=\"12\" maxlength=\"12\" "+ name +" "+ value +" "+ script +" />" ;
		}
	}
	public String getPorcentajeComisionTexto() {
		CInstrumentoItemDistribucionStruct dist = (CInstrumentoItemDistribucionStruct)this.getCurrentRowObject();
		if (null != dist && null != dist.getPorcentaje()) {
			return dist.getPorcentaje().setScale(2).toString();
		} else {
			return "0.00";
		}
	}
	public String getImporteComision(){
		CInstrumentoItemDistribucionStruct dist = (CInstrumentoItemDistribucionStruct)this.getCurrentRowObject();
		String index = new Integer(this.getListIndex()).toString();
		String id ="";
		String style = "";
		String classStyle = "";
		String name = "";
		String value = "";
		String script = "";

		if (null != form) {
	    	id = "id=\"importeDistribucion_" + index +"\"";
	    	style="style=\"text-align:right\"";
	    	classStyle="class=\"importeComision\"";
	    	name = "name=\"importeComisionMapped("+this.getListIndex()+")\"";
	    	value = "value=\""+form.getImporteComisionMapped(index)+"\"";

	    	script = "onblur=\"formatImporte(this), calcularPorcentajeDesdeImporte(this,"+index+")";
	    	if ( dist.getTipoItem().isInstitutoContraparte() ){
	    		id = "id=\"importeDistribucionComision_" + index +"\"";
	    		script = "onblur=\"formatImporte(this), calcularPorcentajeComisionDesdeImporte(this,"+index+")";
	    		//script+=",mostrarUniversidad("+index+")";
	    	}else if (dist.getTipoItem().isComision()){
	    		id = "id=\"importeDistribucionComision_" + index +"\"";
	    		script = "onblur=\"formatImporte(this), calcularPorcentajeComisionDesdeImporte(this,"+index+")";
	    	}else if (dist.getTipoItem().isCostos()){
	    		id = "id=\"importeDistribucionRecupero_" + index +"\"";
	    		script = "onblur=\"formatImporte(this), calcularPorcentajeRecuperoDesdeImporte(this,"+index+")";
	    	}
	    	
	    	script+="\"";
	    	
	    }
		return " <input type=\"text\" "+ id +" "+ style +" "+ classStyle +" size=\"12\" maxlength=\"12\" "+ name +" "+ value +" "+ script +" />" ;


	}


	public String getImporteComisionTexto(){
		CInstrumentoItemDistribucionStruct dist = (CInstrumentoItemDistribucionStruct)this.getCurrentRowObject();
		if (null != dist && null != dist.getImporte()) {
			return dist.getImporte().setScale(2).toString();
		} else {
			return "";
		}
	}

	public String getBotonAgregar(){
		
		String ret="";
		
		if(!form.getSoloDistribucionExcel()){
			String index = new Integer(this.getListIndex()).toString();
			int i = this.getListIndex();
			int indice = i + 1;
			CInstrumentoItemDistribucionStruct dist = (CInstrumentoItemDistribucionStruct)this.getCurrentRowObject();

			if (null != form) {
				if (dist.getTipoItem().isInstitutoContraparte()){
					String value="Seleccionar";
					String tipo="";
					if (form.getComisionOtraInstitucion().size()>0){
						String pendiente=calcularImporteTotal(form.getComisionOtraInstitucion());
						value=(new Integer(form.getComisionOtraInstitucion().size())).toString()+" Contrapartes "+pendiente;
						tipo="Transp";
					}
					ret= "<input  type=\"submit\" class=\"CformBoton"+tipo+"\" name=btnContraparte("+this.getListIndex()+")" +
								" value=\""+value+" \" />";
					// si tiene cobros no puede eliminar desde aqui
					if (form.getComisionOtraInstitucion().size()>0){
						ret+= "<input  type=\"submit\" class=\"CformBotonRemove\" name=btnContraparte("+this.getListIndex()+")" +
						" value=\"\" />";
					}	
				} else if (	dist.getTipoItem().getCodigo().equalsIgnoreCase("PRO") ){
					String value="Seleccionar";
					String tipo="";
					if (form.getProductividadEntidad().size()>0){
						String pendiente=calcularImporteTotal(form.getProductividadEntidad());
						value=(new Integer(form.getProductividadEntidad().size())).toString()+" Personas "+pendiente;
						tipo="Transp";
					}
					ret= "<input  type=\"submit\" class=\"CformBoton"+tipo+"\" name=btnProductividad("+this.getListIndex()+")" +
								" value=\""+value+" \" />";
					// si tiene cobros no puede eliminar desde aqui
					if (form.getProductividadEntidad().size()>0 ){
						ret+= "<input  type=\"submit\" class=\"CformBotonRemove\" name=btnProductividad("+this.getListIndex()+")" +
						" value=\"\" />";
					}
				}
			}
		}
		return ret;
	} 
	
	
	private String calcularImporteTotal(
			List<CInstrumentoItemDistribucionStruct> listado) {

		BigDecimal totI=BigDecimal.ZERO;
		for (CInstrumentoItemDistribucionStruct pe : listado) {
			if (pe.getImporte()!=null) {
				totI= totI.add(pe.getImporte());
			}
		}


		return " $"+totI.toString();
	}

	public String getBotonAgregarTexto(){
		String index = new Integer(this.getListIndex()).toString();
		int i = this.getListIndex();
		int indice = i + 1;
		CInstrumentoItemDistribucionStruct dist = (CInstrumentoItemDistribucionStruct)this.getCurrentRowObject();

		String ret="";
		if (null != form) {
			/*if ( dist.getTipoItemFacturacion().getCodigo().equalsIgnoreCase("ICO") ){
				ret="No Seleccionado";
				if (!StringUtils.isEmpty(form.getUniversidadDescripcion())){
					ret=form.getUniversidadDescripcion();
				}*/
			if (dist.getTipoItem().isInstitutoContraparte() ){
					String pendiente=calcularImporteTotal(form.getComisionOtraInstitucion());
					ret=(new Integer(form.getComisionOtraInstitucion().size())).toString()+" contrapartes "+pendiente;
					
			} else if (	dist.getTipoItem().getCodigo().equalsIgnoreCase("PRO") ){
				String pendiente=calcularImporteTotal(form.getProductividadEntidad());
				ret=(new Integer(form.getProductividadEntidad().size())).toString()+" Personas "+pendiente;
			}
		}
		return ret;
	}
	
	@Override
	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}

}
