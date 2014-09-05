<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>

<style type="text/css">
tr.even {
	  font-family: verdana, tahoma, arial, helvetica;
	  font-size: 11px;
	  background-color:#FFFFFF;
	  /*background-color: #fea*/

	}
</style>

<script>


	 
</script>  


<script>


$(document).ready(function() {


	$("#selectUvts").multiselect({
		   selectedText: "# de # UVTs seleccionadas",
		   noneSelectedText: "Seleccionar",
		   checkAllText: "Selecc. Todos",
		   uncheckAllText: "Deselecc. Todos",
	});
	 
	if(document.cReporteContabilidadBuscarActionForm.generarPDF.value=="S"){
		document.cReporteContabilidadBuscarActionForm.generarPDF.value="N";
		go();
	}

	
	var opciones = {"desde":"id_fechaDesdeMovimiento","hasta":"id_fechaHastaMovimiento"};
	var x = new CPeriodoPicker(opciones);
	var opciones = {"desde":"id_fechaDesdeRegistro","hasta":"id_fechaHastaRegistro"};
	var x = new CPeriodoPicker(opciones);
	initDialogDetalleReporteContabilidad();	 
	$("#id_btnLimpiar").click(function(){
		$("#selectUvts").multiselect("uncheckAll");
	});
	

	
});

function buscarSaldoInicial (idsBusqueda){
	buscarDetalle("cReporteContabilidadBuscarAction.do?method=buscarDetalleSaldoInicial&match="+idsBusqueda,"Prestador","Saldo Inicial");
}

function buscarFacturas (idsBusqueda){
	buscarDetalle("cReporteContabilidadBuscarAction.do?method=buscarDetalleFacturas&match="+idsBusqueda,"N°Factura","Facturado");
}

function buscarCobros (idsBusqueda){
	buscarDetalle("cReporteContabilidadBuscarAction.do?method=buscarDetalleCobros&match="+idsBusqueda,"Fecha - N°Recibo","Cobrado");
}

function buscarEgresos (idsBusqueda){
	buscarDetalle("cReporteContabilidadBuscarAction.do?method=buscarDetalleEgresos&match="+idsBusqueda,"Fecha - Tipo","Egresos");
}

function go(){
	
	//var id = <bean:write name="cReporteContabilidadBuscarActionForm" property="resultados" />;
 	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cReporteContabilidadPDFAction.do?id=','_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}



</script>

<br>

<html:form action="cReporteContabilidadBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="generarPDF"/>

<h1 align="center" class="titulo"> Reporte Contabilidad</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Reporte Contabilidad</td>
  </tr>

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table width="100%">
				             <table> 
 

						    <tr>
				                    <td class="CformNombre" width="200">Fecha Desde Movimiento:<span class="dato_obligatorio">*</span></td>
				                    <td class="CformDato"><html:text property="fechaDesdeMovimiento" styleId="id_fechaDesdeMovimiento"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" > Hasta:</td>
				                    <td class="CformDato">  <html:text property="fechaHastaMovimiento" styleId="id_fechaHastaMovimiento"  size="10" maxlength="10" />
				                     </td>
				            </tr>
  							<tr>
				                    <td class="CformNombre" width="200">Fecha Desde Registro:<span class="dato_obligatorio">*</span></td>
				                    <td class="CformDato"><html:text property="fechaDesdeRegistro" styleId="id_fechaDesdeRegistro"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" > Hasta:</td>
				                    <td class="CformDato">    <html:text property="fechaHastaRegistro" styleId="id_fechaHastaRegistro"  size="10" maxlength="10" />
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
					             <tr>
					                <td class="CformNombre" width="120">Tipo de Servicio:</td>
					                <td class="CformDato">&nbsp;
					                  <html:select disabled="false" property="tipoServicio" >
					                    <html:options collection="comboTipoServicio" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
	 			              </tr>
					             <tr>
					                <td class="CformNombre" width="120">Tipo de Filtro:</td>
					                <td class="CformDato">&nbsp;
					                  <html:select disabled="false" property="tipoReporte" >
					                    <html:options collection="comboTipoReporte" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
	 			              </tr>
			                  <tr>
					                <td class="CformNombre" width="120">
					                  Con Saldo Anterior:&nbsp;
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
		        <td class="CformAreaBotones" height="35">
		         <table  align="center" width="100%">
					    <tr>
					        <td>
					         <div align="left">
								          <span class="dato_obligatorio">*Datos obligatorios.</span>
							  </div> 
					        </td>
							<td>
							</td>	
					      </tr>
					      <tr>
					        <td>
					         <div align="left" ><span class="mensajes" style="font-weight: bold;" >
					          Los Saldos Inicio resaltados en rojo fueron modificados en el período solicitado
					          </span>
							</div>
					        </td>
							<td>
					         <div align="right" >
					            <jsp:include page="/jsp/layout/botones.jsp">
					               <jsp:param name="formulario" value="cReporteContabilidadBuscarActionForm" />
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
	             <display:table style="width: 100%" export="true"   name="sessionScope.cReporteContabilidadBuscarActionForm.resultados" id="cobroListar"  requestURI="cReporteContabilidadBuscarAction.do"  decorator="conicet.apps.svt.web.reporte.decorator.CReporteContabilidadDisplayWrapper">
	             <display:column property="uvtExcel" title="Uvt" headerClass="tableCellHeader"  style="width: 80px;text-align:left;" media="excel" />
	             <display:column property="tipoServicioExcel" title="Tipo de Servicio" headerClass="tableCellHeader"  style="width: 80px;text-align:left;" media="excel" />
	             <display:column property="tipo" title="Tipo" headerClass="tableCellHeader"  style="width: 80px;text-align:right;" media="html excel" />/>
	             <display:column property="importeHtml" title="Total($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;font-weight:bold;" decorator="conicet.apps.svt.util.CImporteDecorator" media="html"  />
	             <display:column property="importe" title="Total($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;font-weight:bold;" decorator="conicet.apps.svt.util.CImporteDecorator" media="excel"  />
	             
	             
	             <display:column property="uvtImporte" title="UVT ($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" decorator="conicet.apps.svt.util.CImporteDecorator" />
	             <display:column property="conicetImporte" title="CONICET($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;"  decorator="conicet.apps.svt.util.CImporteDecorator" />
	             <display:column property="contraparteImporte" title="Contrapartes($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;"  decorator="conicet.apps.svt.util.CImporteDecorator"/>
	             <display:column property="prestadorImporte" title="Prestadores($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;"  decorator="conicet.apps.svt.util.CImporteDecorator"  />
	             <display:column property="productividadImporte" title="Productividad($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" decorator="conicet.apps.svt.util.CImporteDecorator" />
	             <display:column property="retencionImporte" title="Retencion($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" decorator="conicet.apps.svt.util.CImporteDecorator" />

				<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.reporte.decorator.CReporteContabilidadDisplayWrapper" />
            	<display:setProperty name="export.excel.filename" value="ReporteContabilidad.xls" />
            	 <display:caption media="excel" >Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
	           	<display:setProperty name="export.pdf" value="false"/> 	     
			     <display:footer media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%>
			     </display:footer>
	            
	             </display:table>
    		</td>
            </tr>
  	    <tr>
            <td colspan="10" class="headTabla" >
			 
              <div align="right">

				<button name="btnSubmit" class="CformBoton" value="Generar PDF" type="submit"> Generar PDF <img src="./imagenes/ico_file_pdf.png"></button>
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cReporteContabilidadBuscarActionForm" />
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


<jsp:include page="/jsp/dialog/detalleReporteContabilidad.jsp">
		<jsp:param name="form" value="cReporteContabilidadBuscarActionForm" />
		<jsp:param name="actionName" value="cReporteContabilidadBuscarAction" />
</jsp:include>


</html:form>



