<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<br />
<logic:equal property="valueEAccion" value="alta" name="cPdtsForm">
	<h1 align="center" class="titulo">Registro de PDTS</h1>
	<html:form method="post" styleId="cPdtsForm" action="cPdtsAltaAction.do" enctype="multipart/form-data">
		<html:hidden property="accion"/>
<%-- 		<html:hidden property="tab" /> --%>
		<html:hidden property="esPDT" styleId="id_es_pdt" />
		

		<logic:equal property="accion" value="alta" name="cPdtsForm">
		
<!-- 			<div class="tab-container" id="container"> -->

<!-- 				<table class="tablaMin" align="center" cellpadding="0" cellspacing="0" > -->
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<ul class="tabs"> -->
<!-- 								<li><a href="#" onClick="return mostrarPanel('datos', this)" id="tabDatos">PDTS</a></li> -->
<!-- 								<li><a href="#" onClick="return mostrarPanel('partes', this)" id="tabPartes">Partes</a></li> -->
<!-- 								<li><a href="#" onClick="return mostrarPanel('participacion', this)" id="tabParticipacion">Participación</a></li> -->
<!-- 								<li><a href="#" onClick="return mostrarPanel('distribucion', this)" id="tabDistribucion">Distribución</a></li> -->
<!-- 							</ul> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
				<div>
					<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
						<jsp:param name="instrumentoForm" value="cPdtsForm" />
						<jsp:param name="pageName" value="convenioAlta" />
						<jsp:param name="tipoPantalla" value="input" />
					</jsp:include>
				</div>
		</logic:equal>

		<logic:equal property="accion" value="confirmar" name="cPdtsForm">
		
		
			<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
				<jsp:param name="instrumentoForm" value="cPdtsForm" />
				<jsp:param name="pageName" value="convenioCfm" />
				<jsp:param name="tipoPantalla" value="view" />
			</jsp:include>
		</logic:equal>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="modificar" name="cPdtsForm">
	<h1 align="center" class="titulo">Modificación de PDTS</h1>
	<html:form method="post" styleId="cPdtsForm" action="cPdtsModificarAction.do" enctype="multipart/form-data">
		<html:hidden property="accion"/>
		<html:hidden property="tab" />
		

		<logic:equal property="accion" value="modificar" name="cPdtsForm">
		
<!-- 			<div class="tab-container" id="container"> -->

<!-- 				<table class="tablaMin" align="center"  cellpadding="0" cellspacing="0" > -->
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<ul class="tabs"> -->
<!-- 								<li><a href="#" onClick="return mostrarPanel('datos', this)" id="tabDatos">PDTS</a></li> -->
<!-- 								<li><a href="#" onClick="return mostrarPanel('partes', this)" id="tabPartes">Partes</a></li> -->
<!-- 								<li><a href="#" onClick="return mostrarPanel('participacion', this)" id="tabParticipacion">Participación</a></li> -->
<!-- 								<li><a href="#" onClick="return mostrarPanel('distribucion', this)" id="tabDistribucion">Distribución</a></li> -->
<!-- 							</ul> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
				<div>
					<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
						<jsp:param name="instrumentoForm" value="cPdtsForm" />
						<jsp:param name="pageName" value="convenioModificar" />
						<jsp:param name="tipoPantalla" value="input" />
					</jsp:include>
				</div>
		</logic:equal>

		<logic:equal property="accion" value="confirmar" name="cPdtsForm">
		
			<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
				<jsp:param name="instrumentoForm" value="cPdtsForm" />
				<jsp:param name="pageName" value="convenioCfm" />
				<jsp:param name="tipoPantalla" value="view" />
			</jsp:include>
		</logic:equal>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="detalle" name="cPdtsForm">
</logic:equal>

<logic:equal property="valueEAccion" value="inhabilitar" name="cPdtsForm">
	<br>
	<logic:equal property="estado" value="Deshabilitado" name="cPdtsForm">
		<h1 align="center" class="titulo">Habilitación de Pdts</h1>
	</logic:equal>
	<logic:notEqual property="estado" value="Deshabilitado" name="cPdtsForm">
		<h1 align="center" class="titulo">Deshabilitación dePdts</h1>
	</logic:notEqual>
	<html:form method="post" styleId="instrumentoForm" action="cPdtsHabilitarAction.do" enctype="multipart/form-data">
		<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
			<jsp:param name="instrumentoForm" value="cPdtsForm" />
			<jsp:param name="pageName" value="convenioHabilitar" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="eliminar" name="cPdtsForm">
	<br>
	<h1 align="center" class="titulo">Eliminación de Pdts</h1>
	
	<html:form method="post" styleId="cPdtsForm" action="cPdtsEliminarAction.do" enctype="multipart/form-data">
		<tr>
			<td align="center">
				<h2 class="mensajeSuperior">
					Está a punto de eliminar, presione 'Grabar' para confirmar
				</h2>
			</td>
		</tr>
		<jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
			<jsp:param name="instrumentoForm" value="cPdtsForm" />
			<jsp:param name="pageName" value="cnovenioEliminar" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
	</html:form>
</logic:equal>