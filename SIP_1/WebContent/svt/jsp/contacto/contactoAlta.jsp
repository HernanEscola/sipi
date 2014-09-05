<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Registro de Contacto</h1>
<html:form action="cContactoAltaAction.do" method="POST">

	<logic:equal property="accion" value="alta" name="cContactoForm">
		<jsp:include page="/jsp/contacto/contactoInput.jsp">
			<jsp:param name="contactoForm" value="cContactoForm" />
			<jsp:param name="currentActionName" value="cContactoAltaAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
	
	<logic:equal property="accion" value="confirmar" name="cContactoForm">
		<jsp:include page="/jsp/contacto/contactoView.jsp">
			<jsp:param name="contactoForm" value="cContactoForm" />
			<jsp:param name="currentActionName" value="cContactoAltaAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>

</html:form>