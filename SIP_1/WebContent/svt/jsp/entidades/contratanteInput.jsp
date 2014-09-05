<%@include file="/jsp/layout/include.jsp"%>

<bean:define id="contratanteForm" name='<%= request.getParameter("contratanteForm") %>' />
<bean:define id="loteDocumentos" name="contratanteForm" property="documentos(ContratanteDoc)" />
<bean:define id="showBtnLimpiar" value='<%= request.getParameter("showBtnLimpiar") %>' />
<bean:define id="showBtnVolver" value='<%= request.getParameter("showBtnVolver") %>' />
<bean:define id="isAlta" value='<%= request.getParameter("isAlta") %>' />
<bean:define id="comitentes" name="contratanteForm" property="comitentesMultiples" />

<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script>
	$(document).ready(
			function() {

				var opciones = {
					"desde" : "id_fechaDesdeDocumentacion",
					"hasta" : "id_fechaHastaDocumentacion"
				};
				// este periodo picker borrara, en el momento, las fechas que se estan informando que no cumplen la condición fechaDesde<=fechahasta
				var x = new CPeriodoPickerParaRegistrarFechas(opciones);
				// esto inicializa los datepicker de las fechas si existian fechas cargadas anteriormente
				if ($("#id_fechaDesdeDocumentacion").val() == ""
						&& $("#id_fechaHastaDocumentacion").val() != "") {
					$("#id_fechaDesdeDocumentacion").datepicker(
							"option",
							"maxDate",
							$("#id_fechaHastaDocumentacion").datepicker(
									'getDate'));
				} else if ($("#id_fechaDesdeDocumentacion").val() != ""
						&& $("#id_fechaHastaDocumentacion").val() == "") {
					$("#id_fechaHastaDocumentacion").datepicker(
							"option",
							"minDate",
							$("#id_fechaDesdeDocumentacion").datepicker(
									'getDate'));
				} else if ($("#id_fechaDesdeDocumentacion").datepicker(
						'getDate') < $("#id_fechaHastaDocumentacion")
						.datepicker('getDate')) {
					$("#id_fechaDesdeDocumentacion").datepicker(
							"option",
							"maxDate",
							$("#id_fechaHastaDocumentacion").datepicker(
									'getDate'));
					$("#id_fechaHastaDocumentacion").datepicker(
							"option",
							"minDate",
							$("#id_fechaDesdeDocumentacion").datepicker(
									'getDate'));
				}

				var input = new CInputNumero(true);
				input.bind("input[id^='porcentajeComitente_']");//selector de jquery
				var input2 = new CInputNumero(false);
				input2.bind("input[id='autoCompleteActividadIndustrial']");//selector de jquery
				
				prepararActividadIndustrial();

			});



	
	function isMaxLength(ta, maxlength) {
		var mlength = parseInt(maxlength);
		if (ta.getAttribute && ta.value.length > mlength) {
			ta.value = ta.value.substring(0, mlength);
		}
	}

	function ocultarAutoComplete(tipo) {
		$('#autoComplete' + tipo + '').hide().val("");
		$('#autoComplete' + tipo + 'Descripcion').hide().val("");
	}

	function prepararActividadIndustrial() {

		var conicetGeneral = new ConicetGeneral();

		var action = document.forms[0].getAttribute('action');
		action = action.split("/")[2];

		conicetGeneral.autocomplete({
			idInput : "autoCompleteActividadIndustrial",
			url : action + '?btnSubmit=autoCompleteActividadIndustrial',
			onSelectFunction : function(item) {
				$("#ActividadIndustrialSeleccionado").attr("value",
						item.data.id);
				$("#autoCompleteActividadIndustrialTexto").text(
						item.data.nombre);
				$("#autoCompleteActividadIndustrialCategoria").text(
						item.data.padre.padre.nombre);
				$("#autoCompleteActividadIndustrialSubcategoria").text(
						item.data.padre.nombre);
				intercambiar('ActividadIndustrial');
			},
			valueDefault : "",
			formatItem : function(item) {
				return item.nombre;
			}

		});

		$('#autoCompleteActividadIndustrial').show().css("width", "200px")
				.autocomplete("option", "position", {
					my : "right top",
					at : "right bottom"
				});
		$('#autoCompleteActividadIndustrialDescripcion').hide();
		intercambiar('ActividadIndustrial');

	}

	function mostrar(i, tipo) {
		$("[id^=autoComplete" + tipo + "]").hide();
	}

	function removeBy(tipo) {
		$('#' + tipo + 'Seleccionado').attr("value", "");
		$('#autoComplete' + tipo).attr("value", "");
		intercambiar(tipo);
	}

	function intercambiar(tipo) {
		var select = $('#' + tipo + 'Seleccionado').val();
		if (select != "" && select != null) {
			$('#autoComplete' + tipo).hide();
			$('#autoComplete' + tipo + 'Descripcion').show();
		} else {
			$('#autoComplete' + tipo + 'Descripcion').hide();
			$('#autoComplete' + tipo).show();
		}
	}
	
</script>

<html:hidden property="descargarArchivoMapped(ContratanteDoc)" styleId="descargarArchivoContratanteDoc" />
<html:hidden property="removerArchivoMapped(ContratanteDoc)" styleId="removerArchivoContratanteDoc" />
<html:hidden property="rolUsrLoggeado" />
<html:hidden property="estado" styleId="estado" />
<div id="datos">
	<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
		<tr>
			<td class="CformAreaBotones" width="100%">
				<div align="center" id="formEmpresaBoton">
					<a href="cContratanteAltaAction.do?accion=entidad"></a>
					<!--Esto se cambio a button para que pueda desabilitar el ir para atras-->
					<input type="button" class="CformBotonTranspBorde" value="|<<" onclick=" irTabInicial()"/> <input type="button" class="CformBotonTranspBorde" value="<" onclick=" irTabAnterior()"/> <input
						type="button" class="CformBotonTranspBorde" value=">" onclick="irTabSiguiente()" /> <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabFinal()" />
				</div></td>
		</tr>
	</table>
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<table width="100%">
					<tr id="tipoMenu">
						<td class="CformNombre" width="25%">Tipo:&nbsp;</td>
						<td class="CformDato" width="75%"><html:select styleId="tipoContratante" property="tipoContratante" onchange="hideForms()">
								<html:options collection="comboTipoContratante" property="value" labelProperty="label" />
							</html:select></td>
					</tr>
				</table></td>
		</tr>

		<tr>
			<td>
				<table width="100%">
					<logic:equal value="si" name="isAlta">
						<logic:equal name="contratanteForm" property="tipoBusqueda" value="descripcion">
							<tr id="formBusqueda">
								<td>
									<table width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td height="10"></td>
										</tr>
										<tr bgcolor="#DDEEFF">
											<td colspan="2" width="100%">Búsqueda:<span class="dato_obligatorio">(1)</span>
											</td>
										</tr>
										<tr>
											<td height="10"></td>
										</tr>
										<tr>
											<td class="CformNombre" width="25%">Razón Social / Nombre Fantasía:&nbsp;</td>
											<td class="CformDato" width="75"><html:text property="contratanteBuscar" styleId="autoCompleteContratante" size="60" /></td>
										</tr>
										<tr>
											<td class="CformNombre" width="25%">CUIT/CUIL:&nbsp;</td>
											<td class="CformDato" width="75">
												<!--html:text property="contratanteCuitBuscar" --> <html:text property="cuit" styleId="autoCompleteCuit" size="12" /> <!--
	                        <html:text styleId="cuitPrefijo" property="cuitPrefijo" maxlength="2" size="1" onkeypress="validarNumero()" /> -
	                        <html:text styleId="cuitNumero" property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()"/> -
							<html:text styleId="cuitSufijo" property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()"/> --></td>
										</tr>
									</table></td>
							</tr>

							<!--  tr id="formBusquedaBoton">
	                <td class="CformAreaBotones" height="21" id="Busqueda">
	                  <div align="right">
	                  <html:submit property="btnSubmit" styleClass="CformBoton" onclick="limpiarDatosE()" value="Buscar"/>
	                  </div>
	                </td>
	             </tr-->

						</logic:equal>

						<!-- Si es diferente de descripcion (por lo tanto en NUEVO y SELECT tambien lo muestra -->

						<logic:equal name="contratanteForm" property="tipoBusqueda" value="collection">
							<tr id="formEmpresaBusqu">
								<td>
									<table width="100%" cellpadding="2" cellspacing="2">
										<tr>
											<td class="CformNombre" height="20" width="200">Razón Social / Nombre Fantasía:&nbsp;</td>
											<td class="CformDato"><html:select disabled="false" property="contratanteSeleccionado">
													<html:options collection="comboContratantes" property="value" labelProperty="label" />
												</html:select></td>
										</tr>
									</table></td>
							</tr>
							<tr id="formEmpresaBot">
								<td class="CformAreaBotones" height="21" id="Busqueda">
									<div align="right">
										<html:submit property="btnSubmit" styleClass="CformBoton" value="Elegir" onclick="habilitarCampos()" />
									</div></td>
							</tr>
						</logic:equal>
					</logic:equal>
				</table></td>
		</tr>

		<tr>
			<td>
				<!-- Esto se muestra solo cuando se carga la página -->



				<div id="formEmpresa">
					<logic:equal name="contratanteForm" property="esConsumidorFinal" value="false">
						<table align="center" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td>
									<table align="center" cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td>
												<div id="campos">
													<table width="100%" cellpadding="2" cellspacing="2">

														<tr>
															<td height="10"></td>
														</tr>
														<tr bgcolor="#DDEEFF">
															<td colspan="2" width="100%">Contratante</td>
														</tr>
														<tr>
															<td class="CformNombre">Sucursal:</td>
															<td class="CformDato">
																No 
																<html:radio styleId="contratanteNoEsSucursal" property="sucursal" value="N" onclick="botonCentralChange(true)" />
																Sí 
																<html:radio styleId="contratanteEsSucursal" property="sucursal" value="S" onclick="botonCentralChange(true)" /> 
																<html:hidden styleId="sucursalRadio" property="sucursal" />
															</td>
														</tr>
														<tr>
															<td class="CformNombre">Central: <span class="dato_obligatorio">(2)</span>
															</td>
															<td class="CformDato">
																<html:select styleId="centralSeleccionada" property="central" onchange="cargarDatosDeCentralElegida()">
																	<html:options collection="comboCentral" property="value" labelProperty="label" />
																</html:select>
															</td>
														</tr> 
														<tr>
															<td class="CformNombre">Razón Social:<span class="dato_obligatorio">*</span></td>
															<td class="CformDato"><html:text styleId="razonSocial" property="razonSocial" maxlength="100" size="65" />
															</td>
														</tr>
														<tr>
															<td class="CformNombre">Nombre Fantasía:</td>
															<td class="CformDato"><html:text property="nombreFantasia" maxlength="60" size="65" />
															</td>
														</tr>

														<tr>
															<td class="CformNombre">Nacionalidad:&nbsp;<span class="dato_obligatorio">*</span>
															</td>
															<td class="CformDato">
																<html:select styleId="personaJuridicaNacionalidadCombo" property="nacionalidadPersonaJuridicaId">
																	<html:options collection="comboNacionalidadPersonaJuridica" property="value" labelProperty="label" />
																</html:select> 
																<html:select styleId="personaJuridicaClasificacionCombo" property="clasificacionGeneralPersonaJuridicaId" style="display: none;">
																	<html:options collection="comboClasificacionPersonaJuridica" property="value" labelProperty="label" />
																</html:select> 
																<html:select styleId="personaJuridicaTipoCombo" property="tipoPersonaJuridicaId" style="display: none;">
																	<html:options collection="comboTipoPersonaJuridica" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr id="autoCompleteOrganismoRow" style="display: none;">
															<td class="CformNombre">Denominación:&nbsp;<span class="dato_obligatorio">*</span>
															</td>

															<td class="CformDato">
																<capplication:autoComplete tipoAutocomplete="organismo" tipoAction="BtnSubmit" actionIngresarNuevo="ingresarOrganismoDenominacion"/>
															</td>
														</tr>
														<tr id="comitenteMultipleTableRow" style="display: none;">
															<td class="CformNombre"></td>
															<td>
															<display:table id="tablaComitentes" class="CFormDisplayTable" name='<%= comitentes %>' decorator="conicet.apps.svt.web.contratante.decorator.CComitenteDisplayWrapper">
																	<display:column property="tipo" title="Tipo de Comitente" headerClass="tableCellHeader" style="width: 20%;" />
																	<display:column property="razonSocial" title="Razón Social" headerClass="tableCellHeader" style="width: 70%;" />
																	<display:column property="porcentaje" title="%" headerClass="tableCellHeader" style="width: 5%;text-align: right;" />

																	<logic:equal property="bloquearDatos" value="no" name="contratanteForm">
																		<display:column property="remove" title="  " headerClass="tableCellHeader" style="width: 5%;text-align: right;" />
																		<display:footer>
																			<tr style="background-color: #FAFAFA;">
																				<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="1">
																					Tipo: 
																					<html:select styleId="tipoComitente" property="tipoComitente">
																						<html:options name="form" collection="tipoComitentes" property="value" labelProperty="label" />
																					</html:select>
																				</td>
																				<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="1">
																					<label/>
																					<div id="comitenteContratanteDiv">
																						<capplication:autoComplete tipoAutocomplete="ComitenteContratante" tipoAction="BtnSubmit"/>
																					</div>
																					<div id="comitenteOrganismoDiv">
																						<capplication:autoComplete tipoAutocomplete="ComitenteOrganismo" tipoAction="BtnSubmit" actionIngresarNuevo="ingresarOrganismoComitente"/>
																					</div>
																				</td>
																				<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="1">
																					<html:submit styleId="btnAgregarComitente"
																						property="btnSubmit" value="Agregar Comitente" styleClass="CformBoton" />
																				</td>
																			</tr>
																		</display:footer>
																	</logic:equal>

																</display:table>
																</td>
														</tr>
														<tr id="comitenteMultipleCentralTableRow" style="display: none;">
															<td class="CformNombre" />

															<td class="CformDato">
																<table id="tablaComitentesCentral" width="100%">
																</table>
															</td>
														</tr>
														<tr>
															<td class="CformNombre">Situaci&oacute;n IVA:&nbsp;<span class="dato_obligatorio">*</span>
															</td>
															<td class="CformDato"><html:select styleId="iva" property="categoriaIva">
																	<html:options collection="comboCategoriaIva" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">CUIT / CUIL:&nbsp;<span class="dato_obligatorio">*</span>
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
														<tr>
															<td class="CformNombre">Actividad Industrial:&nbsp;<span class="dato_obligatorio">*</span>
																
															</td>
															<td class="CformDato"><html:hidden property="actividadIndustrialSeleccionado" styleId="ActividadIndustrialSeleccionado" />
																<div id="autoCompleteActividadIndustrialDescripcion" style='display: inline-block;'>
																	<div>
																		<strong> Categoría: </strong><label id="autoCompleteActividadIndustrialCategoria"> <bean:write name="contratanteForm" property="actividadIndustrialCategoria" /> </label>
																		<logic:equal property="bloquearDatos" value="no" name="contratanteForm">
																			<a href="#" onclick="removeBy('ActividadIndustrial')"><img src="./imagenes/close.png" align="top" /> </a>
																		</logic:equal>
																	</div>
																	<div>
																		<strong> Subcategoría: </strong><label id="autoCompleteActividadIndustrialSubcategoria"><bean:write name="contratanteForm" property="actividadIndustrialSubcategoria" /> </label>
																	</div>
																	<div>
																		<strong> Actividad: </strong><label id="autoCompleteActividadIndustrialTexto"><bean:write name="contratanteForm" property="actividadIndustrialDescripcion" /> </label>
																	</div>
																</div> <input type="text" name="autoCompleteActividadIndustrial" id="autoCompleteActividadIndustrial" maxlength="6" size="10" />
															</td>
														</tr>
														<tr>
															<td class="CformNombre">Campo Aplicación:&nbsp;<capplication:isApplication application="SVT">
																	<span class="dato_obligatorio">*</span>
																</capplication:isApplication>
															</td>
															<td class="CformDato"><html:select styleId="campoAplicacion" property="campoAplicacion">
																	<html:options collection="comboCampoAplicacion" property="value" labelProperty="label" filter="false" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">WEB:&nbsp;</td>
															<td class="CformDato">
																<html:text styleId="web" property="web" size="100" maxlength="100"/>
															</td>
														</tr>
														<tr>
															<td class="CformNombre">Origen del Contacto:&nbsp;</td>
															<td class="CformDato">
																<html:text property="origenContacto" size="100" maxlength="100"/>
															</td>
														</tr>
														<tr>
															<td class="CformNombre">Mail General de la Empresa:&nbsp;</td>
															<td class="CformDato">
																<html:text property="mailEmpresa" size="100" maxlength="100"/>
															</td>
														</tr>
														<tr>
															<td height="10"></td>
														</tr>
														<tr bgcolor="#DDEEFF">
															<td colspan="2" width="100%">Domicilio Legal</td>
														</tr>
														<tr>
															<td height="10"></td>
														</tr>
														<tr>
															<td class="CformNombre">Domicilio:&nbsp;<span class="dato_obligatorio">*</span>
															</td>
															<td class="CformDato"><html:text property="domicilio" maxlength="60" size="65" />
															</td>
														</tr>
														<tr>
															<td class="CformNombre">Pa&iacute;s:&nbsp;<span class="dato_obligatorio">*</span>
															</td>
															<td class="CformDato"><html:select styleId="cboPais" property="pais">
																	<html:options collection="comboPais" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">Provincia:&nbsp;<span class="dato_obligatorio">(3)</span>
															</td>
															<td class="CformDato"><html:select styleId="cboProvincia" property="provincia">
																	<html:options collection="comboProvincia" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">Partido:&nbsp;<span class="dato_obligatorio">(3)</span>
															</td>
															<td class="CformDato"><html:select styleId="cboPartido" property="partido">
																	<html:options collection="comboPartido" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">Localidad:&nbsp;<span class="dato_obligatorio">(3)</span>
															</td>
															<td class="CformDato"><html:select styleId="cboLocalidad" property="localidad">
																	<html:options collection="comboLocalidad" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">C&oacute;digo Postal:<span class="dato_obligatorio">*</span>
															</td>
															<td class="CformDato" colspan="3"><html:text property="codigoPostal" maxlength="15" size="15" />
															</td>
														</tr>
														<tr>
															<td height="10"></td>
														</tr>
														<tr bgcolor="#DDEEFF">
															<td colspan="2" width="100%">Domicilio Administrativo</td>
														</tr>
														<tr>
															<td height="10"></td>
														</tr>
														<tr>
															<td class="CformNombre">Domicilio:&nbsp;</td>
															<td class="CformDato"><html:text property="domicilioAdm" maxlength="60" size="65" />
															</td>
														</tr>
														<tr>
															<td class="CformNombre">Pa&iacute;s:&nbsp;</td>
															<td class="CformDato"><html:select styleId="cboPaisAdm" property="paisAdm">
																	<html:options collection="comboPais" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">Provincia:&nbsp;<span class="dato_obligatorio">(3)</span>
															</td>
															<td class="CformDato"><html:select styleId="cboProvinciaAdm" property="provinciaAdm">
																	<html:options collection="comboProvinciaAdm" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">Partido:&nbsp;<span class="dato_obligatorio">(3)</span>
															</td>
															<td class="CformDato"><html:select styleId="cboPartidoAdm" property="partidoAdm">
																	<html:options collection="comboPartidoAdm" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">Localidad:&nbsp;<span class="dato_obligatorio">(3)</span>
															</td>
															<td class="CformDato"><html:select styleId="cboLocalidadAdm" property="localidadAdm">
																	<html:options collection="comboLocalidadAdm" property="value" labelProperty="label" />
																</html:select></td>
														</tr>
														<tr>
															<td class="CformNombre">C&oacute;digo Postal:</td>
															<td class="CformDato" colspan="3"><html:text property="codigoPostalAdm" maxlength="15" size="15" />
															</td>
														</tr>


													</table>
												</div></td>
										</tr>


										<tr>
											<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
												<div align="right">
													<logic:notEqual property="accion" value="modificar" name="contratanteForm">
														<logic:notEqual name="contratanteForm" property="tipoBusqueda" value="descripcion">
															<logic:notEqual name="contratanteForm" property="tipoBusqueda" value="collection">
																<html:submit property="btnSubmit" styleClass="CformBoton" value="Nueva Busqueda" onclick="habilitarCampos()" styleId="formEmpresaNuevaBusq" />
															</logic:notEqual>
														</logic:notEqual>
													</logic:notEqual>
													<capplication:isApplication application="SIUVT">
														<html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
													</capplication:isApplication>
													<capplication:isNotApplication application="SIUVT">
														<input type="button" class="CformBoton" value="Siguiente" name="contratanteForm" onclick="irTabSiguiente()" />
														<logic:equal value="si" name="showBtnLimpiar">
															<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
														</logic:equal>
														<logic:equal value="si" name="showBtnVolver">
															<html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
														</logic:equal>
													</capplication:isNotApplication>
												</div></td>
										</tr>
									</table></td>
							</tr>
						</table>
					</logic:equal>
				</div> <logic:equal name="contratanteForm" property="esConsumidorFinal" value="true">
					<div id="formConsumidorFinal">
						<table align="center" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td>
									<table width="100%" cellpadding="2" cellspacing="2">
										<tr bgcolor="#DDEEFF">
											<td>Persona Física sin CUIT&nbsp;</td>
										</tr>
									</table>
									<table width="100%">
										<tr>
											<td height="10"></td>
										</tr>
										<tr>
											<td class="CformNombre">Nombre:<span class="dato_obligatorio">*</span>
											</td>
											<td class="CformDato"><html:text property="nombre" maxlength="50" size="65" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre">Apellido:<span class="dato_obligatorio">*</span>
											</td>
											<td class="CformDato"><html:text property="apellido" maxlength="50" size="65" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre">Documento:<span class="dato_obligatorio">*</span>
											</td>
											<td class="CformDato"><html:text property="documento" maxlength="20" size="65" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre">Cargo:</td>
											<td class="CformDato"><html:text property="cargo" maxlength="50" size="65" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre">Tel&eacute;fono:</td>
											<td class="CformDato"><html:text property="telefono" maxlength="50" size="65" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre">E-mail:</td>
											<td class="CformDato"><html:text property="email" maxlength="30" size="65" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre">Fax:</td>
											<td class="CformDato"><html:text property="fax" maxlength="20" size="65" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre">Observaciones:</td>
											<td class="CformDato"><html:textarea property="observaciones" rows="3" onkeyup="isMaxLength(this,250)" />
											</td>
										</tr>
									</table>
									<table width="100%" cellpadding="2" cellspacing="2">
										<tr bgcolor="#DDEEFF">
											<td>Domicilio&nbsp;</td>
										</tr>
										<tr>
											<td height="10"></td>
										</tr>
									</table>
									<table width="100%">
										<tr>
											<td height="10"></td>
										</tr>
										<tr>
											<td class="CformNombre">Domicilio:&nbsp;</td>
											<td class="CformDato"><html:text property="domicilio" maxlength="60" size="65" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre">Pa&iacute;s:&nbsp;</td>
											<td class="CformDato"><html:select styleId="cboPais" property="pais">
													<html:options collection="comboPais" property="value" labelProperty="label" />
												</html:select></td>
										</tr>
										<tr>
											<td class="CformNombre">Provincia:&nbsp;<span class="dato_obligatorio">(1)</span>
											</td>
											<td class="CformDato"><html:select styleId="cboProvincia" property="provincia">
													<html:options collection="comboProvincia" property="value" labelProperty="label" />
												</html:select></td>
										</tr>
										<tr>
											<td class="CformNombre">Partido:&nbsp;<span class="dato_obligatorio">(1)</span>
											</td>
											<td class="CformDato"><html:select styleId="cboPartido" property="partido">
													<html:options collection="comboPartido" property="value" labelProperty="label" />
												</html:select></td>
										</tr>
										<tr>
											<td class="CformNombre">Localidad:&nbsp;<span class="dato_obligatorio">(1)</span>
											</td>
											<td class="CformDato"><html:select styleId="cboLocalidad" property="localidad">
													<html:options collection="comboLocalidad" property="value" labelProperty="label" />
												</html:select></td>
										</tr>
										<tr>
											<td class="CformNombre">C&oacute;digo Postal:&nbsp;</td>
											<td class="CformDato" colspan="3"><html:text property="codigoPostal" maxlength="15" size="15" />
											</td>
										</tr>
										<tr>
											<td height="10"></td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td height="35" class="CformAreaBotones"><span class="dato_obligatorio">* Datos obligatorios</span>
									<div align="right">
										<html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
										<logic:equal value="si" name="showBtnLimpiar">
											<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
										</logic:equal>

										<logic:equal value="no" name="isAlta">
											<html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
										</logic:equal>
									</div></td>
							</tr>
						</table>

					</div>
				</logic:equal></td>
		</tr>

	</table>
	<div id="formEmpresaLeyenda">
		<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
			<tr>
				<td id="formBusquedaleyenda"><span class="dato_obligatorio">(1)</span> Ingrese por lo menos 2 caracteres para iniciar la busqueda y luego seleccione el que desee.</td>
			</tr>
			<tr>
				<td><span class="dato_obligatorio">(2)</span> Si el Contratante es Sucursal, el campo Central es obligatorio.</td>
			</tr>
			<tr>
				<td><span class="dato_obligatorio">(3)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.</td>
			</tr>
			<capplication:isApplication application="SVTP">
				<tr>
					<td><span class="dato_obligatorio"></span> En el caso de necesitar modificar los datos de la solapa Datos, se deberá comunicar con la Dirección de Vinculación Tecnológica.</td>
				</tr>
			</capplication:isApplication>
		</table>

	</div>
	<div id="formConsumidorFinalLeyenda">
		<table align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td><span class="dato_obligatorio">(1)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.</td>
			</tr>
		</table>
	</div>
</div>
<!-- tabContacto-->
<capplication:isNotApplication application="SIUVT">
	<div id="contacto">
		<logic:equal name="contratanteForm" property="esConsumidorFinal" value="false">
			<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
				<tr>
					<td width="100%" class="CformAreaBotones">
						<div align="center">
							<input type="button" class="CformBotonTranspBorde" value="|<<" name=" contratanteForm" onclick="irTabInicial()" /> <input type="button" class="CformBotonTranspBorde" value="<" name="
								contratanteForm" onclick="irTabAnterior()" /> <input type="button" class="CformBotonTranspBorde" value=">" name="contratanteForm" onclick="irTabSiguiente()" /> <input type="button"
								class="CformBotonTranspBorde" value=">>|" name="contratanteForm" onclick="irTabFinal()" />
						</div></td>
				</tr>
			</table>
			<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table width="100%" cellpadding="2" cellspacing="2">
							<tr bgcolor="#DDEEFF">
								<td>Contacto&nbsp;</td>
							</tr>
						</table>
						<table width="100%">
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td class="CformNombre">Nombre:<span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato"><html:text property="nombre" maxlength="60" size="65" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre">Apellido:<span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato"><html:text property="apellido" maxlength="60" size="65" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre">Cargo:</td>
								<td class="CformDato"><html:text property="cargo" maxlength="60" size="65" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre">Tel&eacute;fono:<span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato"><html:text property="telefono" maxlength="50" size="65" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre">E-mail:</td>
								<td class="CformDato"><html:text property="email" maxlength="30" size="65" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre">Fax:</td>
								<td class="CformDato"><html:text property="fax" maxlength="30" size="65" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre">Observaciones:</td>
								<td class="CformDato"><html:textarea property="observaciones" rows="3" onkeyup="isMaxLength(this,250)" />
								</td>
							</tr>
						</table>
						<table width="100%" cellpadding="2" cellspacing="2">
							<tr bgcolor="#DDEEFF">
								<td>Domicilio Administrativo&nbsp;</td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
						</table>
						<table width="100%">
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td class="CformNombre">Domicilio:&nbsp;<span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato"><html:text property="domicilioContacto" maxlength="60" size="65" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre">Pa&iacute;s:&nbsp;<span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato"><html:select styleId="cboPaisContacto" property="paisContacto">
										<html:options collection="comboPais" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Provincia:&nbsp;<span class="dato_obligatorio">(2)</span>
								</td>
								<td class="CformDato"><html:select styleId="cboProvinciaContacto" property="provinciaContacto">
										<html:options collection="comboProvinciaContacto" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Partido:&nbsp;<span class="dato_obligatorio">(2)</span>
								</td>
								<td class="CformDato"><html:select styleId="cboPartidoContacto" property="partidoContacto">
										<html:options collection="comboPartidoContacto" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Localidad:&nbsp;<span class="dato_obligatorio">(2)</span>
								</td>
								<td class="CformDato"><html:select styleId="cboLocalidadContacto" property="localidadContacto">
										<html:options collection="comboLocalidadContacto" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">C&oacute;digo Postal:&nbsp;<span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato" colspan="3"><html:text property="codigoPostalContacto" maxlength="15" size="15" />
								</td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td height="35" class="CformAreaBotones"><span class="dato_obligatorio">* Datos obligatorios</span>
						<div align="right">
							<capplication:isApplication application="SVT">
								<input type="button" class="CformBoton" value="Siguiente" name="contratanteForm" onclick="irTabSiguiente()" />
							</capplication:isApplication>
							<capplication:isApplication application="SVTP">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
							</capplication:isApplication>
							<logic:equal value="si" name="showBtnLimpiar">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
							</logic:equal>
						</div></td>
				</tr>

			</table>
		</logic:equal>
		<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
			<tr>
				<td><span class="dato_obligatorio">(2)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.</td>
			</tr>
		</table>
	</div>
</capplication:isNotApplication>

<capplication:isApplication application="SVT">
	<div id="documentacion">
		<div id="formEmpresaDocumentacion">
			<logic:equal name="contratanteForm" property="esConsumidorFinal" value="false">
				<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
					<tr>
						<td width="100%" class="CformAreaBotones">
							<div align="center">
								<input type="button" class="CformBotonTranspBorde" value="|<<" name=" contratanteForm" onclick="irTabInicial()" /> <input type="button" class="CformBotonTranspBorde" value="<" name="
									contratanteForm" onclick="irTabAnterior()" /> <input type="button" class="CformBotonTranspBorde" value=">" name="contratanteForm" onclick="irTabSiguiente()" /> <input type="button"
									class="CformBotonTranspBorde" value=">>|" name="contratanteForm" onclick="irTabFinal()" />
							</div></td>
					</tr>
				</table>
				<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr bgcolor="#DDEEFF">
									<td>Documentación&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td><display:table class="displayTable" style="width: 100%" name='<%= loteDocumentos %>' id="documentaciones"
											decorator="conicet.apps.svt.web.contratante.decorator.CContratanteDocumentacionDisplayWrapper">
											<display:column property="tipoDocumentacion" title="Tipo" headerClass="tableCellHeader" style="width: 50px;" />
											<display:column property="vigencia" title="Vigencia" headerClass="tableCellHeader" style="width: 100px;" />
											<display:column property="lugarFisico" title="Lugar Físico" headerClass="tableCellHeader" style="width: 50px;" />
											<display:column property="observacion" title="Observación" headerClass="tableCellHeader" style="width: 100px;" />
											<display:column property="archivoDescargar" title="Documento" headerClass="tableCellHeader" style="width: 150px;" />
											<logic:equal value="true" property="esNuevoContratante" name="contratanteForm">
												<display:column property="eliminar" title="  " headerClass="tableCellHeader" style="width: 10px;" />
											</logic:equal>
										</display:table></td>
								</tr>
							</table> <logic:equal value="true" property="esNuevoContratante" name="contratanteForm">
								<table width="100%">
									<tr>
										<td height="10"></td>
									</tr>
									<tr>
										<td colspan="2">
											<table>
												<tr>
													<td class="CformNombre" width="13%">Tipo:&nbsp;<span class="dato_obligatorio">*</span>
													</td>
													<td class="CformDato">
														<html:select styleId="tipoDocumentacion" property="tipoDocumentacion">
															<html:options collection="comboTipoDocumentacion" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td class="CformNombre" width="200">Fecha de Vigencia:&nbsp; Desde:&nbsp;<span class="dato_obligatorio">*</span>
													</td>
													<td class="CformDato"><html:text styleId="id_fechaDesdeDocumentacion" property="fechaDesdeDocumentacion" maxlength="10" size="10" />
													</td>
													<td class="CformNombre">Hasta:&nbsp;<span class="dato_obligatorio">*</span>
													</td>
													<td class="CformDato"><html:text styleId="id_fechaHastaDocumentacion" property="fechaHastaDocumentacion" maxlength="10" size="10" />
													</td>
												</tr>
											</table></td>
									</tr>
									<tr>

									</tr>

									<tr>
										<td class="CformNombre" width="10%">Archivo:&nbsp;<span class="dato_obligatorio">*</span>
										</td>
										<td class="CformDato">
											<html:file property="fileMapped(ContratanteDoc)" size="40" /> 
											<logic:notEmpty property="fileMapped(ContratanteDoc)" name="contratanteForm">
												<br />
					         					Seleccionado: <bean:write property="descripcionDocumentoMapped(ContratanteDoc)" name="contratanteForm" />
											</logic:notEmpty></td>
									</tr>
									<tr>
										<td class="CformNombre">Lugar Físico:&nbsp;&nbsp;</td>
										<td class="CformDato"><html:text property="lugarFisico" maxlength="50" size="35" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre">Observación:&nbsp;</td>
										<td class="CformDato"><html:textarea property="observacionDocumentacion" rows="2" onkeyup="isMaxLength(this,250)" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre">&nbsp;</td>
										<td><html:submit property="btnSubmit" styleClass="CformBoton" value="Agregar Documento" />
										</td>
									</tr>
									<tr>
										<td height="10"></td>
									</tr>
								</table>
							</logic:equal></td>
					</tr>
					<tr>
						<td height="35" class="CformAreaBotones"><span class="dato_obligatorio">* Datos obligatorios</span>
							<div align="right">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
							</div></td>
					</tr>

				</table>
			</logic:equal>
			<table align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td><span class="dato_obligatorio">(2)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.</td>
				</tr>
			</table>
		</div>
	</div>
</capplication:isApplication>