<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/generalScript.js"></script>
<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="form" name='<%= request.getParameter("form") %>' />
<bean:define id="loteParticipacion" name="form" property="participaciones" />

	<script>
	function quitar(tipo ,index)
	{
	  submitAction("?method=remove "+tipo+"&removeIndex="+index);
	}
	
		$(document).ready(function() {

			var input = new CInputNumero(true);
			var input2 = new CInputNumero(false);
			input2.bind("#id_duracion");//selector de jquery
			input.bind("#id_porcentaje");//selector de jquery

			//deshabilita el enter, y quita el foco al presionarlo
			$("input[type=text]").keypress(function(e) {
				if (e.which == 13) {
					this.blur();
					return false;
				}
			});
		});
	</script>
	<div id="datos">
		<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
				<td>
					<table class="tablaMin" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<table width="100%" cellpadding="2" cellspacing="2">
									<tr bgcolor="#BFDFFF">
										<td colspan="10"><strong>Participante &nbsp;</strong></td>
									</tr>
									<tr>
										<td class="CformNombre" width="75">Nombre:</td>
										<td class="CformDato"><bean:write name="form" property="nombreParticipante" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="75">Rol:</td>
										<td class="CformDato"><bean:write name="form" property="rolParticipante" /></td>
									</tr>
									<tr>
										<td colspan="10">
											<table width="100%">

												<tr bgcolor="#DDEEFF">
													<td>Participación:
													</td>
												</tr>

												<tr>
													<td colspan="10"><display:table class="CFormDisplayTable" name='<%= loteParticipacion %>' id='listaParticipacion_id'
															decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoParticipacionDisplayWrapper">
															<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 6px;" />
															<display:column property="duracion" title="Duración" headerClass="tableCellHeader" style="width: 300px; " />
															<display:column property="dedicacion" title="Porcentaje de Dedicación" headerClass="tableCellHeader" style="width: 200px;" />
															<logic:notEqual value="view" name="tipoPantalla">
																<display:column property="remove" title="  " headerClass="tableCellHeader" style="width: 10px;" />
																<display:footer>
																	<tr style="background-color: #FAFAFA;">
																		<td style="text-align: right; border-color: #CCCCCC; border-style: solid; border-width: 1px;"><strong>Ingresar Nueva:</strong>
																		</td>
																		<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;"><html:text name="form" property="duracion" style="text-align:right;" maxlength="3"
																				size="3" styleId="id_duracion" /> <html:select styleId="unidad" property="unidad" style="width: 90px;">
																				<html:options name="form" collection="comboUnidades" property="value" labelProperty="label" />
																			</html:select>
																		</td>
																		<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;"><html:text name="form" property="porcentaje" style="text-align:right;"
																				maxlength="6" size="7" styleId="id_porcentaje" onblur="formatImporte(this)" />
																		</td>
																		<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;"><html:submit styleId="btnAgregarParticipante" style="width:85px;"
																				property="btnSubmit" value="Agregar" styleClass="CformBoton" />
																		</td>
																	</tr>
																</display:footer>
															</logic:notEqual>
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
				<td class="CformAreaBotones" height="35"><logic:notEqual value="view" name="tipoPantalla"><span class="dato_obligatorio">* Datos obligatorios</span></logic:notEqual>
					<div align="right">
						<jsp:include page="/jsp/layout/botones.jsp">
							<jsp:param name="formulario" value='<%= request.getParameter("form") %>' />
							<jsp:param name="entidad" value="instrumentoParticipacion" />
						</jsp:include>
					</div>
				</td>
			</tr>
		</table>
	</div>