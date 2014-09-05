<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Registro de Proveedor</h1>
<html:form action="cProveedorAltaAction.do" method="POST">

	<logic:equal property="accion" value="alta" name="cProveedorForm">
		<jsp:include page="/jsp/proveedor/proveedorInput.jsp">
			<jsp:param name="proveedorForm" value="cProveedorForm" />
			<jsp:param name="currentActionName" value="cProveedorAltaAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
	
	<logic:equal property="accion" value="confirmar" name="cProveedorForm">
		<jsp:include page="/jsp/proveedor/proveedorView.jsp">
			<jsp:param name="proveedorForm" value="cProveedorForm" />
			<jsp:param name="currentActionName" value="cProveedorAltaAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>

</html:form>
