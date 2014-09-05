<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
	media="screen, print" />
	<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>

<bean:define id="unidadPrestacionForm"
	name='<%=request.getParameter("unidadPrestacionForm")%>' />

<script>
	$(document).ready(function() { });
</script>

<html:hidden property="accion" styleId="accion" name="unidadPrestacionForm" />


<div>
	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="2">
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Unidad de Prestación:&nbsp;</td>
					</tr>
				</table>
		<tr>
			<td height="10" colspan="10"></td>
		</tr>
		<tr>
			<td>
				<table width="100%" cellpadding="2" cellspacing="2">
					<tr>
						<td class="CformNombre">Descripción:<span class="dato_obligatorio">*</span></td>
						<td class="CformDato" colspan="3">
							<html:text property="descripcion" maxlength="100" size="80" styleId="descripcion"/>
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
										value='<%=request.getParameter("unidadPrestacionForm")%>' />
									<jsp:param name="entidad" value='unidadPrestacion' />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>