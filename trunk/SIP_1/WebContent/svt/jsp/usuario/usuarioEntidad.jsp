<%@page import="conicet.apps.svt.web.usuario.form.CUsuarioForm"%>
<%@include file="/jsp/layout/include.jsp"%>
<br />

<bean:define id="tipoPantalla" value='<%=request.getParameter("tipoPantalla")%>' />
<bean:define id="formulario" name='<%=request.getParameter("form")%>' />
<script>
	function cambiarEntidadSectorUvt() {
		 submitAction("?method=cambioDeRol");
	}
</script>

<logic:equal value="input" name="tipoPantalla">
	<div id="usuarioSvt">
		<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2">
					<table align="center" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td height="10" colspan="10"></td>
						</tr>
						<tr>
							<td>
								<table width="100%" cellpadding="2" cellspacing="2">
									<tr>
										<td class="CformNombre" width="120">Rol:<span class="dato_obligatorio">*</span></td>
										<td class="CformDato"><html:select styleId="rol" property="rol" onchange="cambiarEntidadSectorUvt()">
												<html:options collection="comboRolAsigna" property="value" labelProperty="label" />
											</html:select></td>
									</tr>
									<logic:notEmpty name="formulario" property="tipoUsuarioRelacion">
										<tr>
											<td class="CformNombre" width="120">Usuario:<span class="dato_obligatorio">*</span></td>
											<td class="CformDato"><capplication:autoComplete name="formulario" tipoAutocomplete="Usuario" /></td>
										</tr>
										<tr>
											<td class="CformNombre" width="120"><bean:write name="formulario" property="tipoUsuarioRelacionString" /><span class="dato_obligatorio">*</span>:</td>
											<td class="CformDato"><logic:equal value="<%=CUsuarioForm.ETipoUsuarioRelacion.Gestor.name()%>" name="formulario" property="tipoUsuario">
													<logic:equal value="true" name="formulario" property="entidadGestorSeleccionable">
														<capplication:autoComplete name="formulario" tipoAutocomplete="Gestor" />
													</logic:equal>
													<logic:equal value="false" name="formulario" property="entidadGestorSeleccionable">
														<capplication:autoCompleteView name="formulario" tipoAutocomplete="Gestor" />
													</logic:equal>
												</logic:equal> <logic:equal value="<%=CUsuarioForm.ETipoUsuarioRelacion.Entidad.name()%>" name="formulario" property="tipoUsuario">
													<logic:equal value="true" name="formulario" property="entidadGestorSeleccionable">
														<capplication:autoComplete name="formulario" tipoAutocomplete="Entidad" />
													</logic:equal>
													<logic:equal value="false" name="formulario" property="entidadGestorSeleccionable">
														<capplication:autoCompleteView name="formulario" tipoAutocomplete="Entidad" />
													</logic:equal>
												</logic:equal></td>
										</tr>
									</logic:notEmpty>
								</table>
							</td>
							<td width="40" rowspan="100"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="CformAreaBotones" height="35">
					<div align="right">
						<jsp:include page="/jsp/layout/botones.jsp">
							<jsp:param name="formulario" value='<%=request.getParameter("form")%>' />
							<jsp:param name="entidad" value="factura" />
						</jsp:include>
					</div>
				</td>
			</tr>
		</table>
		<div>
</logic:equal>

<logic:equal value="view" name="tipoPantalla">
	<div id="usuarioSvt">
		<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2">
					<table align="center" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td height="10" colspan="10"></td>
						</tr>
						<tr>
							<td>
								<table width="100%" cellpadding="2" cellspacing="2">
									<tr>
										<td class="CformNombre" width="120">Rol:</td>
										<td class="CformDato"><bean:write name="formulario" property="rol" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="120">Usuario:</td>
										<td class="CformDato"><capplication:autoCompleteView name="formulario" tipoAutocomplete="Usuario" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="120"><bean:write name="formulario" property="tipoUsuarioRelacionString" />:</td>
										<td class="CformDato"><logic:equal value="<%=CUsuarioForm.ETipoUsuarioRelacion.Gestor.name()%>" name="formulario" property="tipoUsuario">
												<capplication:autoCompleteView  name="formulario" tipoAutocomplete="Gestor" />
											</logic:equal> <logic:equal value="<%=CUsuarioForm.ETipoUsuarioRelacion.Entidad.name()%>" name="formulario" property="tipoUsuario">
												<capplication:autoCompleteView name="formulario" tipoAutocomplete="Entidad" />
											</logic:equal></td>
									</tr>
								</table>
							</td>
							<td width="40" rowspan="100"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="CformAreaBotones" height="35">
					<div align="right">
						<jsp:include page="/jsp/layout/botones.jsp">
							<jsp:param name="formulario" value='<%=request.getParameter("form")%>' />
							<jsp:param name="entidad" value="factura" />
						</jsp:include>
					</div>
				</td>
			</tr>
		</table>
	</div>
</logic:equal>
