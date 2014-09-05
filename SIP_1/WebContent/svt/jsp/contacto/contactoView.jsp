<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<bean:define id="contactoForm" name='<%= request.getParameter("contactoForm") %>' />
<bean:define id="accion" value='<%= request.getParameter("accion") %>' />

<script type="text/javascript">
</script>

<html:hidden property="accion" styleId="accion" name="contactoForm" />
<div>

	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="2">
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Contacto:&nbsp;</td>
					</tr>
				</table>
		<tr>
			<td height="10" colspan="10"></td>
		</tr>
		<tr>
			<td>
				<table align="left" cellpadding="0" cellspacing="0" >
					<tr>
						<td class="CformNombre">Nombre: </td>
						<td class="CformDato" colspan="3"><bean:write name="contactoForm" property="nombre"/></td>
					</tr>
					
					<tr>
						<td class="CformNombre">Apellido: </td>
						<td class="CformDato" colspan="3"><bean:write name="contactoForm" property="apellido"/></td>
					</tr>
					
					<tr>
						<td class="CformNombre">Teléfono: </td>
						<td class="CformDato" colspan="3"><bean:write name="contactoForm" property="telefono"/></td>
					</tr>
					
					<tr>
						<td class="CformNombre">Email: </td>
						<td class="CformDato" colspan="3"><bean:write name="contactoForm" property="email"/></td>
					</tr>
					
					<tr>
						<td class="CformNombre">Cargo: </td>
						<td class="CformDato" colspan="3"><bean:write name="contactoForm" property="cargo" /></td>
					</tr>
					
					<tr>
						<td class="CformNombre">Organismo Relacionado: </td>
						<td class="CformDato" colspan="3">
							<capplication:autoCompleteView name = "contactoForm" tipoAutocomplete="OtroOrganismo"/>
						</td>
					</tr>			
				
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td class="CformAreaBotones">
							
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario"
										value='<%=request.getParameter("contactoForm")%>' />
									<jsp:param name="entidad" value='contacto' />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>

