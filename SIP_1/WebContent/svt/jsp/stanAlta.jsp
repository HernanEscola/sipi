<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
	media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>

	<capplication:isApplication application="SVT">
	solapas = new Array('tab1', 'tabEquipos', 'tab2', 'tab5', 'tab4');
	/* solapas = new Array('tab1','tabGestor','tabMasInf','tab2','tab3','tab4','tab5','tab8','tabEquipos');*/
	</capplication:isApplication>

	<capplication:isApplication application="SVTP">
	solapas = new Array('tab1', 'tabEquipos', 'tab2', 'tab5', 'tab4');
	/*solapas = new Array('tab1','tabMasInf','tab2','tab3','tab5','tab8','tabEquipos');*/
	</capplication:isApplication>

	window.onload = function() {
		setupPanes("container", document.cStanActionForm.cambiaPanel.value);
		updateUnidadPrestacion();
		<capplication:isApplication application="SVTP">
		marcarObligatorios();
		</capplication:isApplication>

	}

	$(document).ready(function() {

	});

	function setFoco() {
		var x = event.keyCode;
		if ((x == 13)) { // enter
			window.event.returnValue = false;
		}
	}

	function irTabFinal() {
		document.cStanActionForm.cambiaPanel.value = solapas[solapas.length - 1];
		setupPanes("container", document.cStanActionForm.cambiaPanel.value);
	}

	function irTabInicial() {
		document.cStanActionForm.cambiaPanel.value = solapas[0];
		setupPanes("container", document.cStanActionForm.cambiaPanel.value);
	}

	function irTabAnterior() {
		var obj = document.cStanActionForm.cambiaPanel.value;
		for (i = 1; i < solapas.length; i++) {
			if ((solapas[i] == obj)) {
				document.cStanActionForm.cambiaPanel.value = solapas[i - 1];
				/*if (solapas[i-1] == 'tab5')
				  updateUnidadPrestacion();
				else*/if (solapas[i - 1] == 'tab8')
					return submitCostos();
				break;
			}
		}
		setupPanes("container", document.cStanActionForm.cambiaPanel.value);
	}

	function irTabSiguiente() {
		var obj = document.cStanActionForm.cambiaPanel.value;
		for (i = 0; i < (solapas.length - 1); i++) {
			if ((solapas[i] == obj)) {
				document.cStanActionForm.cambiaPanel.value = solapas[i + 1];
				/*if (solapas[i+1] == 'tab5')
				  updateUnidadPrestacion();
				else*/if (solapas[i + 1] == 'tab8')
					return submitCostos();
				break;
			}
		}
		setupPanes("container", document.cStanActionForm.cambiaPanel.value);
	}

	function irA(obj) {
		if (document.cStanActionForm.cambiaPanel.value != 'tab8'
				&& obj == 'tab8') {
			return submitCostos();
		}
		document.cStanActionForm.cambiaPanel.value = obj;
		setupPanes("container", document.cStanActionForm.cambiaPanel.value);
	}

	function mostrarPanel(obj1, obj2) {
		if (document.cStanActionForm.cambiaPanel.value != 'tab8'
				&& obj2.id == 'tab8') {
			return submitCostos();
		}
		document.cStanActionForm.cambiaPanel.value = obj2.id;
		return showPane(obj1, obj2);
	}

	function updateUnidadPrestacion() {
		if ($('#comboUPrestacion').get(0).value != "-1"
				&& $('#comboUPrestacion').get(0).value != "-2"
				&& $('#comboUPrestacion').get(0).value != "-4") {
			var select = document.getElementById("comboUPrestacion");
			for ( var i = 0; i < select.options.length; i++) {
				if (select.options[i].selected) {
					$('#unidadPrestacionDescripcion').text(
							select.options[i].text);
				}
			}
		}
		//-4 es "Otros"
		else if ($('#comboUPrestacion').get(0).value == "-4") {
			if ($('#descripcionUPrestacion').get(0).value != "") {
				$('#unidadPrestacionDescripcion').text(
						$('#descripcionUPrestacion').get(0).value);
			} else
				$('#unidadPrestacionDescripcion').text("");
		}
	}

	function habilitarCamposByDP() {
		if ((document.cStanActionForm.principalDP.value == "-1")
				|| (document.cStanActionForm.principalDP.value == "-2")) {
			document.cStanActionForm.disciplinaPrimaria.disabled = true;
			document.cStanActionForm.disciplinaPrimaria.className = 'CformTextDisabled';
			for (m = document.cStanActionForm.disciplinaPrimaria.options.length - 1; m > 0; m--) {
				document.cStanActionForm.disciplinaPrimaria.options[m].selected = false;
			}

		} else {
			document.cStanActionForm.disciplinaPrimaria.disabled = false;
			document.cStanActionForm.disciplinaPrimaria.className = 'CformTextEnabled';
		}
	}

	function habilitarCamposByDD() {
		if ((document.cStanActionForm.principalDD.value == "-1")
				|| (document.cStanActionForm.principalDD.value == "-2")) {
			document.cStanActionForm.disciplinaDesagregada.disabled = true;
			document.cStanActionForm.disciplinaDesagregada.className = 'CformTextDisabled';
			for (m = document.cStanActionForm.disciplinaDesagregada.options.length - 1; m > 0; m--) {
				document.cStanActionForm.disciplinaDesagregada.options[m].selected = false;
			}

		} else {
			document.cStanActionForm.disciplinaDesagregada.disabled = false;
			document.cStanActionForm.disciplinaDesagregada.className = 'CformTextEnabled';

		}
	}

	function habilitarCamposByCO() {
		if ((document.cStanActionForm.principalCO.value == "-1")
				|| (document.cStanActionForm.principalCO.value == "-2")) {
			document.cStanActionForm.clasificacionOnu.disabled = true;
			document.cStanActionForm.clasificacionOnu.className = 'CformTextDisabled';
			for (m = document.cStanActionForm.clasificacionOnu.options.length - 1; m > 0; m--) {
				document.cStanActionForm.clasificacionOnu.options[m].selected = false;
			}

		} else {
			document.cStanActionForm.clasificacionOnu.disabled = false;
			document.cStanActionForm.clasificacionOnu.className = 'CformTextEnabled';

		}
	}

	function habilitarCamposByCA() {
		if ((document.cStanActionForm.principalCA.value == "-1")
				|| (document.cStanActionForm.principalCA.value == "-2")) {
			document.cStanActionForm.campoAplicacion.disabled = true;
			document.cStanActionForm.campoAplicacion.className = 'CformTextDisabled';
			for (m = document.cStanActionForm.campoAplicacion.options.length - 1; m > 0; m--) {
				document.cStanActionForm.campoAplicacion.options[m].selected = false;
			}

		} else {
			document.cStanActionForm.campoAplicacion.disabled = false;
			document.cStanActionForm.campoAplicacion.className = 'CformTextEnabled';

		}
	}

	function agregarDecimales(obj) {
		if (obj.value != '') {
			var a = 0;
			var a = eval(obj.value);
			a = Math.round((a) * 100) / 100;
			a = a.toFixed(2);
			cStanActionForm.costoOtraMoneda.value = a;
			obj.value = a;
		}
		return 1;
	}

	function pedirConfirmacion(url) {
		url.href = 'cStanAltaAction.do?accion=oferta';
		msg = 'Se perderán los datos no grabados, ¿desea continuar?';
		if (window.confirm(msg)) {
			url.href = url.href;
		} else {
			url.href = '#';
		}
	}

	function habilitarPublicacionByHabilitados(obj) {

		if (document.cStanActionForm.rolUsuario.value != "DVH") {

			<logic:iterate id="estadoTipoOferta"  property="estadosByTipoOferta" name="cStanActionForm">
			<bean:define id="EstadosTipoOfertaId" name="estadoTipoOferta" property="tipoEstado"/>
			if (obj.value == <bean:write name="EstadosTipoOfertaId" property="id" />) {
				if (<bean:write property="publicable" name="estadoTipoOferta" />) {
					document.cStanActionForm.publica[0].disabled = false;
					document.cStanActionForm.publica[1].disabled = false;
				} else {
					document.cStanActionForm.publica[0].checked = false;
					document.cStanActionForm.publica[0].disabled = true;
					document.cStanActionForm.publica[1].checked = true;
					document.cStanActionForm.publica[1].disabled = true;
					//document.cStanActionForm.publica.selectedValue="N";
				}
			}
			</logic:iterate>
		}

	}

	function submitCostos() {
		document.cStanActionForm.action = 'cStanAltaAction.do?btnSubmit=cargarComboCostos';
		document.cStanActionForm.submit();
	}

	function habilitarDescripcion() {
		if (document.cStanActionForm.unidadPrestacion.value != "-4") {
			document.cStanActionForm.descripcionUnidadPrestacion.value = "";
			document.cStanActionForm.descripcionUnidadPrestacion.disabled = true;
			document.cStanActionForm.descripcionUnidadPrestacion.className = 'CformTextDisabled';
		} else {
			document.cStanActionForm.descripcionUnidadPrestacion.disabled = false;
			document.cStanActionForm.descripcionUnidadPrestacion.className = 'CformTextEnabled';
		}
	}

	function marcarObligatorios() {
		var asterisco = "<span class=\"dato_obligatorio\">*</span>";
		var msgObligatorios = "<td width=\"200\" class=\"CformAreaBotones\"><div align=\"left\" class=\"dato_obligatorio\">* Datos obligatorios </div></td>";
		$('#dispPrimariaPpal').append(asterisco);
		$('#dispDesagregadaPpal').append(asterisco);
		$('#campoAplicPpal').append(asterisco);
		$('#activIndPpal').append(asterisco);
		$('#areaBotonesInfTecnologica').prepend(msgObligatorios);
		$('#pClave1').append(asterisco);
		$('#pClave2').append(asterisco);
		$('#pClave3').append("&nbsp;&nbsp;");
		$('#pClave4').append("&nbsp;&nbsp;");
		$('#pClave5').append("&nbsp;&nbsp;");
		$('#areaBotonesPClaves').prepend(msgObligatorios);
	}
</script>

<br>
<h1 align="center" class="titulo">
	<capplication:isApplication application="SVTP">
		<logic:equal value="si" property="modificaOferta" name="cStanActionForm">
  			Modificaci&oacute;n de Oferta Tecnol&oacute;gica
  		</logic:equal>
		<logic:notEqual value="si" property="modificaOferta" name="cStanActionForm">
	  		Registro de STAN
	  	</logic:notEqual>
	</capplication:isApplication>
	<capplication:isApplication application="SVT">
  		Registro de STAN
	</capplication:isApplication>
</h1>
<html:form action="cStanAltaAction.do" method="POST">
	<html:hidden property="accion" />
	<html:hidden property="cambiaPanel" />
	<html:hidden property="rolUsuario" />
	<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_autorizacion,id_fecha_resolucion" />

	<bean:define id="responsablesTecnicos" name="cStanActionForm" property="responsablesTecnicos" />


	<logic:equal property="accion" value="alta" name="cStanActionForm">

		<div class="tab-container" id="container">
			<table align="center" cellpadding="0" cellspacing="0"
				class="tablaMin">

				<tr>
					<td>
						<ul class="tabs">
							<capplication:isApplication application="SVTP">
								<logic:notEqual value="si" property="modificaOferta"
									name="cStanActionForm">
									<li><a
										href="cTipoOfertaSeleccionarAction.do?accion=volver"
										onClick="return pedirConfirmacion(this)">Oferta</a></li>
								</logic:notEqual>
							</capplication:isApplication>
							<capplication:isApplication application="SVT">
								<li><a href="cTipoOfertaSeleccionarAction.do?accion=volver"
									onClick="return pedirConfirmacion(this)">Oferta</a></li>
							</capplication:isApplication>
							<li><a href="#" onClick="return mostrarPanel('stan', this)"
								id="tab1">Stan</a></li>
							<li><a href="#"
								onClick="return mostrarPanel('equipos', this)" id="tabEquipos">Equipamientos</a></li>
							<li><a href="#"
								onClick="return mostrarPanel('informacionTecnologica', this)"
								id="tab2">Inf.Tecnológica</a></li>
							<li><a href="#"
								onClick="return mostrarPanel('costos', this)" id="tab5">Costos</a></li>
							<li><a href="#"
								onClick="return mostrarPanel('resolucion', this)" id="tab4">Seguimiento</a></li>

						</ul>
					</td>
				</tr>
			</table>
			<div>


				<!-- tab1-->
				<div id="stan">
					<table align="center" cellpadding="0" cellspacing="0"
						class="tablaMin">
						<tr>
							<td class="CformAreaBotones">
								<div align="center">
									<input type="button" class="CformBotonTranspBorde"
										value="|<<" name=" cStanActionForm"   onclick="irTabInicial()" />
									<input type="button" class="CformBotonTranspBorde"
										value="<" name=" cStanActionForm"   onclick="irTabAnterior()" />
									<input type="button" class="CformBotonTranspBorde" value=">"
										name="cStanActionForm" onclick="irTabSiguiente()" /> <input
										type="button" class="CformBotonTranspBorde" value=">>|"
										name="cStanActionForm" onclick="irTabFinal()" />
								</div>
							</td>
						</tr>
					</table>
					<table class="CformTable" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<table width="100%">
									<tr>
										<td class="CformNombre" width="150">
											Es Servicio:&nbsp;&nbsp;
										</td>
										<td class="CformDato" width="50">
											<html:radio property="tipo" value="ST" disabled="false" />
										</td>
										<td class="CformNombre" width="200">
											Es Asesoramiento:&nbsp;&nbsp;
										</td>
										<td class="CformDato">
											<html:radio property="tipo" value="AINS" disabled="false" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Prestador:&nbsp;<span class="dato_obligatorio">*</span></td>
									</tr>
								</table> <logic:notEmpty property="prestadorLote" name="cStanActionForm">
									<table width="100%">
										<tr>
											<td colspan="10"><display:table
													name="sessionScope.cStanActionForm.prestadorLote"
													style="width: 100%"
													decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
													<display:column property="indiceEntidadesEnDetalleOferta"
														title="#" style="width:10px" headerClass="tableCellHeader" />
													<display:column property="descripcion" title="Descripción"
														headerClass="tableCellHeader" style="width: 350px;" />
													<display:column property="tipo" title="Tipo"
														headerClass="tableCellHeader" style="width: 150px;" />
													<display:column property="provincia" title="Provincia"
														headerClass="tableCellHeader" style="width: 350px;" />
												</display:table></td>
										</tr>
									</table>
								</logic:notEmpty> <logic:empty property="prestadorLote" name="cStanActionForm">
									<table width="100%">
										<tr>
											<td>No se seleccionó prestador&nbsp;</td>
										</tr>
									</table>
								</logic:empty>
							</td>
						</tr>
						<capplication:isApplication application="SVT">
							<tr>
								<td>
									<table width="100%">
										<tr>
											<td class="CformAreaBotones">
												<div align="right">
													<html:submit property="btnSubmit" styleClass="CformBoton"
														value="Seleccionar" />
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</capplication:isApplication>
						<capplication:isApplication application="SVTP">
							<logic:equal value="N" property="prestadorBloqueado"
								name="cStanActionForm">
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td class="CformAreaBotones">
													<div align="right">
														<html:submit property="btnSubmit" styleClass="CformBoton"
															value="Seleccionar" />
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</logic:equal>
						</capplication:isApplication>
						<tr>
							<td>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>STAN&nbsp;</td>
									</tr>
								</table>

								<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td class="CformNombre" width="150">Título:&nbsp;<span
											class="dato_obligatorio">*</span></td>
										<td class="CformDato"><html:textarea
												property="descripcion" rows="3" onkeydown="setFoco()" /></td>
										<!--td class="CformDato"><html:text property="descripcion"  onkeydown="setFoco()"   maxlength="80" size="60"/></td-->
									</tr>

									<tr>
										<td class="CformNombre" width="150">
											Prestación:&nbsp;&nbsp;</td>
										<td class="CformDato"><html:textarea
												property="prestacionDescripcion" rows="3" /></td>
									</tr>
								</table>

								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Especificación&nbsp;</td>
									</tr>
								</table>

								<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td class="CformNombre" width="150">Detalle STAN:&nbsp;<span
											class="dato_obligatorio">*</span></td>
										<td class="CformDato"><html:textarea property="detalle"
												rows="3" /></td>
									</tr>

									<tr>
										<td class="CformNombre" width="150">Detalle
											Prestación:&nbsp;</td>
										<td class="CformDato"><html:textarea
												property="prestacionDetalle" rows="3" /></td>
									</tr>

									<tr>
										<td class="CformNombre" width="150">Metodología:&nbsp;<span
											class="dato_obligatorio">(1)</span></td>
										<td><html:textarea property="especificacionMetodologia"
												rows="6" /></td>
									</tr>

									<tr>
										<td colspan="10">
											<table width="100%">
												<tr bgcolor="#DDEEFF">
													<td><strong>Responsables Técnicos:</strong></td>
												</tr>
												<tr>
													<td width="100%">
														<display:table style="width='100%'" 
															class="CFormDisplayTable"
															name='<%= responsablesTecnicos %>'
															decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
															<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
															<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
															<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
															<display:column property="documentacion" title="Documentación" headerClass="tableCellHeader" />												
															<display:column property="remove" title="Acción" headerClass="tableCellHeader" style="width: 10px;" />
															<display:footer>
																<tr style="background-color: #FAFAFA;">
																	<td style="text-align: right; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;"
																		colspan="2">Ingresar Nuevo:</td>
																	<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 300px;"
																		colspan="1">
																		<capplication:autoComplete tipoAutocomplete="responsableTecnico" actionIngresarNuevo="altaResponsableTecnico" tipoAction="BtnSubmit" />
																	</td>
																	<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 200px;"
																		colspan="2">
																		<html:submit style="width:170px;" property="btnSubmit" value="Agregar Responsable Tecnico" styleClass="CformBoton" />
																	</td>
																</tr>
															</display:footer>
														</display:table></td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td class="CformNombre" width="150">Unidad de
											Prestación:&nbsp;<span class="dato_obligatorio">*</span>
										</td>
										<td class="CformDato"><html:select
												styleId="comboUPrestacion" disabled="false"
												property="unidadPrestacion"
												onchange="habilitarDescripcion(),updateUnidadPrestacion()">
												<html:options collection="comboUnidadPrestacion"
													property="value" labelProperty="label" />
											</html:select>&nbsp; <html:text styleId="descripcionUPrestacion" size="30"
												property="descripcionUnidadPrestacion" maxlength="30"
												onchange="updateUnidadPrestacion()" /></td>
									</tr>

									<tr>
										<td class="CformNombre" width="150">Capacidad
											Operativa:&nbsp;&nbsp;</td>
										<td class="CformDato"><html:text
												property="capacidadOperativa" maxlength="30" size="63" /></td>
									</tr>


									<tr>
										<td class="CformNombre" width="150">Cantidad
											Mínima:&nbsp;&nbsp;</td>
										<td class="CformDato"><html:text size="12"
												property="cantidadMinima" maxlength="10"
												onkeypress="validarImporte(this)" /></td>
									</tr>

								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="60%" class="CformAreaBotones"><div
												align="left" class="dato_obligatorio">* Datos
												obligatorios</div></td>
										<td width="40%" class="CformAreaBotones">
											<div align="right">
												<input type="button" class="CformBoton" value="Siguiente"
													name="cStanActionForm" onclick="irTabSiguiente()" />

												<capplication:isApplication application="SVTP">
													<!--si es alta-->
													<logic:equal value="no" property="modificaOferta"
														name="cStanActionForm">
														<html:submit property="btnSubmit" styleClass="CformBoton"
															value="Limpiar" />
														<!-- si es alta pero viene de copiar a nueva oferta -->
														<logic:notEmpty property="copiarNuevaOferta"
															name="cStanActionForm">
															<html:submit property="btnSubmit" styleClass="CformBoton"
																value="Volver" />
														</logic:notEmpty>
													</logic:equal>
													<!-- si es una modificación de oferta en svtp -->
													<logic:equal value="si" property="modificaOferta"
														name="cStanActionForm">
														<html:submit property="btnSubmit" styleClass="CformBoton"
															value="Volver" />
													</logic:equal>
												</capplication:isApplication>


												<capplication:isApplication application="SVT">
													<html:submit property="btnSubmit" styleClass="CformBoton"
														value="Limpiar" />
													<!-- si es un alta pero viene de botón copiar a nueva oferta -->
													<logic:notEmpty property="copiarNuevaOferta"
														name="cStanActionForm">
														<html:submit property="btnSubmit" styleClass="CformBoton"
															value="Volver" />
													</logic:notEmpty>

												</capplication:isApplication>

											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<table align="center" cellpadding="0" cellspacing="0"
						class="tablaMin">
						<tr>
							<td><span class="dato_obligatorio">(1)</span> Si existe
								prestación en el STAN la metodología deberá referirse a dicha
								prestación. Caso contrario será del STAN.</td>
						</tr>
					</table>


				</div>


				<!-- tabEquipos ex-tab6-->

				<div id="equipos">
					<table align="center" cellpadding="0" cellspacing="0"
						class="tablaMin">
						<tr>
							<td class="CformAreaBotones">
								<div align="center">
									<input type="button" class="CformBotonTranspBorde"
										value="|<<" name=" cStanActionForm"   onclick="irTabInicial()" />
									<input type="button" class="CformBotonTranspBorde"
										value="<" name=" cStanActionForm"   onclick="irTabAnterior()" />
									<input type="button" class="CformBotonTranspBorde" value=">"
										name="cStanActionForm" onclick="irTabSiguiente()" /> <input
										type="button" class="CformBotonTranspBorde" value=">>|"
										name="cStanActionForm" onclick="irTabFinal()" />
								</div>
							</td>
						</tr>
					</table>


					<table class="CformTable" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Equipamientos:&nbsp;</td>
									</tr>
								</table> <logic:notEmpty property="equiposLote" name="cStanActionForm">

									<table width="100%">
										<tr>
											<td colspan="10"><display:table
													name="sessionScope.cStanActionForm.equiposLote"
													style="width:100%"
													decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
													<display:column property="descripcion" title="Descripción"
														headerClass="tableCellHeader" maxLength="22"
														style="width: 350px;" />
													<display:column property="anio" title="Año"
														headerClass="tableCellHeader" style="width: 50px;" />
													<display:column property="marca" title="Marca"
														headerClass="tableCellHeader" maxLength="15"
														style="width: 350px;" />
													<display:column property="modelo" title="Modelo"
														headerClass="tableCellHeader" maxLength="6"
														style="width: 80px;" />
													<display:column property="nroSerie" title="N°Serie"
														headerClass="tableCellHeader" maxLength="6"
														style="width: 80px;" />

												</display:table></td>
										</tr>
									</table>
								</logic:notEmpty> <logic:empty property="equiposLote" name="cStanActionForm">
									<tr>
										<td>No se seleccionaron equipamientos&nbsp;</td>
									</tr>
								</logic:empty>


							</td>
						</tr>

						<tr>
							<td>
								<table width="100%">
									<tr>
										<td class="CformAreaBotones">
											<div align="right">
												<html:submit property="btnSubmit" styleClass="CformBoton"
													value="Seleccionar" />
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>



						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="40%" class="CformAreaBotones">
											<div align="left" class="dato_obligatorio">&nbsp;</div>
										</td>
										<td width="60%" class="CformAreaBotones">
											<div align="right">
												<input type="button" class="CformBoton" value="Siguiente"
													name="cStanActionForm" onclick="irTabSiguiente()" />
												<capplication:isApplication application="SVTP">
													<logic:equal value="no" property="modificaOferta"
														name="cStanActionForm">
														<html:submit property="btnSubmit" styleClass="CformBoton"
															value="Limpiar" />
													</logic:equal>
												</capplication:isApplication>
												<capplication:isApplication application="SVT">
													<html:submit property="btnSubmit" styleClass="CformBoton"
														value="Limpiar" />
												</capplication:isApplication>


											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>

				<!-- tab2-->
				<div id="informacionTecnologica">
					<table align="center" cellpadding="0" cellspacing="0"
						class="tablaMin">
						<tr>
							<td class="CformAreaBotones">
								<div align="center">
									<input type="button" class="CformBotonTranspBorde"
										value="|<<" name=" cStanActionForm"   onclick="irTabInicial()" />
									<input type="button" class="CformBotonTranspBorde"
										value="<" name=" cStanActionForm"   onclick="irTabAnterior()" />
									<input type="button" class="CformBotonTranspBorde" value=">"
										name="cStanActionForm" onclick="irTabSiguiente()" /> <input
										type="button" class="CformBotonTranspBorde" value=">>|"
										name="cStanActionForm" onclick="irTabFinal()" />
								</div>
							</td>
						</tr>
					</table>

					<table class="CformTable" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Disciplina Primaria&nbsp;</td>
									</tr>
								</table>
								<table width="100%">
									<tr>
										<td class="CformNombre" width="55" id="dispPrimariaPpal">Principal:&nbsp;</td>
										<td class="CformDato"><html:select disabled="false"
												property="principalDP" onchange="habilitarCamposByDP()">
												<html:options collection="comboDisciplinaPrimaria"
													property="value" labelProperty="label" />
											</html:select></td>
									</tr>
									<tr>
										<td class="CformNombre" width="55">Otras:&nbsp;</td>
										<td class="CformDato"><logic:lessEqual value="-1"
												property="principalDP" name="cStanActionForm">
												<html:select disabled="true" property="disciplinaPrimaria"
													multiple="true" size="3" onchange="habilitarCamposByDP()">
													<html:options collection="comboDisciplinaPrimariaM"
														property="value" labelProperty="label" />
												</html:select>
											</logic:lessEqual> <logic:greaterThan value="-1" property="principalDP"
												name="cStanActionForm">
												<html:select disabled="false" property="disciplinaPrimaria"
													multiple="true" size="3" onchange="habilitarCamposByDP()">
													<html:options collection="comboDisciplinaPrimariaM"
														property="value" labelProperty="label" />
												</html:select>
											</logic:greaterThan></td>
									</tr>
									<tr>
										<td class="caratula_texto"><img
											src="./imagenes/ico_file_pdf.png"> <a target="_blank"
											href="./manuales/ListadoCodigosDisciplinasPrimarias.pdf" />
											PDF</td>
									</tr>
								</table>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Disciplina Desagregada&nbsp;</td>
									</tr>
								</table>
								<table width="100%">
									<tr>
										<td class="CformNombre" width="55" id="dispDesagregadaPpal">Principal:&nbsp;</td>
										<td class="CformDato"><html:select disabled="false"
												property="principalDD" onchange="habilitarCamposByDD()">
												<html:options collection="comboDisciplinaDesagregada"
													property="value" labelProperty="label" />
											</html:select></td>
									</tr>
									<tr>
										<td class="CformNombre" width="55">Otras:&nbsp;</td>
										<td class="CformDato"><logic:lessEqual value="-1"
												property="principalDD" name="cStanActionForm">
												<html:select disabled="true"
													property="disciplinaDesagregada" multiple="true" size="3"
													onchange="habilitarCamposByDD()">
													<html:options collection="comboDisciplinaDesagregadaM"
														property="value" labelProperty="label" />
												</html:select>
											</logic:lessEqual> <logic:greaterThan value="-1" property="principalDD"
												name="cStanActionForm">
												<html:select disabled="false"
													property="disciplinaDesagregada" multiple="true" size="3"
													onchange="habilitarCamposByDD()">
													<html:options collection="comboDisciplinaDesagregadaM"
														property="value" labelProperty="label" />
												</html:select>
											</logic:greaterThan></td>
									</tr>
									<tr>
										<td class="caratula_texto"><img
											src="./imagenes/ico_file_pdf.png"> <a target="_blank"
											href="./manuales/ListadoCodigosDisciplinasDesagregadas.pdf" />
											PDF</td>
									</tr>
								</table>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Campo Aplicación&nbsp;</td>
									</tr>
								</table>
								<table width="100%">
									<tr>
										<td class="CformNombre" width="55" id="campoAplicPpal">Principal:&nbsp;</td>
										<td class="CformDato"><html:select disabled="false"
												property="principalCA" onchange="habilitarCamposByCA()">
												<html:options collection="comboCampoAplicacion"
													property="value" labelProperty="label" />
											</html:select></td>
									</tr>
									<tr>
										<td class="CformNombre" width="55">Otras:&nbsp;</td>
										<td class="CformDato"><logic:lessEqual value="-1"
												property="principalCA" name="cStanActionForm">
												<html:select disabled="true" property="campoAplicacion"
													multiple="true" size="3" onchange="habilitarCamposByCA()">
													<html:options collection="comboCampoAplicacionM"
														property="value" labelProperty="label" />
												</html:select>
											</logic:lessEqual> <logic:greaterThan value="-1" property="principalCA"
												name="cStanActionForm">
												<html:select disabled="false" property="campoAplicacion"
													multiple="true" size="3" onchange="habilitarCamposByCA()">
													<html:options collection="comboCampoAplicacionM"
														property="value" labelProperty="label" />
												</html:select>
											</logic:greaterThan></td>
									</tr>
									<tr>
										<td class="caratula_texto"><img
											src="./imagenes/ico_file_pdf.png"> <a target="_blank"
											href="./manuales/ListadoCodigosAplicacion.pdf" /> PDF</td>
									</tr>
								</table>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Actividades Industriales&nbsp;</td>
									</tr>
								</table>
								<table width="100%">
									<tr>
										<td class="CformNombre" width="55" id="activIndPpal">Principal:&nbsp;</td>
										<td class="CformDato"><html:select disabled="false"
												property="principalCO" onchange="habilitarCamposByCO()">
												<html:options collection="comboClasificacionOnu"
													property="value" labelProperty="label" filter="false" />
											</html:select></td>
									</tr>
									<tr>
										<td class="CformNombre" width="55">Otras:&nbsp;</td>
										<td class="CformDato"><logic:lessEqual value="-1"
												property="principalCO" name="cStanActionForm">
												<html:select disabled="true" property="clasificacionOnu"
													multiple="true" size="3" onchange="habilitarCamposByCO()">
													<html:options collection="comboClasificacionOnuM"
														property="value" labelProperty="label" filter="false" />
												</html:select>
											</logic:lessEqual> <logic:greaterThan value="-1" property="principalCO"
												name="cStanActionForm">
												<html:select disabled="false" property="clasificacionOnu"
													multiple="true" size="3" onchange="habilitarCamposByCO()">
													<html:options collection="comboClasificacionOnuM"
														property="value" labelProperty="label" filter="false" />
												</html:select>
											</logic:greaterThan></td>
									</tr>
									<tr>
										<td class="caratula_texto"><img
											src="./imagenes/ico_file_pdf.png"> <a target="_blank"
											href="./manuales/ListadoCodigosActividadesIndustriales.pdf" />
											PDF</td>
									</tr>
								</table>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Palabras Claves&nbsp;</td>
									</tr>
								</table>
								<table width="100%">
									<tr>
										<td class="CformNombre" width="55" id="pClave1">1ª:&nbsp;</td>
										<td class="CformDato"><html:text property="palabraClave1"
												maxlength="40" size="60" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="55" id="pClave2">2ª:&nbsp;</td>
										<td class="CformDato"><html:text property="palabraClave2"
												maxlength="40" size="60" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="55" id="pClave3">3ª:&nbsp;</td>
										<td class="CformDato"><html:text property="palabraClave3"
												maxlength="40" size="60" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="55" id="pClave4">4ª:&nbsp;</td>
										<td class="CformDato"><html:text property="palabraClave4"
												maxlength="40" size="60" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="55" id="pClave5">5ª:&nbsp;</td>
										<td class="CformDato"><html:text property="palabraClave5"
												maxlength="40" size="60" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%">
									<tr id="areaBotonesInfTecnologica">
										<td class="CformAreaBotones">
											<div align="right">
												<input type="button" class="CformBoton" value="Siguiente"
													name="cStanActionForm" onclick="irTabSiguiente()" />
												<capplication:isApplication application="SVTP">
													<logic:equal value="no" property="modificaOferta"
														name="cStanActionForm">
														<html:submit property="btnSubmit" styleClass="CformBoton"
															value="Limpiar" />
													</logic:equal>
												</capplication:isApplication>
												<capplication:isApplication application="SVT">
													<html:submit property="btnSubmit" styleClass="CformBoton"
														value="Limpiar" />
												</capplication:isApplication>

											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table align="center" cellpadding="0" cellspacing="0"
						class="tablaMin">
						<tr>
							<td>Atención: Para seleccionar más de un ítem en "Otras"
								presionar CTRL+Botón izquierdo del mouse</td>
						</tr>
						<tr>
							<td><b> Futuros clientes realizaran búsquedas en base a
									estos campos, cuanta más información coloque mejor promovida
									estará su OT</b></td>
						</tr>
					</table>

				</div>


				<!-- tab5-->
				<div id="costos">
					<table align="center" cellpadding="0" cellspacing="0"
						class="tablaMin">
						<tr>
							<td width="650" class="CformAreaBotones">
								<div align="center">
									<input type="button" class="CformBotonTranspBorde"
										value="|<<" name=" cStanActionForm"   onclick="irTabInicial()" />
									<input type="button" class="CformBotonTranspBorde"
										value="<" name=" cStanActionForm"   onclick="irTabAnterior()" />
									<input type="button" class="CformBotonTranspBorde" value=">"
										name="cStanActionForm" onclick="irTabSiguiente()" /> <input
										type="button" class="CformBotonTranspBorde" value=">>|"
										name="cStanActionForm" onclick="irTabFinal()" />
								</div>
							</td>
						</tr>
					</table>
					<table class="CformTable" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Costos:&nbsp;<span class="dato_obligatorio">*</span>

											(Unidad de Prestación:&nbsp;
											<div id="unidadPrestacionDescripcion"
												style="display: inline;"></div>)

										</td>
									</tr>
								</table> <logic:notEmpty property="stanCostos" name="cStanActionForm">

									<table width="100%">
										<tr>
											<td colspan="10"><display:table
													name="sessionScope.cStanActionForm.stanCostos"
													requestURI="cStanAltaAction.do"
													decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
													<display:column property="descripcion" title="Descripción"
														headerClass="tableCellHeader" style="width: 200px;" />
													<display:column property="costoConsolidado"
														title="Costo $ Mínimo" maxLength="20"
														headerClass="tableCellHeader"
														style="text-align:right;width: 80px;" />
													<display:column property="fechaDesde"
														title="Vigencia desde" headerClass="tableCellHeader"
														style="text-align:right; width: 150px;" />
													<display:column property="fechaHasta"
														title="Vigencia hasta" headerClass="tableCellHeader"
														style="text-align:right; width: 150px;" />
													<display:column property="estado" title="Estado"
														headerClass="tableCellHeader"
														style="align:right; width: 150px;" />
												</display:table></td>
										</tr>
									</table>
								</logic:notEmpty> <logic:empty property="stanCostos" name="cStanActionForm">
									<tr>
										<td>No se informaron costos&nbsp;</td>
									</tr>
								</logic:empty>


							</td>
						</tr>

						<tr>
							<td>
								<table width="100%">
									<tr>
										<td class="CformAreaBotones">
											<div align="right">
												<html:submit property="btnSubmit" styleClass="CformBoton"
													value="Seleccionar" />
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>



						<tr>
							<td>
								<table width="100%">
									<tr>
										<td width="40%" class="CformAreaBotones">
											<div align="left" class="dato_obligatorio">* Datos
												obligatorios</div>
										</td>
										<td width="60%" class="CformAreaBotones">
											<div align="right">
												<input type="button" class="CformBoton" value="Siguiente"
													name="cStanActionForm" onclick="irTabSiguiente()" />
												<capplication:isApplication application="SVTP">
													<logic:equal value="no" property="modificaOferta"
														name="cStanActionForm">
														<html:submit property="btnSubmit" styleClass="CformBoton"
															value="Limpiar" />
													</logic:equal>
												</capplication:isApplication>
												<capplication:isApplication application="SVT">
													<html:submit property="btnSubmit" styleClass="CformBoton"
														value="Limpiar" />
												</capplication:isApplication>

											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>



				<!-- tab4-->


				<div id="resolucion">


					<table align="center" cellpadding="0" cellspacing="0"
						class="tablaMin">
						<tr>
							<td class="CformAreaBotones">
								<div align="center">
									<input type="button" class="CformBotonTranspBorde"
										value="|<<" name=" cStanActionForm" onclick="irTabInicial()" />
									<input type="button" class="CformBotonTranspBorde"
										value="<" name=" cStanActionForm" onclick="irTabAnterior()" />
									<input type="button" class="CformBotonTranspBorde" value=">"
										name="cStanActionForm" onclick="irTabSiguiente()" /> <input
										type="button" class="CformBotonTranspBorde" value=">>|"
										name="cStanActionForm" onclick="irTabFinal()" />
								</div>
							</td>
						</tr>
					</table>
					<table class="CformTable" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><capplication:isApplication application="SVT">
									<table width="100%">

										<tr bgcolor="#DDEEFF">
											<td>Expediente</td>
										</tr>
									</table>

									<table width="100%">
										<tr>
											<td class="CformNombre" width="130">Nro:</td>
											<td class="CformDato"><html:text size="6"
													property="nroExpediente" maxlength="6"
													onkeypress="validarNumero()" /> / <html:text size="4"
													property="anioExpediente" maxlength="4"
													onkeypress="validarNumero()" /></td>
										</tr>
									</table>
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td>Autorización&nbsp;</td>
										</tr>
									</table>
									<table width="100%">
										<tr>
											<td class="CformNombre" width="130">Fecha:&nbsp;<span
												class="dato_obligatorio">(1)</span></td>
											<td class="CformDato"><html:text
													styleId="id_fecha_autorizacion"
													property="fechaAutorizacion" maxlength="10" size="10"
													onkeypress="validarNumero()" /></td>
										</tr>
									</table>
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td>Resolución&nbsp;</td>
										</tr>
									</table>
									<table>
										<tr>
											<td class="CformNombre" width="130">Tipo:&nbsp;<span
												class="dato_obligatorio">(1)</span></td>
											<td class="CformDato"><html:select disabled="false"
													property="tipoResolucion">
													<html:options collection="comboTipoResolucion"
														property="value" labelProperty="label" />
												</html:select></td>
											<td class="CformNombre">Nro:&nbsp;</td>
											<td class="CformDato"><html:text
													property="nroResolucion" maxlength="6" size="6"
													onkeypress="validarImporte(this)" /></td>
										</tr>
									</table>
									<table>
										<tr>
											<td class="CformNombre" width="130">Fecha:&nbsp;</td>
											<td class="CformDato"><html:text
													styleId="id_fecha_resolucion" property="fechaResolucion"
													maxlength="10" size="10" onkeypress="validarNumero()" /></td>
										</tr>
										<tr>
											<td class="CformNombre" width="130">Estado:&nbsp;</td>
											<td class="CformDato"><html:select disabled="false"
													property="estadoResolucion">
													<html:options collection="comboEstadoResolucion"
														property="value" labelProperty="label" />
												</html:select></td>
										</tr>
									</table>
								</capplication:isApplication>
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td>Situación Actual&nbsp;</td>
									</tr>
								</table>


								<table width="100%">

									<tr>
										<td class="CformNombre" width="130">Estado: <span
											class="dato_obligatorio">*</span>
										</td>
										<td class="CformDato"><html:select disabled="false"
												property="tipoEstado"
												onchange="habilitarPublicacionByHabilitados(this)">
												<html:options collection="comboEstadosByTipoOferta"
													property="value" labelProperty="label" />
											</html:select></td>
									</tr>

									<capplication:isApplication application="SVT">
										<tr>
											<td class="CformNombre" width="130">Publicación
												Web:&nbsp;&nbsp;&nbsp;</td>
											<logic:notEqual value="DVH" property="rolUsuario"
												name="cStanActionForm">
												<logic:equal value="S" property="publicable"
													name="cStanActionForm">
													<td class="CformDato">Sí<html:radio property="publica"
															value="S" /> No<html:radio property="publica" value="N" />
													</td>
												</logic:equal>
												<logic:equal value="N" property="publicable"
													name="cStanActionForm">
													<td class="CformDato">Sí<html:radio property="publica"
															value="S" disabled="true" /> No<html:radio
															property="publica" value="N" disabled="true" />
													</td>
												</logic:equal>
											</logic:notEqual>
											<logic:equal value="DVH" property="rolUsuario"
												name="cStanActionForm">
												<td class="CformDato">Sí <html:radio property="publica"
														value="S" disabled="true" /> No <html:radio
														property="publica" value="N" disabled="true" />
												</td>
											</logic:equal>

											<html:hidden property="publica" />

										</tr>


									</capplication:isApplication>
								</table></td>
						</tr>

						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td class="CformAreaBotones">
											<div align="left" class="dato_obligatorio">* Datos
												obligatorios</div>
										</td>

										<td class="CformAreaBotones">
											<div align="right">
												<html:submit property="btnSubmit" styleClass="CformBoton"
													value="Registrar" />
												<capplication:isApplication application="SVTP">
													<logic:equal value="no" property="modificaOferta"
														name="cStanActionForm">
														<html:submit property="btnSubmit" styleClass="CformBoton"
															value="Limpiar" />
													</logic:equal>
												</capplication:isApplication>
												<capplication:isApplication application="SVT">
													<html:submit property="btnSubmit" styleClass="CformBoton"
														value="Limpiar" />
												</capplication:isApplication>


											</div>
										</td>

									</tr>
								</table>
							</td>
						</tr>

					</table>


					<capplication:isApplication application="SVT">
						<table align="center" cellpadding="0" cellspacing="0"
							class="tablaMin">
							<tr>
								<td><span class="dato_obligatorio">(1)</span> Si el estado
									del STAN es "Aprobado" o "Denegado" los datos de la Resolución
									son obligatorios. Si el estado es "Autorizado" la fecha de
									autorización es obligatoria.</td>
							</tr>
						</table>
					</capplication:isApplication>
				</div>




			</div>
		</div>

	</logic:equal>
	<script>
  habilitarDescripcion();
</script>

</html:form>
