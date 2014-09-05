<!--  DEBO AGREGAR LIBRERIAS NECESARIAS PARA EL DISPLAY -->
<%@include file="/jsp/layout/include.jsp"%>

<!-- AQUI DESARROLLAR EL DISPLAY. -->


     <display:table id="contratanteAnalisisBuscarTabla" sort="external" export="true" requestURI="cContratanteAnalisisBuscarAction.do" name="sessionScope.cContratanteAnalisisBuscarActionForm.resultados" style="width: 100%" 
            decorator="conicet.apps.svt.web.contratante.decorator.CContratanteDisplayWrapper">
              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                

			<display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 4%;"/>
            <display:column property="nombreRazon" title="Razón Social / Nombre" headerClass="tableCellHeader" media="html excel pdf" style="width: 30%;"/>
            <display:column property="cuit" title="CUIT/DNI" headerClass="tableCellHeader" media="html excel pdf" style="width: 10%;"/>
            <display:column property="nacionalidad" title="Nacionalidad" headerClass="tableCellHeader" media="html excel pdf" style="width: 20%;"/>
            <display:column property="pais" title="País" headerClass="tableCellHeader" media="html excel pdf" style="width: 11%;"/> 
            <display:column property="fechaAlta" title="Fecha Alta" headerClass="tableCellHeader" media="html excel pdf" style="width: 10%;"/> 
            <display:column property="validado" title="Validado" headerClass="tableCellHeader" media="html excel pdf" style="width: 5%;"/> 
			<display:column property="estado" title="Estado" headerClass="sortable" sortable="true" style="width: 10%;" media="html" />
			<display:column property="estadoExcel" title="Estado" headerClass="sortable" sortable="true" style="width: 8%;"  media="excel pdf" />
 
			<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.contratante.decorator.CContratanteDisplayWrapper" />
			<display:setProperty name="export.excel.filename" value="ListadoDeContratantes.xls" />
			<display:setProperty name="export.pdf.filename" value="ListadoDeContratantes.pdf" />

              <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
     </display:table>

