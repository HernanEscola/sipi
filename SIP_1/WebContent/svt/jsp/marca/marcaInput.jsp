<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
	media="screen, print" />
	<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>

<bean:define id="marcaForm"
	name='<%=request.getParameter("marcaForm")%>' />

<script>
	$(document).ready(function() {
		agregarObligatorioSN();
		generarCombos("",null,"<%=CConstantes.paisArgentina%>");
	});
</script>

<html:hidden property="accion" styleId="accion" name="marcaForm" />


<div>

	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="2">
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Marca:&nbsp;</td>
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
							<html:text property="nombre" maxlength="70" size="70" styleId="nombre"/>
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
										value='<%=request.getParameter("marcaForm")%>' />
									<jsp:param name="entidad" value='marca' />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>