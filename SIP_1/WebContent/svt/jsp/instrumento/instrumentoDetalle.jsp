<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<br>
<h1 align="center" class="titulo">Detalle de Convenio</h1>
<html:form method="post" styleId="instrumentoForm" action="cConvenioDetalleAction.do" enctype="multipart/form-data">
	<html:hidden name="cConvenioForm" property="tienePatente" styleId="tienePatente"/>
	
		<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
			<jsp:param name="instrumentoForm" value="cConvenioForm" />
			<jsp:param name="pageName" value="convenioDetalle" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
</html:form>
