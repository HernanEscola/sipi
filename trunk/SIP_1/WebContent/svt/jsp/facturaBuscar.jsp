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
	   
	
	
	var opciones = {"desde":"id_fechaDesdeFactura","hasta":"id_fechaHastaFactura"};
	  var x = new CPeriodoPicker(opciones);
	   var input = new CInputNumero(false);
  	   input.bind("input[id='importeDesde']");//selector de jquery
  	   input.bind("input[id='importeHasta']");//selector de jquery

	  
});


</script>


<br>
<html:form action="cFacturaBuscarAction.do" method="POST">
<html:hidden property="accion"/>

<h1 align=" center" class="titulo">Búsqueda de Facturas</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
  <capplication:isApplication application="SIUVT">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Búsqueda de Facturas de &nbsp;:&nbsp; <bean:write name="cFacturaBuscarActionForm" property="gestorDesc" /></td>
  </tr>
  </capplication:isApplication>	
   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table >
				             <table> 
				              <tr>
				                <td class="CformNombre"  width="140"  >Factura Nro:</td>
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
				                <td class="CformNombre" width="140" >Importe Desde:</td>
				                <td class="CformDato">$<html:text  styleId="importeDesde" property="importeDesde" size="14" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
				                <td class="CformNombre"  >Hasta:</td>
				                <td class="CformDato">$<html:text styleId="importeHasta" property="importeHasta"  size="14" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
				 	    	</tr>
						    <tr>
				                    <td class="CformNombre" width="140" >Fecha Desde:</td>
				                    <td class="CformDato">&nbsp;	<html:text  property="fechaDesdeFactura" styleId="id_fechaDesdeFactura"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" > Hasta:</td>
				                    <td class="CformDato">    <html:text property="fechaHastaFactura" styleId="id_fechaHastaFactura"  size="10" maxlength="10" />
				                     </td>
				            </tr>
							</table>
							<table> 	
				              <tr>
					                <td class="CformNombre"  width="140"  >Descripción:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="detalle" size="60" maxlength="60"  /> 
									</td>
									
							  </tr>

				              <tr>
					                <td class="CformNombre"  width="140">Prestador:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="prestadorDesc" size="60" maxlength="60"  />
									</td>
									<capplication:isApplication application="SVT">
										<td class="CformNombre"  width="140">Sigla Exacta:</td>
						       	        <td class="CformDato">
						                	<html:checkbox property="prestadorDescExacta" name="cFacturaBuscarActionForm"/>
										</td>
									</capplication:isApplication>
							  </tr>
							  					         
				              <tr>
					                <td class="CformNombre"  width="140"  >Contratante:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="contactoDesc" size="60" maxlength="60"  /> 
									</td>
							  </tr>
							<capplication:isApplication application="SVT">
    						 <tr>
						        
					                <td class="CformNombre" width="140">Facturado por:</td>
					                <td class="CformDato">&nbsp;
					                  <html:select styleId="selectUvts" multiple="multiple" disabled="false" property="uvtsIds" >
					                    <html:options collection="comboUvts" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
				                
					         </tr> 
							</capplication:isApplication>

						       <tr>
					                <td class="CformNombre" width="140">Estado:</td>
					                <td class="CformDato">&nbsp;
					                  <html:select disabled="false" property="estadoCobro"  >
					                    <html:options collection="comboTipoEstadoCobro" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
	 			              </tr>
	 			              
	 			              <tr>
					                <td class="CformNombre" width="140">Tipo de Servicio:</td>
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
					                <td class="CformNombre" width="140">
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
		               <jsp:param name="formulario" value="cFacturaBuscarActionForm" />
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
                	<bean:define id="idFacturaListar" value="facturaListar" />
			  		<capplication:isApplication application="SIUVT">
                		<bean:define id="idFacturaListar" value="facturaListarParaSIUVT" />
					</capplication:isApplication>                
                  <fmt:setLocale value="en_GB"/>
	              <display:table sort="list"    name="sessionScope.cFacturaBuscarActionForm.resultados" id="<%= idFacturaListar %>" style="width: 100%" export="true"  requestURI="cFacturaBuscarAction.do"   decorator="conicet.apps.siuvt.web.ingreso.decorator.CFacturaDisplayWrapper">
				     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
					 
					 <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" />
					 <display:column property="facturaFecha" format="{0,date,dd-MM-yyyy}" title="Fecha" headerClass="sortable"  sortable="true" style="width: 100px;" />
			  		 <display:column property="facturaNro"  title="Número Factura" headerClass="sortable" sortable="true" style="width: 100px;" />
			  		 <display:column property="tipoServicio"  title="Tipo Servicio" headerClass="sortable" sortable="true"  style="width: 100px;" />
			  		 <display:column property="prestador"  title="Prestador" headerClass="sortable" sortable="true"  style="width: 200px;" />
			  		 <display:column property="contratante"  title="Contratante" headerClass="sortable"  sortable="true" style="width: 200px;" />
			  		 <display:column property="cuit"  title="CUIT / DNI" headerClass="tableCellHeader" style="width: 200px;text-align:right;"/>
			  		 <capplication:isApplication application="SVT">
			  		 	<display:column property="uvt"  title="Facturado por" headerClass="sortable"  sortable="true" style="width: 200px;" />
			  		 </capplication:isApplication>	
		             <display:column property="importe" title="Importe($)" decorator="conicet.apps.svt.util.CImporteDecorator"  headerClass="tableCellHeader" style="width: 100px;text-align:right;" total="true"  media="html pdf"/>
		  	  		 <display:column property="importeCobrado"  title="Cobrado($)"  decorator="conicet.apps.svt.util.CImporteDecorator"  headerClass="tableCellHeader"  style="width: 100px;text-align:right;" total="true"  media="html pdf"/>
		              <display:column property="saldo" decorator="conicet.apps.svt.util.CImporteDecorator" title="A Cobrar($)"  headerClass="tableCellHeader" style="width: 100px;text-align:right;"  media="html pdf" />

		             <display:column property="importe" title="Importe($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;" total="true"  media="excel"/>
		  	  		 <display:column property="importeCobrado"  title="Cobrado($)"   headerClass="tableCellHeader"  style="width: 100px;text-align:right;" total="true" media="excel"/>
		              <display:column property="saldo"  title="A Cobrar($)"  headerClass="tableCellHeader" style="width: 100px;text-align:right;"  media="excel" />

		             <display:column property="estadoCobro" title="Estado" maxLength="16" headerClass="sortable" sortable="true" style="width: 50px;"  />
		              <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
		              <display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CFacturaDisplayWrapper" />
		              <display:setProperty name="export.excel.filename" value="ListadoDeFacturas.xls" />
		              <display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CFacturaDisplayWrapper" />
		              <display:setProperty name="export.pdf.filename" value="ListadoDeFacturas.pdf" />
	               </display:table>
	               
	               
	               
	               
	    		</td>
           </tr>

	 	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cFacturaBuscarActionForm" />
                  <jsp:param name="entidad" value="factura" />
                  <jsp:param name="posicion" value="1" />
                </jsp:include>
              </div>
            </td>
          </tr>

       </table>
    </td></tr>
</table>


</html:form>



