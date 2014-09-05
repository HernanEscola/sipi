<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Registro de Marca</h1>
<html:form action="cMarcaAltaAction.do" method="POST">

	<logic:equal property="accion" value="alta" name="cMarcaForm">
		<jsp:include page="/jsp/marca/marcaInput.jsp">
			<jsp:param name="marcaForm" value="cMarcaForm" />
			<jsp:param name="currentActionName" value="cMarcaAltaAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
	
	<logic:equal property="accion" value="confirmar" name="cMarcaForm">
		<jsp:include page="/jsp/marca/marcaView.jsp">
			<jsp:param name="marcaForm" value="cMarcaForm" />
			<jsp:param name="currentActionName" value="cMarcaAltaAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>

</html:form>
