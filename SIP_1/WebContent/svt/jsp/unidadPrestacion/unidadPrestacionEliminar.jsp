<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Eliminar Unidad de Prestación</h1>
<html:form action="cUnidadPrestacionEliminarAction.do" method="POST">
	
	<logic:equal property="accion" value="eliminar" name="cUnidadPrestacionForm">
		<jsp:include page="/jsp/unidadPrestacion/unidadPrestacionView.jsp">
			<jsp:param name="unidadPrestacionForm" value="cUnidadPrestacionForm" />
			<jsp:param name="currentActionName" value="cUnidadPrestacionEliminarAction" />
			<jsp:param name="accion" value="eliminar" />
		</jsp:include>
	</logic:equal>
	
</html:form>