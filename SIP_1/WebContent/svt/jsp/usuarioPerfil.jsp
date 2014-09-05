<%@include file="layout/include.jsp"%>
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>
<script>

var modificar;

function modificarPerfil()
{
	if (modificar == 0) {
		$("[id^=detalle]").hide();
		$("[id^=modificacion]").show();
		$("[id^=modificarEmail]").removeAttr('disabled');
		$("#nuevoEmailPerfil").removeAttr('disabled');
		modificar = 1;
		document.cUsuarioPerfilActionForm.modificando.value = true;
	} else {
		$("[id^=detalle]").show();
		$("[id^=modificacion]").hide();
		$("[id^=modificarEmail]").attr('disabled', true);
		$("#nuevoEmailPerfil").attr('disabled', true);
		modificar = 0;
	}
	
}

function inicializarPerfil()
{
	if(document.cUsuarioPerfilActionForm.modificarEmailPredeterminado.checked)
	{
		$("#nuevoEmailPerfil").hide();
	}
	if(document.cUsuarioPerfilActionForm.modificarEmailPerfil.checked)
	{
		$("#nuevoEmailPerfil").show();
		
	}
}

function descargar()
{
	$.ajax({
		// try to leverage ajaxQueue plugin to abort previous requests
		type: "POST",
        url:"cUsuarioPerfilAction.do?method=init",
        data: "qq=download_file",
		success: function(data) {
			alert("descargando");
		}
	});
}

function descargar2()
{
	$.ajax({
		// try to leverage ajaxQueue plugin to abort previous requests
		type: "POST",
        url:"cUsuarioPerfilAction.do?method=init",
		success: function(data) {
			alert("descargando2");
		}
	});
}

$(document).ready(function() {
	

	if(document.cUsuarioPerfilActionForm.modificando.value == "true")
	{// si se esta modificando le pongo valor 0 para q lo ponga en modificar
		modificar = 0;
	}
	else
		modificar = 1;
	
	inicializarPerfil();
	modificarPerfil();
	

});

</script>

<style type="text/css">

</style>

<br>
<div id="detalleTitulo">
	<h1 align="center" class="titulo">Detalle del Perfil del Usuario</h1>
</div>

<div id="modificacionTitulo" style="display: none;">
	<h1 align="center" class="titulo">Modificacion del Perfil del
		Usuario</h1>
</div>

<html:form action="cUsuarioPerfilAction.do" method="POST" enctype="multipart/form-data">
	<html:hidden property="modificando" />

	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>

							<table align="left" width="100%" cellpadding="2" cellspacing="2">

								<tr>
									<td class="CformNombre" width="35%" height="15">Nombre :
										&nbsp;</td>
									<td class="CformDato" height="15"><bean:write
											name="cUsuarioPerfilActionForm" property="nombre" /></td>

								</tr>
								<tr>
									<td class="CformNombre" width="35%">CUIT/CUIL : &nbsp;</td>
									<td class="CformDato"><bean:write
											name="cUsuarioPerfilActionForm" property="cuit" /></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>

							<table align="left" width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td height="10"></td>
								</tr>
								<tr bgcolor="#DDEEFF">
									<td colspan="2" width="100%"><strong>Email para
											comunicaciones</strong>
									</td>
								</tr>
								<tr>
									<td height="10"></td>
								</tr>

							</table></td>
					</tr>
					<tr>
						<td>
							<table align="left" width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td class="CformNombre" width="35%" height="15">Usar email
										Predeterminado :&nbsp;</td>
									<td height="15" width="10"><html:radio
											styleId="modificarEmailPredeterminado"
											property="usarEmailPerfil" value="I" onchange="inicializarPerfil()"/></td>
									<td class="CformDato" height="15"><bean:write
											name="cUsuarioPerfilActionForm" property="email" /></td>

								</tr>
								<tr>
									<td class="CformNombre" width="35%">Otro :&nbsp;</td>
									<td><html:radio styleId="modificarEmailPerfil"
											property="usarEmailPerfil" value="N" onchange="inicializarPerfil()"/></td>
									<td class="CformDato"><html:text
											styleId="nuevoEmailPerfil" property="emailPerfil" /></td>
								</tr>
								
							</table></td>
					</tr>
					<tr>
						<td class="CformAreaBotones" height="21">
							<div align="right">
								<button id="detalleBoton" class="CformBoton" onclick="modificarPerfil()"
									 type="button">Modificar</button>
								<html:submit property="method" styleClass="CformBoton"
									value="Grabar" styleId="modificacionBoton"/>
								<html:submit property="btnSubmit" styleClass="CformBoton"
									value="Volver" onclick="habilitarCampos()" />
							</div></td>
					</tr>

					<tr>
						<td></td>
					</tr>
				</table></td>

		</tr>
	</table>
	
</html:form>
