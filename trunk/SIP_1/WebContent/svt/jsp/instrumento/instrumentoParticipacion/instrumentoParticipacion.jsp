<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br />
<logic:equal property="valueEAccion" value="alta" name="cInstrumentoParticipacionForm">
	<h1 align="center" class="titulo">Alta de Dedicación</h1>
	<html:form method="post" styleId="form" action="cInstrumentoParticipacionAltaAction.do" enctype="multipart/form-data">
				<div>
					<jsp:include page="/jsp/instrumento/instrumentoParticipacion/instrumentoParticipacionEntidad.jsp">
						<jsp:param name="form" value="cInstrumentoParticipacionForm" />
						<jsp:param name="tipoPantalla" value="input" />
					</jsp:include>
				</div>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="detalle" name="cInstrumentoParticipacionForm">
	<h1 align="center" class="titulo">Detalle de Dedicación</h1>
	<html:form method="post" action="cInstrumentoParticipacionDetalleAction.do" enctype="multipart/form-data">
				<div>
					<jsp:include page="/jsp/instrumento/instrumentoParticipacion/instrumentoParticipacionEntidad.jsp">
						<jsp:param name="form" value="cInstrumentoParticipacionForm" />
						<jsp:param name="tipoPantalla" value="view" />
					</jsp:include>
				</div>
	</html:form>
</logic:equal>