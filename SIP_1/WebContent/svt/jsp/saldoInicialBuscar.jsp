<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>



<script type="text/javascript">

$(document).ready(function(){
	
	$("#selectUvts").multiselect({
		   selectedText: "# de # UVTs seleccionadas",
		   noneSelectedText: "Seleccionar",
		   checkAllText: "Selecc. Todos",
		   uncheckAllText: "Deselecc. Todos",
		});
	
	initDialogDetalleComisionContraparte();	 

});
	


	
function buscarContrapartes (idSaldoInicial){
		
		url ="cSaldoInicialBuscarAction.do?method=buscarlistacontrapartes&match="+idSaldoInicial;
		
			$
					.ajax({
						 
						url : url,
						
						type : 'POST',
						dataType : "json",
						
						success : function(data) {
							

							
							
							var datos = data;
							var index = 0;
							
							var html=" <table align='center' width='100%' >";
							
							var tipoServicio = datos[index].tipoServicio;
							var prestador = datos[index].prestador;
							html +=  "<tr><td> Tipo De Servicio:</td><td> "+tipoServicio+"</td></tr>";
							html +=  "<tr><td> Prestador       :</td><td> "+prestador+"</td></tr>";
							html +=  "<tr><td> </td><td> </td></tr>";
							html +=  "</table>";
							
							html +=  " <table align='center' width='100%'  border ='1' >";
							html += "<tr  bgcolor='#DDEEFF'> <td> 	Contraparte  </td>  <td>  	Importe ($) </td> </tr>";
							for (index = 0; index < datos.length; index++ ){
								var contraparte = datos[index].contraparte;
								var importe = datos[index].importe;
								html +=  "<tr><td> "+contraparte+"</td><td> "+ Number(importe).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,")  +"</td></tr>";
							}
							html +=  "</table>";
							$("#encabezadoDiv").html(html);
						
							
							$( "#dialogDetalleComisionContraparte" ).dialog( "open" );
							return false;

						}
					});
		

	
}	
	
</script>

<br>
<html:form  action="cSaldoInicialBuscarAction.do" method="POST">
<html:hidden property="accion"/>

<h1 align=" center" class="titulo">Búsqueda de Saldos Iniciales</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Búsqueda de Saldos Iniciales de &nbsp;:&nbsp; <bean:write name="cSaldoInicialBuscarActionForm" property="gestorDesc" /></td>
  </tr>

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table >
							<table> 	
							
				              <tr>
					                <td class="CformNombre"  width="120"  >Tipo Servicio:</td>
					       	        <td class="CformDato">&nbsp;
					       	         	<html:select  property="tipoServicio">
					                 	<html:options collection="comboTipoServicio" property="value" labelProperty="label"  />
					                 	</html:select>
									</td>
							  </tr>

				              <tr>
					                <td class="CformNombre"  width="120"  >Prestador:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="prestadorDesc" size="60" maxlength="60"  /> 
									</td>
							  </tr>
							   <tr>
					                <td class="CformNombre" width="120">Uvt:</td>
					                <td class="CformDato">&nbsp;
					                  <html:select styleId="selectUvts" multiple="multiple" disabled="false" property="uvtsIds" >
					                    <html:options collection="comboUvts" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
				                </tr>
							</table>
							
					</table>
				
				 </td>
			 </tr>
		
		     <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cSaldoInicialBuscarActionForm" />
		               <jsp:param name="entidad" value="factura" />
		               <jsp:param name="posicion" value="0" />
		            </jsp:include>
		          </div>
		        </td>
		      </tr>
	   </table>
	 </td>
  </tr>
</table>



<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >


  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultado de la búsqueda</td>
          </tr>

          <tr>
                <td colspan="10">
	              <display:table sort="list"    name="sessionScope.cSaldoInicialBuscarActionForm.resultados" id="saldoInicial" style="width: 100%" export="true"  requestURI="cSaldoInicialBuscarAction.do"   decorator="conicet.apps.siuvt.web.ingreso.decorator.CSaldoInicialDisplayWrapper">
				     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
					 
					 <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" />
			  		 <display:column property="uvt"  title="UVT Sigla"  headerClass="tableCellHeader" style="width: 100px" media="excel pdf" />
			  		 <display:column property="tipoServicio"  title="Tipo Servicio" headerClass="sortable" sortable="true"   />
			  		 <display:column property="prestador"  title="Prestador" headerClass="sortable" sortable="true"   />
		             <display:column property="importe" decorator="conicet.apps.svt.util.CImporteDecorator" title="Importe Total($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;" total="true"   media="html"/>
		             <display:column property="importe" decorator="conicet.apps.svt.util.CImporteDecorator" title="Total($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;" total="true"   media="pdf"/>
		             <display:column property="comisionConicet" decorator="conicet.apps.svt.util.CImporteDecorator" title="Comisión CONICET($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="html pdf"/>
		             <display:column property="comisionUvt" decorator="conicet.apps.svt.util.CImporteDecorator" title="Comisión UVT($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="html pdf"/>
		             <display:column property="detalleComisionContraparte" decorator="conicet.apps.svt.util.CImporteDecorator" title="Comisión Contraparte($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;" media="html" />
		             <display:column property="comisionContraparte" decorator="conicet.apps.svt.util.CImporteDecorator" title="Com.Contrap($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;" media="pdf" />
		             <display:column property="recuperoCostos" decorator="conicet.apps.svt.util.CImporteDecorator" title="Costos($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="html pdf"/>
		             <display:column property="importeParaPrestador" decorator="conicet.apps.svt.util.CImporteDecorator" title="Prestador($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="html pdf"/>
		             <display:column property="productividad" decorator="conicet.apps.svt.util.CImporteDecorator" title="Productividad($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="html pdf"/>

		             <display:column property="importe"  title="Importe Total($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;" total="true"   media="excel"/>
		             <display:column property="comisionConicet" title="Comisión CONICET($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="excel"/>
		             <display:column property="comisionUvt" title="Comisión UVT($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="excel"/>
		             <display:column property="comisionContraparte"  title="Comisión Contraparte($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="excel"/>
		             <display:column property="recuperoCostos" title="Costos($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="excel"/>
		             <display:column property="importeParaPrestador" title="Prestador($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"   media="excel"/>
		             <display:column property="productividad" title="Productividad($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"    media="excel"/>



		              <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
		              <display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CFacturaDisplayWrapper" />
		              <display:setProperty name="export.excel.filename" value="ListadoDeSaldoInicial.xls" />
		              <display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CFacturaDisplayWrapper" />
		              <display:setProperty name="export.pdf.filename" value="ListadoDeSaldoInicial.pdf" />
	               </display:table>
	    		</td>
           </tr>

	 	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cSaldoInicialBuscarActionForm" />
                  <jsp:param name="entidad" value="saldo_inicial" />
                  <jsp:param name="posicion" value="1" />
                </jsp:include>
              </div>
            </td>
          </tr>

       </table>
    </td></tr>
</table>

<jsp:include page="/jsp/dialog/detalleComisionContraparte.jsp">
		<jsp:param name="form" value="cSaldoInicialBuscarActionForm" />
		<jsp:param name="actionName" value="cSaldoInicialBuscarAction" />
</jsp:include>


</html:form>



