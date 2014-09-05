<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<script>  
  $(document).ready(function() {
  });
 


</script>

<br>

<html:form action="cEquipoNombreBuscarAction.do" method="POST">


	<h1 align="center" class="titulo">Búsqueda de Nombres de Equipo</h1>
	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0" width="800">
		<tr height="25">
			<td class="CformRowHeader" colspan="10">&nbsp; Búsqueda de
				Nombres</td>
		</tr>

		<tr>
			<td>

				<table width="100%" cellpadding="2" cellspacing="2">
					<tr>
						<td>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="20%">Nombre</td>
									<td class="CformDato" width="80%">
										<html:text styleId="nombre" property="nombreBusqueda" maxlength="50" size="30"/>
									</td>

								</tr>
							</table>

						</td>
					</tr>

					<tr>
						<td class="CformAreaBotones">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cEquipoNombreBuscarActionForm" />
									<jsp:param name="entidad" value="equipoNombre" />
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
								name="sessionScope.cEquipoNombreBuscarActionForm.resultados"
								id="equipoNombreListar" requestURI="cEquipoNombreBuscarAction.do"
								decorator="conicet.apps.svt.web.equipoNombre.decorator.CEquipoNombreDisplayWrapper">
								<display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%><%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>

								<display:column property="indice" title="#" 
									headerClass="tableCellHeader" style="width:20px" media="html" />
								<!-- display:column property="id" title="Id"  headerClass="sortable" sortable="true" style="width: 20px;" / -->
								<!-- display:column property="nrosOrden"  title="Nro.Orden"  headerClass="tableCellHeader"   style="width: 120px;" / -->
								<display:column property="nombre"
									title="Nombre" sortable="true" headerClass="tableCellHeader"
									style="width: 120px;" />
								
								<display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
							</display:table></td>
					</tr>
					<tr>
						<td colspan="10" class="headTabla">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cEquipoNombreBuscarActionForm" />
									<jsp:param name="entidad" value="equipo_nombre" />
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
