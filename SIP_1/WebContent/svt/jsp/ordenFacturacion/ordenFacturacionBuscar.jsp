<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="/jsp/layout/include.jsp"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>
<script>

$(document).ready(function() {
	  var opciones = {"desde":"id_fechaDesdeOCS","hasta":"id_fechaHastaOCS"};
	  var x = new CPeriodoPicker(opciones);
	 
	  
		$("#selectUvts").multiselect({
			   selectedText: "# de # UVTs seleccionadas",
			   noneSelectedText: "Seleccionar",
			   checkAllText: "Selecc. Todos",
			   uncheckAllText: "Deselecc. Todos",
			});
	  
});

function imprimirPDF(id){
	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cOrdenFacturacionPDFAction.do?idOrdenFacturacion='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}

</script> 
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>


<br>
<h1 align="center" class="titulo">
  Búsqueda de Órdenes de Facturación
</h1>
<html:form action="cOrdenFacturacionBuscarAction.do" method="POST">


<!-- DESDE AQUI, TABLE CON CAMPOS DEL CRITERIO DE BUSQUEDA.  -->

	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0" width="100%">
		<tr>
			<td>
				<table align="left" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="CformNombre" width="220">Prestador:</td>
						<td class="CformDato">
							<capplication:autoComplete tipoAutocomplete="Prestador" />
						</td>
					</tr>
					<tr>
						<td class="CformNombre" width="220">Contratante:</td>
						<td class="CformDato">
							<html:text property="contratanteDescripcion" maxlength="80" size="50" />
						</td>
					</tr>
					<tr>
						<td class="CformNombre" width="220">
							Código Orden Facturación:
						</td>
						<td class="CformDato">
							<html:text property="codigoOrdenFacturacion" maxlength="10" size="12" onkeypress="validarNumero()" />
						</td>
					</tr>
				 	<tr>
		                <td class="CformNombre" width="120">Tipo de Servicio:</td>
		                <td class="CformDato">
		                  <html:select disabled="false" property="tipoServicio" >
		                    <html:options collection="comboTipoServicio" property="value" labelProperty="label"/>
		                  </html:select>
	            		</td>
		            </tr>
					<tr>
						<td class="CformNombre" width="220">Importe Desde:</td>
						<td class="CformDato" width="100"><html:text property="importeDesde" size="10" maxlength="10" /></td>
						<td class="CformNombre">Hasta:</td>
						<td class="CformDato"><html:text property="importeHasta" size="10" maxlength="10" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="CformAreaBotones">
				<div align="right">
					<jsp:include page="/jsp/layout/botones.jsp">
						<jsp:param name="formulario" value="cOrdenFacturacionBuscarActionForm" />
						<jsp:param name="entidad" value="factura" />
						<jsp:param name="posicion" value="0" />
					</jsp:include>
				</div>
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
				 <display:table id="ordenFacturacionAltaFacturasBuscarTabla" export="true" sort="list" requestURI="cOrdenFacturacionBuscarAction.do" name="sessionScope.cOrdenFacturacionBuscarActionForm.resultados" style="width: 100%" 
			            decorator="conicet.apps.svt.web.ordenFacturacion.decorator.COrdenFacturacionDisplayWrapper">
			          <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%> <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                
			          <display:setProperty name="export.pdf.filename"   value="ListadoDeOrdenesDeFacturación.pdf" />
			          <display:setProperty name="export.excel.filename" value="ListadoDeOrdenesDeFacturación.xls" />
			          
			          <display:column property="indice" title="#"  media="html" headerClass="tableCellHeader" style="width: 3%;" />			          
			          <display:column property="numeroOF" title="Número OF" maxLength="200"  headerClass="sortable" sortable="true"  style="text-align:right; width: 12%;" />
			          <display:column property="tipoServicio" title="Tipo De Servicio" maxLength="200" headerClass="tableCellHeader" sortable="true"  style="width: 10%;" />
			          <display:column property="prestador" title="Prestador" maxLength="200" headerClass="tableCellHeader" sortable="true" style="width: 25%;" />
			          <display:column property="contratante" title="Contratante" maxLength="200" headerClass="tableCellHeader" sortable="true" style="width: 25%;" />
					  <display:column property="cuit" title="CUIT" maxLength="100" headerClass="tableCellHeader" sortable="true" style="width: 10%;"   />
		              <display:column property="facImporte" title="Importe" maxLength="100" decorator="conicet.apps.svt.util.CImporteDecorator" headerClass="tableCellHeader" sortable="true" style="width: 10%;text-align:right;"  media="html pdf" />
 					  <display:column property="facImporte" title="Importe"  headerClass="sortable" sortable="true" style="width: 100px;text-align:right;"  media="excel" />

					  <display:column property="linkAltaFactura" title="Acción" media="html" maxLength="100" headerClass="tableCellHeader" sortable="true" style="width: 10%;" />
					  
			
			          <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
			     </display:table>				 
			</td>
		  </tr>
		  <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cOrdenFacturacionBuscarActionForm" />
                  <jsp:param name="entidad" value="factura" />
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





