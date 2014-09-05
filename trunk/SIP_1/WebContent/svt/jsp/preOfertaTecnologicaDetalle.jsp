<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="layout/include.jsp"%>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script>
	window.onload=function(){
		if (document.cPreOfertaTecnologicaDetalleActionForm.aplicacion="SVTP"){
				if(document.cPreOfertaTecnologicaDetalleActionForm.generarPDF.value=="S"){
					document.cPreOfertaTecnologicaDetalleActionForm.generarPDF.value="N";
					go();
				}
		}
	}
	
	function submitComboCostos(){
	  document.cPreOfertaTecnologicaDetalleActionForm.action = 'cPreOfertaTecnologicaDetalleAction.do?accion=populateCosto';
	  document.cPreOfertaTecnologicaDetalleActionForm.submit();
	}

	function go(){
		var id = <bean:write name="cPreOfertaTecnologicaDetalleActionForm" property="idSelected" />;
		var app = "<bean:write name="cPreOfertaTecnologicaDetalleActionForm" property="aplicacion"/>";
		var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
		window.open('/'+urlAppName+'/cPreOfertaTecnologicaPDFAction.do?id='+id+'&aplicacion='+app,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
	}

</script>

<br>
<html:form action="cPreOfertaTecnologicaDetalleAction.do" method="POST">
 <capplication:isApplication application="SVTP">
  <html:hidden property="generarPDF" />
 </capplication:isApplication> 

	<logic:equal property="accion" value="formulario"	name="cPreOfertaTecnologicaDetalleActionForm">
	  
		<h1 align="center" class="titulo">Detalle de la Pre-Oferta Tecnológica</h1>
		<capplication:isApplication application="SVT"> 
    <logic:equal value="S" property="tienePreOTActiva" name="cPreOfertaTecnologicaDetalleActionForm">
       <h2 class="mensajeSuperior">El Prestador o el Adminsitrador esta realizando correcciones en esta Oferta Tecnológica.</h2>
    </logic:equal> 
    </capplication:isApplication>
		<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
				<td>
				<table align="center" width="100%">
					<tr>
						<td>
						<table width="100%">
							<tr bgcolor="#BFDFFF">
								<td><strong><bean:write
									name="cPreOfertaTecnologicaDetalleActionForm"
									property="tipoOfertaDescripcion" />&nbsp;</strong></td>
							</tr>
						</table>

						<!-- CONOCIMIENTO--> <logic:equal property="tipoOferta" value="1" name="cPreOfertaTecnologicaDetalleActionForm">
							<table width="100%" cellpadding="0" cellspacing="0">
								<logic:notEmpty property="codigoId" name="cPreOfertaTecnologicaDetalleActionForm">
								  <tr>
									 <td class="CformNombre" width="114">Código:&nbsp;</td>
									 <td class="CformDato">
									   <bean:write name="cPreOfertaTecnologicaDetalleActionForm" property="codigoId" />
									 </td>
								  </tr>
								</logic:notEmpty>
								<tr>
									<td class="CformNombre" width="114">Título:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="descripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="114">Detalle:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm" property="detalle" />
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="114">Responsable Técnico:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm" property="responsable" />
									</td>
								</tr>
								<!--  
                  <capplication:isApplication application="SVT"> 
                    <tr>
                      <td class="CformNombre" width="114">
                        Estado:&nbsp;
                      </td>
                      <td class="CformDato">
                        <html:select disabled="true" property="tipoEstado">
                          <html:options collection="comboTipoEstado" property="value" labelProperty="label" />
                        </html:select>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="110">
                        Publicación Web:
                      </td>
                      <td class="CformDato">
                        Sí
                        <html:radio property="publica" value="S" disabled="true" />
                        No
                        <html:radio property="publica" value="N" disabled="true" />
                      </td>
                    </tr>
                  </capplication:isApplication>
                  -->
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Prestador &nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td colspan="10"><display:table
										name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.titularLote"
										id="preOfertaTecnologicaDetalle"
										decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
										<display:column property="indiceEntidadesEnDetalleOferta"
											title="#" style="width:10px" headerClass="tableCellHeader" />
										<display:column property="descripcion" title="Descripción"
											headerClass="tableCellHeader" style="width: 350px;" />
										<display:column property="tipo" title="Tipo"
											headerClass="tableCellHeader" style="width: 350px;" />
										<display:column property="provincia" title="Provincia"
											headerClass="tableCellHeader" style="width: 350px;" />
									</display:table></td>
								</tr>
							</table>
							<!--
							<logic:equal value="true" property="mostrarUVT"	name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>UVT:&nbsp;</strong></td>
									</tr>
								</table>
								<logic:notEmpty property="colGestor" name="cPreOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td colspan="10">
											  <display:table	name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.colGestor"	decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
											    <display:column property="indiceGestor" title="#"	style="width:10px" headerClass="tableCellHeader" />
												  <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
												  <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
												  <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
											  </display:table>
											</td>
										</tr>
									</table>
								</logic:notEmpty>
								<logic:empty property="colGestor" name="cPreOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td>No se seleccionó UVT.&nbsp;</td>
										</tr>
									</table>
								</logic:empty>
							</logic:equal>
							-->
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Equipamientos&nbsp;</strong></td>
								</tr>
							</table>
							<logic:notEmpty property="equiposLote"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.equiposLote"
											decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
											<display:column property="descripcion" title="Descripción"
												headerClass="tableCellHeader" maxLength="22"
												style="width: 350px;" />
											<display:column property="anio" title="Año"
												headerClass="tableCellHeader" style="width: 50px;" />
											<display:column property="marca" title="Marca"
												headerClass="tableCellHeader" maxLength="15"
												style="width: 350px;" />
											<display:column property="modelo" title="Modelo"
												headerClass="tableCellHeader" maxLength="6"
												style="width: 80px;" />
											<display:column property="nroSerie" title="N°Serie"
												headerClass="tableCellHeader" style="width: 350px;" />
										</display:table></td>
									</tr>
								</table>
							</logic:notEmpty>
							<logic:empty property="equiposLote"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td>No se seleccionaron equipamientos&nbsp;</td>
									</tr>
								</table>
							</logic:empty>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Información Tecnológica&nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalDPDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDP"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteDP" multiple="true" size="3">
											<html:options collection="comboOtDP" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Disciplina Desagregada&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalDDDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDD"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteDD" multiple="true" size="3">
											<html:options collection="comboOtDD" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Campo de Aplicación&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalCADescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteCA"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteCA" multiple="true" size="3">
											<html:options collection="comboOtCA" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Actividades Industriales&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalCODescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otros:&nbsp;</td>
									<logic:notEmpty property="loteCO"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteCO" multiple="true" size="3">
											<html:options collection="comboOtCO" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Palabras Claves&nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%" cellpadding="5" cellspacing="2">
								<tr>
									<td class="CformNombre" width="80">1ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave1" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="80">2ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave2" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="80">3ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave3" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="80">4ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave4" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="80">5ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave5" /></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Seguimiento&nbsp;</strong></td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="CformNombre" width="114">Estado:&nbsp;</td>
									<td class="CformDato"><html:select disabled="true"
										property="tipoEstado">
										<html:options collection="comboTipoEstado" property="value"
											labelProperty="label" />
									</html:select></td>
								</tr>
							</table>
							<table>
								<capplication:isApplication application="SVT">
									<tr>
										<td class="CformNombre" width="110">Publicación Web:</td>
										<td class="CformDato">Sí <html:radio property="publica"
											value="S" disabled="true" /> No <html:radio
											property="publica" value="N" disabled="true" /></td>
									</tr>
								</capplication:isApplication>
							</table>
							<!--tr No borrar>
              <td class="CformNombre" colspan="2">
                <html:submit property="btnSubidaArchivo" styleClass="CformBotonTransp" value="Subir Archivo."/>
              </td>
            </tr-->
            <tr>
              <td class="CformNombre" colspan="2">
                <html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Ver Presentaciones"/>
              </td>
            </tr>

						</logic:equal> <!-- STAN --> <logic:equal property="tipoOferta" value="3"
							name="cPreOfertaTecnologicaDetalleActionForm">
							<table width="100%" cellpadding="0" cellspacing="0">
								<logic:notEmpty property="codigoId" name="cPreOfertaTecnologicaDetalleActionForm">
								  <tr>
									 <td class="CformNombre" width="130">Código:&nbsp;</td>
									 <td class="CformDato">
									   <bean:write name="cPreOfertaTecnologicaDetalleActionForm" property="codigoId" />
									 </td>
								  </tr>
								</logic:notEmpty>
								<tr>
							         <td class="CformNombre" width="150">
							           Es Servicio:&nbsp;&nbsp;
							         </td>
							         <td class="CformDato">
							           <html:radio property="tipoStan" value="ST" disabled="true" />
							         </td>
							         <td class="CformNombre" width="150">
							           Es Asesoramiento:&nbsp;&nbsp;
							         </td>
							         <td class="CformDato">
							           <html:radio property="tipoStan" value="AINS" disabled="true" />
							         </td>
						       </tr>								

								<tr>
									<td class="CformNombre" width="130">Título:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="descripcion" /></td>
								</tr>

								<tr>
									<td class="CformNombre" width="130">Prestación:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="prestacionDescripcion" /></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Prestador &nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td colspan="10"><display:table
										name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.titularLote"
										id="preOfertaTecnologicaDetalle"
										decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
										<display:column property="indiceEntidadesEnDetalleOferta"
											title="#" style="width:10px" headerClass="tableCellHeader" />
										<display:column property="descripcion" title="Descripción"
											headerClass="tableCellHeader" style="width: 350px;" />
										<display:column property="tipo" title="Tipo"
											headerClass="tableCellHeader" style="width: 350px;" />
										<display:column property="provincia" title="Provincia"
											headerClass="tableCellHeader" style="width: 350px;" />
									</display:table></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Especificación&nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="130">Detalle STAN:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm" property="detalle" />
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Detalle Prestación:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm" property="prestacionDetalle" />
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Metodología:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="especificacionMetodologia" /></td>
								</tr>

								<tr>
									<td class="CformNombre" width="130">Responsable
									Técnico:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="responsable" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Unidad de
									Prestación:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="unidadPrestacion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Capacidad
									Operativa:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="capacidadOperativa" /></td>
								</tr>

								<tr>
									<td class="CformNombre" width="130">Cantidad Mínima:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="cantidadMinima" /></td>
								</tr>
							</table>

							<!-- <logic:equal value="true" property="mostrarUVT"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>UVT:&nbsp;</strong></td>
									</tr>
								</table>
								<logic:notEmpty property="colGestor"
									name="cPreOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td colspan="10"><display:table
												name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.colGestor"
												decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
												<display:column property="indiceGestor" title="#"
													style="width:10px" headerClass="tableCellHeader" />
												<display:column property="descripcionSeleccion"
													title="Descripción" headerClass="tableCellHeader"
													style="width: 350px;" />
												<display:column property="siglaSeleccion" title="Sigla"
													headerClass="tableCellHeader" style="width: 350px;" />
												<display:column property="tipoGestor" title="Tipo"
													headerClass="tableCellHeader" style="width: 150px;" />
											</display:table></td>
										</tr>
									</table>
								</logic:notEmpty>
								<logic:empty property="colGestor"
									name="cPreOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td>No se seleccionó UVT.&nbsp;</td>
										</tr>
									</table>
								</logic:empty>
							</logic:equal>
							-->
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Equipamientos&nbsp;</strong></td>
								</tr>
							</table>
							<logic:notEmpty property="equiposLote"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.equiposLote"
											decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
											<display:column property="descripcion" title="Descripción"
												headerClass="tableCellHeader" maxLength="22"
												style="width: 350px;" />
											<display:column property="anio" title="Año"
												headerClass="tableCellHeader" style="width: 50px;" />
											<display:column property="marca" title="Marca"
												headerClass="tableCellHeader" maxLength="15"
												style="width: 350px;" />
											<display:column property="modelo" title="Modelo"
												headerClass="tableCellHeader" maxLength="6"
												style="width: 80px;" />
											<display:column property="nroSerie" title="N°Serie"
												headerClass="tableCellHeader" style="width: 350px;" />
										</display:table></td>
									</tr>
								</table>
							</logic:notEmpty>
							<logic:empty property="equiposLote"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td>No se seleccionaron equipamientos&nbsp;</td>
									</tr>
								</table>
							</logic:empty>


							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Información Tecnológica&nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Disciplina Primaria&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalDPDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDP"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteDP" multiple="true" size="3">
											<html:options collection="comboOtDP" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Disciplina Desagregada&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalDDDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDD"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteDD" multiple="true" size="3">
											<html:options collection="comboOtDD" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Campo de Aplicación&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalCADescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteCA"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteCA" multiple="true" size="3">
											<html:options collection="comboOtCA" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Actividades Industriales&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalCODescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otros:&nbsp;</td>
									<logic:notEmpty property="loteCO"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteCO" multiple="true" size="3">
											<html:options collection="comboOtCO" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Palabras Claves&nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">1ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave1" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">2ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave2" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">3ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave3" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">4ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave4" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">5ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave5" /></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Costos&nbsp;</strong></td>
								</tr>
							</table>
							<logic:notEmpty property="stanCostos"
								name="cPreOfertaTecnologicaDetalleActionForm">

								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.stanCostos"
											id="detalleOferta"
											requestURI="cPreOfertaTecnologicaDetalleAction.do"
											defaultsort="1" defaultorder="descending"
											decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
											<display:column property="indice" title="#"
												style="width:10px" headerClass="tableCellHeader" />
											<display:column property="descripcion" title="Descripción"
												headerClass="tableCellHeader" style="width: 200px;" />
											<display:column property="costoConsolidado"
												title=" Costo $ Mínimo" maxLength="20"
												headerClass="tableCellHeader"
												style="text-align:right;width: 80px;" />
											<display:column property="fechaDesde" title="Vigencia Desde"
												headerClass="tableCellHeader"
												style="align:right; width: 150px;" />
											<display:column property="fechaHasta" title="Vigencia Hasta"
												headerClass="tableCellHeader"
												style="align:right; width: 150px;" />

											<display:column property="estado" title="Estado"
												headerClass="tableCellHeader"
												style="align:right; width: 150px;" />
										</display:table></td>
									</tr>
								</table>
							</logic:notEmpty>
							<logic:empty property="stanCostos"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td>No se informaron costos&nbsp;</td>
									</tr>
								</table>
							</logic:empty>



							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Seguimiento&nbsp;</strong></td>
								</tr>
							</table>

							<capplication:isApplication application="SVT">
								<table width="100%">
									<tr>
										<td class="CformNombre" width="130" align="left">Expediente
										Nro:&nbsp;</td>
										<td class="CformDato"><logic:notEmpty
											property="nroExpediente"
											name="cPreOfertaTecnologicaDetalleActionForm">
											<bean:write name="cPreOfertaTecnologicaDetalleActionForm"
												property="nroExpediente" /> /
                      						<bean:write
												name="cPreOfertaTecnologicaDetalleActionForm"
												property="anioExpediente" />
										</logic:notEmpty></td>
									</tr>
									<tr>
										<td class="CformNombre" width="130">Fecha
										Autorización:&nbsp;</td>
										<td class="CformDato"><bean:write
											name="cPreOfertaTecnologicaDetalleActionForm"
											property="fechaAutorizacion" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="130">Resolución:&nbsp;</td>
										<td class="CformDato"><logic:notEmpty
											property="nroResolucion"
											name="cPreOfertaTecnologicaDetalleActionForm">
												Tipo:&nbsp;
												<html:select disabled="true" property="tipoResolucion">
												<html:options collection="comboTipoResolucion"
													property="value" labelProperty="label" />
											</html:select>
				    					    	Nro: <bean:write
												name="cPreOfertaTecnologicaDetalleActionForm"
												property="nroResolucion" />
											
											&nbsp;&nbsp;Fecha:&nbsp;<bean:write
												name="cPreOfertaTecnologicaDetalleActionForm"
												property="fechaResolucion" />
										</logic:notEmpty> <logic:greaterThan value="-1" property="estadoResolucion"
											name="cPreOfertaTecnologicaDetalleActionForm">
											<html:select disabled="true" property="estadoResolucion">
												<html:options collection="comboEstadoResolucion"
													property="value" labelProperty="label" />
											</html:select>
										</logic:greaterThan></td>
									</tr>
								</table>

							</capplication:isApplication>


							<table width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td class="CformNombre" width="130">Estado:&nbsp;</td>
									<td class="CformDato"><html:select disabled="true"
										property="tipoEstado">
										<html:options collection="comboTipoEstado" property="value"
											labelProperty="label" />
									</html:select></td>
								</tr>
							</table>

							<capplication:isApplication application="SVT">
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td class="CformNombre" width="130">Publicar:&nbsp;</td>
										<td class="CformDato">Sí <html:radio property="publica"
											value="S" disabled="true" /> No <html:radio
											property="publica" value="N" disabled="true" /></td>
									</tr>
								</table>
							</capplication:isApplication>



							<!-- tr No borrar>
              <td class="CformNombre" colspan="2">
                <html:submit property="btnSubidaArchivo" styleClass="CformBotonTransp" value="Subir Archivo."/>
              </td>
            </tr-->

            <tr>
              <td class="CformNombre" colspan="2">
                <html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Ver Presentaciones"/>
              </td>
            </tr>



						</logic:equal> <!-- PROP.INTELECTUAL--> <logic:equal property="tipoOferta"
							value="2" name="cPreOfertaTecnologicaDetalleActionForm">

							<table width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td class="CformNombre" width="114">Número:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="numeroPropiedad" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="114">Título:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="descripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="114">Estado:&nbsp;</td>
									<td class="CformDato"><html:select disabled="true"
										property="tipoEstado">
										<html:options collection="comboTipoEstado" property="value"
											labelProperty="label" />
									</html:select></td>
								</tr>
								<capplication:isApplication application="SVT">
									<tr>
										<td class="CformNombre" width="110">Publicar:</td>
										<td class="CformDato">Sí <html:radio property="publica"
											value="S" disabled="true" /> No <html:radio
											property="publica" value="N" disabled="true" /></td>
									</tr>
								</capplication:isApplication>
							</table>

							<table width="100%" cellpadding="0" cellspacing="0">
								<!--Si es propiedad intelectual, mostrar tipo-->
								<tr>
									<td class="CformNombre" width="114">Tipo Propiedad:&nbsp;</td>
									<td class="CformDato"><html:select disabled="true"
										property="tipoPropiedad">
										<html:options collection="comboTipoPropiedad" property="value"
											labelProperty="label" />
									</html:select></td>
								</tr>
							</table>

							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Prestador / Titular &nbsp;</strong></td>
								</tr>
							</table>

							<table width="100%">
								<tr>
									<td colspan="10"><display:table
										name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.titularLote"
										id="preOfertaTecnologicaDetalle"
										decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
										<display:column property="indiceEntidadesEnDetalleOferta"
											title="#" style="width:10px" headerClass="tableCellHeader" />
										<display:column property="descripcion" title="Descripción"
											headerClass="tableCellHeader" style="width: 350px;" />
										<display:column property="tipo" title="Tipo"
											headerClass="tableCellHeader" style="width: 350px;" />
										<display:column property="provincia" title="Provincia"
											headerClass="tableCellHeader" style="width: 350px;" />
										<display:column property="comboDetalleEsTitularCfm"
											title="Rol" headerClass="tableCellHeader"
											style="width: 100px;" media="html" />
										<display:column property="titularidadDetalle"
											title="%Titularidad" headerClass="tableCellHeader"
											style="text-align:right;width:100px;" />
										<display:column property="comboEsScpDetalle" title="SCP"
											headerClass="tableCellHeader" style="width: 20px;"
											media="html" />
									</display:table></td>
								</tr>
							</table>
							<table>
								<tr class="tableRowFooter">
									<td align="left" width="400">%Total dentro del SCP:&nbsp;</td>
									<td class="CformNombre" width="150"><html:text
										style="text-align:right" readonly="true" maxlength="12"
										property="totalScp" name="cPreOfertaTecnologicaDetalleActionForm"
										size="16" /></td>
								</tr>
							</table>
							<logic:equal value="true" property="mostrarUVT"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>UVT:&nbsp;</strong></td>
									</tr>
								</table>
								<logic:notEmpty property="colGestor"
									name="cPreOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td colspan="10"><display:table
												name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.colGestor"
												decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
												<display:column property="indiceGestor" title="#"
													style="width:10px" headerClass="tableCellHeader" />
												<display:column property="descripcionSeleccion"
													title="Descripción" headerClass="tableCellHeader"
													style="width: 350px;" />
												<display:column property="siglaSeleccion" title="Sigla"
													headerClass="tableCellHeader" style="width: 350px;" />
												<display:column property="tipoGestor" title="Tipo"
													headerClass="tableCellHeader" style="width: 150px;" />
											</display:table></td>
										</tr>
									</table>
								</logic:notEmpty>
								<logic:empty property="colGestor"
									name="cPreOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td>No se seleccionó UVT.&nbsp;</td>
										</tr>
									</table>
								</logic:empty>
							</logic:equal>

							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Información Tecnológica&nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Disciplina Primaria&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalDPDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDP"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteDP" multiple="true" size="3">
											<html:options collection="comboOtDP" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Disciplina Desagregada&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalDDDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDD"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteDD" multiple="true" size="3">
											<html:options collection="comboOtDD" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Campo de Aplicación&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalCADescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteCA"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteCA" multiple="true" size="3">
											<html:options collection="comboOtCA" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Actividades Industriales&nbsp;</td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Principal:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="principalCODescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otros:&nbsp;</td>
									<logic:notEmpty property="loteCO"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select disabled="false"
											property="loteCO" multiple="true" size="3">
											<html:options collection="comboOtCO" property="value"
												labelProperty="label" />
										</html:select></td>
									</logic:notEmpty>
								</tr>
							</table>

							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td>Clasificación Internacional Alfanumérica OMPI&nbsp;</td>
								</tr>
							</table>

							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Código CIP:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm" property="cip" />
									</td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Palabras Claves&nbsp;</strong></td>
								</tr>
							</table>

							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">1ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave1" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">2ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave2" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">3ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave3" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">4ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave4" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">5ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="palabraClave5" /></td>
								</tr>
							</table>

							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Inventores&nbsp;</strong></td>
								</tr>
							</table>
							<logic:notEmpty property="inventores"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.inventores"
											decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDisplayWrapper">
											<display:column property="tipo" title="Tipo"
												headerClass="tableCellHeader" style="width: 120px;" />
											<display:column property="descripcion" title="Descripción"
												headerClass="tableCellHeader" style="width: 350px;" />
											<display:column property="comboEsScpInventorDetalle"
												title="SCP" headerClass="tableCellHeader"
												style="width: 20px;" media="html" />
											<display:column property="autoria" title="% de Autoría"
												headerClass="tableCellHeader"
												style="text-align:right;width:100px;" />
											<display:column property="participacionPorcentajeDetalle"
												title="%Participación" headerClass="tableCellHeader"
												style="text-align:right;width:100px;" />
											<display:column property="distribucionPorcentajeDetalle"
												title="%Total Distribución" headerClass="tableCellHeader"
												style="text-align:right;width:100px;" />
										</display:table></td>
									</tr>
								</table>
							</logic:notEmpty>
							<logic:empty property="inventores"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td>No se seleccionaron inventores&nbsp;</td>
									</tr>
								</table>
							</logic:empty>

							<!-- Historial distribucion de beneficios por inventor -->

							<table align="center">
								<tr>
									<td>
									<div id="auto_retract_normal_accordion" class="accContainer">
									<logic:iterate id="distribucion"
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="colDistribucionHistorial">
										<div id="overviewPane2" class="accordion-pane">
										<div id="overviewHeader" class="menuTitle">Desde: <bean:write
											name="distribucion" property="fechaDesde" format="dd/MM/yyyy" />
										- Hasta: <bean:write name="distribucion" property="fechaHasta"
											format="dd/MM/yyyy" /></div>
										<bean:define id="distribucionId" name="distribucion"
											property="id" />
										<div id="panel1Content" class="accordion-cont">
										<div class="content">
										<table align="center" class="CformTable">
											<tr>
												<td>
												<table width="100%">
													<tr>
														<td colspan="10"><display:table
															name='<%="sessionScope.cPreOfertaTecnologicaDetalleActionForm.armarDistribucionPorId("+ distribucionId + ")"%>'
															id="distribucionDetalleEnOferta"
															decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
															<display:column property="tipoEgresoDescripcion"
																title="Tipo Imputación" headerClass="tableCellHeader"
																style="width: 300px;" />
															<display:column property="importePorcentual"
																title="% Asignado" headerClass="tableCellHeader"
																style="text-align:right;width: 100px;" />
															<display:column property="sugerido" title="% Sugerido"
																headerClass="tableCellHeader" style="width: 200px;" />
														</display:table></td>
													</tr>
												</table>
												</td>
											</tr>
										</table>
										</div>
										</div>
										</div>
									</logic:iterate></div>
									</td>
								</tr>
							</table>

							<logic:empty property="colDistribucionHistorial"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td>El Historial de la Distribución de Beneficios está
										vacio.&nbsp;</td>
									</tr>
								</table>
							</logic:empty>

							<!-- distribucion de beneficios por inventor -->
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Distribución de Beneficios&nbsp;</strong></td>
								</tr>
							</table>
							<logic:notEmpty property="distribucionLote"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.distribucionLote"
											id="distribucionDetalleEnOferta"
											decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
											<display:column property="tipoEgresoDescripcion"
												title="Tipo Imputación" headerClass="tableCellHeader"
												style="width: 300px;" />
											<display:column property="importePorcentual"
												title="% Asignado" headerClass="tableCellHeader"
												style="text-align:right;width: 100px;" />
											<display:column property="sugerido" title="% Sugerido"
												headerClass="tableCellHeader" style="width: 200px;" />
										</display:table></td>
									</tr>
								</table>
							</logic:notEmpty>

							<logic:empty property="distribucionLote"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td>No se seleccionó distribución&nbsp;</td>
									</tr>
								</table>
							</logic:empty>
							<table>
								<tr class="tableRowFooter">
									<td align="left" width="400">%Total fuera del SCP:&nbsp;</td>
									<td class="CformNombre" width="150"><html:text
										style="text-align:right" readonly="true" maxlength="12"
										property="totalNoScp"
										name="cPreOfertaTecnologicaDetalleActionForm" size="16" /></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Instancias&nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%" align="center">
								<tr>
									<td><display:table
										name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.instancias"
										decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
										<display:column property="descripcionCfm" title="Instancia"
											headerClass="tableCellHeader" style="width: 400px;" />
										<display:column property="fechaCfm" title="Fecha"
											headerClass="tableCellHeader" style="width: 200px;" />
									</display:table></td>
								</tr>
							</table>

							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Registro&nbsp;</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td class="CformNombre" width="100">Fecha:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="fechaRegistrada" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Denominación:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cPreOfertaTecnologicaDetalleActionForm"
										property="denominacion" /></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td>
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td>Organismo de Registro&nbsp;</td>
										</tr>
									</table>
									<logic:notEmpty property="organismoRegistroLote"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<table width="100%">
											<tr>
												<td colspan="10"><display:table
													name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.organismoRegistroLote"
													decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
													<display:column property="descripcion" title="Descripción"
														headerClass="tableCellHeader" style="width: 350px;" />
													<display:column property="sigla" title="Sigla"
														headerClass="tableCellHeader" style="width: 100px;" />
													<display:column property="pais" title="País"
														headerClass="tableCellHeader" style="width:350px;" />
												</display:table></td>
											</tr>
										</table>
									</logic:notEmpty> <logic:empty property="organismoRegistroLote"
										name="cPreOfertaTecnologicaDetalleActionForm">
										<table width="100%">
											<tr>
												<td>No se seleccionó organismo de Registro&nbsp;</td>
											</tr>
										</table>
									</logic:empty></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Equipamientos&nbsp;</strong></td>
								</tr>
							</table>
							<logic:notEmpty property="equiposLote"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cPreOfertaTecnologicaDetalleActionForm.equiposLote"
											decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
											<display:column property="descripcion" title="Descripción"
												headerClass="tableCellHeader" maxLength="22"
												style="width: 350px;" />
											<display:column property="anio" title="Año"
												headerClass="tableCellHeader" style="width: 50px;" />
											<display:column property="marca" title="Marca"
												headerClass="tableCellHeader" maxLength="15"
												style="width: 350px;" />
											<display:column property="modelo" title="Modelo"
												headerClass="tableCellHeader" maxLength="6"
												style="width: 80px;" />
											<display:column property="nroSerie" title="N°Serie"
												headerClass="tableCellHeader" style="width: 350px;" />
										</display:table></td>
									</tr>
								</table>
							</logic:notEmpty>
							<logic:empty property="equiposLote"
								name="cPreOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td>No se seleccionaron equipamientos&nbsp;</td>
									</tr>
								</table>
							</logic:empty>
							<!-- tr No borrar>
              <td class="CformNombre" colspan="2">
                <html:submit property="btnSubidaArchivo" styleClass="CformBotonTransp" value="Subir Archivo."/>
              </td>
            </tr-->
						</logic:equal></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td class="CformAreaBotones" height="35">
				<div align="right">
				  <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value="cPreOfertaTecnologicaDetalleActionForm" />
            <jsp:param name="entidad" value="pot" />
          </jsp:include>
				</div>
				</td>
			</tr>
		</table>
	</logic:equal>

	<logic:equal property="accion" value="stanDistribucion"
		name="cPreOfertaTecnologicaDetalleActionForm">
		<h1 align="center" class="titulo">Detalle de la Distribución del
		STAN</h1>
		<table class="CformTable" align="center" cellpadding="0"
			cellspacing="0" width="680">
			<tr>
				<td>
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Costos:&nbsp; <html:select disabled="false"
							property="costoSeleccionado" onchange="submitComboCostos()">
							<html:options collection="comboCostos" property="value"
								labelProperty="label" />
						</html:select></td>
					</tr>
				</table>
				<table width="100%" align="center">
					<tr>
						<td>
						<div class="content"
							style="margin-right: auto; margin-left: auto;">
						<div class="row"><span class="header" style="width: 30%;";>&nbsp;</span>
						<span class="header" style="width: 20%; text-align: center;">Categoría
						A</span> <span class="header" style="width: 20%; text-align: center;">Categoría
						B</span> <span class="header" style="width: 20%; text-align: center;">Categoría
						C</span></div>
						<div class="row"><span class="even"
							style="width: 30%; height: 28;">Costo</span> <span class="even"
							style="width: 20%; height: 28; font-weight: bold; text-align: right;">$&nbsp;<bean:write
							name="cPreOfertaTecnologicaDetalleActionForm" property="costoPesos" /></span>
						<span class="even"
							style="width: 20%; height: 28; font-weight: bold; text-align: right;">$&nbsp;<bean:write
							name="cPreOfertaTecnologicaDetalleActionForm" property="costoPesos" /></span>
						<span class="even"
							style="width: 20%; height: 28; font-weight: bold; text-align: right;">$&nbsp;<bean:write
							name="cPreOfertaTecnologicaDetalleActionForm" property="costoPesos" /></span>
						</div>
						<div class="row"><span class="odd"
							style="width: 30%; height: 28;">% Ganancia</span> <logic:iterate
							id="categ" indexId="indice" property="categorias"
							name="cPreOfertaTecnologicaDetalleActionForm">
							<span class="odd"
								style="width: 20%; height: 28; text-align: right;"><bean:write
								property='<%= "gananciaCategoria("+indice+")" %>'
								name="cPreOfertaTecnologicaDetalleActionForm" />&nbsp;%</span>
						</logic:iterate></div>
						<div class="row"><span class="even"
							style="width: 30%; height: 28;">Importe ganancia</span> <logic:iterate
							id="categ" indexId="indice" property="categorias"
							name="cPreOfertaTecnologicaDetalleActionForm">
							<span class="even"
								style="width: 20%; height: 28; text-align: right;">$&nbsp;<bean:write
								property='<%= "importeGanacia("+indice+")" %>'
								name="cPreOfertaTecnologicaDetalleActionForm" /></span>
						</logic:iterate></div>
						<div class="row"><span class="tableRowFooter"
							style="width: 30%;">Precio Parcial</span> <logic:iterate
							id="categ" indexId="indice" property="categorias"
							name="cPreOfertaTecnologicaDetalleActionForm">
							<span class="tableRowFooter"
								style="width: 20%; text-align: right;">$&nbsp;<bean:write
								property='<%= "precioParcial("+indice+")" %>'
								name="cPreOfertaTecnologicaDetalleActionForm" /></span>
						</logic:iterate></div>
						</div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Comisiones:&nbsp;</td>
					</tr>
				</table>
				<table width="70%" align="center">
					<tr>
						<td>
						<div class="content">
						<div class="row"><span class="header"
							style="width: 50%; text-align: center;">Comisiones</span> <span
							class="header" style="width: 40%; text-align: center;">%</span></div>
						<logic:iterate id="tipoEgreso" indexId="comisionId"
							property="comisiones" name="cPreOfertaTecnologicaDetalleActionForm">
							<bean:define id="grupoEgreso" name="tipoEgreso"
								property="grupoEgreso" />
							<logic:notEqual value="1" name="grupoEgreso" property="id">
								<div class="row"><span
									class='<%= comisionId.intValue()%2 == 0 ? "even" : "odd" %>'
									style="width: 50%; height: 28;">%&nbsp;<bean:write
									name="tipoEgreso" property="descripcionCorta" /></span> <span
									class='<%= comisionId.intValue()%2 == 0 ? "even" : "odd" %>'
									style="width: 40%; text-align: right; height: 28;"><bean:write
									property='<%= "porcentajeComision(" + comisionId + ")" %>'
									name="cPreOfertaTecnologicaDetalleActionForm" /></span></div>
							</logic:notEqual>
						</logic:iterate>
						<div class="row"><span class="tableRowFooter"
							style="width: 50%; text-align: left;">Total Comisiones</span> <span
							class="tableRowFooter" style="width: 40%; text-align: right;"><bean:write
							name="cPreOfertaTecnologicaDetalleActionForm"
							property="totalComisiones" /></span></div>
						</div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Distribución:&nbsp;</td>
					</tr>
				</table>
				<table width="100%" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td>
						<div class="content">
						<div class="row"><span class="header"
							style="width: 20%; height: 32; text-align: center;">Comisiones&nbsp;(%)</span>
						<span class="header" style="width: 12.4%; height: 32;">&nbsp;</span>
						<span class="header"
							style="width: 16%; height: 32; text-align: center;">Sugerido
						Conv. Marco</span> <span class="header"
							style="width: 14%; height: 32; text-align: center;">Categoría
						A&nbsp;($)</span> <span class="header"
							style="width: 14%; height: 32; text-align: center;">Categoría
						B&nbsp;($)</span> <span class="header"
							style="width: 14%; height: 32; text-align: center;">Categoría
						C&nbsp;($)</span></div>
						<logic:iterate id="tipoEgreso" indexId="index"
							property="comisiones" name="cPreOfertaTecnologicaDetalleActionForm">
							<bean:define id="tipoEgredoId" name="tipoEgreso" property="id" />
							<bean:define id="grupoEgreso" name="tipoEgreso"
								property="grupoEgreso" />
							<div class="row"><span
								class='<%= index.intValue()%2 == 0 ? "even" : "odd" %>'
								style="width: 20%; height: 28;">%&nbsp;<bean:write
								name="tipoEgreso" property="descripcionCorta" /></span> <span
								class='<%= index.intValue()%2 == 0 ? "even" : "odd" %>'
								style="width: 12.5%; height: 28; text-align: right;"><bean:write
								property='<%= "porcentajeComision("+index+")" %>'
								name="cPreOfertaTecnologicaDetalleActionForm" /></span> <span
								class='<%= index.intValue()%2 == 0 ? "even" : "odd" %>'
								style="width: 16%; height: 28; text-align: right;"><bean:write
								property='<%= "porcentajeComisionSugerido("+index+")" %>'
								name="cPreOfertaTecnologicaDetalleActionForm" /></span> <span
								class='<%= index.intValue()%2 == 0 ? "even" : "odd" %>'
								style="width: 14%; height: 28; text-align: right;"><bean:write
								property='<%= "importeCategoriaComision(0_"+index+")" %>'
								name="cPreOfertaTecnologicaDetalleActionForm" /></span> <span
								class='<%= index.intValue()%2 == 0 ? "even" : "odd" %>'
								style="width: 14%; height: 28; text-align: right;"><bean:write
								property='<%= "importeCategoriaComision(1_"+index+")" %>'
								name="cPreOfertaTecnologicaDetalleActionForm" /></span> <span
								class='<%= index.intValue()%2 == 0 ? "even" : "odd" %>'
								style="width: 14%; height: 28; text-align: right;"><bean:write
								property='<%= "importeCategoriaComision(2_"+index+")" %>'
								name="cPreOfertaTecnologicaDetalleActionForm" /></span></div>
						</logic:iterate>
						<div class="row">
						<span class="tableRowFooter" style="width: 20%; text-align: left;">Total</span> 
						<span	class="tableRowFooter" style="width: 12.5%; text-align: right;">
						  <bean:write	name="cPreOfertaTecnologicaDetalleActionForm" property="totalPorcentajes" />
						</span> 
						<span class="tableRowFooter" style="width: 16%; text-align: left;">&nbsp;</span> 
						<span class="tableRowFooter" style="width: 14%; text-align: right;">
						  <bean:write	name="cPreOfertaTecnologicaDetalleActionForm" property="precioFinal(0)" />
						</span> 
						<span class="tableRowFooter" style="width: 14%; text-align: right;">
						  <bean:write	name="cPreOfertaTecnologicaDetalleActionForm" property="precioFinal(1)" />
						</span> 
						<span class="tableRowFooter" style="width: 14%; text-align: right;">
						  <bean:write	name="cPreOfertaTecnologicaDetalleActionForm" property="precioFinal(2)" />
						</span>
						</div>
						</div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>
				<table>
					<tr>
						<td width="210" class="CformAreaBotones">
						<div align="left" class="dato_obligatorio">&nbsp;</div>
						</td>
						<td width="470" class="CformAreaBotones">
						<div align="right"><html:submit property="btnSubmit"
							styleClass="CformBoton" value="Volver" /></div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
	</logic:equal>

</html:form>
