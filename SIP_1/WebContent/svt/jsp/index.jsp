<%@page import="conicet.apps.svt.object.funcion.CFuncion"%>
<%@ include file="/jsp/layout/include.jsp"%><!--


Se definen Todos los Modulos con sus respectivos menu.
Algunos modulos, sus submenues solo tiene una funcion, por lo tanto los Bean estan definidos como si fueran menu.

-->


<bean:define id="menuEntidad" value='entidad_registro,entidad_busqueda' />
<bean:define id="menuTipoImputacion" value='tipo_imp_registro,tipo_imp_busqueda,valor_mano_obra' />
<bean:define id="menuConvenioMarco" value='conv_marco_registro,conv_marco_busqueda,porcentajes_institucionales' />
<bean:define id="menuUsuario" value='usuario_registro,usuario_busqueda' />
<bean:define id="menuAdmPrestadores" value='ad_pr_autorizacion,ad_pr_registro,ad_pr_busqueda' />
<bean:define id="menuAdmEntidadExternaRelacion" value='entidad_externa_relacion_busqueda' />
<bean:define id="menuSector" value='sector_registro,sector_busqueda' />
<bean:define id="moduloAdministracion" value='<%= menuEntidad+","+menuTipoImputacion+","+menuConvenioMarco+","+menuUsuario+","+menuAdmPrestadores+","+menuAdmEntidadExternaRelacion+","+menuSector%>' />

<bean:define id="menuContacto" value='contacto_registro, contacto_busqueda' />
<bean:define id="menuConvenio" value='instrumento_registro,instrumento_busqueda' />
<bean:define id="menuPdts" value='pdts_registro,pdts_busqueda' />
<bean:define id="moduloConvenio" value='<%= menuConvenio+","+menuContacto%>' />
<bean:define id="moduloSeguimientoConvenio" value='seguimiento_convenio,pdts_registro,pdts_busqueda' />

<bean:define id="menuAsesorias" value='asesoria_registro,asesoria_busqueda,asesor_antecedente_busqueda' />
<bean:define id="menuMinutas" value='minuta_registro,minuta_busqueda' />
<bean:define id="moduloAsesorias" value='<%= menuAsesorias+","+menuMinutas%>' />

<bean:define id="menuCobro" value='saldo_inicial_busqueda,cobro_busqueda,cobro_registro' />
<bean:define id="menuFacturacion" value='factura_busqueda,factura_registro' />
<bean:define id="moduloIngresos" value='<%= menuCobro+","+menuFacturacion%>' />

<bean:define id="moduloReportes" value='informe_busqueda,disponibilidad_fondos_buscar,eficacia_cobranza_buscar,informe_seguimiento_uvt,reporte_contabilidad_buscar' />


<bean:define id="menuOfertaTecnologica" value='ot_pi_busqueda,ot_stan_busqueda,ot_busqueda,ot_registro' />
<bean:define id="menuEquipamiento" value='equipamiento_registro,equipamiento_busqueda' />
<bean:define id="menuMarca" value='marca_registro,marca_busqueda' />
<bean:define id="menuUnidadPrestacion" value='unidad_prestacion_registro,unidad_prestacion_busqueda' />
<bean:define id="menuEquipoNombre" value='equipo_nombre_registro,equipo_nombre_busqueda' />
<bean:define id="menuPrestador" value='prestador_busqueda' />
<bean:define id="menuPreOferta" value='pot_busqueda_novedades,pot_busqueda' />
<bean:define id="moduloOfertaTecnologica" value='<%= menuOfertaTecnologica+","+menuEquipamiento+","+menuPreOferta+","+menuPrestador%>' />
<bean:define id="menuUvt" value='gestor_registro,gestor_busqueda' />
<bean:define id="menuContratante" value='contratante_registro,contratante_busqueda,contratante_analisis_busqueda' />
<bean:define id="menuPresupuesto" value='presupuesto_registro,presupuesto_busqueda' />
<bean:define id="menuOrdenFacturacion" value='orden_facturacion_busqueda' />
<bean:define id="menuPrecioSugerido" value='precio_sugerido_registro,precio_sugerido_busqueda' />
<bean:define id="moduloContrataciones" value='<%= menuUvt+","+menuContratante+","+menuPresupuesto+","+menuOrdenFacturacion+","+menuPrecioSugerido%>' />

<bean:define id="menuTransferencia" value='transferencia_registro,transferencia_busqueda,transferencia_busqueda_conicet' />
<bean:define id="menuProveedor" value='proveedor_registro,proveedor_busqueda' />

<bean:define id="moduloEgreso" value='<%= menuTransferencia +","+menuProveedor %>' />

<bean:define id="menuReportesDelPeriodo" value='informe_registro,informe_registro' />
<bean:define id="menuInformeProductividad" value='informe_registro,informe_registro' />
<bean:define id="moduloInformes" value='<%= menuReportesDelPeriodo +","+menuInformeProductividad %>' />

<%
	//Defino el nombre de la aplicacion para descargar el manual correspondiente.
	String appName = request.getSession().getServletContext().getServletContextName().toUpperCase();
%>

<table class="tablaMin" border="0" cellpadding="0" cellspacing="0" align="center">

	<tr valign="top">
		<!-- columna 1-->
		<td width="50%">
			<!-- Tabla de la columna1-->
			<table width="100%" border="0">
				<tr>
					<td><csecurity:hasFuncion funcion="<%=moduloAdministracion %>">
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
										<div align="right" class="caratula_titulo">
											<a href="manuales/Instructivo_<%=appName%>_Administracion.pdf" target="_blank">ADMINISTRACIÓN</a>
										</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
											<csecurity:hasFuncion funcion="<%=menuEntidad %>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">ENTIDAD:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="entidad_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cEntidadAltaAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda" /> Registro</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="entidad_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cEntidadBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuSector%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">SECTOR:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="sector_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cSectorAltaAction.do?method=init"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="sector_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cSectorBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>											
											<csecurity:hasFuncion funcion="<%=menuAdmEntidadExternaRelacion%>">
											
												<tr>
													<td colspan="2" class="caratula_subtitulo">ENTIDAD RELACION:</td>
												</tr>
												<tr>
												
													<csecurity:hasFuncion funcion="entidad_externa_relacion_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cEntidadExternaRelacionBuscarAction.do?method=init"> Búsqueda 
														</td>													
													</csecurity:hasFuncion>
												</tr>
												
											</csecurity:hasFuncion>
											
											<csecurity:hasFuncion funcion="<%=menuTipoImputacion%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">TIPO IMPUTACIÓN :</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="tipo_imp_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cTipoEgresoAltaAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="tipo_imp_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cTipoEgresoBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
												<csecurity:hasFuncion funcion="valor_mano_obra">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <csecurity:hasFuncion funcion="valor_mano_obra">
																<a href="cValorManoObraDetalleAction.do?accion=ini">
															</csecurity:hasFuncion> Valor Mano de Obra</td>
													</tr>
												</csecurity:hasFuncion>
											</csecurity:hasFuncion>
										<!-- tr>
											<td colspan="2" class="caratula_subtitulo">MINUTAS:</td>
										</tr>
										<tr>
											<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <csecurity:hasFuncion funcion="asesoria_registro">
													<a href="cMinutaAltaAction.do?method=init" />
												</csecurity:hasFuncion> Registro <csecurity:hasFuncion funcion="asesoria_registro">
												</csecurity:hasFuncion></td>
											<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <csecurity:hasFuncion funcion="asesoria_busqueda">
													<a href="cMinutaBuscarAction.do?method=init">
												</csecurity:hasFuncion> Búsqueda <csecurity:hasFuncion funcion="asesoria_busqueda">
												</csecurity:hasFuncion></td>
										</tr-->

											<csecurity:hasFuncion funcion="<%=menuConvenioMarco%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">CONVENIO MARCO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="conv_marco_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cConvenioMarcoAltaAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="conv_marco_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cConvenioMarcoBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
												<csecurity:hasFuncion funcion="porcentajes_institucionales">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cValorReferenciaConicetDetalleAction.do?method=init"> Valores Institucionales 
														</td>
													</tr>
												</csecurity:hasFuncion>
											</csecurity:hasFuncion>

											<csecurity:hasFuncion funcion="<%=menuUsuario%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">USUARIO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="usuario_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cUsuarioAltaAction.do?method=init"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="usuario_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cUsuarioBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
												<csecurity:hasFuncion funcion="configuracion_uvt">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cConfiguracionUvtAction.do?method=init"> Configuración UVT </a>
														</td>
													</tr>
												</csecurity:hasFuncion>
											</csecurity:hasFuncion>

											<csecurity:hasFuncion funcion="<%=menuAdmPrestadores%>">
												<tr>
													<td colspan="1" class="caratula_subtitulo">ADM. PRESTADORES:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="ad_pr_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cAdministracionPrestadoresAction.do?accion=ini"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="ad_pr_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cAdministracionPrestadoresBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
												<csecurity:hasFuncion funcion="ad_pr_autorizacion">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"><a href="cAdministracionPrestadoresAutorizacionAction.do?accion=ini"> Autorización 
														</td>
													</tr>
												</csecurity:hasFuncion>
											</csecurity:hasFuncion>
										</table></td>
								</tr>
							</table>
						</csecurity:hasFuncion></td>
				</tr>

				<csecurity:hasFuncion funcion="<%=moduloConvenio%>">
				<csecurity:hasNotFunction funcion="<%=moduloSeguimientoConvenio%>">
					<tr>
						<td>
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
										<div align="right" class="caratula_titulo">
											<a href="manuales/Instructivo_<%=appName%>_Convenios.pdf" target="_blank">CONVENIOS</a>
										</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
											<csecurity:hasFuncion funcion="<%=menuConvenio%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">CONVENIO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="instrumento_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cConvenioAltaAction.do?method=init" /> Registro</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="instrumento_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cInstrumentoBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuContacto%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">CONTACTO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="contacto_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cContactoAltaAction.do?method=init"> Registro</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="contacto_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cContactoBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
										</table></td>
								</tr>
							</table></td>
					</tr>
				</csecurity:hasNotFunction>
				</csecurity:hasFuncion>

				<csecurity:hasFuncion funcion="<%=moduloSeguimientoConvenio%>">
					<tr>
						<td>
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
										<div align="right" class="caratula_titulo">
											<a href="manuales/Instructivo_<%=appName%>_Seguimiento_Proyectos.pdf" target="_blank">SEGUIMIENTO PROYECTOS</a>
										</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
										
											<csecurity:hasFuncion funcion="seguimiento_convenio">
												<tr>
													<td colspan="2" class="caratula_subtitulo">CONVENIO:</td>
												</tr>
												<tr>
													<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cInstrumentoBuscarAction.do?method=initSeguimiento"> Búsqueda</td>
												</tr>
											</csecurity:hasFuncion>
											
											<csecurity:hasFuncion funcion="<%=menuPdts%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">PDTS:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="pdts_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cPdtsAltaAction.do?method=init" /> Registro</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="pdts_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cPdtsBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
												
											<csecurity:hasFuncion funcion="ver_hitos_convenio">
												<tr>
													<td colspan="2" class="caratula_subtitulo">HITOS:</td>
												</tr>
												<tr>
													<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cHitoBuscarAction.do?method=init"> Búsqueda</td>
												</tr>
											</csecurity:hasFuncion>
										</table>
									</td>
								</tr>
							</table></td>
					</tr>
				</csecurity:hasFuncion>
					
				<csecurity:hasFuncion funcion="<%=moduloAsesorias%>">
					<tr>
						<td>
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
										<div align="right" class="caratula_titulo">ASESORIAS</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
											<csecurity:hasFuncion funcion="<%=menuAsesorias%>">
											<tr>
												<td colspan="2" class="caratula_subtitulo">ASESORIA:</td>
											</tr>
											<tr>
												<csecurity:hasFuncion funcion="asesoria_registro">
													<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cAsesoriaAltaAction.do?method=init" /> Registro</td>
												</csecurity:hasFuncion>
												<csecurity:hasFuncion funcion="asesoria_busqueda">
													<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cAsesoriaBuscarAction.do?method=init"> Búsqueda 
													</td>
												</csecurity:hasFuncion>
											</tr>
											
											<csecurity:hasFuncion funcion="asesor_antecedente_busqueda">
											
												<tr>
													<td width="50%" class="caratula_texto">
														<img src="./imagenes/arrow.png"> 
														<a href="cAsesorAntecedenteBuscarAction.do?method=init"> Informe de Antecedentes </a>
													</td>
												</tr>
											</csecurity:hasFuncion>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuMinutas%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">MINUTAS:</td>
												</tr>
												<tr>
												 	<csecurity:hasFuncion funcion="minuta_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png">	<a href="cMinutaAltaAction.do?method=init" /> Registro</td> 
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="minuta_busqueda">	
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cMinutaBuscarAction.do?method=init"> Búsqueda </td> 
													</csecurity:hasFuncion>
												</tr>	
											</csecurity:hasFuncion>				
										
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
										
					
				</csecurity:hasFuncion>

				<capplication:isApplication application="SVT,SVTP">
					<csecurity:hasFuncion funcion="<%=moduloReportes%>">
						<tr>
							<td>
								<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
									<tr bordercolor="#FFFFFF" valign="middle">
										<td bgcolor="#d7e2f7" bordercolor="#d7e2f7"><div align="right" class="caratula_titulo">REPORTES</div></td>
									</tr>
									<tr bordercolor="#FFFFFF" valign="middle">
										<td class="caratula_texto">
											<table bordercolor="#FFFFFF" width="100%">
												<csecurity:hasFuncion funcion="informe_busqueda">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cInformeBuscarAction.do?method=init"> Búsqueda de Informes 
														</td>
													</tr>
												</csecurity:hasFuncion>
												<csecurity:hasFuncion funcion="disponibilidad_fondos_buscar">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cDisponibilidadFondosBuscarAction.do?method=init"> Disponibilidad de Fondos 
														</td>
													</tr>
												</csecurity:hasFuncion>
												<csecurity:hasFuncion funcion="reporte_contabilidad_buscar">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cReporteContabilidadBuscarAction.do?method=init"> Reporte de Contabilidad 
														</td>
													</tr>
												</csecurity:hasFuncion>
												<csecurity:hasFuncion funcion="eficacia_cobranza_buscar">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cCobroReporteAction.do?method=init"> Situación Cobranza</a>
														</td>
													</tr>
												</csecurity:hasFuncion>
												<csecurity:hasFuncion funcion="informe_seguimiento_uvt">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cReporteMensualUvtsAction.do?method=init"> Informe Seguimiento UVTs 
														</td>
													</tr>
												</csecurity:hasFuncion>
											</table>
										</td>
									</tr>
								</table></td>
						</tr>
					</csecurity:hasFuncion>
				</capplication:isApplication>
				<capplication:isApplication application="SVTP">
					<tr>
						<td>
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
										<div align="right" class="caratula_titulo">AYUDA</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
											<tr>
												<td colspan="2"><img src="./imagenes/arrow.png">&nbsp;Consultas: <a href="mailto:svt-soporte@conicet.gov.ar">svt-soporte@conicet.gov.ar</a>
												</td>
											</tr>
											<tr>
												<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="./normativa.do">Normativa</a></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
				</capplication:isApplication>
			</table></td>
		<!-- columna 2-->
		<td>
			<!-- Tabla columna 2-->
			<table width="100%" border="0" background="#EFEFEF">
				<csecurity:hasFuncion funcion="<%=moduloOfertaTecnologica%>">
					<tr>
						<td>
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
										<div align="right" class="caratula_titulo">
											<a href="manuales/Instructivo_<%=appName%>_OT_STAN.pdf" target="_blank">OFERTA TECNOLÓGICA</a>
										</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
											<csecurity:hasFuncion funcion="<%=menuPrestador%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">PRESTADOR:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="prestador_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cPrestadorBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuOfertaTecnologica%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">OFERTA TECNOLÓGICA:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="ot_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cTipoOfertaSeleccionarAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="ot_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cOfertaTecnologicaBuscarAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="ot_stan_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cOfertaTecnologicaBuscarStanAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda"> Búsqueda
																STAN 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="ot_pi_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cOfertaTecnologicaBuscarPropiedadAction.do?accion=ini"> Búsqueda Prop. Int. 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuEquipamiento%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">EQUIPAMIENTO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="equipamiento_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cEquipoAltaAction.do?method=init&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="equipamiento_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cEquipoBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>						
												</tr>
											</csecurity:hasFuncion>
											
											<csecurity:hasFuncion funcion="<%=menuMarca%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">MARCA:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="marca_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cMarcaAltaAction.do?method=init&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="marca_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cMarcaBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>					
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuUnidadPrestacion%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">UNIDAD DE PRESTACION:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="unidad_prestacion_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cUnidadPrestacionAltaAction.do?method=init&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="unidad_prestacion_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cUnidadPrestacionBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuEquipoNombre%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">NOMBRE DE EQUIPO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="equipo_nombre_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cEquipoNombreAltaAction.do?method=init&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="equipo_nombre_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cEquipoNombreBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>					
												</tr>
											</csecurity:hasFuncion>
											
											<csecurity:hasFuncion funcion="<%=menuPreOferta%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">PRE OFERTA TECNOLÓGICA:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="pot_busqueda_novedades">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cOfertaAceptarListarAction.do?accion=ini" /> Búsqueda de Novedades</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="pot_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cPreOfertaTecnologicaBuscarAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda" /> Búsqueda</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
										</table></td>
								</tr>
							</table>
						</td>
					</tr>
				</csecurity:hasFuncion>
				<csecurity:hasFuncion funcion="<%=moduloContrataciones%>">
					<tr>
						<td>
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
										<div align="right" class="caratula_titulo"></div>
										<div align="right" class="caratula_titulo">
											<a href="manuales/Instructivo_<%=appName%>_Contrataciones.pdf" target="_blank">CONTRATACIONES</a>
										</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
											<csecurity:hasFuncion funcion="<%=menuUvt%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">UVT:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="gestor_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cUvtAltaAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="gestor_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cGestorBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuContratante%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">CONTRATANTE:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="contratante_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cContratanteAltaAction.do?accion=ini&amp;btnSubmit=limpiarBusqueda"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="contratante_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cContratanteBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
												<csecurity:hasFuncion funcion="contratante_analisis_busqueda">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cContratanteAnalisisBuscarAction.do?method=init"> Búsqueda Avanzada </a>
														</td>
													</tr>
												</csecurity:hasFuncion>
											</csecurity:hasFuncion>


											<csecurity:hasFuncion funcion="<%=menuPresupuesto%>">
												<tr>
													<td colspan="1" class="caratula_subtitulo">PRESUPUESTO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="presupuesto_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cPresupuestoAltaAction.do?accion=ini"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="presupuesto_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cPresupuestoBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>


											<csecurity:hasFuncion funcion="<%=menuOrdenFacturacion%>">
												<tr>
													<td colspan="1" class="caratula_subtitulo">ORDEN DE FACTURACIÓN:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="orden_facturacion_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cOFPresupuestoBuscarAction.do?accion=ini"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuPrecioSugerido%>">
												<tr>
													<td colspan="1" class="caratula_subtitulo">PRECIO SUGERIDO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="precio_sugerido_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cPrecioSugeridoAltaAction.do?method=init"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="precio_sugerido_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cPrecioSugeridoBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
										</table></td>
								</tr>
							</table></td>
					</tr>
				</csecurity:hasFuncion>
				
				<csecurity:hasFuncion funcion="<%=moduloIngresos%>">
					<tr>
						<td>
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7"><div align="right" class="caratula_titulo">
											<a href="manuales/Instructivo_<%=appName%>_Ingresos.pdf" target="_blank">INGRESOS</a>
										</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
											<csecurity:hasFuncion funcion="<%=menuFacturacion%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">FACTURACIÓN:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="factura_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cFacturaAltaAction.do?method=init"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="factura_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cFacturaBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="factura_registro_desde_of">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cOrdenFacturacionBuscarAction.do?method=init"> 
															Registro Desde Orden De Facturación 
														</td>
													</csecurity:hasFuncion>
												</tr>
											</csecurity:hasFuncion>
											<csecurity:hasFuncion funcion="<%=menuCobro%>">
												<tr>
													<td colspan="2" class="caratula_subtitulo">COBRO:</td>
												</tr>
												<tr>
													<csecurity:hasFuncion funcion="cobro_registro">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cCobroAltaAction.do?method=init"> Registro 
														</td>
													</csecurity:hasFuncion>
													<csecurity:hasFuncion funcion="cobro_busqueda">
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cCobroBuscarAction.do?method=init"> Búsqueda 
														</td>
													</csecurity:hasFuncion>
												</tr>
												<csecurity:hasFuncion funcion="saldo_inicial_busqueda">
													<tr>
														<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cSaldoInicialBuscarAction.do?method=init"> Saldos Iniciales 
														</td>
													</tr>
												</csecurity:hasFuncion>
											</csecurity:hasFuncion>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</csecurity:hasFuncion>

				
					<csecurity:hasFuncion funcion="<%=moduloEgreso%>">
						<tr>
							<td>
								<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
									<tr bordercolor="#FFFFFF" valign="middle">
										<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
											<div align="right" class="caratula_titulo">
												<a href="manuales/Instructivo_<%=appName%>_Egresos.pdf" target="_blank">EGRESOS</a>
											</div>
										</td>
									</tr>
									<tr bordercolor="#FFFFFF" valign="middle">
										<td class="caratula_texto">
											<table bordercolor="#FFFFFF" width="100%">
												<csecurity:hasFuncion funcion="<%=menuTransferencia%>">
													<tr>
														<td colspan="2" class="caratula_subtitulo">TRANSFERENCIAS:</td>
													</tr>

													<tr>
														<csecurity:hasFuncion funcion="transferencia_registro">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="./transferenciaAlta.do" /> Registro</td>
														</csecurity:hasFuncion>
														<csecurity:hasFuncion funcion="transferencia_busqueda">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cTransferenciaBuscarAction.do?method=init"> Búsqueda 
															</td>
														</csecurity:hasFuncion>
													</tr>
													<tr>
														<csecurity:hasFuncion funcion="transferencia_busqueda_conicet">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cTransferenciaConicetBuscarAction.do?method=init"> Transferencias Conicet 
															</td>
														</csecurity:hasFuncion>
													</tr>

													<tr>
														<td colspan="2" class="caratula_subtitulo">EJECUCIÓN DE GASTOS:</td>
													</tr>
													<tr>
														<csecurity:hasFuncion funcion="ejecucion_gastos_registrar">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="./cEjecucionGastosUDAltaAction.do?method=init" /> Registro</td>
														</csecurity:hasFuncion>
														<csecurity:hasFuncion funcion="ejecucion_gastos_busqueda">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cEjecucionGastosBuscarAction.do?method=init"> Búsqueda 
															</td>
														</csecurity:hasFuncion>
													</tr>
												</csecurity:hasFuncion>
												<csecurity:hasFuncion funcion="<%=menuProveedor%>">	
													
													<tr>
														<td colspan="2" class="caratula_subtitulo">PROVEEDORES:</td>
													</tr>
													<tr>
														<csecurity:hasFuncion funcion="proveedor_registro">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="./cProveedorAltaAction.do?method=init" /> Registro</td>
														</csecurity:hasFuncion>
														<csecurity:hasFuncion funcion="proveedor_busqueda">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cProveedorBuscarAction.do?method=init"> Búsqueda 
															</td>
														</csecurity:hasFuncion>
													</tr>
													
													
												</csecurity:hasFuncion>
											</table></td>
									</tr>
								</table></td>
						</tr>
					</csecurity:hasFuncion>
				<capplication:isApplication application="SIUVT">
					<csecurity:hasFuncion funcion="<%=moduloInformes%>">
						<tr>
							<td>
								<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
									<tr bordercolor="#FFFFFF" valign="middle">
										<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
											<div align="right" class="caratula_titulo">
												<a href="manuales/Instructivo_<%=appName%>_Informes.pdf" target="_blank">INFORMES</a>
											</div>
										</td>
									</tr>
									<tr bordercolor="#FFFFFF" valign="middle">
										<td class="caratula_texto">
											<table bordercolor="#FFFFFF" width="100%">
												<csecurity:hasFuncion funcion="<%=menuReportesDelPeriodo%>">
													<tr>
														<td colspan="2" class="caratula_subtitulo">REPORTE DEL PERIODO:</td>
													</tr>
													<tr>
														<csecurity:hasFuncion funcion="informe_registro">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cInformeAltaAction.do?method=init" /> Registro</td>
														</csecurity:hasFuncion>
														<csecurity:hasFuncion funcion="informe_busqueda">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cInformeBuscarAction.do?method=init"> Búsqueda 
															</td>
														</csecurity:hasFuncion>
													</tr>
													<csecurity:hasFuncion funcion="informe_terceros_registro">
														<tr>
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cInformeDeTercerosAction.do?method=init" /> Informe Fondos de Terceros</td>
														</tr>
													</csecurity:hasFuncion>
													
												</csecurity:hasFuncion>
												<csecurity:hasFuncion funcion="<%=menuInformeProductividad%>">
													<tr>
														<td colspan="2" class="caratula_subtitulo">INFORME PRODUCTIVIDAD:</td>
													</tr>
													<tr>
														<csecurity:hasFuncion funcion="informe_prod_registro">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cInformeReciboProductividadAction.do?method=init" /> Registro</td>
														</csecurity:hasFuncion>
														<csecurity:hasFuncion funcion="informe_prod_busqueda">
															<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="cInformeProductividadBuscarAction.do?method=init"> Búsqueda 
															</td>
														</csecurity:hasFuncion>
													</tr>
												</csecurity:hasFuncion>
											</table></td>
									</tr>
								</table></td>
						</tr>
					</csecurity:hasFuncion>
				</capplication:isApplication>
				<capplication:isApplication application="SVT,SIUVT">
					<tr>
						<td>
							<table width="100%" cellspacing="0" cellpadding="3" border="1" bordercolor="#666666">
								<tr bordercolor="#FFFFFF" valign="middle">
									<td bgcolor="#d7e2f7" bordercolor="#d7e2f7">
										<div align="right" class="caratula_titulo">AYUDA</div></td>
								</tr>
								<tr bordercolor="#FFFFFF" valign="middle">
									<td class="caratula_texto">
										<table bordercolor="#FFFFFF" width="100%">
											<tr>
												<td colspan="2"><img src="./imagenes/arrow.png">&nbsp;Consultas: <a href="mailto:<%=appName.toLowerCase()%>-soporte@conicet.gov.ar"><%=appName.toLowerCase()%>-soporte@conicet.gov.ar</a>
												</td>
											</tr>
											<tr>
												<td width="50%" class="caratula_texto"><img src="./imagenes/arrow.png"> <a href="./normativa.do">Normativa</a></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
				</capplication:isApplication>
			</table></td>
	</tr>
</table>
