<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Eliminar Sector</h1>

<h2 class="mensajeSuperior">Está a punto de eliminar el sector, presione 'Grabar' para confirmar.</h2>


<html:form action="cSectorEliminarAction.do" method="POST">
		<jsp:include page="/jsp/sector/sectorView.jsp">
			<jsp:param name="sectorForm" value="cSectorForm" />
			<jsp:param name="currentActionName" value="cSectorEliminarAction" />
			<jsp:param name="accion" value="eliminar" />
		</jsp:include>

</html:form>