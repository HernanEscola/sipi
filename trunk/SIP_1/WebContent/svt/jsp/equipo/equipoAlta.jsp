<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Registro de Equipamiento</h1>
<html:form action="cEquipoAltaAction.do" method="POST">

	<logic:equal property="accion" value="alta" name="cEquipoForm">
		<div class="tab-container" id="container">

				<table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
					<tr>
						<td>
							<ul class="tabs">
									<li><a href="#" onClick="return mostrarPanel('equipo', this)" id="tabEquipo">Equipo</a></li>
									<li><a href="#" onClick="return mostrarPanel('horario', this)" id="tabHorario">Horario de Servicio</a></li>
							</ul>
						</td>
					</tr>
				</table>
				<div>
					<jsp:include page="/jsp/equipo/equipoInput.jsp">
						<jsp:param name="equipoForm" value="cEquipoForm" />
						<jsp:param name="currentActionName" value="cEquipoAltaAction" />
						<jsp:param name="accion" value="alta" />
					</jsp:include>
				</div>
		</div>
		
		
		
	</logic:equal>

	<logic:equal property="accion" value="confirmar" name="cEquipoForm">
		<jsp:include page="/jsp/equipo/equipoView.jsp">
			<jsp:param name="equipoForm" value="cEquipoForm" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>
</html:form>
