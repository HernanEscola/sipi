<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>

<script type="text/javascript">









$(document).ready(function() {
	
	$("#selectUvts").multiselect({
		   selectedText: "# de # UVTs seleccionadas",
		   noneSelectedText: "Seleccionar",
		   checkAllText: "Selecc. Todos",
		   uncheckAllText: "Deselecc. Todos",
	});
	 
	var opciones = {"desde":"id_fechaDesde","hasta":"id_fechaHasta"};
	var x = new CPeriodoPicker(opciones);
	  
});


</script>

<br>

<html:form action="cDisponibilidadFondosBuscarAction.do" method="POST">
<html:hidden property="accion"/>

<h1 align="center" class="titulo"> Disponibilidad de Fondos</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Disponibilidad de Fondos</td>
  </tr>

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table width="100%">
				             <table> 
 

						    <tr>
				                    <td class="CformNombre" width="200">Fecha Desde:<span class="dato_obligatorio">*</span></td>
				                    <td class="CformDato"><html:text property="fechaDesde" styleId="id_fechaDesde"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" > Hasta:</td>
				                    <td class="CformDato">    <html:text property="fechaHasta" styleId="id_fechaHasta"  size="10" maxlength="10" />
				                     </td>
				            </tr>

							</table>
														
							<table> 	
    						 <tr>
						        
					                <td class="CformNombre" width="200">Uvt:&nbsp;</td>
					                <td class="CformDato">
					                  <html:select styleId="selectUvts" multiple="multiple" disabled="false" property="uvtsIds" >
					                    <html:options collection="comboUvts" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
				                
					         </tr> 
							</table>
							<table>
				                  <tr>
					                <td class="CformNombre" width="200">
					                  Con Saldo Inicial:&nbsp;
					                </td>
						            <td class="CformDato">
						                    Sí<html:radio property="conSaldoInicio" value="S" />
						                    No<html:radio property="conSaldoInicio" value="N" />
						            </td>
						            <html:hidden property="conSaldoInicio" />
					              </tr>
							</table>
					</table>
				
				 </td>
			 </tr>
		
		     <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cDisponibilidadFondosBuscarActionForm" />
		               <jsp:param name="entidad" value="cobro" />
		               <jsp:param name="posicion" value="0" />
		            </jsp:include>
		          </div>
		        </td>
		      </tr>
	   </table>
	 </td>
  </tr>
</table>







<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >

  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda</td>
          </tr>
          <tr>
             <td colspan="10">
	             <display:table style="width: 100%" export="true"   name="sessionScope.cDisponibilidadFondosBuscarActionForm.resultados" id="cobroListar"  requestURI="cDisponibilidadFondosBuscarAction.do"  decorator="conicet.apps.svt.web.reporte.decorator.CDisponibilidadFondosDisplayWrapper">
	             <display:column property="uvt" title="UVT" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" media="excel pdf" />
	             <display:column property="tipoExportar" title="Tipo" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" media="excel pdf" />
	             <display:column property="tipo" title="Tipo" headerClass="tableCellHeader"  style="width: 80px;text-align:left;" media="html" />
	             
	             <display:column property="importe" title="Total($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" decorator="conicet.apps.svt.util.CImporteDecorator" media="html pdf" />
	             <display:column property="uvtImporte" title="UVT ($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" decorator="conicet.apps.svt.util.CImporteDecorator" media="html pdf" />
	             <display:column property="conicetImporte" title="CONICET($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" decorator="conicet.apps.svt.util.CImporteDecorator" media="html pdf" />
	             <display:column property="contraparteImporte" title="Contrapartes($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" decorator="conicet.apps.svt.util.CImporteDecorator" media="html pdf" />
	             <display:column property="recuperoImporte" title="Recuperos($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" decorator="conicet.apps.svt.util.CImporteDecorator" media="html pdf" />
	             <display:column property="prestadorImporte" title="Prestadores($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" decorator="conicet.apps.svt.util.CImporteDecorator" media="html pdf" />
	             <display:column property="productividadImporte" title="Productividad($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" decorator="conicet.apps.svt.util.CImporteDecorator" media="html pdf" />

	             <display:column property="importe" title="Total($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true"  media="excel" />
	             <display:column property="uvtImporte" title="UVT ($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true"  media="excel" />
	             <display:column property="conicetImporte" title="CONICET($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true"  media="excel" />
	             <display:column property="contraparteImporte" title="Contrapartes($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true"  media="excel" />
	             <display:column property="recuperoImporte" title="Recuperos($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true"  media="excel" />
	             <display:column property="prestadorImporte" title="Prestadores($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true"  media="excel" />
	             <display:column property="productividadImporte" title="Productividad($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true"  media="excel" />



				<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.reporte.decorator.CDisponibilidadFondosDisplayWrapper" />
            	<display:setProperty name="export.excel.filename" value="DisponibilidadFondos.xls" />
            	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.reporte.decorator.CDisponibilidadFondosDisplayWrapper" />
            	<display:setProperty name="export.pdf.filename" value="DisponibilidadFondos.pdf" />
			     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
			     <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
                 <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.reporte.decorator.CDisponibilidadFondosDisplayWrapper" />
	             
	             
	             </display:table>
    		</td>
            </tr>
  	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cDisponibilidadFondosBuscarActionForm" />
                  <jsp:param name="entidad" value="cobro" />
                  <jsp:param name="posicion" value="1" />
                </jsp:include>
              </div>
            </td>
          </tr>


       </table>
    </td>
  </tr>
</table>



</html:form>



