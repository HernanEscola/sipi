<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<br />


<logic:equal property="valueEAccion" value="alta" name="cConvenioForm">
	<h1 align="center" class="titulo">Registro de Convenio</h1>
	<html:form method="post" styleId="cConvenioForm" action="cConvenioAltaAction.do" enctype="multipart/form-data">
		<html:hidden property="accion"/>
<%-- 		<html:hidden property="tab" /> --%>
		

		<logic:equal property="accion" value="alta" name="cConvenioForm">
				<div>
					<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
						<jsp:param name="instrumentoForm" value="cConvenioForm" />
						<jsp:param name="pageName" value="convenioAlta" />
						<jsp:param name="tipoPantalla" value="input" />
					</jsp:include>
				</div>
		</logic:equal>

		<logic:equal property="accion" value="confirmar" name="cConvenioForm">
		<html:hidden name="cConvenioForm" property="tienePatente" styleId="tienePatente"/>
		
			<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
				<jsp:param name="instrumentoForm" value="cConvenioForm" />
				<jsp:param name="pageName" value="convenioCfm" />
				<jsp:param name="tipoPantalla" value="view" />
			</jsp:include>
		</logic:equal>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="modificar" name="cConvenioForm">
	<h1 align="center" class="titulo">Modificación de Convenio</h1>
	<html:form method="post" styleId="cConvenioForm" action="cConvenioModificarAction.do" enctype="multipart/form-data">
		<html:hidden property="accion"/>
<%-- 		<html:hidden property="tab" /> --%>
		

		<logic:equal property="accion" value="modificar" name="cConvenioForm">
				<div>
					<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
						<jsp:param name="instrumentoForm" value="cConvenioForm" />
						<jsp:param name="pageName" value="convenioModificar" />
						<jsp:param name="tipoPantalla" value="input" />
					</jsp:include>
				</div>
		</logic:equal>

		<logic:equal property="accion" value="confirmar" name="cConvenioForm">
		<html:hidden name="cConvenioForm" property="tienePatente" styleId="tienePatente"/>
		
			<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
				<jsp:param name="instrumentoForm" value="cConvenioForm" />
				<jsp:param name="pageName" value="convenioCfm" />
				<jsp:param name="tipoPantalla" value="view" />
			</jsp:include>
		</logic:equal>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="detalle" name="cConvenioForm">
<!-- 
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
	-->
</logic:equal>

<logic:equal property="valueEAccion" value="inhabilitar" name="cConvenioForm">
	<br>
	<logic:equal property="estado" value="Deshabilitado" name="cConvenioForm">
		<h1 align="center" class="titulo">Habilitación de Convenio</h1>
	</logic:equal>
	<logic:notEqual property="estado" value="Deshabilitado" name="cConvenioForm">
		<h1 align="center" class="titulo">Deshabilitación de Convenio</h1>
	</logic:notEqual>
	<html:form method="post" styleId="instrumentoForm" action="cConvenioHabilitarAction.do" enctype="multipart/form-data">
	<html:hidden name="cConvenioForm" property="tienePatente" styleId="tienePatente"/>
		<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
			<jsp:param name="instrumentoForm" value="cConvenioForm" />
			<jsp:param name="pageName" value="convenioHabilitar" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
	</html:form>
</logic:equal>

