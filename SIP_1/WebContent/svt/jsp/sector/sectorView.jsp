<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<bean:define id="sectorForm" name='<%= request.getParameter("sectorForm") %>' />
<bean:define id="accion" value='<%= request.getParameter("accion") %>' />

<script type="text/javascript">
</script>

<html:hidden property="accion" styleId="accion" name="sectorForm" />
<div>

	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="2">
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Sector:&nbsp;</td>
					</tr>
				</table>
		<tr>
			<td height="10" colspan="10"></td>
		</tr>
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="CformNombre">Descripción: </td>
						<td class="CformDato" colspan="3"><bean:write name="sectorForm" property="descripcion" /></td>
					</tr>
					
					<tr>
						<td class="CformNombre">Sigla: </td>
						<td class="CformDato" colspan="3"><bean:write name="sectorForm" property="sigla" /></td>
					</tr>
					
					<tr>
						<td class="CformNombre">Email: </td>
						<td class="CformDato" colspan="3"><bean:write name="sectorForm" property="email" /></td>
					</tr>
					
					<tr>
						<td class="CformNombre">Estado: </td>
						<td>
					    <html:select disabled="true" property="habilitado">
                        	<html:options collection="comboHabilitado" property="value" labelProperty="label" />
                        </html:select>
                      	<html:hidden property="habilitado" /></td>
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
										value='<%=request.getParameter("sectorForm")%>' />
									<jsp:param name="entidad" value='sector' />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>

