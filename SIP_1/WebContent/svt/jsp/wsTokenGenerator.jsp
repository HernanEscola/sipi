<%@include file="layout/include.jsp"%>
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>
<script>

var modificar;

function generarToken()
{
	var val = $("#ws_id").val();
		$.ajax({
					url : document.forms[0].action + "?method=generar Token",
					type : 'POST',
					dataType : "json",
					data : {
						match : val
					},
					success : function(data) {
						$("#token_id").text(data.value);
					},
					timeout : function() {
						$("#token_id").text("### TimeOut ERROR! ###");
					},
					error : function() {
						$("#token_id").text("### ERROR! ###");
					}
				});
}

</script>

<style type="text/css">
</style>

<br>
<div id="detalleTitulo">
	<h1 align="center" class="titulo">Generar Clave del Servicio Web</h1>
</div>

<html:form action="cWSTokenGeneratorAction.do" method="POST" enctype="multipart/form-data">
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>

							<table align="left" width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td height="15" colspan="2" align="center" width="100%" >Seleccione el Servicio Web y el Sistema le proporcionará la clave para este.&nbsp;</td>
									
								</tr>
								<tr>
									<td class="CformNombre" width="35%" height="15">Servicio Web: &nbsp;</td>
									<td class="CformDato" height="15"><html:select styleId="ws_id" property="wsSeleccionado" style=" width:500px" onchange="generarToken()">
											<html:options name="form" collection="comboTipoWS" property="value" labelProperty="label" />
										</html:select>
									</td>

								</tr>
								<tr>
									<td class="CformNombre" width="35%">Clave: &nbsp;</td>
									<td class="CformDato"><label id="token_id" style="color:#FF9999;"><bean:write name="cWSTokenGeneratorForm" property="token" />
									</label></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="CformAreaBotones" colspan="10">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cWSTokenGeneratorForm" />
									<jsp:param name="entidad" value="ws" />
								</jsp:include>
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
			</td>

		</tr>
	</table>

</html:form>
