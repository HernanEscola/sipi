<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Registro de Sector</h1>
<html:form action="cSectorAltaAction.do" method="POST">

	<logic:equal property="accion" value="alta" name="cSectorForm">
		<jsp:include page="/jsp/sector/sectorInput.jsp">
			<jsp:param name="sectorForm" value="cSectorForm" />
			<jsp:param name="currentActionName" value="cSectorAltaAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
	
	<logic:equal property="accion" value="confirmar" name="cSectorForm">
		<jsp:include page="/jsp/sector/sectorView.jsp">
			<jsp:param name="sectorForm" value="cSectorForm" />
			<jsp:param name="currentActionName" value="cSectorAltaAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>

</html:form>
