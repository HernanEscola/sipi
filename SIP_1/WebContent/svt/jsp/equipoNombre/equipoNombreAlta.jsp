<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Registro de Nombres</h1>
<html:form action="cEquipoNombreAltaAction.do" method="POST">

	<logic:equal property="accion" value="alta" name="cEquipoNombreForm">
		<jsp:include page="/jsp/equipoNombre/equipoNombreInput.jsp">
			<jsp:param name="equipoNombreForm" value="cEquipoNombreForm" />
			<jsp:param name="currentActionName" value="cEquipoNombreAltaAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
	
	<logic:equal property="accion" value="confirmar" name="cEquipoNombreForm">
		<jsp:include page="/jsp/equipoNombre/equipoNombreView.jsp">
			<jsp:param name="equipoNombreForm" value="cEquipoNombreForm" />
			<jsp:param name="currentActionName" value="cEquipoNombreAltaAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>

</html:form>
