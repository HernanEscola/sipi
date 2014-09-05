<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>

<script>

$(document).ready(function() {
	$("#selectUvts").multiselect({
		   selectedText: "# de # UVTs seleccionadas",
		   noneSelectedText: "Seleccionar",
		   checkAllText: "Selecc. Todos",
		   uncheckAllText: "Deselecc. Todos",
	});
	   
	var opciones = {"desde":"id_fechaDesdeCobro","hasta":"id_fechaHastaCobro"};
	  var x = new CPeriodoPicker(opciones);

	  var opciones2 = {"desde":"id_fechaDesdeFactura","hasta":"id_fechaHastaFactura"};
	  var x2 = new CPeriodoPicker(opciones2);


	  var input = new CInputNumero(false);
  	   input.bind("input[id='importeDesde']");//selector de jquery
  	   input.bind("input[id='importeHasta']");//selector de jquery

});


</script>

<br>

<html:form action="cCobroBuscarAction.do" method="POST">
<html:hidden property="accion"/>


<h1 align="center" class="titulo">Búsqueda de Cobros</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >
   <capplication:isApplication application="SIUVT">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Búsqueda de Cobros de &nbsp;:&nbsp; <bean:write name="cCobroBuscarActionForm" property="gestorDesc" /></td>
  </tr>
  </capplication:isApplication>	
   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table width="100%">
				             <table> 
				              <tr>
				                <td class="CformNombre"  width="120"  >Nro. Recibo:</td>
				       	        <td class="CformDato">&nbsp;
				                	<html:text property="cobroPrefijoB" size="4" maxlength="4" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,4)"  /> -
				                	
				                	<html:text property="cobroSufijoB" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,8)"  />
				                </td>
					         </tr>
							</table>
							<table> 	
				             <tr>
				                <td class="CformNombre" width="120" >Importe Desde:</td>
				                <td class="CformDato">$<html:text styleId="importeDesde" property="importeDesde" size="14" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
				                <td class="CformNombre"  >Hasta:</td>
				                <td class="CformDato">$<html:text styleId="importeHasta" property="importeHasta"  size="14" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
				 	    	</tr>
						    <tr>
				                    <td class="CformNombre" width="120" >Cobro:Fecha Desde:</td>
				                    <td class="CformDato">&nbsp;	<html:text property="fechaDesdeCobro" styleId="id_fechaDesdeCobro"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" > Hasta:</td>
				                    <td class="CformDato">    <html:text property="fechaHastaCobro" styleId="id_fechaHastaCobro"  size="10" maxlength="10" />
				                     </td>
				            </tr>
						    <tr>
				                    <td class="CformNombre" width="120" >Factura:Fecha Desde:</td>
				                    <td class="CformDato">&nbsp;	<html:text property="fechaDesdeFactura" styleId="id_fechaDesdeFactura"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" > Hasta:</td>
				                    <td class="CformDato">    <html:text property="fechaHastaFactura" styleId="id_fechaHastaFactura"  size="10" maxlength="10" />
				                     </td>
				            </tr>

							</table>

							<table> 
				              <tr>
				                <td class="CformNombre"  width="120"  >Factura Nro:</td>
				       	        <td class="CformDato">&nbsp;
				       	             <html:select  property="facturaTipo">
					                 <html:options collection="comboTipoFactura" property="value" labelProperty="label"  />
					                 </html:select>
				                     <html:select  property="facturaPrefijo">
						                 <html:options collection="comboPrefijoFactura" property="value" labelProperty="label"  />
							                 </html:select>- 

				                	<html:text property="facturaSufijo" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,8)"  />
				                </td>
					         </tr>
							</table>
							
							<table> 	
				              <tr>
					                <td class="CformNombre"  width="120"  >Prestador:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="prestadorDesc" size="60" maxlength="60"  /> 
									</td>
									<capplication:isApplication application="SVT">
										<td class="CformNombre"  width="120">Sigla Exacta:</td>
						       	        <td class="CformDato">
						                	<html:checkbox property="prestadorDescExacta"/>
										</td>
									</capplication:isApplication>
							  </tr>
							  					         
				              <tr>
					                <td class="CformNombre"  width="120"  >Contratante:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="contactoDesc" size="60" maxlength="60"  /> 
									</td>
							  </tr>
 							 <capplication:isApplication application="SVT">
 								<tr>
						        
					                <td class="CformNombre" width="120">Facturado Por:</td>
					                <td class="CformDato">&nbsp;
					                  <html:select styleId="selectUvts" multiple="multiple" disabled="false" property="uvtsIds" >
					                    <html:options collection="comboUvts" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
				                
					         </tr> 
					          </capplication:isApplication>

    						  <tr>
					                <td class="CformNombre" width="120">Cobrado Por:</td>
					                <td class="CformDato">&nbsp;
					                  <html:select disabled="false" property="cobradoEn" >
					                    <html:options collection="comboCobradoEn" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
	 			              </tr>
							
							 <tr>
					                <td class="CformNombre" width="120">Tipo de Servicio:</td>
					                <td class="CformDato">&nbsp;
					                  <html:select disabled="false" property="tipoServicio" >
					                    <html:options collection="comboTipoServicio" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
	 			              </tr>
							</table>
							<capplication:isApplication application="SVT">
							<table>
				                  <tr>
					                <td class="CformNombre" width="120">
					                  Solo lo Informado:&nbsp;
					                </td>
						            <td class="CformDato">
						                    Sí<html:radio property="soloLoInformado" value="S" />
						                    No<html:radio property="soloLoInformado" value="N" />
						            </td>
						            <html:hidden property="soloLoInformado" />
					              </tr>
							</table>
							</capplication:isApplication>

							
					</table>
				
				 </td>
			 </tr>
		
		     <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cCobroBuscarActionForm" />
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
	             <display:table style="width: 100%" export="true"   name="sessionScope.cCobroBuscarActionForm.resultados" id="cobroListar"  requestURI="cCobroBuscarAction.do"  decorator="conicet.apps.siuvt.web.ingreso.decorator.CCobroDisplayWrapper">
				<display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CCobroDisplayWrapper" />
            	<display:setProperty name="export.excel.filename" value="Cobros.xls" />
            	<display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CCobroDisplayWrapper" />
            	<display:setProperty name="export.pdf.filename" value="Cobros.pdf" />
			     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
				 
				 <display:column property="indice" title="#" headerClass="tableCellHeader" style="width:20px" media="html"/>
				 <!-- display:column property="id" title="Id"  headerClass="sortable" sortable="true" style="width: 20px;" /-->
	             <display:column property="cobroFecha" format="{0,date,dd-MM-yyyy}" title="Fecha"  headerClass="sortable"  sortable="true"  style="width: 120px;" />
				 <display:column property="cobroNro" title="Nro. Recibo"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="facturaNro" title="Nro. Factura"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="prestador" title="Prestador"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="contratante" title="Contratante"  headerClass="sortable" sortable="true" style="width: 120px;" />
			 	<display:column property="gestorFactura" title="Facturado por"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="cobradoEn" title="Cobrado por"  headerClass="sortable" sortable="true" style="width: 120px;" />
	             <display:column property="importe" title="Importe ($)"  decorator="conicet.apps.svt.util.CImporteDecorator"  headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" media="html pdf"/>
	             <display:column property="importe" title="Importe ($)"  headerClass="tableCellHeader"  style="width: 90px;text-align:right;" total="true" media="excel"/>

		              <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
	             <display:setProperty name="export.excel.filename" value="ListadoDeCobros.xls" />
                 <display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CCobroDisplayWrapper" />
                 <display:setProperty name="export.pdf.filename" value="ListadoDeFacturas.pdf" />
	             
	             
	             </display:table>
    		</td>
            </tr>
  	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cCobroBuscarActionForm" />
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



