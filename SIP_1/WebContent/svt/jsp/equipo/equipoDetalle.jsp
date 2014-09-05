<%@include file="/jsp/layout/include.jsp"%>


<br>
<h1 align="center" class="titulo">Detalle del Equipamiento</h1>
<html:form action="cEquipoDetalleAction.do" method="POST">

	<jsp:include page="/jsp/equipo/equipoView.jsp">
		<jsp:param name="equipoForm" value="cEquipoDetalleActionForm" />
		<jsp:param name="accion" value="detalle" />
	</jsp:include>

</html:form>