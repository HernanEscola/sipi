<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br>
<h1 align=" center" class="titulo">Registro de Unidad de Prestación</h1>
<html:form action="cUnidadPrestacionAltaAction.do" method="POST">

	<logic:equal property="accion" value="alta" name="cUnidadPrestacionForm">
		<jsp:include page="/jsp/unidadPrestacion/unidadPrestacionInput.jsp">
			<jsp:param name="unidadPrestacionForm" value="cUnidadPrestacionForm" />
			<jsp:param name="currentActionName" value="cUnidadPrestacionAltaAction" />
			<jsp:param name="accion" value="alta" />
		</jsp:include>
	</logic:equal>
		
	<logic:equal property="accion" value="confirmar" name="cUnidadPrestacionForm">
		<jsp:include page="/jsp/unidadPrestacion/unidadPrestacionView.jsp">
			<jsp:param name="unidadPrestacionForm" value="cUnidadPrestacionForm" />
			<jsp:param name="currentActionName" value="cUnidadPrestacionAltaAction" />
			<jsp:param name="accion" value="confirmar" />
		</jsp:include>
	</logic:equal>

</html:form>
