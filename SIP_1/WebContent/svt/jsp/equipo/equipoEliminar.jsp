<%@include file="/jsp/layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Eliminación de Equipamiento</h1>
<html:form action="cEquipoEliminarAction.do" method="POST">
<br>
<h2 class="mensajeSuperior">Está a punto de eliminar el equipamiento, presione 'Grabar' para confirmar.</h2>

		<jsp:include page="/jsp/equipo/equipoView.jsp">
			<jsp:param name="equipoForm" value="cEquipoDetalleActionForm" />
			<jsp:param name="accion" value="eliminar" />
		</jsp:include>

</html:form>
