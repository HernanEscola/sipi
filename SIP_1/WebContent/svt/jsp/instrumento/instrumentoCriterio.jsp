<!--  DEBO AGREGAR LIBRERIAS Y STRUTS NECESARIOS PARA EL CRITERIO DE BUSQUEDA -->


<%@include file="/jsp/layout/include.jsp"%>

<!-- DESDE AQUI, TABLE CON CAMPOS DEL CRITERIO DE BUSQUEDA.  -->

<script>
$(document).ready(function() {
	  var opciones = {"desde":"id_fechaDesde","hasta":"id_fechaHasta"};
	  var x = new CPeriodoPicker(opciones);
	  var input = new CInputNumero(false);
 	   input.bind("#montoDesde");//selector de jquery
 	   input.bind("#montoHasta");//selector de jquery
 	  input.bind("#id_numero_tramite");
 	  input.bind("#id_pcti_nro");
 	 input.bind("#codigo");
	   
});

$(function() {
	$("#autocomplete-interviniente").autocomplete({
		delay: 500,
		minLength: 3,
		source: function(request, response) {
			$.getJSON("cInstrumentoBuscarAction.do?method=getIntervinientes", {
				key: encodeURIComponent(request.term)
			}, function(data) {
				response( $.map( data, function( item ) {
			           return {
							label: item.name,
							name: item.id,
			             value: item.name
			           };
			         }));
			});
		},
		focus: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
		},
		select: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// navigate to the selected item's url
			window.open(ui.item.url);
		}
	});
});
</script>
<bean:define id="form" name="cInstrumentoBuscarActionForm" />

<table align="center" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="CformNombre" width="220">Fecha de ingreso DVTS Desde:</td>
					<td class="CformDato"><html:text styleId="id_fechaDesde" property="fechaDesdeIngreso" size="10" maxlength="10" />
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Fecha de ingreso DVTS Hasta:</td>
					<td class="CformDato"><html:text styleId="id_fechaHasta" property="fechaHastaIngreso" size="10" maxlength="10" />
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Año:</td>
					<td class="CformDato"><html:select styleId="añoId" property="añoTramite">
							<html:options name="form" collection="comboAños" property="value" labelProperty="label" />
						</html:select>
					</td>
				</tr>
				
				<tr>
					<td class="CformNombre" width="220">Número de Proyecto:</td>
					<td class="CformDato"><html:text property="codigo" size="8" maxlength="8" styleId="codigo" />
				</tr> 
				
				<tr>
					<td class="CformNombre" width="220">Numero de Trámite:</td>
					<td class="CformDato"><html:text property="nroTramite" size="7" maxlength="6" styleId="id_numero_tramite"/>
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Numero de PCTI:</td>
					<td class="CformDato"><html:text property="pctiNro" size="7" maxlength="6" styleId="id_pcti_nro"/>
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Estado:</td>
					<td class="CformDato">
					 <logic:notEqual value="seguimiento" property="tipoBusqueda" name="form" >
						<html:select property="estado">
							<html:options name="form" collection="comboEstados" property="value" labelProperty="label" />
						</html:select>
					 </logic:notEqual>
					 <logic:equal value="seguimiento" property="tipoBusqueda" name="form" >
						<html:select property="estadoMultiple" multiple="true">
							<html:options name="form" collection="comboEstados" property="value" labelProperty="label" />
						</html:select>					  
					 </logic:equal>
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Responsable:</td>
					<td class="CformDato"><html:select styleId="responsableId" disabled="false" property="responsableDescripcion">
							<html:options name="formulario" collection="comboResponsablesConvenio" property="value" labelProperty="label" />
						</html:select>
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Prestador:</td>
					<td class="CformDato"><html:text property="prestadorDescripcion" size="50" maxlength="50" />
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Parte:</td>
					<td class="CformDato"><html:text property="parteDescripcion" size="50" maxlength="50" />
					</td>
				</tr>
				<!-- en pdtsBuscar por default trae listado de pdts -->
				 <logic:notEqual value="pdts" property="tipoBusqueda" name="form" >
					<tr>
						<td class="CformNombre" width="220">PDTS:</td>
						<td class="CformDato"><html:checkbox property="esPdt" />
						</td>
					</tr>
				</logic:notEqual>
					<tr>
					<td class="CformNombre" width="220">Título PDTS:</td>
					<td class="CformDato"><html:text property="tituloPdts" size="50" maxlength="50" />
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Participante:</td>
					<td class="CformDato"><html:text property="participanteDescripcion" size="50" maxlength="50" />
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Objeto:</td>
					<td class="CformDato"><html:text property="objeto" size="50" maxlength="50" />
					</td>
				</tr>
				
				<tr>
					<td class="CformNombre" width="220">Expediente:</td>
					<td class="CformDato"><html:text styleId="id_numeroResolucion" property="numeroExpediente" style="text-align: right;" size="8" maxlength="8" /> / <html:select property="añoExpediente">
							<html:options collection="comboAños" property="value" labelProperty="label" />
						</html:select></td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Resolución:</td>
					<td class="CformDato"><html:text styleId="id_numeroResolucion" property="numeroResolucion" style="text-align: right;" size="8" maxlength="8" /> / <html:select property="añoResolucion">
							<html:options collection="comboAños" property="value" labelProperty="label" />
						</html:select></td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Monto Desde:</td>
					<td class="CformDato"><html:text styleId="montoDesde" property="montoDesde" style="text-align: right;" size="12" maxlength="12" onkeypress="validarImporteConDecimales(this)" /> Hasta: <html:text
							styleId="montoHasta" property="montoHasta" style="text-align: right;" size="12" maxlength="12" onkeypress="validarImporteConDecimales(this)" /> Moneda: <html:select property="tipoMoneda">
							<html:options collection="comboTipoMoneda"  filter="false" property="value" labelProperty="label" />
						</html:select></td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Área de conocimiento:</td>
					<td class="CformDato"><html:select property="clasificacionPDT" style=" width:300px;">
							<html:options collection="comboClasificacionPDT" property="value" labelProperty="label" />
						</html:select>
					</td>
				</tr>

				<tr>
					<td class="CformNombre" width="220">Campo Aplicación:</td>
					<td class="CformDato"><html:select property="campoAplicacion" style=" width:300px;">
							<html:options collection="comboCampoAplicacion" property="value" labelProperty="label" filter="false" />
						</html:select>
					</td>
				</tr>

				<tr>
					<td class="CformNombre" width="220">Tipo Convenio:</td>
					<td class="CformDato"><html:select property="tipoConvenio" style=" width:300px;">
							<html:options collection="comboTipoConvenio" property="value" labelProperty="label" />
						</html:select>
					</td>
				</tr>
				
				<tr>
					<td class="CformNombre" width="220">Palabras:</td>
					<td class="CformDato"><html:text property="palabrasClave" size="50" maxlength="50" />
				</tr>
				<!-- tr>
					<td class="CformNombre" width="220">Intervinientes:</td>
					<td class="CformDato"><html:text styleId="autocomplete-interviniente" property="palabrasClave" size="50" maxlength="50" />
				</tr--->
			</table></td>
	</tr>
</table>


