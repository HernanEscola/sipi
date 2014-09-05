<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<script>  
  $(document).ready(function() {
  });
 


</script>

<br>

<html:form action="cUnidadPrestacionBuscarAction.do" method="POST">


	<h1 align="center" class="titulo">Búsqueda de Unidades de Prestación</h1>
	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0" width="800">
		<tr height="25">
			<td class="CformRowHeader" colspan="10">&nbsp; Búsqueda de Unidades de Prestación</td>
		</tr>
		
		<tr>
			<td>

				<table width="100%" cellpadding="2" cellspacing="2">
					<tr>
						<td>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="20%">Descripcion</td>
									<td class="CformDato" width="80%">
										<html:text styleId="descripcion" property="descripcionBusqueda" maxlength="50" size="30"/>
									</td>

								</tr>
							</table>

						</td>
					</tr>

					<tr>
						<td class="CformAreaBotones">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cUnidadPrestacionBuscarActionForm" />
									<jsp:param name="entidad" value="unidadPrestacion" />
									<jsp:param name="posicion" value="0" />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800">

		<tr>
			<td>
				<table align="center" width="100%">
					<tr>
						<td colspan="12" align="center" class="headTabla">Resultados de la búsqueda</td>
					</tr>
					<tr>
						<td colspan="10"><display:table style="width: 100%"
								export="true" sort="list"
								name="sessionScope.cUnidadPrestacionBuscarActionForm.resultados"
								id="unidadPrestacionListar" requestURI="cUnidadPrestacionBuscarAction.do"
								decorator="conicet.apps.svt.web.unidadPrestacion.decorator.CUnidadPrestacionDisplayWrapper">
								<display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%> <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>

								<display:column property="indice" title="#" headerClass="tableCellHeader" style="width:20px" media="html" />
								<display:column property="descripcion" title="Descripción" sortable="true" headerClass="tableCellHeader" style="width: 120px;" />
								
								<display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
							</display:table></td>
					</tr>
					<tr>
						<td colspan="10" class="headTabla">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cUnidadPrestacionBuscarActionForm" />
									<jsp:param name="entidad" value="unidadPrestacion" />
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
