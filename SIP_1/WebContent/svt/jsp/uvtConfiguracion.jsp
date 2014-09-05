<%@include file="layout/include.jsp"%>
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>
<script>
</script>

<br>
<h1 align="center" class="titulo">Configuración de la Unidad</h1>

<html:form action="cConfiguracionUvtAction.do" method="POST">


	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>

							<table align="left" width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td class="CformNombre" width="35%">Tipo:&nbsp;&nbsp;</td>
									<td class="CformDato"><bean:write
											name="cConfiguracionUvtActionForm" property="tipoUvt" /></td>
								</tr>
								<tr>

									<td class="CformNombre" width="35%">Depende de:&nbsp;&nbsp;</td>
									<td class="CformDato"><bean:write
											name="cConfiguracionUvtActionForm" property="central" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="35%">Sigla:&nbsp;&nbsp;</td>
									<td class="CformDato"><bean:write
											name="cConfiguracionUvtActionForm" property="sigla" />
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="35%">Denominaci&oacute;n:&nbsp;&nbsp;</td>
									<td class="CformDato"><bean:write
											name="cConfiguracionUvtActionForm" property="denominacion" /></td>
								</tr>
								<tr>
								<tr>
									<td class="CformNombre" width="35%" >Código Pto. Venta:<span class="dato_obligatorio">*</span></td>
									<td class="CformDato">
									<html:text property="codigoFactura" maxlength="4"></html:text></td>
								</tr>
							</table>
						</td>
					</tr>

					<tr>
						<td class="CformAreaBotones" height="21">
						<span class="dato_obligatorio">* Datos obligatorios</span>
							<div align="right">
								<html:submit property="method" styleClass="CformBoton"
									value="Grabar" styleId="modificacionBoton" />
								<html:submit property="btnSubmit" styleClass="CformBoton"
									value="Volver" onclick="habilitarCampos()" />
							</div>
						</td>
					</tr>
				</table>
			</td>

		</tr>
	</table>

</html:form>
