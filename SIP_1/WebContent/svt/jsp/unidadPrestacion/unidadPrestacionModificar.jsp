<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Modificación de Unidad de Prestación</h1>
<html:form action="cUnidadPrestacionModificarAction.do" method="POST">

	<logic:equal property="accion" value="modificar" name="cUnidadPrestacionForm">
		<jsp:include page="/jsp/unidadPrestacion/unidadPrestacionInput.jsp">
			<jsp:param name="unidadPrestacionForm" value="cUnidadPrestacionForm" />
			<jsp:param name="currentActionName" value="cUnidadPrestacionModificarAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
	
	<logic:equal property="accion" value="confirmar" name="cUnidadPrestacionForm">
		<jsp:include page="/jsp/unidadPrestacion/unidadPrestacionView.jsp">
			<jsp:param name="unidadPrestacionForm" value="cUnidadPrestacionForm" />
			<jsp:param name="currentActionName" value="cUnidadPrestacionModificarAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>
	
</html:form>