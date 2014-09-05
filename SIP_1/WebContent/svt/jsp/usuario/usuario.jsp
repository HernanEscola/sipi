<%@include file="/jsp/layout/include.jsp"%>
<br />
 

<h1 align="center" class="titulo">
	<bean:write name="cUsuarioForm" property="titleNameEAccion" />
	de Asignación de Rol
</h1>

<logic:equal property="valueEAccion" value="alta" name="cUsuarioForm">
	<html:form method="post" styleId="cUsuarioForm" action="cUsuarioAltaAction.do" enctype="multipart/form-data">
		<html:hidden property="accion" />
		<logic:equal property="accion" value="alta" name="cUsuarioForm">
			<div>
				<jsp:include page="/jsp/usuario/usuarioEntidad.jsp">
					<jsp:param name="form" value="cUsuarioForm" />
					<jsp:param name="pageName" value="usuarioAlta" />
					<jsp:param name="tipoPantalla" value="input" />
				</jsp:include>
			</div>
		</logic:equal>

		<logic:equal property="accion" value="confirmar" name="cUsuarioForm">

			<jsp:include page="/jsp/usuario/usuarioEntidad.jsp">
				<jsp:param name="form" value="cUsuarioForm" />
				<jsp:param name="pageName" value="usuarioCfm" />
				<jsp:param name="tipoPantalla" value="view" />
			</jsp:include>
		</logic:equal>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="modificar" name="cUsuarioForm">
	<html:form method="post" styleId="cUsuarioForm" action="cUsuarioModificarAction.do" enctype="multipart/form-data">
		<html:hidden property="accion" />

		<logic:equal property="accion" value="modificar" name="cUsuarioForm">
			<div>
				<jsp:include page="/jsp/usuario/usuarioEntidad.jsp">
					<jsp:param name="form" value="cUsuarioForm" />
					<jsp:param name="pageName" value="usuarioModificar" />
					<jsp:param name="tipoPantalla" value="input" />
				</jsp:include>
			</div>
		</logic:equal>

		<logic:equal property="accion" value="confirmar" name="cUsuarioForm">
			<jsp:include page="/jsp/usuario/usuarioEntidad.jsp">
				<jsp:param name="form" value="cUsuarioForm" />
				<jsp:param name="pageName" value="usuarioCfm" />
				<jsp:param name="tipoPantalla" value="view" />
			</jsp:include>
		</logic:equal>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="detalle" name="cUsuarioForm">
	<html:form method="post" styleId="usuarioForm" action="cUsuarioDetalleAction.do" enctype="multipart/form-data">
		<jsp:include page="/jsp/usuario/usuarioEntidad.jsp">
			<jsp:param name="form" value="cUsuarioForm" />
			<jsp:param name="pageName" value="usuarioDetalle" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="eliminar" name="cUsuarioForm">
	<html:form method="post" styleId="usuarioForm" action="cUsuarioEliminarAction.do" enctype="multipart/form-data">
		<jsp:include page="/jsp/usuario/usuarioEntidad.jsp">
			<jsp:param name="form" value="cUsuarioForm" />
			<jsp:param name="pageName" value="usuarioEliminar" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="inhabilitar" name="cUsuarioForm">
	<html:form method="post" styleId="usuarioForm" action="cUsuarioHabilitarAction.do" enctype="multipart/form-data">
		<jsp:include page="/jsp/usuario/usuarioEntidad.jsp">
			<jsp:param name="form" value="cUsuarioForm" />
			<jsp:param name="pageName" value="usuarioHabilitar" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
	</html:form>
</logic:equal>

<logic:equal property="valueEAccion" value="habilitar" name="cUsuarioForm">
	<html:form method="post" styleId="usuarioForm" action="cUsuarioHabilitarAction.do" enctype="multipart/form-data">
		<jsp:include page="/jsp/usuario/usuarioEntidad.jsp">
			<jsp:param name="form" value="cUsuarioForm" />
			<jsp:param name="pageName" value="usuarioHabilitar" />
			<jsp:param name="tipoPantalla" value="view" />
		</jsp:include>
	</html:form>
</logic:equal>