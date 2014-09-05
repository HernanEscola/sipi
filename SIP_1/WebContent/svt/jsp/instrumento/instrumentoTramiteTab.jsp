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
<bean:define id="loteTramites" name="form" property="itemsTramite" />

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
						<tr>
							<td colspan="10">
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>Trámite &nbsp;</strong></td>
										<td>Estado: <bean:write name="form" property="estadoDelTramite" /></td>
									</tr>
								</table>
								<table width="100%">
									<tr>
										<td colspan="10"><display:table class="CFormDisplayTable" style="width: 100%" name='<%= loteTramites %>' id='<%= pageName %>'
												decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoItemTramiteDisplayWrapper">
												<display:column property="fechaTramite" title="Fecha" headerClass="tableCellHeader" style="width: 60px;" />
												<display:column property="evento" title="Evento" headerClass="tableCellHeader" style="width: 200px;" />
												<display:column property="observacion" title="Observación" headerClass="tableCellHeader" style="width: 350px;" />
												<logic:notEqual value="confirmar" name="form" property="accion">
													<display:column property="archivo" title="Archivo" headerClass="tableCellHeader" style="width: 200px;" />
												</logic:notEqual>
												<logic:equal value="true" name="form" property="esModificable">
													<display:column property="accion" title="Acción" headerClass="tableCellHeader" style="width: 6px;" />
												</logic:equal>
											</display:table>
										</td>
									</tr>
									<logic:notEqual value="confirmar" name="form" property="accion">
										<logic:equal value="true" name="form" property="esModificable">
											<tr>
												<td class="CformAreaBotones">
													<div align="right">
														<html:submit property="btnSubmit" value="Agregar Evento" />
													</div></td>
											</tr>
										</logic:equal>
									</logic:notEqual>
								</table></td>
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