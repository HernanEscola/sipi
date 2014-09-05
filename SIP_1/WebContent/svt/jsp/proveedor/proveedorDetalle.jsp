<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>

<h1 align=" center" class="titulo">Detalle de Proveedor</h1>
<html:form action="cProveedorDetalleAction.do" method="POST">
		<jsp:include page="/jsp/proveedor/proveedorView.jsp">
			<jsp:param name="proveedorForm" value="cProveedorForm" />
			<jsp:param name="currentActionName" value="cProveedorDetalleAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>

</html:form>