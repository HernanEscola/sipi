<%@page import="conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento"%>
<%@page import="conicet.apps.svt.object.instrumento.EEstadoInstrumento"%>
<%@page import="conicet.apps.svt.object.convenio.ETipoConvenio"%>
<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/generalScript.js"></script>

<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="form" name='<%= request.getParameter("instrumentoForm") %>' />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionPage" name="form" property="actionName" />
<bean:define id="loteContactos" name="form" property="contactosInstrumento" />

<html:hidden property="contactoContratanteSeleccionado" styleId="ContactoContratanteSeleccionado" />

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
				<td>
					<table class="tablaMin" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<table width="100%" cellpadding="2" cellspacing="2">
												<tr>
													<td colspan="10">
														<table width="100%">
															<tr bgcolor="#DDEEFF">
																<td>Contactos:
																</td>
															</tr>
															<tr>
																<td colspan="10"><display:table class="CFormDisplayTable" name='<%= loteContactos %>' id='<%= pageName %>'
																		decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoContactoDisplayWrapper">
																		<logic:equal value="convenioDetalle" name="pageName">
																			<display:column property="indice" title="#"	headerClass="tableCellHeader" style="width: 6px;" />
																		</logic:equal>	
																		<display:column property="funcion" title="Tipo Contacto" headerClass="tableCellHeader" style="width: 200px;" />
																		<display:column property="contactoOrganismoOContratante" title="Organismo/Contratante" headerClass="tableCellHeader" style="width:  300px;" />
																		<display:column property="parteNombre" title="Apellido y Nombre" headerClass="tableCellHeader" style="width:  300px;" />
																		<display:column property="contactoTelefono" title="Telefono" headerClass="tableCellHeader" style="width: 400px;" />
																		
																		<logic:equal value="input" name="tipoPantalla">
																			<display:column property="remove" title="  " headerClass="tableCellHeader" style="width: 110px" />
																			<display:footer>
																				<tr style="background-color: #FAFAFA;">
																					<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="2">
																						Ingresar Contacto: 
																						<html:select styleId="tipoContacto" property="tipoContactoAgregar" onchange="cambiarTipoContacto()">
																							<html:options name="form" collection="comboTipoContactos"property="value" labelProperty="label" />
																						</html:select>
																					</td>
																					<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="2" >
																						<div id="autoCompleteContactoContratanteDiv" style="display: none;">
																							<div id="autoCompleteContactoContratanteDescripcion" style='display: inline-block;'>
																								<label id="autoCompleteContactoContratanteTexto"> </label> <a href="#" onclick="removeBy('ContactoContratante')"><img src="./imagenes/close.png" align="top" /> </a>
																							</div> <input type="text" name="autoCompleteContactoContratante" id="autoCompleteContactoContratante" width="200" /> &nbsp;
																						</div>
																						<div id="autoCompleteContactoOtrosOrganismosDiv" style="display: none;">
																							<capplication:autoComplete tipoAutocomplete="ContactoOtrosOrganismos" />
																						</div>
																					</td>
																					<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="1"><html:submit styleId="btnAgregarContacto" style="width:110px;"
																							property="btnSubmit" value="Agregar Contacto" styleClass="CformBoton" />
																					</td>
																				</tr>
																			</display:footer>
																		</logic:equal>
																		
																	</display:table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table></td>
									</tr>
								</table>
								</td>
						
			</tr>
			<tr>
				<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
					<div align="right">
					    <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
					</div></td>
			</tr>
</table>

