<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
	media="screen, print" />
	<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>

<bean:define id="proveedorForm"
	name='<%=request.getParameter("proveedorForm")%>' />


<script>
	$(document).ready(function() {
		   var input = new CInputNumero(false); // si false verifica que sea un nro. y NO lo trata como un importe
		   input.bind("input[id='cuitPrefijo']");//selector de jquery
		   input.bind("input[id='cuitNumero']");//selector de jquery 
		   input.bind("input[id='cuitSufijo']");//selector de jquery

		
		
		var tipoNeEs = $("#tipoNE").val();
		if(tipoNeEs == 'E') {
			  $("#cuitSufijo").attr('disabled', true);  
			  $("#cuitPrefijo").attr('disabled', true);  
			  $('#cuitNumero').attr('disabled', true); 
		}
		$("#tipoNE").change(function(e) {
				
				habilitarCuit();
				//mostrarFechasEjecucionObligatorio();
		});	
		
	});
	
	
	
	

	function habilitarCuit(){
	  var tipoNeEs = $("#tipoNE").val();
	  
	  if(tipoNeEs == 'N') {
	      $('#cuitSufijo').removeAttr('disabled');
	      $('#cuitPrefijo').removeAttr('disabled');
	      $('#cuitNumero').removeAttr('disabled');
	  }
	  else{
		  $("#cuitSufijo").attr('disabled', true);  
		  $("#cuitPrefijo").attr('disabled', true);  
		  $('#cuitNumero').attr('disabled', true);  
	  } 
	  
	}  
	
	
	
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
				<table width="100%" cellpadding="2" cellspacing="2">
					<tr>
						<td class="CformNombre">Razón Social:<span class="dato_obligatorio">*</span></td>
						<td class="CformDato" colspan="3">
							<html:text property="descripcion" maxlength="80" size="80" styleId="descripcion"/>
						</td>
					</tr>
					<tr>
						<td class="CformNombre">Tipo:&nbsp;<span class="dato_obligatorio">*</span>
						</td>
						<td class="CformDato">
						 <html:select property="tipoNE" styleId="tipoNE" onchange="habilitarCuit()" >
						 <html:options collection="comboNESeleccionar" property="value" labelProperty="label"  />
						 </html:select>
				
						</td>
					</tr>										
				
					<tr>
						<td class="CformNombre">CUIT / CUIL:&nbsp;<span class="dato_obligatorio">(1)</span>
						</td>
						<td class="CformDato">
																<div id="cuit">
																	<!--  <html:text property="cuit"/></td-->
																	<!--El cuit Prefijo, número y sufijo sirve tanto para cuit como para cuil-->
																	<html:text styleId="cuitPrefijo" property="cuitPrefijo" maxlength="2" size="2" onkeypress="validarNumero()" />
																	-
																	<html:text styleId="cuitNumero" property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()" />
																	-
																	<html:text styleId="cuitSufijo" property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()" />
																	
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
							<div align="left">
									<span class="dato_obligatorio">* Datos Obligatorios </span>
							 </div>
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
	
	<table>			
			<tr>
			<td>
				
				<div id="formEmpresaLeyenda">
					<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
						<tr>
							<td><span class="dato_obligatorio">(1)</span> Cuit obligatorio si el Tipo de Proveedor es Nacional </td>
						</tr>
					</table>

				</div>
				</td>
				</tr>
	</table>
</div>