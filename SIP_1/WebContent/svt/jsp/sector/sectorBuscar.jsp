<%@include file="/jsp/layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>

<br>
<h1 align=" center" class="titulo">Búsqueda de Sector</h1>
<html:form action="cSectorBuscarAction.do" method="POST">

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
		<tr>
			<td>
			  <table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td height="10" colspan="10"></td>
					</tr>
					<tr>
						<td width="40" rowspan="100"></td>
						<td>
						<table width="100%" cellpadding="2" cellspacing="2">
						    <tr>
				                <td class="CformNombre" width="120">Sigla:</td>
				                <td class="CformDato">
				                  <html:text property="siglaBusqueda" maxlength="30" size="30" />
				                </td>
				            </tr>
						    <tr>
								<td class="CformNombre" width="120">Denominación:</td>
								<td class="CformDato">
									<html:text property="descripcionBusqueda" maxlength="255" size="50" /></td>
						    </tr>	             
							<tr>
								<td class="CformNombre" width="120">Estado:</td>
								<td class="CformDato">
								  <html:select disabled="false"	property="habilitadoBusqueda">
											  <html:options collection="comboHabilitado" property="value"	labelProperty="label" />
								  </html:select>
							</tr>
						</table>
					</td>
					<td width="40" rowspan="100"></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
				<td class="CformAreaBotones" height="35">
				   <div align="right">
				      <jsp:include page="/jsp/layout/botones.jsp">
	               <jsp:param name="formulario" value="cSectorBuscarActionForm" />
	               <jsp:param name="entidad" value="gestor" />
	               <jsp:param name="posicion" value="0" />
	            </jsp:include> 
					  </div>
				</td>
		</tr>
	</table>
	<!--/logic:equal-->
	<script>
		
	</script>
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<table align="center" width="100%">
				<thead>
					<tr>
					  <!-- Muestro datos de sector -->
				      <td colspan="10" align="center">
	              	  <display:table id="sectorBuscarTabla" sort="external" export="true" requestURI="cSectorBuscarAction.do" name="sessionScope.cSectorBuscarActionForm.resultados" style="width: 100%;" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
		              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>    Fecha: <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
		              <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper" />
		              <display:setProperty name="export.excel.filename" value="ListadoDeUVTs.xls" />
		              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper" />
		              <display:setProperty name="export.pdf.filename" value="ListadoDeUVTs.pdf" />

	                  <display:column media="excel pdf" property="tipoGestorBusqueda" title="    Tipo     " headerClass="tableCellHeader" style="width: 25%;" />
	                  <display:column media="excel pdf" property="siglaBusqueda" title="     Sigla       " headerClass="tableCellHeader" style="width:25%;" />
	                  <display:column media="excel pdf" property="descripcionBusqueda" title="          Descripción        " headerClass="tableCellHeader" style="width: 30%;" />
	                  <display:column media="excel pdf" property="habilitado" title="   Estado   " headerClass="tableCellHeader" style="width: 10%;" />
	                
	           		  <display:column media="html" property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;" />
	                  <display:column media="html" sortName="srt_codigo" property="id" title="Código" headerClass="tableCellHeader" style="width: 70px;" sortable="true" />
	                  <display:column media="html" sortName="srt_siglaBusqueda" property="siglaBusqueda" title="Sigla" headerClass="tableCellHeader" style="width: 150px;" sortable="true" />
	                  <display:column media="html" sortName="srt_descripcionBusqueda" property="descripcionBusqueda" title="Denominación" headerClass="tableCellHeader" style="width: 250px;" sortable="true" maxLength="40"/>
	                  <display:column media="html" sortName="srt_habilitado" property="habilitado" title="Estado" headerClass="tableCellHeader" style="width: 200px;" sortable="true" />
                  
                      <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
                      </display:table>
           <!-- Muestro datos de uvt -->

						<!-- Muestro datos de todos -->
					
					</tr>
				</thead>
				<tr>
	        <td class="CformAreaBotones" height="35">
	         <div align="right">
             <jsp:include page="/jsp/layout/botones.jsp">
               <jsp:param name="formulario" value="cSectorBuscarActionForm" />
               <jsp:param name="entidad" value="sector" />
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