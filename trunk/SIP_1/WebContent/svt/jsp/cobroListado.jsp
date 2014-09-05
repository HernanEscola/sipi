<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>

$(document).ready(function() {
});


</script>

<br>

<html:form action="cCobroListadoAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="uvtDescripcion"/>


<h1 align="center" class="titulo">Listado de Cobros de <bean:write name="cCobroListadoActionForm" property="uvtDescripcion" /></h1>


<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >

    <tr>
        <td>
          <table align="center" width="100%">
              <tr>
                <td colspan="12" align="center" class="headTabla">
                  Criterios de la búsqueda:
                </td>
              </tr>
              <tr>
                <td>
                 <bean:write name="cCobroListadoActionForm" property="criterioBusquedaString" />
                </td>
			  </tr>	              
              <tr>
                <td colspan="12" align="center" class="headTabla">
                  Resultados de la búsqueda:
                </td>
              </tr>

          <tr>
             <td colspan="10">
	             <display:table style="width: 100%" export="true"   name="sessionScope.cCobroListadoActionForm.resultados" id="cobroListado"  requestURI="cCobroListadoAction.do"  decorator="conicet.apps.siuvt.web.ingreso.decorator.CCobroReporteDisplayWrapper">
				<display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CCobroReporteDisplayWrapper" />
            	<display:setProperty name="export.excel.filename" value="listadoDeCobros.xls" />
            	<display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CCobroReporteDisplayWrapper" />
            	<display:setProperty name="export.pdf.filename" value="listadoDeCobros.pdf" />
			     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
			     <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
				 <display:column property="indice" title="#" headerClass="tableCellHeader" style="width:20px" media="html"/>
	             <display:column property="cobroFecha" format="{0,date,dd-MM-yyyy}" title="Fecha"  headerClass="sortable"  sortable="true"  style="width: 120px;" />
				 <display:column property="cobroNro" title="Nro. Recibo"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="facturaNro" title="Nro. Factura"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="uvtVarias" title="Uvt"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="prestador" title="Prestador"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="contratante" title="Contratante"  headerClass="sortable" sortable="true" style="width: 120px;" />
	             <display:column property="importeCobro" title="Importe ($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" />
	             <display:column property="importeCobradoFacturas" title="Cobrado en Facturas($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" />

	             </display:table>
    		</td>
            </tr>
  	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cCobroListadoActionForm" />
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



