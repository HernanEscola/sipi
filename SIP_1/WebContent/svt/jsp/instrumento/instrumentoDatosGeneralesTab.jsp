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
<bean:define id="loteResoluciones" name="form" property="resoluciones" />
<bean:define id="tipoInstrumento" name="form" property="tipo" />
<bean:define id="titulo" name="tipoInstrumento" property="descripcion" />


<logic:empty name="form" property="instrumento" >
	<bean:define id="codigo" value="" />
</logic:empty>
<logic:notEmpty name="form" property="instrumento" >
	<bean:define id="instrumento" name="form" property="instrumento" />
	<bean:define id="codigo" name="instrumento" property="codigo" />
</logic:notEmpty>

		<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
				<td>
					<table align="center" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td>
								<table width="100%" cellpadding="2" cellspacing="2">
								
							<logic:equal value="input" name="tipoPantalla"> 
								<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">	
									<tr bgcolor="#BFDFFF">
										<td colspan="10"><strong>Responsable &nbsp;</strong></td>
									</tr>
								
									<tr>
										
										<td class="CformNombre" width="165">Responsable: <span class="dato_obligatorio">*</span></td>
										<td class="CformDato"><logic:equal value="CCO" name="form" property="rolUsuario">
												<html:select styleId="responsable" property="responsable">
													<html:options name="form" collection="comboResponsables" property="value" labelProperty="label" />
												</html:select>
											</logic:equal> <logic:notEqual value="CCO" name="form" property="rolUsuario">
												<bean:write name="form" property="responsable" />
											</logic:notEqual></td>
									</tr>
								</logic:notEqual>	
									<tr bgcolor="#BFDFFF">
										<td colspan="10"><strong>Datos Generales &nbsp;</strong></td>
									</tr>
									<tr>
										<logic:equal value="CONVENIO" name="tipoInstrumento" property="tipo">
											<td class="CformNombre">Alcance: <span class="dato_obligatorio">*</span></td>
											<td class="CformDato"><html:select styleId="tipoAlcanceConvenio" property="alcanceConvenio">
													<html:options name="form" collection="comboAlcanceConvenio" property="value" labelProperty="label" />
												</html:select></td>
										</logic:equal>
									</tr>
									<tr>
										<logic:equal value="CONVENIO" name="tipoInstrumento" property="tipo">
											<td class="CformNombre" width="150">Tipo: <span class="dato_obligatorio">*</span></td>
											<td class="CformDato"><html:select styleId="tipoConvenio" property="tipoConvenio" onchange="mostrarPatente()">
													<html:options name="form" collection="comboTipoConvenios" property="value" labelProperty="label" />
												</html:select></td>
										</logic:equal>
										
									</tr>
									
									<tr>
											<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
												<td class="CformNombre" width="150">Nro. Trámite:</td>
												<td class="CformDato"><div id="nroTramite">
														<bean:write name="form" property="numeroTramite" />
												</td>
												<td class="CformNombre">Año:<span class="dato_obligatorio">*</span>	
												</td>
												<td class="CformDato">
												<logic:equal value="alta" name="form" property="valueEAccion">
													<html:select styleId="añoId" property="año" onchange="setearNroTramite()">
														<html:options name="form" collection="comboAños" property="value" labelProperty="label" />
													</html:select>
												</logic:equal>
												<logic:equal value="modificar" name="form" property="valueEAccion">
													<bean:write name="form" property="año"/>
												</logic:equal>
													</td>
											</logic:notEqual>
											<logic:equal value="PDT" name="tipoInstrumento" property="tipo">
												<td class="CformNombre">Año:<span class="dato_obligatorio">*</span></td>
												<td class="CformDato">
													<html:select styleId="añoId" property="año">
														<html:options name="form" collection="comboAños" property="value" labelProperty="label" />
													</html:select>
												</td>
												
											</logic:equal>
									</tr>
									<tr>
										<td class="CformNombre">Fecha Ingreso DVTS: 
										<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
											<span class="dato_obligatorio">*</span>
										</logic:notEqual>
										</td>
										
										<td class="CformDato">
										<html:text name="form" styleId="id_ingreso_fecha" property="fechaIngresoDVTS" maxlength="10" size="10" />
										</td>
										<td class="CformNombre">Objeto:
										<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
										 <span class="dato_obligatorio">*</span>
										 </logic:notEqual>
										 </td>
										<td class="CformDato" colspan="3"><html:textarea name="form" property="objeto" />
										</td>
									</tr>
									

									<tr>
										<td class="CformNombre">Nro. Expediente:</td>
										<td class="CformDato">
										<html:text styleId="numeroExpediente_id" name="form" property="numeroExpediente"  size="6" maxlength="6" style="text-align:right;"/>
											/ <html:select styleId="añoExpediente_id" name="form" property="añoExpediente" style="width:55px;">
												<html:options name="form" collection="comboAños" property="value" labelProperty="label" />
											</html:select>
										</td>
										<td class="CformNombre" style="width: 141px;">Objeto Divulgación: <span id="id_objeto_divulgacion_obl" class="dato_obligatorio">*</span></td>
										<td class="CformDato" colspan="3" ><html:textarea name="form" property="objetoDivulgacion" />
										</td>
									</tr>
									
									<tr>
										<td class="CformNombre">Carpetín:</td>
										<td class="CformDato"><html:text name="form" property="carpetin" maxlength="20"/></td>
										<td id="id_patenteNombre" class="CformNombre">Propiedad Intelectual:</td>
										<td id="id_patenteDato" class="CformDato" colspan="3"><html:textarea name="form" property="patente" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre">Plan de Trabajo:&nbsp;</td>
											<logic:empty name="form" property="planDeTrabajo">
												<td  colspan="1" id="planUpload"><html:file property="filePlanDeTrabajo" size="50" onchange="subirArchivo()" />
												</td>
											</logic:empty>
											<logic:notEmpty name="form" property="planDeTrabajo">
												<td colspan="1" id="planLink"><a href="./<%=actionPage%>.do?method=descargarplandetrabajo"> <bean:write name="form" property="fileNamePlanDeTrabajo" /> <a href="#" onclick="removeArchivo()">
												<img src="./imagenes/close.png" align="top"> </a> </a>
												</td>
											</logic:notEmpty>
										<td id="id_publicarWebNombre" class="CformNombre" width="75">Publicar en Web:</td>
										<td id="id_publicarWebDato" class="CformDato"><html:checkbox styleId="id_publicar_web" name="form" property="publicarWeb" />
										</td>
									</tr>
									
									<tr>
										<td class="CformNombre">Campo Aplicación:</td>
										<td class="CformDato" colspan="3"><html:select name="form" property="campoAplicacion" style="width:300px;">
												<html:options name="form" collection="comboCampoAplicacion" property="value" labelProperty="label" filter="false"/>
											</html:select></td>
										</td>
									</tr>
									
									<tr>
										<logic:equal value="modificar" name="form" property="valueEAccion">
											<td class="CformNombre">Estado:<span class="dato_obligatorio">*</span></td>
											<td class="CformDato"><html:select property="estado" styleId="estado_id" onchange="mostrarPublicarWeb()">
													<html:options name="form" collection="comboEstadosSinDeshabilitado" property="value" labelProperty="label"  />
												</html:select>
											</td>
											<td class="CformNombre">Estado Trámite:</td>
											<td class="CformDato"><html:select property="estadoTramite">
													<html:options name="form" collection="comboEstadosTramite" property="value" labelProperty="label" />
												</html:select>
											</td>
										</logic:equal>
									</tr>
									<tr bgcolor="#BFDFFF">
										<td colspan="10"><strong>Datos Ejecución &nbsp;</strong></td>
									</tr>

									

									<tr>
										<td class="CformNombre">Fecha Inicio:
										<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
										<span id="id_fecha_inicio_obl" class="dato_obligatorio">*</span>
										</logic:notEqual>
										</td>
										<td class="CformDato"><html:text name="form" property="fechaInicio" styleId="id_inicio_fecha" maxlength="10" size="10" /></td>
										<td class="CformNombre">Prorroga:</td>
										<td class="CformDato" colspan="3"><html:select styleId="tipoProrroga" property="prorroga" style="width:365px;">
												<html:options name="form" collection="comboProrrogas" property="value" labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td class="CformNombre">Fecha Fin:
										<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
										<span id="id_fecha_fin_obl" class="dato_obligatorio">*</span>
										</logic:notEqual>
										
										</td>
										<td class="CformDato"><html:text name="form" property="fechaFin" styleId="id_fin_fecha" maxlength="10" size="10" /></td>
										<td class="CformNombre">Duración:</td>
										<td class="CformDato"><html:text name="form" property="duracion" style="text-align:right;" maxlength="3" size="3" styleId="id_duracion" /> Meses</td>
										<td class="CformNombre">Desde:</td>
										<td class="CformDato"><html:text name="form" property="duracionEventoDesde" /></td>
									</tr>
									<tr>
										<td class="CformNombre">Observaciones FIN:</td>
										<td class="CformDato" colspan="3"><html:textarea name="form" property="observacionesFin" />
										</td>
									</tr>
									<tr>
										<td colspan="10">
											<table width="100%">
												<tr bgcolor="#DDEEFF">
													<td><strong>Resoluciones/Disposición:</strong><span id="id_numero_resolucion_obl" class="dato_obligatorio">*</span>
													</td>
												</tr>
												<tr>
													<td colspan="10"><display:table class="CFormDisplayTable" name='<%= loteResoluciones %>' id='<%= pageName %>'
															decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoResolucionDisplayWrapper">
															<display:column property="numeroConDisposicion" title="Numero" headerClass="tableCellHeader" style="width: 300px;" />
															<display:column property="año" title="Año" headerClass="tableCellHeader" style="width: 80px;" />
															<display:column property="pdt" title="Actividad/PDT" headerClass="tableCellHeader" style="width: 80px;" />
															<display:column property="remove" title="  " headerClass="tableCellHeader" style="width: 10px;" />
															<display:footer>
																<tr style="background-color: #FAFAFA;">
											
																	<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 400px;">
																		<html:select name="form" property="tipoResolucion">Ingresar Nuevo: 
																			<html:options name="form" collection="comboTiposResolucion" property="value" labelProperty="label" />
																		</html:select> 
																		 <html:text name="form" styleId="id_numeroResolucion" property="numeroResolucion"  style="text-align: right;" size="8" maxlength="8"/>
																	</td>
																	<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;"><html:select name="form" property="añoResolucion">
																			<html:options name="form" collection="comboAños" property="value" labelProperty="label" />
																		</html:select>
																	</td>
																	<td class="CformDato"><html:select name="form" property="pdtResolucion">
																			<html:options name="form" collection="comboActividadPdt" property="value" labelProperty="label" />
																		</html:select> 
																	</td>
																	<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;"><html:submit style="width:100px;" property="btnSubmit"
																			value="Agregar" styleClass="CformBoton" />
																	</td>
																</tr>
															</display:footer>
														</display:table>
													</td>
												</tr>
											</table></td>
									</tr>
									
									
									
									
									<logic:equal value="true" name="form" property="mostrarDatosExcel">
										<tr bgcolor="#DDEEFF">
											<td colspan="10">Datos Planilla Excel</td>
										</tr>
										<tr>
											<td class="CformNombre" width="150">Monto:</td>
											<td class="CformDato"><bean:write name="form" property="montoTexto" />
											</td>
											<td class="CformNombre" width="150">Monto Otra Moneda:</td>
											<td class="CformDato"><bean:write name="form" property="montoOtraMonedaTexto" />
											</td>
										</tr>
										
									
										<tr>
											<td class="CformNombre" width="150">Responsable:</td>
											<td class="CformDato"><bean:write name="form" property="responsableTexto" />
											</td>
											<td class="CformNombre" width="150">Uvt:</td>
											<td class="CformDato"><bean:write name="form" property="uvtTexto" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre" width="150">Tipo Convenio</td>
											<td class="CformDato"><bean:write name="form" property="tipoConvTexto" />
											</td>
										</tr>
										<tr>
											<td class="CformNombre" width="150">Contratante Sigla:</td>
											<td class="CformDato" width="150"><bean:write name="form" property="contratanteSiglaTexto" />
											</td>
											<td class="CformNombre" width="150">Contratante Nombre:</td>
											<td class="CformDato" width="150"><bean:write name="form" property="contratanteNombreTexto" />
											</td>
										</tr>
									</logic:equal>

</logic:equal>

<logic:equal value="view" name="tipoPantalla">
									
<tr bgcolor="#DDEEFF"> 
						<td colspan="6" width="100%"><bean:write name="titulo" />&nbsp;<b><bean:write name="codigo" /></b></td>
					</tr>
					<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
							<tr bgcolor="#BFDFFF">
								<td colspan="10"><strong>Responsable &nbsp;</strong></td>
							</tr>
							<tr>
								<td class="CformNombre" width="150">Responsable:</td>
								<td class="CformDato">
									<logic:equal value="confirmar" name="form" property="accion">
										<logic:equal value="CCO" name="form" property="rolUsuario">
											<html:select disabled="true" property="responsable">
												<html:options name="form" collection="comboResponsables" property="value" labelProperty="label" />
											</html:select>
										</logic:equal>
										<logic:notEqual value="CCO" name="form" property="rolUsuario">
											<bean:write name="form" property="responsable" />
										</logic:notEqual>
									</logic:equal> <logic:notEqual value="confirmar" name="form" property="accion">
										<bean:write name="form" property="responsable" />
									</logic:notEqual></td>
							</tr>
							<tr>
							<td class="CformNombre" width="150">Sector:</td>
								<td class="CformDato">
									<bean:write name="form" property="sector"/>
								</td>
					</tr>
					</logic:notEqual>
					<tr bgcolor="#BFDFFF">
						<td colspan="10"><strong>Datos Generales &nbsp;</strong></td>
					</tr>
					<tr>
						<logic:equal value="CONVENIO" name="tipoInstrumento" property="tipo">
							<td class="CformNombre">Alcance:</td>
							<td class="CformDato"><bean:write name="form" property="alcanceConvenio" />
							</td>
						</logic:equal>
					</tr>
					<tr>
						<logic:equal value="CONVENIO" name="tipoInstrumento" property="tipo">
							<td class="CformNombre" width="250">Tipo:</td>
							<td class="CformDato" width="250"><bean:write name="form" property="tipoConvenio" />
						</logic:equal>
						
					</tr>
					
					<tr>
						<logic:notEqual value="PDT" name="tipoInstrumento" property="tipo">
							<td class="CformNombre" width="150">Nro. Trámite:</td>
							<td class="CformDato"><div id="nroTramite">
									<bean:write name="form" property="numeroTramite" />
							</td>
						</logic:notEqual>	
						<td class="CformNombre">Año:</td>
						<td class="CformDato"><bean:write name="form" property="año" />
						</td>
					</tr>
					<tr>
						<td class="CformNombre">Fecha Ingreso DVTS:</td>
						<td class="CformDato"><bean:write name="form" property="fechaIngresoDVTS" />
						</td>
						<td class="CformNombre">Objeto:</td>
						<td class="CformDato" colspan="3"><bean:write name="form" property="objeto" />
						</td>
					</tr>
					<tr>
						<td class="CformNombre">Nro. Expediente:</td>
						<td class="CformDato"><bean:write name="form" property="numeroExpedienteCompleto" /></td>
						<td class="CformNombre" style="width: 160px;">Objeto Divulgación:</td>
						<td class="CformDato" colspan="3"><bean:write name="form" property="objetoDivulgacion" />
						</td>
					</tr>
					<tr>
						<td class="CformNombre">Carpetín:</td>
						<td class="CformDato"><bean:write name="form" property="carpetin" />
						</td>
						<td id="id_patenteNombre" class="CformNombre" style="width: 160px;">Propiedad Intelectual:</td>
						<td id="id_patenteDato" class="CformDato" colspan="3"><bean:write name="form" property="patente" />
						</td>
					</tr>
					<cvisibilidad:isVisible funcionalidad="convenio_detalle">
						<tr>
							<td class="CformNombre">Plan de Trabajo:</td>
							<logic:notEmpty name="form" property="planDeTrabajo">
								<td  class="CformDato"  id="planLink" colspan="3">
									<a href="./<%=actionPage%>.do?method=descargarplandetrabajo"> 
										<bean:write name="form" property="fileNamePlanDeTrabajo" /> 
									</a>
								</td>
							</logic:notEmpty>
<!-- 							Es necesario que se pongan estos TD vacíos porque sino no se respeta el espacio bien -->
							<logic:empty name="form" property="planDeTrabajo">
								<td>
								</td>
							</logic:empty>
							<logic:equal value="true" name="form" property="enEjecucion">
								<td id="id_publicarWebNombre" class="CformNombre" width="150">Publicar en WEB:</td>
								<td id="id_publicarWebDato" class="CformDato"><html:hidden name="form" property="publicarWeb"/><html:checkbox disabled="true" name="form" property="publicarWeb" />
							</td>
						</logic:equal>
						</tr>
					</cvisibilidad:isVisible>
					<tr>
						<td class="CformNombre">Campo Aplicación:</td>
						<td class="CformDato" colspan="3"><html:select styleId="campoAplicacion" property="campoAplicacion" disabled="true">
								<html:options name="form" collection="comboCampoAplicacion" property="value" labelProperty="label" filter="false"/>
							</html:select>
						</td>
					</tr>
					<tr>
						<td class="CformNombre" width="150">Estado:</td>
						<td class="CformDato"><bean:write name="form" property="estado" />
						</td>
						<td class="CformNombre" width="150">Estado Trámite:</td>
						<td class="CformDato"><bean:write name="form" property="estadoTramite" />
						</td>
					</tr>	
						
					<tr bgcolor="#BFDFFF">
						<td colspan="10"><strong>Datos Ejecución &nbsp;</strong></td>
					</tr>
					<tr>
						<td class="CformNombre">Fecha Inicio:</td>
						<td class="CformDato"><bean:write name="form" property="fechaInicio" /></td>
						<td class="CformNombre">Prorroga:</td>
						<td class="CformDato" colspan="3"><bean:write name="form" property="prorroga" />
						</td>
					</tr>
					<tr>
						<td class="CformNombre">Fecha Fin:</td>
						<td class="CformDato"><bean:write name="form" property="fechaFin" /></td>
						<td class="CformNombre">Duración:</td>
						<td class="CformDato"><bean:write name="form" property="duracion" /> Meses</td>
						<td class="CformNombre">Desde:</td>
						<td class="CformDato"><bean:write name="form" property="duracionEventoDesde" /></td>
					</tr>

					<tr>
							<td colspan="10">
								<table width="100%">
									<tr bgcolor="#DDEEFF">
										<td><strong>Resoluciones/Disposición:</strong>
										</td>
									</tr>
									<tr>
										<td colspan="10"><display:table class="CFormDisplayTable" name='<%= loteResoluciones %>' id='resoluciones_id'
 												decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoResolucionDisplayWrapper"> 
 												<display:column property="numeroConDisposicion" title="Numero" headerClass="tableCellHeader" style="width: 300px;" /> 
 												<display:column property="año" title="Año" headerClass="tableCellHeader" style="width: 100px;" /> 
 												<display:column property="pdt" title="Actividad/PDT" headerClass="tableCellHeader" style="width: 80px;" /> 
											
											</display:table> 
										</td>
									</tr>
								</table>
								</td>
						</tr>
					<tr>
						<td class="CformNombre">Observaciones FIN:</td>
						<td class="CformDato" colspan="3"><bean:write name="form" property="observacionesFin" />
						</td>
					</tr>
						


					<logic:notEqual value="confirmar" name="form" property="accion">
						<logic:equal value="true" name="form" property="mostrarDatosExcel">
							<tr bgcolor="#DDEEFF">
								<td colspan="10">Datos Planilla Excel</td>
							</tr>
							<tr>
								<td class="CformNombre" width="150">Monto:</td>
								<td class="CformDato"><bean:write name="form" property="montoTexto" />
								</td>
								<td class="CformNombre" width="150">Monto Otra Moneda:</td>
								<td class="CformDato"><bean:write name="form" property="montoOtraMonedaTexto" />
								</td>
							</tr>
							
							<tr>
								<td class="CformNombre" width="150">Nro Trámite:</td>
								<td class="CformDato"><bean:write name="form" property="numeroTramiteTexto" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre" width="150">Responsable:</td>
								<td class="CformDato"><bean:write name="form" property="responsableTexto" />
								</td>
								<td class="CformNombre" width="150">Uvt:</td>
								<td class="CformDato"><bean:write name="form" property="uvtTexto" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre" width="150">Tipo Convenio</td>
								<td class="CformDato"><bean:write name="form" property="tipoConvTexto" />
								</td>
							</tr>
							<tr>
								<td class="CformNombre" width="150">Contratante Sigla:</td>
								<td class="CformDato" width="150"><bean:write name="form" property="contratanteSiglaTexto" />
								</td>
								<td class="CformNombre" width="150">Contratante Nombre:</td>
								<td class="CformDato" width="150"><bean:write name="form" property="contratanteNombreTexto" />
								</td>
							</tr>
						</logic:equal>
					</logic:notEqual>



					</logic:equal>
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