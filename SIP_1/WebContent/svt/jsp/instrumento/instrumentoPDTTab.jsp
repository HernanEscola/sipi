<%@page import="conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento"%>
<%@page import="conicet.apps.svt.object.instrumento.EEstadoInstrumento"%>
<%@page import="conicet.apps.svt.object.convenio.ETipoConvenio"%>
<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/generalScript.js"></script>

<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="form" name='<%= request.getParameter("instrumentoForm") %>' />
<bean:define id="tipoInstrumento" name="form" property="tipo" />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionPage" name="form" property="actionName" />
<bean:define id="loteContactos" name="form" property="contactosInstrumento" />


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
														<logic:equal value="input" name="tipoPantalla">
															<tr bgcolor="#BFDFFF">
																<td colspan="10"><strong>PDT &nbsp;</strong></td>
															</tr>
															<tr>
																<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
																	<td class="CformNombre" width="75">Es PDT:</td>
																	<td class="CformDato" width="75"><html:checkbox styleId="id_es_pdt" name="form" property="esPDT" />
																	</td>
																</logic:notEqual>
																<logic:equal value="PDT" name="tipoInstrumento" property="tipo">
																	<html:hidden styleId="id_es_pdt" property="esPDT" name="form" value="true"/>
																</logic:equal>
																	
														
																<td class="CformNombre" width="75">Nro. PCTI:</td>
																<td class="CformDato">
																<html:text styleId="pctiNro_id" name="form" property="pctiNro"  size="6" maxlength="6" style="text-align:right;"/>
																</td>
															</tr>	
															<tr>	
																<td class="CformNombre" width="100">Categoría PDT:</td>
																<td class="CformDato"colspan="5"><html:select styleId="categoriaPDT" property="categoriaPDT" style=" width:400px">
																		<html:options name="form" collection="comboCategoriaPDT" property="value" labelProperty="label" />
																	</html:select>
																</td>
						
															</tr>	
															<tr>
															    <td class="CformNombre">Titulo: </td>
																<td class="CformDato" colspan="5"><html:textarea name="form" styleId="tituloPdts" property="tituloPdts" />
																</td>
															</tr>
															<tr>
															<td class="CformNombre" width="100">Área de conocimiento:</td>
																<td class="CformDato" colspan="5"><html:select styleId="clasificacionPDT" property="clasificacionPDT" style=" width:800px">
																		<html:options name="form" collection="comboClasificacionPDT" property="value" labelProperty="label" />
																	</html:select>
																</td>
															</tr>
															</logic:equal>
															
															
															<logic:equal value="view" name="tipoPantalla">
																				<tr bgcolor="#BFDFFF">
						<td colspan="10"><strong>PDT &nbsp;</strong></td>
					</tr>
					<tr>
						<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
							<td class="CformNombre" width="100">Es PDT:</td>
							<td class="CformDato" width="100"><html:hidden name="form" property="esPDT"/><html:checkbox disabled="true" name="form" property="esPDT" />
							</td>
						</logic:notEqual>	
						
						<td class="CformNombre">Nro. PCTI:</td>
						<td class="CformDato">
						<logic:equal value="true" name="form" property="esPDT" >
						<bean:write name="form" property="pctiNro" />
						</logic:equal>
						</td>
					</tr>
					<tr>

						<td class="CformNombre" width="100">Categoría PDT:</td>
						<td class="CformDato"  colspan="5"><logic:equal value="true" name="form" property="esPDT" ><bean:write name="form" property="categoriaPDT" /></logic:equal>
						</td>

					</tr>
					<tr>
						<td class="CformNombre">Título:</td>
						<td class="CformDato" colspan="5"><logic:equal value="true" name="form" property="esPDT" ><bean:write name="form" property="tituloPdts" /></logic:equal>
						</td>
					</tr>

					<tr>
						<td class="CformNombre" width="100">Área de conocimiento:</td>
						<td class="CformDato"  colspan="5">
						<logic:equal value="true" name="form" property="esPDT" >
							<html:select styleId="clasificacionPDT" property="clasificacionPDT" disabled="true" style=" width:800px">
								<html:options name="form" collection="comboClasificacionPDT" property="value" labelProperty="label" />
							</html:select>
						</logic:equal>	
						</td> 
					</tr>
												</logic:equal>			
															
														</table>
													</td>
												</tr>
											</table>
										</td>
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
				