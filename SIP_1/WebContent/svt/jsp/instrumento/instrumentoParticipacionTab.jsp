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
<bean:define id="loteParticipantes" name="form" property="participantesInstrumento" />

<html:hidden property="participanteSeleccionado" styleId="ParticipanteSeleccionado" />

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
																<td>Participantes:<span id="id_participante_obl" class="dato_obligatorio">*</span>
																</td>
															</tr>
															<tr>
																<td colspan="10"><display:table class="CFormDisplayTable" name='<%= loteParticipantes %>' id='<%= pageName %>'
																		decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoParticipanteDisplayWrapper">
																		<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 200x;" />
																		<display:column property="rolParticipante" title="Rol" headerClass="tableCellHeader" style="width: 200px;" />
																		<display:column property="nombre" title="Participante" headerClass="tableCellHeader" style="width: 200px;" />
																		<display:column property="categoria" title="Categoría" headerClass="tableCellHeader" style="width: 200px;" />
																		<display:column property="cuit" title="CUIT" headerClass="tableCellHeader" style="width: 150px;" />
																		<display:column property="participacion" title="Participación" headerClass="tableCellHeader" style="width: 150px;" />
																	
																	<logic:equal value="input" name="tipoPantalla">
																		<display:column property="remove" title="  " headerClass="tableCellHeader" style="width: 10px;" />
																		<display:footer>
																			<tr style="background-color: #FAFAFA;">
																				<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="2">Ingresar Nuevo: <html:select styleId="rolParticipante"
																						property="rolParticipante">
																						<html:options name="form" collection="comboRolesParticipantes" property="value" labelProperty="label" />
																					</html:select>
																				</td>
																				<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="2" >
																					<div id="autoCompleteParticipanteDescripcion" style='display: inline-block;'>
																						<label id="autoCompleteParticipanteTexto"> </label> <a href="#" onclick="removeBy('Participante')"><img src="./imagenes/close.png" align="top" /> </a>
																					</div> <input type="text" name="autoCompleteContratante" id="autoCompleteParticipante" width="200" /> &nbsp;</td>
																				<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;" colspan="3"><html:submit styleId="btnAgregarParticipante" style="width:110px;"
																						property="btnSubmit" value="Agregar Participante" styleClass="CformBoton" />
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
								</table></td>
						
			</tr>
			<tr>
				<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
					<div align="right">
					    <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
					</div></td>
			</tr>
		</table>