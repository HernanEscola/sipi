<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Eliminar Contacto</h1>

<h2 class="mensajeSuperior">Está a punto de eliminar el contacto, presione 'Grabar' para confirmar.</h2>


<html:form action="cContactoEliminarAction.do" method="POST">
		<jsp:include page="/jsp/contacto/contactoView.jsp">
			<jsp:param name="contactoForm" value="cContactoForm" />
			<jsp:param name="currentActionName" value="cContactoEliminarAction" />
			<jsp:param name="accion" value="eliminar" />
		</jsp:include>

</html:form>