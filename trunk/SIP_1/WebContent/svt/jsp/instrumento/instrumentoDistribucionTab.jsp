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
<bean:define id="loteDistribucion" name="form" property="itemsDistribucionStruct" />

		<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
				<td>
					<table class="tablaMin" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<table align="center" cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td>
											<table width="100%" cellpadding="2" cellspacing="2">
												<tr bgcolor="#BFDFFF">
													<td>Distribución:</td>
												</tr>
												<tr>
													<td>
														<table width="100%">
															<tr>
																<td colspan="10"><display:table class="CFormDisplayTable" style="width: 100%" name='<%= loteDistribucion %>' id='<%= pageName %>'
																		decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoItemDistribucionDisplayWrapper">
																		<display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
																		<logic:equal value="input" name="tipoPantalla">
																			<display:column property="porcentajeComision" title="% Porcentaje" headerClass="tableCellHeader" style="width: 80px; text-align:right;" />
																		</logic:equal>
																		<logic:equal value="view" name="tipoPantalla">
																			<display:column property="porcentajeComisionTexto" title="% Porcentaje" headerClass="tableCellHeader" style="width: 80px; text-align:right;" />
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