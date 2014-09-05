<%@page
	import="conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento"%>
<%@page import="conicet.apps.svt.object.instrumento.EEstadoInstrumento"%>
<%@page import="conicet.apps.svt.object.convenio.ETipoConvenio"%>
<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript"
	src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/generalScript.js"></script>


<bean:define id="tipoPantalla" value='<%=request.getParameter("tipoPantalla")%>' /> 
<bean:define id="form" name='<%=request.getParameter("instrumentoForm")%>' />
<bean:define id="pageName" value='<%=request.getParameter("pageName")%>' />
<bean:define id="actionPage" name="form" property="actionName" />
<bean:define id="loteAdministradores" name="form" property="administradoresInstrumento" />
<bean:define id="lotePartes" name="form" property="partesInstrumento" />
<bean:define id="loteUDs" name="form" property="udsInstrumento" />
<bean:define id="tipoInstrumento" name="form" property="tipo" />


<html:hidden property="prestadorSeleccionado" styleId="PrestadorSeleccionado" />
<html:hidden property="uvtSeleccionado" styleId="UvtSeleccionado" />
<html:hidden property="contraparteSeleccionado" styleId="ContraparteSeleccionado" />
<html:hidden property="contratanteSeleccionado" styleId="ContratanteSeleccionado" />
<html:hidden property="promotorSeleccionado" styleId="PromotorSeleccionado" />
<html:hidden property="contratantePromotorSeleccionado" styleId="ContratantePromotorSeleccionado" />
<html:hidden property="conicetSeleccionado" styleId="ConicetSeleccionado" />

<table class="CformTable" align="center" cellpadding="0" cellspacing="0"
	width="600">
	<tr>
		<td>
			<table align="center" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table width="100%" cellpadding="2" cellspacing="2">
							<tr bgcolor="#BFDFFF">
								<td colspan="10"><strong>Intervinientes &nbsp;</strong></td>
							</tr>
							<tr>
								<td><logic:equal value="modificar" name="form"
										property="valueEAccion">
										<table>
											<tr>
												<td class="CformNombre">Responsable Técnico:</td>
												<td class="CformDato"><bean:write name="form"
														property="responsableTecnico" /></td>
											</tr>
										</table>
									</logic:equal></td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td>Administradores:</td>
										</tr>
										<tr>
											<td colspan="10"><display:table
													class="CFormDisplayTable" style="100%"
													name='<%=loteAdministradores%>' id='<%=pageName%>'
													decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoAdmDisplayWrapper">
													<logic:equal value="convenioDetalle" name="pageName">
														<display:column property="indice" title="#"
															headerClass="tableCellHeader" style="width: 6px;" />
													</logic:equal>
													<display:column property="funcion" title="Tipo Adm."
														headerClass="tableCellHeader" style="width: 200px;" />
													<display:column property="parteSigla" title="Sigla/Nombre"
														headerClass="tableCellHeader" style="width:  200px;" />
													<display:column property="parteNombre" title="Descripción"
														headerClass="tableCellHeader" style="width: 200px;" />
													<display:column property="parteCuitDoc" title="CUIT/Doc."
														headerClass="tableCellHeader" style="width: 200px;" />

													<logic:equal value="input" name="tipoPantalla">
														<display:column property="remove" title="  "
															headerClass="tableCellHeader" style="width: 110px" />
														<display:footer>
															<tr style="background-color: #FAFAFA;">
																<td
																	style="text-align: center; widht: 200px; border-color: #CCCCCC; border-style: solid; border-width: 1px;"
																	colspan="2">Ingresar Nuevo: <html:select
																		styleId="tipoAdm" property="tipoAdmAgregar"
																		onchange="cambiarTipoAdm()">
																		<html:options name="form" collection="comboTiposAdm"
																			property="value" labelProperty="label" />
																	</html:select>
																</td>
																<td
																	style="text-align: center; width: 200px; border-color: #CCCCCC; border-style: solid; border-width: 1px;"
																	colspan="2">
																	<div id="autoCompleteDeFondosDiv"
																		style="display: none;">
																		<capplication:autoComplete tipoAutocomplete="DeFondos" />
																	</div>
																	<div id="autoCompleteDelegadoDiv"
																		style="display: none;">
																		<capplication:autoComplete tipoAutocomplete="Delegado" />
																	</div>
																</td>
																<td
																	style="text-align: center; width: 110; border-color: #CCCCCC; border-style: solid; border-width: 1px;"
																	colspan="3"><html:submit styleId="btnAgregarAdm"
																		style="width:100px;" property="btnSubmit"
																		value="Agregar Adm" styleClass="CformBoton" /></td>
															</tr>
														</display:footer>
													</logic:equal>

												</display:table></td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="10">
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td>Partes:<logic:notEqual value="PDT"
													name="tipoInstrumento" property="tipo">
													<span class="dato_obligatorio">*</span>
												</logic:notEqual></td>
										</tr>
										<tr>
											<td colspan="10"><display:table
													class="CFormDisplayTable" style="100%"
													name='<%=lotePartes%>' id='<%=pageName%>'
													decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoParteDisplayWrapper">
													<logic:equal value="convenioDetalle" name="pageName">
														<display:column property="indice" title="#"
															headerClass="tableCellHeader" style="width: 6px;" />
													</logic:equal>
													<display:column property="funcion" title="Función"
														headerClass="tableCellHeader" style="width: 200px;" />
													<display:column property="parteSigla" title="Sigla/Nombre"
														headerClass="tableCellHeader" style="width:  200px;" />
													<display:column property="parteNombre" title="Descripción"
														headerClass="tableCellHeader" style="width: 200px;" />
													<display:column property="parteCuitDoc" title="CUIT/Doc."
														headerClass="tableCellHeader" style="width: 200px;" />

													<logic:equal value="input" name="tipoPantalla">
														<display:column property="remove" title="  "
															headerClass="tableCellHeader" style="width: 110px" />
														<display:footer>
															<tr style="background-color: #FAFAFA;">
																<td
																	style="text-align: center; widht: 200px; border-color: #CCCCCC; border-style: solid; border-width: 1px;"
																	colspan="2">Ingresar Nuevo: <html:select
																		styleId="tipoParte" property="tipoParteAgregar"
																		onchange="cambiarTipoParte()">
																		<html:options name="form" collection="comboTiposParte"
																			property="value" labelProperty="label" />
																	</html:select></td>
																<td
																	style="text-align: center; width: 200px; border-color: #CCCCCC; border-style: solid; border-width: 1px;"
																	colspan="2">
																	<div id="autoCompleteContraparteDescripcion"
																		style='display: inline-block;'>
																		<label id="autoCompleteContraparteTexto"> </label> <a
																			href="#" onclick="removeBy('Contraparte')"><img
																			src="./imagenes/close.png" align="top" /> </a>
																	</div> <input type="text" name="autoCompleteContraparte"
																	id="autoCompleteContraparte" />
																	<div id="autoCompletePromotorDescripcion"
																		style='display: inline-block;'>
																		<label id="autoCompletePromotorTexto"> </label> <a
																			href="#" onclick="removeBy('Promotor')"><img
																			src="./imagenes/close.png" align="top" /> </a>
																	</div> <input type="text" name="autoCompletePromotor"
																	id="autoCompletePromotor" width="200" />
																	<div id="autoCompleteContratanteDescripcion"
																		style='display: inline-block;'>
																		<label id="autoCompleteContratanteTexto"> </label> <a
																			href="#" onclick="removeBy('Contratante')"><img
																			src="./imagenes/close.png" align="top" /> </a>
																	</div> <input type="text" name="autoCompleteContratante"
																	id="autoCompleteContratante" width="200" />
																	<div id="autoCompleteContratantePromotorDescripcion"
																		style='display: inline-block;'>
																		<label id="autoCompleteContratantePromotorTexto">
																		</label> <a href="#" onclick="removeBy('ContratantePromotor')"><img
																			src="./imagenes/close.png" align="top" /> </a>
																	</div> <input type="text"
																	name="autoCompleteContratantePromotor"
																	id="autoCompleteContratantePromotor" width="200" />&nbsp;
																	<div id="autoCompleteConicetDescripcion"
																		style='display: inline-block;'>
																		<label id="autoCompleteConicetTexto"> </label> <a
																			href="#" onclick="removeBy('Conicet')"><img
																			src="./imagenes/close.png" align="top" /> </a>
																	</div> <input type="text" readonly="readonly"
																	name="autoCompleteConicet" id="autoCompleteConicet"
																	width="200" />&nbsp;
																	<div id="autoCompleteUvtDescripcion" style='display: inline-block;'>
																						<label id="autoCompleteUvtTexto"> </label> <a href="#" onclick="removeBy('Uvt')"><img src="./imagenes/close.png" align="top" /> </a>
																					</div> <input type="text" name="autoCompleteUvt" id="autoCompleteUvt" width="200" />
																</td>
																<td
																	style="text-align: center; width: 110; border-color: #CCCCCC; border-style: solid; border-width: 1px;"
																	colspan="3"><html:submit styleId="btnAgregarParte"
																		style="width:100px;" property="btnSubmit"
																		value="Agregar Parte" styleClass="CformBoton" /></td>
															</tr>
														</display:footer>
													</logic:equal>

												</display:table></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td>UD's:</td>
										</tr>
										<tr>
											<td colspan="10"><display:table
													class="CFormDisplayTable" style="100%" name='<%=loteUDs%>'
													id='<%=pageName%>'
													decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoUDDisplayWrapper">
													<logic:equal value="convenioDetalle" name="pageName">
														<display:column property="indice" title="#"
															headerClass="tableCellHeader" style="width: 6px;" />
													</logic:equal>
													<display:column property="parteSigla" title="Sigla/Nombre"
														headerClass="tableCellHeader" style="width:  250px;" />
													<display:column property="parteNombre" title="Descripción"
														headerClass="tableCellHeader" style="width: 250px;" />
													<display:column property="parteCuitDoc" title="CUIT/Doc."
														headerClass="tableCellHeader" style="width: 250px;" />

													<logic:equal value="input" name="tipoPantalla">
														<display:column property="remove" title="  "
															headerClass="tableCellHeader" style="width: 160px" />
														<display:footer>
															<tr style="background-color: #FAFAFA;">
																<td
																	style="text-align: center; widht: 200px; border-color: #CCCCCC; border-style: solid; border-width: 1px;"
																	colspan="3">Ingresar Prestador:
																	<div id="autoCompletePrestadorDescripcion"
																		style='display: inline-block;'>
																		<label id="autoCompletePrestadorTexto"> </label> <a
																			href="#" onclick="removeBy('Prestador')"><img
																			src="./imagenes/close.png" align="top" /> </a>
																	</div> <input type="text" name="autoCompletePrestador"
																	id="autoCompletePrestador" width="200"
																	style='display: inline-block;' />
																</td>
																<td
																	style="text-align: center; width: 110; border-color: #CCCCCC; border-style: solid; border-width: 1px;"
																	colspan="2"><html:submit styleId="btnAgregarUD"
																		style="width:100px;" property="btnSubmit"
																		value="Agregar UD" styleClass="CformBoton" /></td>
															</tr>
														</display:footer>
													</logic:equal>

												</display:table></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	</tr>
	<tr>
				<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
					<div align="right">
					    <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
					</div></td>
			</tr>
</table>