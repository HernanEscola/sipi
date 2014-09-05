<!--  DEBO AGREGAR LIBRERIAS NECESARIAS PARA EL DISPLAY -->
<%@include file="/jsp/layout/include.jsp"%>

<!-- AQUI DESARROLLAR EL DISPLAY. -->

     <display:table id="ordenFacturacionBuscarTabla" export="true" sort="list" requestURI="cOFPresupuestoBuscarAction.do" 
     		name="sessionScope.cOFPresupuestoBuscarActionForm.resultados" style="width: 100%" 
            decorator="conicet.apps.svt.web.ordenFacturacion.decorator.COFPresupuestoDisplayWrapper">
              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%> <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                
              <display:column property="indice" title="#"  media="html" headerClass="tableCellHeader" />
              <display:column property="codigoOC" title="Nro Orden Facturación" maxLength="100" headerClass="sortable" style="text-align:right;" />
              <display:column property="fechaOC" title="Fecha" maxLength="200" headerClass="tableCellHeader"  style="width: 200px;" />
              <display:column property="prestador" title="Prestador"  maxLength="200" headerClass="tableCellHeader" style="width: 300;" />
              <display:column property="contratante" title="Contratante" maxLength="200" headerClass="tableCellHeader" style="width: 300;" />
              <display:column property="estadoOF" title="Estado Orden Fact" maxLength="100" headerClass="tableCellHeader" style="width: 100;"/>
              <display:setProperty name="export.excel.filename" value="ListadoDeOrdenesDeFacturación.xls" />
              <display:setProperty name="export.pdf.filename" value="ListadoDeOrdenesDeFacturación.pdf" />
              <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
     </display:table>
