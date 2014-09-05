<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<bean:define id="equipoForm" name='<%= request.getParameter("equipoForm") %>' />
<bean:define id="accion" value='<%= request.getParameter("accion") %>' />
<bean:define id="responsablesTecnicos" name="equipoForm" property="responsablesTecnicos" />

<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table align="center" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td colspan="100%">
						<table width="100%">
							<tr bgcolor="#DDEEFF">
								<td>Equipamiento&nbsp;</td>
							</tr>
						</table>
				<tr>
					<td>
						<table width="100%" cellpadding="2" cellspacing="2">
							<tr>
								<td class="CformNombre">Nombre:</td>
								<td class="CformDato" colspan="3">
								 <html:select  property="nombreId" disabled="true">
				                 <html:options collection="comboNombres" property="value" labelProperty="label"  />
				                 </html:select>
								</td>
							</tr>
							<tr>
								<td class="CformNombre" width="25%">Descripción:</td>
								<td class="CformDato" width="35%"><bean:write name="equipoForm" property="descripcion" /> <html:hidden property="descripcion" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Tipo:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="tipo" /></td>
								<td class="CformNombre" width="10%">Subtipo:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="subtipo" /></td>
							</tr>
							<tr>
								<td class="CformNombre" width="130">Marca:</td>
								<td class="CformDato"><capplication:autoCompleteView name="equipoForm" tipoAutocomplete="marca" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Número de serie:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="nroSerie" /></td>
							</tr>
							<tr>
								<td class="CformNombre" width="130">Modelo:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="modelo" /> <html:hidden property="modelo" /></td>
							</tr>
							<tr>
								<td class="CformNombre" width="130">Año de Adquisición:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="anio" /></td>
							</tr>
							<tr>
							<td class="CformNombre" width="130">Año de Fabricación:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="anioFabricacion" /> </td>
								<td class="CformNombre" width="130">Año de Puesta en funcionamiento:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="anioPuestaEnFuncionamiento" /></td>
							</tr>
							<tr bgcolor="#DDEEFF">
								<td colspan="10"><strong>Datos de Inventario:</strong></td>
							</tr>
							<tr>
								<td class="CformNombre" width="130">Propietario:</td>
								<logic:notEqual property="autoCompleteMappedDescripcion(propietario)" value="" name="equipoForm">
									<td class="CformDato"><capplication:autoCompleteView name="equipoForm" tipoAutocomplete="propietario"/></td>
								</logic:notEqual>
								<logic:equal property="autoCompleteMappedDescripcion(propietario)" value="" name="equipoForm">
									<td class="CformDato"><bean:write name="equipoForm" property="propietarioDescripcion" /> <html:hidden property="propietarioDescripcion" /></td>
								</logic:equal>
							</tr>
							<tr>
								<td class="CformNombre" width="130">Patrimonio&nbsp;Nro:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="nroPatrimonio" /> <html:hidden property="nroPatrimonio" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Responsable Patrimonial:</td>
								<td class="CformDato" colspan="3"><capplication:autoCompleteView name="equipoForm"  tipoAutocomplete="ResponsablePatrimonial" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Subresponsable Patrimonial:</td>
								<td class="CformDato" colspan="3"><capplication:autoCompleteView name="equipoForm"  tipoAutocomplete="SubresponsablePatrimonial" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Adherido a:</td>
								<td class="CformDato">
									<bean:define id="tipoAdhesionSNId" name="equipoForm" property="sistemaNacionalId" type="String"/>
									<bean:define id="tipoAdhesionSGId" name="equipoForm" property="grandesInstrumentosId" type="String"/>
									<bean:define id="tipoAdhesionNAId" name="equipoForm" property="ningunoId" type="String"/>
								
									<html:radio styleId="radio_sn1" property="tipoAdhesion" value='<%= tipoAdhesionSNId %>' name="equipoForm" disabled="true"/>Sistemas Nacionales
									<html:radio styleId="radio_sn2" property="tipoAdhesion" value='<%= tipoAdhesionSGId %>' name="equipoForm" disabled="true"/>SECEGRIN
									<html:radio styleId="radio_sn3" property="tipoAdhesion" value='<%= tipoAdhesionNAId %>' name="equipoForm" disabled="true"/>Ninguno
									<html:hidden styleId="tipoAdhesionRadio" property="tipoAdhesion"/>
								</td>
							</tr>

							<tr>
								<td class="CformNombre">Código:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="codigo" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Laboratorio asociado:</td>
								<td class="CformDato"><bean:write name="equipoForm" property="laboratorio" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Institución financiadora:</td>
								<td class="CformDato" colspan="3"><capplication:autoCompleteView name="equipoForm" tipoAutocomplete="InstitucionFinanciadora" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Dependencia donde se encuentra:</td>
								<td class="CformDato" colspan="3"><capplication:autoCompleteView name="equipoForm" tipoAutocomplete="DependenciaUbicado" /></td>
							</tr>
							<tr>
								<td colspan="10">
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td><strong>Responsables Técnicos:</strong></td>
										</tr>
										<tr>
											<td colspan="10"><display:table class="CFormDisplayTable" name='<%= responsablesTecnicos %>' decorator="conicet.apps.svt.web.equipo.decorator.CEquipoResponsableTecnicoDisplayWrapper">
													<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
													<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
													<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
													<display:column property="documento" title="Documento" headerClass="tableCellHeader"/>
												</display:table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr bgcolor="#DDEEFF">
								<td colspan="10" width="100%">Datos de Localización</td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td class="CformNombre">Domicilio:&nbsp;</td>
								<td class="CformDato" colspan="3"><bean:write name="equipoForm" property="domicilio" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Pa&iacute;s:&nbsp;</td>
								<td class="CformDato"><html:select disabled="true" styleId="cboPais" property="pais">
										<html:options collection="comboPais" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Provincia:&nbsp;</td>
								<td class="CformDato"><html:select disabled="true" styleId="cboProvincia" property="provincia">
										<html:options collection="comboProvincia" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Partido:&nbsp;</td>
								<td class="CformDato"><html:select disabled="true" styleId="cboPartido" property="partido">
										<html:options collection="comboPartido" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Localidad:&nbsp;</td>
								<td class="CformDato"><html:select disabled="true" styleId="cboLocalidad" property="localidad">
										<html:options collection="comboLocalidad" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							
							<tr>
								<td colspan="10">
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td>Horarios de disponibilidad del equipo:&nbsp;</td>
										</tr>
									</table>
									
									<logic:empty property="horarios" name="equipoForm">
									<tr>
										<td>&nbsp;&nbsp;No se informaron horarios&nbsp;</td>
									</tr>
								</logic:empty>

									<logic:notEmpty property="horarios" name="equipoForm">
									
									<table width="100%">
						    			<tr>
											<td colspan="10">
												<table class="CFormDisplayTable" >
														<thead>
																<tr>
																	<th class="tableCellHeader">Lunes</th>
																	<th class="tableCellHeader">Martes</th>
																	<th class="tableCellHeader">Miércoles</th>
																	<th class="tableCellHeader">Jueves</th>
																	<th class="tableCellHeader">Viernes</th>
																	<th class="tableCellHeader">Sábado</th>
																	<th class="tableCellHeader">Domingo</th>
																</tr>
														</thead>
														<tbody>
																<tr class="odd">
																	<td><bean:write filter="false" name="equipoForm" property="diaHorarioView(L)" /></td>
																	<td><bean:write filter="false" name="equipoForm" property="diaHorarioView(Ma)" /></td>
																	<td><bean:write filter="false" name="equipoForm" property="diaHorarioView(Mi)" /></td>
																	<td><bean:write filter="false" name="equipoForm" property="diaHorarioView(J)" /></td>
																	<td><bean:write filter="false" name="equipoForm" property="diaHorarioView(V)" /></td>
																	<td><bean:write filter="false" name="equipoForm" property="diaHorarioView(S)" /></td>
																	<td><bean:write filter="false" name="equipoForm" property="diaHorarioView(D)" /></td>
																</tr>
														</tbody>
												</table>
											</td>
										</tr>
								 </table>

									</logic:notEmpty>
							</td>
						</tr>
							
							
							
							
							
						</table>
					</td>
				</tr>

				<logic:equal value="detalle" name="accion">

					<tr>
						<td class="CformAreaBotones" height="35">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cEquipoDetalleActionForm" />
									<jsp:param name="entidad" value="equipamiento" />
								</jsp:include>
							</div>
						</td>
					</tr>
				</logic:equal>

				<logic:equal value="confirmar" name="accion">
					<tr>
						<td class="CformAreaBotones">
							<div align="right">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
							</div>
						</td>
					</tr>
				</logic:equal>

				<logic:equal value="eliminar" name="accion">
					<tr>
						<td class="CformAreaBotones" height="35">
							<div align="right">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
							</div>
						</td>
					</tr>
				</logic:equal>

			</table>
		</td>
	</tr>
</table>