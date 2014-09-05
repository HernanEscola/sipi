<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>

<h1 align=" center" class="titulo">Detalle de Contacto</h1>
<html:form action="cContactoDetalleAction.do" method="POST">
		<jsp:include page="/jsp/contacto/contactoView.jsp">
			<jsp:param name="contactoForm" value="cContactoForm" />
			<jsp:param name="currentActionName" value="cContactoDetalleAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>

</html:form>