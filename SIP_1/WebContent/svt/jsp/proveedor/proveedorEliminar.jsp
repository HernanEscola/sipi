<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Eliminar Proveedor</h1>

<h2 class="mensajeSuperior">Está a punto de eliminar el proveedor, presione 'Grabar' para confirmar.</h2>


<html:form action="cProveedorEliminarAction.do" method="POST">
		<jsp:include page="/jsp/proveedor/proveedorView.jsp">
			<jsp:param name="proveedorForm" value="cProveedorForm" />
			<jsp:param name="currentActionName" value="cProveedorEliminarAction" />
			<jsp:param name="accion" value="eliminar" />
		</jsp:include>

</html:form>


