<%@include file="../jsp/layout/include.jsp"%>

<script>
	function seleccionar() {
		window.location = 'http://localhost/svt/test2.do';
	}
</script>
<br>
<%@page import="conicet.apps.svt.test.InscripcionMateria"%>
<h1 align="center" class="titulo">Reportes</h1>

<%
List prueba = new LinkedList<InscripcionMateria>();
InscripcionMateria m = new InscripcionMateria();
m.setNro("1");
m.setCapacidad("40");
m.setComision("001");
m.setDescripcion("Matemática 2");
m.setDia("Lunes");
m.setTurno("Noche");
m.setVacantes("22");
prueba.add(m);

List desasignados = new LinkedList<InscripcionMateria>();
m = new InscripcionMateria();
m.setNro("1");
m.setCapacidad("25");
m.setComision("002");
m.setDescripcion("Matemática 3");
m.setDia("Lunes");
m.setTurno("Noche");
m.setVacantes("13");
desasignados.add(m);

m = new InscripcionMateria();
m.setNro("2");
m.setCapacidad("25");
m.setComision("021");
m.setDescripcion("Física");
m.setDia("Lunes Y Martes");
m.setHorario("Lunes de 18:00 - 19:20, Martes de 19:20 - 21:00");
m.setTurno("Noche");
m.setVacantes("19");
desasignados.add(m);

m = new InscripcionMateria();
m.setNro("3");
m.setCapacidad("40");
m.setComision("022");
m.setDescripcion("Química");
m.setDia("Lunes");
m.setTurno("Noche");
m.setVacantes("9");
desasignados.add(m);


List alumnos = new LinkedList<InscripcionMateria>();
 m = new InscripcionMateria();
m.setNro("33.333.333");
m.setCapacidad("2");
m.setComision("001");
m.setDescripcion("Matemática 1, Matemática2");
m.setDia("Pepe P. Pala");
m.setTurno("Inglés 1");
m.setVacantes("Carrera Example");
alumnos.add(m);
%><!--

<form action="/inscripcion" method="post">

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table align="center" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td>
										<div id="campos">
											<table width="100%" cellpadding="2" cellspacing="2">
												<tr bgcolor="#DDEEFF">
													<td colspan="2" width="100%">Materia:</td>
												</tr>
												<tr>
													<td class="CformNombre">Comisión:</td>
													<td class="CformDato" width="500px"><input type="text" /></td>
												</tr>
												<tr>
													<td class="CformNombre">Nombre:</td>
													<td class="CformDato"><input type="text" /></td>
												</tr>
												<tr>
													<td class="CformNombre">Día:</td>
													<td class="CformDato"><select>
															<option>Lunes</option>
													</select></td>
												</tr>
												<tr>
													<td class="CformNombre">Turno:</td>
													<td class="CformDato"><select>
															<option>Noche</option>
													</select></td>
												</tr>
												<tr>
													<td colspan="10">
														<table class="tablaMin">
															<tr>
																<td class="CformAreaBotonesInterna" width="100%">
																	<div align="right">
																		<button type="button" class="CformBoton" onclick="seleccionar();">Buscar</button>
																	</div>
																</td>
															</tr>
														</table></td>
												</tr>
											</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tr bgcolor="#DDEEFF">
												<td colspan="2" width="100%">Asignadas: &nbsp;<span class="dato_obligatorio">*</span>
												</td>
											</tr>
											<tr>
												<td>
													<table class="tablaMin">
														<tr>
															<td colspan="10"><display:table style="width: 100%" name='<%=prueba%>' id='asd' decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoAMDisplayWrapper">
																	<display:column property="nro" title="#" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="comision" title="Comisión" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="descripcion" title="Desc." headerClass="tableCellHeader" style="width: 300px;" />
																	<display:column property="turno" title="Turno" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="dia" title="Día" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="horario" title="Horario" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="capacidad" title="Capacidad" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="vacantes" title="Vacantes" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="seleccionado" title="Selec." headerClass="tableCellHeader" style="width: 100px;" />
																</display:table>
															</td>
														</tr>
													</table>
													<table class="tablaMin">
														<tr>
															<td class="CformAreaBotonesInterna" width="100%">
																<div align="right">
																	<button type="button" class="CformBoton" onclick="seleccionar();">Desasignar</button>
																</div></td>
														</tr>
													</table></td>
											</tr>
											<tr bgcolor="#DDEEFF">
												<td colspan="2" width="100%">A Asignar:</td>
											</tr>
											<tr>
												<td>
													<table class="tablaMin">
														<tr>
															<td colspan="10"><display:table style="width: 100%" name='<%=desasignados%>' id='asd' decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoAMDisplayWrapper">
																	<display:column property="nro" title="#" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="comision" title="Comisión" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="descripcion" title="Desc." headerClass="tableCellHeader" style="width: 300px;" />
																	<display:column property="turno" title="Turno" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="dia" title="Día" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="horario" title="Horario" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="capacidad" title="Capacidad" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="vacantes" title="Vacantes" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="seleccionado" title="Selec." headerClass="tableCellHeader" style="width: 100px;" />
																</display:table>
															</td>
														</tr>
													</table>
													<table class="tablaMin">
														<tr>
															<td class="CformAreaBotonesInterna" width="100%">
																<div align="right">
																	<button type="button" class="CformBoton" onclick="seleccionar();">Asignar</button>
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
										</div></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
							<div align="right">
								<button id="boton" class="CformBoton" onclick="seleccionar()" type="button">Volver</button>
								<button id="boton" class="CformBoton" onclick="seleccionar()" type="button">Registrar</button>

							</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>-->


<form action="/inscripcion" method="post">

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table align="center" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td>
										<div id="campos">
											<table width="100%" cellpadding="2" cellspacing="2">
												<tr bgcolor="#DDEEFF">
													<td colspan="2" width="100%">Reporte Alumnos:</td>
												</tr>
												<tr>
													<td class="CformNombre">Cuatrimestre:</td>
													<td class="CformDato"><select>
															<option>1er. Cuatrimestre</option>
													</select></td>
												</tr>
												<tr>
													<td class="CformNombre">Año:</td>
													<td class="CformDato"><select>
															<option>2013</option>
													</select></td>
												</tr>
												<tr>
													<td colspan="10">
														<table class="tablaMin">
															<tr>
																<td class="CformAreaBotonesInterna" width="100%">
																	<div align="right">
																		<button type="button" class="CformBoton" onclick="seleccionar();">Generar Informe</button>
																	</div>
																</td>
															</tr>
														</table></td>
												</tr>
											</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tr bgcolor="#DDEEFF">
												<td colspan="2" width="100%">Informe: &nbsp;
												</td>
											</tr>
											<tr>
												<td>
													<table class="tablaMin">
														<tr>
															<td colspan="10"><display:table style="width: 100%"  export="true" name='<%=alumnos%>'  id='asd' decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoAMDisplayWrapper">
																	<display:column property="nro" title="Dni" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="dia" title="Nombre" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="vacantes" title="Carrera" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="turno" title="Materias Inscriptas" headerClass="tableCellHeader" style="width: 300px;" />
																	<display:column property="descripcion" title="Materias Aprobadas" headerClass="tableCellHeader" style="width: 100px;" />
																	<display:column property="capacidad" title="Cant. Aprobadas" headerClass="tableCellHeader" style="width: 100px;" />																
																	<display:setProperty name="export.pdf.filename" value="ListadoDeTransferencias.pdf" />
																</display:table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
										</div>
									</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td class="CformAreaBotones" height="35">
							<div align="right">
								<button id="boton" class="CformBoton" onclick="seleccionar()" type="button">Salir</button>
							</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>