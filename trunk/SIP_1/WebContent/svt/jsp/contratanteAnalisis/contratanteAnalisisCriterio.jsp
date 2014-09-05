<!--  DEBO AGREGAR LIBRERIAS Y STRUTS NECESARIOS PARA EL CRITERIO DE BUSQUEDA -->


<%@include file="/jsp/layout/include.jsp"%>

<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>
<script language="JavaScript1.2" src="./js/contratante.js"></script>
<script language="JavaScript1.2" src="./js/contratanteBuscar.js"></script>

<!-- DESDE AQUI, TABLE CON CAMPOS DEL CRITERIO DE BUSQUEDA.  -->

<script>
$(document).ready(function() {
	var opciones = {"desde":"id_fecha_alta_desde","hasta":"id_fecha_alta_hasta"};
	new CPeriodoPicker(opciones);
	var input = new CInputNumero(false);
	input.bind("#montoDesde");//selector de jquery
	input.bind("#montoHasta");//selector de jquery
	
	documentReady('cContratanteAnalisisBuscarAction.do?method=preparar Combo Tipo Persona Juridica');
	   
});
</script>

<table align="center" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0">
		      	<tr>
	                <td class="CformNombre" width="200">Nombre / Razón Social: </td>
	                <td class="CformDato" ><html:text property="descripcionBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>

		      	<tr>
	                <td class="CformNombre" width="200">CUIT: </td>
	                <td class="CformDato" ><html:text property="cuitBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>
				
				<tr>
	                <td class="CformNombre" width="200">DNI: </td>
	                <td class="CformDato" ><html:text property="documentoBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>
		      	
		      	<tr>
	                <td class="CformNombre" width="200">Nombre de Fantasía: </td>
	                <td class="CformDato" ><html:text property="nombreFantasia"  maxlength="60" size="50" /></td>
		      	</tr>
		      	<tr>
					<td class="CformNombre" width="220">Nacionalidad:</td>
						<td class="CformDato">
							<html:select styleId="nacionalidadPJId" property="nacionalidadPJId">
								<html:options collection="comboNacionalidadPersonaJuridica" property="value" labelProperty="label" filter="false" />
							</html:select>
							<html:select styleId="clasificacionPJId" property="clasificacionPJId">
								<html:options collection="comboClasificacionPersonaJuridica" property="value" labelProperty="label" filter="false" />
							</html:select>
							<html:select styleId="tipoPJId" property="tipoPJId">
								<html:options collection="comboTipoPersonaJuridica" property="value" labelProperty="label" filter="false" />
							</html:select>
						</td>
				</tr>
				<tr id="denominacionRow">
					<td class="CformNombre">Denominación:&nbsp; </td>

					<td class="CformDato">
						<html:text styleId="denominacion" property="denominacion" size="60" />
					</td>
				</tr>
                </tr>
				<tr>
					<td class="CformNombre" width="220">Campo Aplicación:</td>
					<td class="CformDato"><html:select property="campoAplicacionId" style=" width:360px;">
							<html:options collection="comboCampoAplicacion" property="value" labelProperty="label" filter="false" />
						</html:select>
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Actividad Industrial:</td>
					<td class="CformDato"><html:select property="actividadIndustrialId" style=" width:360px;">
							<html:options collection="comboActividadIndustrial" property="value" labelProperty="label" filter="false" />
						</html:select>
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="200">Estado: </td>
	                <td class="CformDato">
	                <html:select disabled="false" property="tipoEstadoBusqueda">
	                    <html:options name="cContratatanteBuscarActionForm" collection="comboEstado" property="value" labelProperty="label"/>
	                  </html:select>
	                </td>
	            </tr>
                <tr width="60%">
                	<td class="CformNombre">Fecha Alta Desde:</td>
                	
                	<td class="CformDato">
                    <table width="100%">
                    <tr>
	                    <td	class="CformDato">
							<html:text styleId="id_fecha_alta_desde" size="10" property="fechaAltaDesde" maxlength="10" /> 
		                </td>
	                    <td class="CformNombre">Hasta:</td>
	                    <td class="CformDato">
							<html:text styleId="id_fecha_alta_hasta" size="10" property="fechaAltaHasta" maxlength="10"/> 
	                    </td>
                    </tr>
                    </table>
                    </td>
                </tr>
				
				<!-- Agregar el resto de los campos de búsqueda -->
				
			</table>
		</td>
	</tr>
</table>


