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
<bean:define id="loteMontos" name="form" property="montosInstrumento" />


<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	<tr>
		<td>
			<table class="tablaMin" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td>
						<table width="100%" cellpadding="2" cellspacing="2">
							<tr>
								<td colspan="10">
									<table width="100%">
										<tr bgcolor="#BFDFFF">
											<td colspan="10"><strong>Acuerdo de facturaci&oacute;n &nbsp;</strong></td>
										</tr>

										<tr>
											<td colspan="10"><display:table
													class="CFormDisplayTable" name='<%=loteMontos%>'
													id='<%=pageName%>'
													decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoMontoDisplayWrapper">
													<display:column property="tipoMoneda" title="Tipo Moneda"
														headerClass="tableCellHeader" style="width: 60px;" />
													<display:column property="monto" title="Importe"
														headerClass="tableCellHeader" style="width: 80px;" />
													<display:column property="tipoMonto" title="Tipo Monto"
														headerClass="tableCellHeader" style="width: 80px;" />
													<display:column property="observacionMonto"
														title="Observación" headerClass="tableCellHeader"
														style="width: 300px;" />
												<logic:equal value="input" name="tipoPantalla">
													<display:column property="remove" title="  "
														headerClass="tableCellHeader" style="width: 10px;" />
													<display:footer>
														<tr style="background-color: #FAFAFA;">
															<td
																style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 200px;">Ingresar
																Nuevo: <html:select name="form" property="otraMoneda">
																	<html:options name="form" collection="comboTipoMoneda"
																		filter="false" property="value" labelProperty="label" />
																</html:select>
															</td>
															<td
																style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 80px;"><html:text
																	name="form" property="monto" styleId="id_monto"
																	style="text-align:right;" maxlength="12" size="10"
																	onblur="formatImporte(this),calcularDistribucion()" /></td>
															<td
																style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 80px;"><html:select
																	styleId="tipoMonto" property="tipoMonto">
																	<html:options name="form" collection="comboTipoMontos"
																		property="value" labelProperty="label" />
																</html:select></td>
															<td
																style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;"><html:textarea
																	name="form" property="observacionMonto" /></td>
															<td colspan="2"
																style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;"><html:submit
																	style="width:100px;" property="btnSubmit"
																	value="Agregar Monto" styleClass="CformBoton" /></td>
														</tr>
													</display:footer>
									</logic:equal>
												</display:table></td>
										</tr>
										<tr>
											<td class="CformNombre">Otros Ingresos :</td>
											<td class="CformDato" colspan="3">
											<logic:equal value="input" name="tipoPantalla">
												<html:textarea name="form" property="otrosIngresos" />
											</logic:equal>
											<logic:equal value="view" name="tipoPantalla">
												<bean:write name="form" property="otrosIngresos" />
											</logic:equal>
													
											</td>
										</tr>

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
