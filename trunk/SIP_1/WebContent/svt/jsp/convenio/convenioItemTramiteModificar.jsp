<%@include file="/jsp/layout/include.jsp"%>

<h1 align="center" class="titulo">Modificación de Evento del Trámite</h1>
<html:form method="post" styleId="cConvenioItemTramiteForm" action="cConvenioItemTramiteModificarAction.do" enctype="multipart/form-data">
	<html:hidden property="accion" />

	<logic:equal property="accion" value="modificar" name="cConvenioItemTramiteForm">
		<jsp:include page="/jsp/convenio/convenioItemTramite.jsp">
			<jsp:param name="convenioItemTramiteForm" value="cConvenioItemTramiteForm" />
			<jsp:param name="pageName" value="instrumentoAlta" />
			<jsp:param name="tipoPantalla" value="input" />
		</jsp:include>
	</logic:equal>

	<logic:equal property="accion" value="confirmar" name="cConvenioItemTramiteForm">
		<jsp:include page="/jsp/convenio/convenioItemTramite.jsp">
			<jsp:param name="convenioItemTramiteForm" value="cConvenioItemTramiteForm" />
			<jsp:param name="pageName" value="convenioItemTramiteCfm" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
	</logic:equal>
</html:form>