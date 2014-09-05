<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="conicet.apps.siuvt.web.egreso.form.CEgresoForm"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>

<script type="text/javascript">

var importeCobrosAnterior = [];

$(document).ready(function() {
	guardarValores();
	 var input = new CInputNumero(true);
	   input.bind("input[id^='importe']");//selector de jquery
	 var input2 = new CInputNumero(false);
	 	input2.bind("input[id^='idNumeroComprobante']");//selectosr de jquery
	   
  });
  
function calcularTotalImporte(obj, index)
{
	  var i = Number(0);
	  var importe=0;
	  var totalCobros=0;
	  var diferencia=0;
	  
	 var pendiente =  $('#importePendiente_'+ index);
	 
	 if( obj.value < 0 )
		 obj.value = 0;
	 
	 diferencia = Number(importeCobrosAnterior[index] - Number(obj.value)).toFixed(2);
	 
	 pendiente.attr('value', Number(Number(pendiente.attr('value')) + Number(diferencia)).toFixed(2));
	 
	  if( pendiente.attr('value') < 0 )
	  {
		  	diferencia = Number(diferencia) - Number(pendiente.attr('value'));
	  		obj.value = Number(obj.value) + Number(pendiente.attr('value'));
	  		pendiente.attr('value', Number(0).toFixed(2))
	  }
	  
	 importeCobrosAnterior[index] = Number(obj.value).toFixed(2); 
	 
	  $("[id^='importeCobros_']").each(function() {
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
 	  			  totalCobros=Number(totalCobros)+Number((importe).toFixed(2));
			  }
	    	i= Number(i)+Number(1); 
		  });
	  
   $('#importe').attr('value', totalCobros.toFixed(2));
   
   return diferencia;	
}

function guardarValores()
{	
	$("[id^='importeCobros_']").each(function() {
		$(this).attr('value', Number($(this).attr('value')).toFixed(2));
		importeCobrosAnterior[importeCobrosAnterior.length] = $(this).attr('value')
  });
  
		
}

function removeArchivo()
{
	document.<%= request.getParameter("egresoForm") %>.removerArchivo.value = "si";
	document.<%= request.getParameter("egresoForm") %>.submit();
}

function subirArchivo()
{
	document.<%= request.getParameter("egresoForm") %>.removerArchivo.value = "no";
	document.<%= request.getParameter("egresoForm") %>.submit();
}

function isMaxLength(ta,maxlength){
	var mlength = parseInt(maxlength);
	if (ta.getAttribute && ta.value.length>mlength){
		ta.value=ta.value.substring(0,mlength);
	}
}

</script>

<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="egresoForm" name='<%= request.getParameter("egresoForm") %>' />
<bean:define id="grupoTipoEgreso" value='<%= request.getParameter("tipoEgr") %>' />
<bean:define id="loteCobros" name="egresoForm" property="cobroItemsDistribucion" />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionPage" name="egresoForm" property="actionName" />
<bean:define id="tipoEgreso" name="egresoForm" property="tipoEgreso" />
<bean:define id="titulo" name="tipoEgreso" property="tipo" />

<% if(request.getParameter("archivoTransferencia") !=null) {%>
<bean:define id="archivoTransferencia" value='<%= request.getParameter("archivoTransferencia") %>' />
<%}%>

<logic:equal value="input" name="tipoPantalla">

	<logic:equal name="tipoEgreso" property="tipo" value="Transferencia">
		<html:hidden property="removerArchivo" styleId="removerArchivo" />
	</logic:equal>
	<div id="datos">
		<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
				<td>
					<!-- Esto se muestra solo cuando se carga la página -->



					<table class="tablaMin" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<table align="center" cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td>
											<table width="100%" cellpadding="2" cellspacing="2">
												<tr bgcolor="#DDEEFF">
													<td colspan="2" width="100%"><bean:write name="titulo" />
													</td>
												</tr>
												<tr>
													<td class="CformNombre">Fecha: <span class="dato_obligatorio">*</span>
													</td>
													<td class="CformDato"><html:text styleId="id_fecha" property="fechaEgreso" maxlength="10" size="10" /></td>
												</tr>
												<logic:equal name="tipoEgreso" property="id" value="CU">
													<tr>
														<td class="CformNombre">Uvt: <span class="dato_obligatorio">*</span>
														</td>
														<td class="CformDato" width="75%"><bean:write name="egresoForm" property="uvtNombre" /></td>
													</tr>
												</logic:equal>
												<logic:equal name="tipoEgreso" property="id" value="CUP">
													<tr>
														<td class="CformNombre">Uvt: <span class="dato_obligatorio">*</span>
														</td>
														<td class="CformDato" width="75%"><bean:write name="egresoForm" property="uvtNombre" /></td>
													</tr>
												</logic:equal>
												<logic:equal name="tipoEgreso" property="id" value="CP">
													<tr>
														<td class="CformNombre">Contraparte: <span class="dato_obligatorio">*</span>
														</td>
														<td class="CformDato" width="75%">
															<div id="autoCompleteContraparteDescripcion">
																<label id="autoCompleteUnivTexto"><bean:write name="egresoForm" property="contraparteDescripcion" />
																</label>
																<logic:notEqual name="egresoForm" property="valueEAccion" value="modificar">
																	<a href="#" onclick="removeContraparte(this)"><img src="./imagenes/close.png" align="top" />
																	</a>
																</logic:notEqual>
															</div> <input type="text" name="autoCompleteContraparte" id="autoCompleteContraparte" /></td>
													</tr>
												</logic:equal>
												<logic:equal name="tipoEgreso" property="id" value="UD">
													<tr>
														<td class="CformNombre">Prestador: <span class="dato_obligatorio">*</span>
														</td>
														<td class="CformDato" width="75%">
															<div id="autoCompletePrestadorDescripcion">
																<label id="autoCompleteUnivTexto"><bean:write name="egresoForm" property="prestadorDescripcion" />
																</label>
																<logic:notEqual name="egresoForm" property="valueEAccion" value="modificar">
																	<a href="#" onclick="removePrestador(this)"><img src="./imagenes/close.png" align="top" />
																	</a>
																</logic:notEqual>
															</div> <input type="text" name="autoCompletePrestador" id="autoCompletePrestador" /></td>
													</tr>
												</logic:equal>

												<logic:equal name="tipoEgreso" property="id" value="EG">
													<tr>
														<td class="CformNombre">Prestador: <span class="dato_obligatorio">*</span>
														</td>
														<td class="CformDato" width="75%">
															<div id="autoCompletePrestadorDescripcion">
																<label id="autoCompleteUnivTexto"><bean:write name="egresoForm" property="prestadorDescripcion" />
																</label>
																<logic:notEqual name="egresoForm" property="valueEAccion" value="modificar">
																	<a href="#" onclick="removePrestador(this)"><img src="./imagenes/close.png" align="top" />
																	</a>
																</logic:notEqual>
															</div> <input type="text" name="autoCompletePrestador" id="autoCompletePrestador" />
														</td>
													</tr>
													<tr>
														<td class="CformNombre">Tipo Comprobante: <span class="dato_obligatorio">*</span></td>
														<td class="CformDato">
															<html:select styleId="comprobanteTipoId" property="comprobanteTipo">
																<html:options collection="comboComprobanteTipo" property="value" labelProperty="label" />
															</html:select>
														</td>
													</tr>
													<tr>
											            <td class="CformNombre">N&uacute;mero: <span id="idSpanNroComp" class="dato_obligatorio">*</span></td>
											            <td class="CformDato" colspan="4">
											                <html:text styleId="idNumeroComprobante" property="numeroComprobante"  maxlength="18" size="22" />
											            </td>
											        </tr>
											         <tr>
											            <td class="CformNombre">Rubro: <span class="dato_obligatorio">*</span></td>
											            <td class="CformDato" colspan="4">
											                <html:select styleId="rubroId" property="rubroSelected">
											                    <html:options collection="comboRubro" property="value" labelProperty="label"/>
											                </html:select>&nbsp;&nbsp;
											            </td>
											        </tr>
											        <tr>
											            <td class="CformNombre">Subrubro: <span id="idSpanSubRubro" class="dato_obligatorio" hidden="true">*</span></td>
											            <td class="CformDato" id="comboSubRubro" colspan="4">
											               	<html:hidden styleId="hiddenSubrubroId" property="subrubroSelected" value="-1"/>
											                <html:select styleId="subSubroId" property="subrubroSelected" disabled="true" >
											                    <html:options  collection="comboSubrubro" property="value" labelProperty="label"/>
											                </html:select>&nbsp;&nbsp;
											            </td>
											        </tr>
											        <tr>
														<td class="CformNombre">Proveedor: <span class="dato_obligatorio">*</span>
														</td>
														<td class="CformDato">
															<capplication:autoComplete tipoAutocomplete="Proveedor" actionIngresarNuevo="ingresarNuevoProveedor"/>
														</td>
													</tr>
												</logic:equal>
												<logic:equal name="tipoEgreso" property="productividad" value="true">
													<tr>
														<td class="CformNombre">Beneficiario: <span class="dato_obligatorio">*</span>
														</td>
														<td class="CformDato" width="75%">
															<div id="autoCompletePersonaDescripcion">
																<label id="personaNombre"><bean:write name="egresoForm" property="personaDescripcion" />
																</label>
																<logic:notEqual name="egresoForm" property="valueEAccion" value="modificar">
																	<a href="#" onclick="removePersona(this)"><img src="./imagenes/close.png" align="top" />
																	</a>
																</logic:notEqual>
															</div> <input type="text" name="autoCompletePersona" id="autoCompletePersona" /></td>
													</tr>
													<tr>
														<td colspan="2">
															<div id="datosPersona">
																<table width="100%">
																	<tr>
																		<td class="CformNombre"><label id="personaTipoDocumento"><bean:write name="egresoForm" property="personaTipoDocumento" />
																		</label>:</td>
																		<td class="CformDato" width="75%"><label id="personaDocumento"><bean:write name="egresoForm" property="personaDocumento" />
																		</label></td>
																	</tr>
																	<tr>
																		<td class="CformNombre">Categoría:</td>
																		<!-- Aca debo mostrar al categoria pero necesito acceder a la descripcion -->
																		<td class="CformDato" width="75%"><label id="personaCategoria"><bean:write name="egresoForm" property="personaCategoria" />
																		</label></td>
																	</tr>
																	<tr>
																		<td class="CformNombre">CUIT/CUIL:</td>
																		<td class="CformDato" width="75%"><label id="personaCuit"><bean:write name="egresoForm" property="personaCuit" />
																		</label></td>
																	</tr>
																</table>
															</div></td>
													</tr>
												</logic:equal>
											</table>

											<table width="100%">
												<tr>
													<td>

														<table class="tablaMin">
															<tr bgcolor="#BFDFFF">
																<td><strong>Cobros &nbsp;<span class="dato_obligatorio">*</span>
																</strong></td>
															</tr>
														</table>
														<table class="tablaMin">
															<tr>
																<td colspan="10"><display:table defaultsort="1" style="width: 100%" name='<%= loteCobros %>' id='<%= pageName %>'
																		decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoAMDisplayWrapper">
																		<display:column property="fechaFactura" title="Fecha Fact." headerClass="tableCellHeader" style="width: 80px;" />
																		<display:column property="numeroFactura" title="Nº Factura" headerClass="tableCellHeader" style="width: 110px;" />
																		<display:column property="tipoServicio" title="Tipo Servicio" headerClass="tableCellHeader" style="width: 100px;" />
																		<display:column property="contratante" title="Contratante" headerClass="tableCellHeader" style="width: 100px;" />
																		<display:column property="detalleFactura" title="Detalle Fact." headerClass="tableCellHeader" style="width: 100px;" />
																		<display:column property="fecha" title="Fecha Cobro" headerClass="tableCellHeader" style="width: 100px;" />
																		<display:column property="numeroRecibo" title="Nº Recibo" headerClass="tableCellHeader" style="width: 100px;" />
																		<logic:equal name="tipoEgreso" property="id" value="UD">
																			<display:column property="concepto" title="Concepto" headerClass="tableCellHeader" style="width: 300px;" />
																		</logic:equal>
																		<logic:equal name="tipoEgreso" property="id" value="EG">
																			<display:column property="concepto" title="Concepto" headerClass="tableCellHeader" style="width: 300px;" />
																		</logic:equal>
																		<logic:notEqual name="tipoEgreso" property="id" value="EG">
																			<logic:notEqual name="tipoEgreso" property="id" value="UD">
																				<display:column property="porcentajeComision" title="% Comisión" headerClass="tableCellHeader" style="width: 100px;" />
																			</logic:notEqual>
																		</logic:notEqual>

																		<display:column property="importePendiente" title="Importe Pendiente $" headerClass="tableCellHeader" style="width: 100px;" />
																		<display:column property="importeAsignar" title="Importe $" headerClass="tableCellHeader" style="width: 100px;" />
																	</display:table></td>
															</tr>
														</table></td>
												</tr>


												<tr>
													<td><logic:notEqual name="egresoForm" property="tipoId" value="PRP">
															<table class="tablaMin">
																<tr>
																	<td class="CformAreaBotonesInterna" width="100%">
																		<div align="right">
																			<html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar" />
																		</div></td>
																</tr>
															</table>
														</logic:notEqual> 
														<logic:equal name="egresoForm" property="tipoId" value="PRP">
															<logic:notEqual name="egresoForm" property="valueEAccion" value="modificar">
																<table class="tablaMin">
																	<tr>
																		<td class="CformAreaBotonesInterna" width="100%">
																			<div align="right">
																				<html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar" />
																			</div></td>
																	</tr>
																</table>
															</logic:notEqual>
														</logic:equal></td>
												</tr>

												<tr>
													<td>

														<table width="100%">
															<logic:equal name="tipoEgreso" property="id" value="UD">
																<tr>
																	<td class="CformNombre">Importe Costos $</td>
																	<td class="CformDato"><html:text styleId="importeCosto" property="montoCostos" onchange="" readonly="true"></html:text></td>
																</tr>
																<tr>
																	<td class="CformNombre">Importe Ganancias $</td>
																	<td class="CformDato"><html:text styleId="importeGanancia" property="montoBeneficio" onchange="" readonly="true"></html:text></td>
																</tr>
															</logic:equal>
															<tr>
																<td class="CformNombre">Importe Total $</td>
																<td class="CformDato"><html:text styleId="importe" property="monto" onchange="" readonly="true"></html:text></td>
															</tr>
															<logic:equal name="tipoEgreso" property="id" value="EG">
																<tr>
																	<td class="CformNombre">Descripci&oacute;n:&nbsp;</td>
																	<td class="CformDato" width="75%"><html:textarea styleId="observaciones" property="observaciones" rows="3" onkeyup="isMaxLength(this,250)" />
																	</td>
																</tr>
															</logic:equal>
															<logic:equal name="tipoEgreso" property="id" value="UD">
																<tr>
																	<td class="CformNombre">Observaciones:&nbsp;</td>
																	<td class="CformDato" width="75%"><html:textarea styleId="observaciones" property="observaciones" rows="3" onkeyup="isMaxLength(this,250)" />
																	</td>
																</tr>
															</logic:equal>

														</table></td>
												</tr>
												<tr>
													<td height="10"></td>
												</tr>



												<logic:equal name="grupoTipoEgreso" value="transferencia">
													<tr>
														<td>
															<table>
																<tr>
																	<td class="CformNombre">Comprobante de Transferencia:&nbsp;</td>

																	<logic:empty name="egresoForm" property="file">
																		<logic:empty name="egresoForm" property="archivo">
																			<td id="comprobanteTransferenciaUpload"><html:file property="file" size="50" onchange="subirArchivo()" /></td>
																		</logic:empty>
																	</logic:empty>
																	<logic:notEmpty name="egresoForm" property="file">
																		<td id="comprobanteTransferenciaLink"><bean:write name="egresoForm" property="fileName" /> <a href="#" onclick="removeArchivo()"><img src="./imagenes/close.png" align="top">
																		</a>
																		</td>
																	</logic:notEmpty>
																	<logic:empty name="egresoForm" property="file">
																		<logic:notEmpty name="egresoForm" property="archivo">
																			<td id="comprobanteTransferenciaLink"><a href="./<%= actionPage %>.do?method=descargar"> <bean:write name="egresoForm" property="fileName" /> <a href="#"
																					onclick="removeArchivo()"><img src="./imagenes/close.png" align="top">
																				</a> </a></td>
																		</logic:notEmpty>
																	</logic:empty>
																</tr>
															</table></td>
													</tr>
												</logic:equal>
											</table></td>
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
					<div align="right">
						<jsp:include page="/jsp/layout/botones.jsp">
							<jsp:param name="formulario" value='<%= request.getParameter("egresoForm") %>' />
							<jsp:param name="entidad" value='<%= grupoTipoEgreso %>' />
						</jsp:include>
					</div></td>
			</tr>
		</table>
		<html:submit property="btnSubmit" styleClass="CformBoton" value="limpiarCobros" styleId="btnLimpiarCobros" style="display: none;" />

	</div>
	<!-- tabContacto-->

</logic:equal>

<logic:equal value="view" name="tipoPantalla">

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table width="100%" cellpadding="2" cellspacing="2">
					<tr bgcolor="#DDEEFF">
						<td colspan="2" width="100%"><bean:write name="titulo" /></td>
					</tr>
					<tr>
						<td class="CformNombre" width="160">Fecha:</td>
						<td class="CformDato" width="440"><bean:write name="egresoForm" property="fechaEgreso" />
						</td>
					</tr>
					<logic:equal name="tipoEgreso" property="id" value="CP">
						<tr>
							<td class="CformNombre" width="160">Contraparte:</td>
							<td class="CformDato" width="440"><bean:write name="egresoForm" property="contraparteDescripcion" />
							</td>
						</tr>
					</logic:equal>
					<logic:equal name="tipoEgreso" property="id" value="UD">
						<tr>
							<td class="CformNombre" width="160">Prestador:</td>
							<td class="CformDato" width="440"><bean:write name="egresoForm" property="prestadorDescripcion" />
							</td>
						</tr>
					</logic:equal>

					<logic:equal name="tipoEgreso" property="id" value="EG">
						<tr>
							<td class="CformNombre">Prestador:</td>
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="prestadorDescripcion" />
							</td>
						</tr>
						<tr>
							<td class="CformNombre">Tipo Comprobante:</td>
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="comprobanteTipoDescripcion" />
							</td>
						</tr>
						<tr>
							<td class="CformNombre">N&uacute;mero:</td>
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="numeroComprobante" />
							</td>
						</tr>
						<tr>
				            <td class="CformNombre">Rubro:</td>
				            <td class="CformDato" colspan="4">
				                <bean:write property="rubroDescripcion" name="egresoForm"/>
				            </td>
			        	</tr>
			        	<logic:notEmpty property="subRubroDescripcion" name="egresoForm">
					        <tr>
					            <td class="CformNombre">Subrubro:</td>
					            <td class="CformDato" colspan="4">
					                <bean:write property="subRubroDescripcion" name="egresoForm"/>
					            </td>
					        </tr>
				        </logic:notEmpty>
				        <tr>
				        	<td class="CformNombre">Proveedor:</td>
				        	<td class="CformDato">
				        		<capplication:autoCompleteView name="egresoForm" tipoAutocomplete="Proveedor"/>
				        	</td> 
				        </tr>
					</logic:equal>

					<logic:equal name="tipoEgreso" property="productividad" value="true">
						<tr>
							<td class="CformNombre">Beneficiario:</td>
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="personaDescripcion" /></td>
						</tr>
						<tr>
							<td class="CformNombre"><bean:write name="egresoForm" property="personaTipoDocumento" />:</td>
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="personaDocumento" /></td>
						</tr>
						<tr>
							<td class="CformNombre">Categoría:</td>
							<!-- Aca debo mostrar al categoria pero necesito acceder a la descripcion -->
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="personaCategoria" /></td>
						</tr>
						<tr>
							<td class="CformNombre">CUIT/CUIL:</td>
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="personaCuit" /></td>
						</tr>
					</logic:equal>
				</table>
				<table class="tablaMin">
					<tr>
						<td>

							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Cobros &nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td colspan="10"><display:table defaultsort="1" class="displayTable" style="width: 100%" name='<%= loteCobros %>' id='<%= pageName %>'
											decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoAMDisplayWrapper">
											<display:column property="fechaFactura" title="Fecha Fact." headerClass="tableCellHeader" style="width: 80px;" />
											<display:column property="numeroFactura" title="Nº Factura" headerClass="tableCellHeader" style="width: 110px;" />
											<display:column property="tipoServicio" title="Tipo Servicio" headerClass="tableCellHeader" style="width: 100px;" />
											<display:column property="contratante" title="Contratante" headerClass="tableCellHeader" style="width: 100px;" />
											<display:column property="detalleFactura" title="Detalle Fact." headerClass="tableCellHeader" style="width: 100px;" />
											<display:column property="fecha" title="Fecha Cobro" headerClass="tableCellHeader" style="width: 100px;" />
											<display:column property="numeroRecibo" title="Nº Recibo" headerClass="tableCellHeader" style="width: 100px;" />
											<logic:equal name="tipoEgreso" property="id" value="UD">
												<display:column property="concepto" title="Concepto" headerClass="tableCellHeader" style="width: 300px;" />
											</logic:equal>
											<logic:equal name="tipoEgreso" property="id" value="EG">
												<display:column property="concepto" title="Concepto" headerClass="tableCellHeader" style="width: 300px;" />
											</logic:equal>
											<logic:notEqual name="tipoEgreso" property="id" value="EG">
												<logic:notEqual name="tipoEgreso" property="id" value="UD">
													<display:column property="porcentajeComision" title="% Comisión" headerClass="tableCellHeader" style="width: 100px;" />
												</logic:notEqual>
											</logic:notEqual>
											<display:column property="importeAsignado" title="Importe $" headerClass="tableCellHeader" style="width: 150px;" />
										</display:table></td>
								</tr>

							</table></td>
					</tr>
				</table>
				<table class="tablaMin">
					<logic:equal name="tipoEgreso" property="id" value="UD">
						<tr>
							<td class="CformNombre">Importe Costos $:</td>
							<td class="CformDato"><bean:write name="egresoForm" property="montoCostos" /></td>
						</tr>
						<tr>
							<td class="CformNombre">Importe Ganancias $:</td>
							<td class="CformDato"><bean:write name="egresoForm" property="montoBeneficio" /></td>
						</tr>
					</logic:equal>
					<tr>
						<td class="CformNombre">Importe Total $:</td>
						<td class="CformDato" width="75%"><bean:write name="egresoForm" property="monto" />
						</td>
					</tr>

					<logic:equal name="tipoEgreso" property="id" value="EG">
						<tr>
							<td class="CformNombre">Descripci&oacute;n:&nbsp;</td>
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="observaciones" />
							</td>
						</tr>
					</logic:equal>

					<logic:equal name="tipoEgreso" property="id" value="UD">
						<tr>
							<td class="CformNombre">Observaciones:&nbsp;</td>
							<td class="CformDato" width="75%"><bean:write name="egresoForm" property="observaciones" />
							</td>
						</tr>
					</logic:equal>

					<logic:equal name="grupoTipoEgreso" value="transferencia">
						<tr>
							<td class="CformNombre">Comprobante de Transferencia:</td>
							<logic:notEmpty name="egresoForm" property="file">
								<td id="comprobanteTransferenciaLink"><bean:write name="egresoForm" property="fileName" /></td>
							</logic:notEmpty>
							<logic:empty name="egresoForm" property="file">
								<logic:notEmpty name="egresoForm" property="archivo">
									<td class="CformDato" id="comprobanteTransferenciaLink"><a href="./<%= actionPage %>.do?method=descargar"> <bean:write name="egresoForm" property="fileName" /> </a></td>
								</logic:notEmpty>
							</logic:empty>
						</tr>
					</logic:equal>



				</table></td>
		</tr>
		<tr>
			<td class="CformAreaBotones">
				<div align="right">
					<jsp:include page="/jsp/layout/botones.jsp">
						<jsp:param name="formulario" value='<%= request.getParameter("egresoForm") %>' />
						<jsp:param name="entidad" value='<%= grupoTipoEgreso %>' />
					</jsp:include>
				</div></td>
		</tr>
	</table>


</logic:equal>

