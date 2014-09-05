<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<bean:define id="proveedorForm" name='<%= request.getParameter("proveedorForm") %>' />
<bean:define id="accion" value='<%= request.getParameter("accion") %>' />

<script type="text/javascript">
</script>

<html:hidden property="accion" styleId="accion" name="proveedorForm" />
<div>

	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="2">
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Proveedor:&nbsp;</td>
					</tr>
				</table>
		<tr>
			<td height="10" colspan="10"></td>
		</tr>
		<tr>
			<td>
				<table align="left" cellpadding="0" cellspacing="0">
					<tr>
						<td class="CformNombre">Razón Social:</td>
						<td class="CformDato" colspan="3"><bean:write name="proveedorForm" property="descripcion"/>
						</td>
					</tr>
					<tr>
						<td class="CformNombre">Tipo:&nbsp;
						</td>
						<td class="CformDato">
						 <html:select property="tipoNE" styleId="tipoNE" disabled="true">
						 <html:options collection="comboNESeleccionar" property="value" labelProperty="label"  />
						 </html:select>
				
						</td>
					</tr>										
				
					<tr>
						<td class="CformNombre">CUIT / CUIL:&nbsp;
						</td>
						<td class="CformDato">
																<div id="cuit">
																	<!--  <html:text property="cuit"/></td-->
																	<!--El cuit Prefijo, número y sufijo sirve tanto para cuit como para cuil-->
																	<bean:write name="proveedorForm" property="cuitPrefijo"/>
																	-
																	<bean:write name="proveedorForm" property="cuitNumero" />
																	-
																	<bean:write name="proveedorForm" property="cuitSufijo" />
																	
						</div></td>
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
										value='<%=request.getParameter("proveedorForm")%>' />
									<jsp:param name="entidad" value='proveedor' />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>

