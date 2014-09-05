<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<script type="text/javascript" src="./js/generalScript.js"></script>

<script>
</script>


<br>
<html:form action="cPendienteListadoAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="uvtDescripcion"/>

<h1 align=" center" class="titulo">Listado de Pendientes de <bean:write name="cPendienteListadoActionForm" property="uvtDescripcion" /> </h1>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
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
                 <bean:write name="cPendienteListadoActionForm" property="criterioBusquedaString" />
                </td>
			  </tr>	              
              <tr>
                <td colspan="12" align="center" class="headTabla">
                  Resultados de la búsqueda:
                </td>
              </tr>
	      <tr>
                <td colspan="10">
	              <display:table name="sessionScope.cPendienteListadoActionForm.resultados" id="pendienteListado" style="width: 100%" export="true"  requestURI="cPendienteListadoAction.do"   decorator="conicet.apps.siuvt.web.ingreso.decorator.CPendienteDisplayWrapper">
				     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
					 
					<display:column property="indice" title="#" headerClass="tableCellHeader" media="html" />
					 <display:column property="fechaFactura" format="{0,date,dd-MM-yyyy}" title="Fecha" headerClass="sortable"  sortable="true" style="width: 100px;" />
			  		 <display:column property="facturaNro"  title="Número Factura" headerClass="sortable" sortable="true" style="width: 100px;" />
			  		 <display:column property="tipoServicio"  title="Tipo Servicio" headerClass="sortable" sortable="true"  style="width: 100px;" />
			  		 <display:column property="uvt"  title="Uvt" headerClass="sortable" sortable="true"  style="width: 200px;" />
			  		 <display:column property="prestador"  title="Prestador" headerClass="sortable" sortable="true"  style="width: 200px;" />
			  		 <display:column property="contratante"  title="Contratante" headerClass="sortable"  sortable="true" style="width: 200px;" />
		             <display:column property="totalFacturas" title="Importe($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;" total="true" />
		  	  		 <display:column property="totalCobros" title="Cobrado($)" headerClass="tableCellHeader"  style="width: 100px;text-align:right;" total="true" />
		             <display:column property="totalPendiente"  title="A cobrar($)" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
		  	  		 <display:column property="estado" title="Estado" headerClass="tableCellHeader"  style="width: 100px;text-align:right;"/>

		              <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
		              <display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CPendienteDisplayWrapper" />
		              <display:setProperty name="export.excel.filename" value="ListadoDePendientes.xls" />
		              <display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CPendienteDisplayWrapper" />
		              <display:setProperty name="export.pdf.filename" value="ListadoDePendientes.pdf" />
	               </display:table>
	    		</td>
           </tr>

	 	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cPendienteListadoActionForm" />
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



