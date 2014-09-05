<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Modificación de Equipamiento</h1>
<html:form action="cMarcaModificarAction.do" method="POST">

	<logic:equal property="accion" value="modificar" name="cMarcaForm">
		<jsp:include page="/jsp/marca/marcaInput.jsp">
			<jsp:param name="marcaForm" value="cMarcaForm" />
			<jsp:param name="currentActionName" value="cMarcaModificarAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
	
	<logic:equal property="accion" value="confirmar" name="cMarcaForm">
		<jsp:include page="/jsp/marca/marcaView.jsp">
			<jsp:param name="marcaForm" value="cMarcaForm" />
			<jsp:param name="currentActionName" value="cMarcaModificarAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>

</html:form>