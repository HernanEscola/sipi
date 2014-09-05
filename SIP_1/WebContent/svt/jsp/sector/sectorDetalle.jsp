<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>

<h1 align=" center" class="titulo">Detalle del Sector</h1>
<html:form action="cSectorDetalleAction.do" method="POST">
		<jsp:include page="/jsp/sector/sectorView.jsp">
			<jsp:param name="sectorForm" value="cSectorForm" />
			<jsp:param name="currentActionName" value="cSectorDetalleAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>

</html:form>
