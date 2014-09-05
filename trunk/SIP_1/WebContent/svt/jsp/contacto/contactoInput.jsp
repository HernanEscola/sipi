<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
	media="screen, print" />
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	

<bean:define id="contactoForm"
	name='<%=request.getParameter("contactoForm")%>' />


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
				<table width="100%" cellpadding="2" cellspacing="2">
					<tr>
						<td class="CformNombre">Nombre:<span class="dato_obligatorio">*</span></td>
						<td class="CformDato" colspan="3">
							<html:text property="nombre" maxlength="60" size="60" styleId="nombre"/>
						</td>
					</tr>
					
					<tr>
						<td class="CformNombre">Apellido:<span class="dato_obligatorio">*</span></td>
						<td class="CformDato" colspan="3">
							<html:text property="apellido" maxlength="60" size="60" styleId="apellido"/>
						</td>
					</tr>
					
					<tr>
						<td class="CformNombre">Teléfono:<span class="dato_obligatorio">*</span></td>
						<td class="CformDato" colspan="3">
							<html:text property="telefono" maxlength="50" size="60" styleId="telefono"/>
						</td>
					</tr>
					
					<tr>
						<td class="CformNombre">Email:</td>
						<td class="CformDato" colspan="3">
							<html:text property="email" maxlength="30" size="60" styleId="email"/>
						</td>
					</tr>
					
					<tr>
						<td class="CformNombre">Cargo:</td>
						<td class="CformDato" colspan="3">
							<html:text property="cargo" maxlength="60" size="60" styleId="cargo"/>
						</td>
					</tr>
					
						<td class="CformNombre">Organismo relacionado: <span class="dato_obligatorio">*</span></td>
						<td class="CformDato">	
						<capplication:autoComplete tipoAutocomplete="OtroOrganismo"/></td>
	
				
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td class="CformAreaBotones">
							<div align="left">
									<span class="dato_obligatorio">* Datos Obligatorios </span>
							 </div>
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