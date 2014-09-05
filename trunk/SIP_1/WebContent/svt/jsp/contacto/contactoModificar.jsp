<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Modificación de Contacto</h1>
<html:form action="cContactoModificarAction.do" method="POST">

	<logic:equal property="accion" value="modificar" name="cContactoForm">
		<jsp:include page="/jsp/contacto/contactoInput.jsp">
			<jsp:param name="contactoForm" value="cContactoForm" />
			<jsp:param name="currentActionName" value="cContactoModificarAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
	
	<logic:equal property="accion" value="confirmar" name="cContactoForm">
		<jsp:include page="/jsp/contacto/contactoView.jsp">
			<jsp:param name="contactoForm" value="cContactoForm" />
			<jsp:param name="currentActionName" value="cContactoModificarAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>

</html:form>