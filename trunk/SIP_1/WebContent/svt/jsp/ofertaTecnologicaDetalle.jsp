<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="layout/include.jsp"%>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script>
	window.onload=function(){
		if (document.cOfertaTecnologicaDetalleActionForm.aplicacion="SVTP"){
				if(document.cOfertaTecnologicaDetalleActionForm.generarPDF.value=="S"){
					document.cOfertaTecnologicaDetalleActionForm.generarPDF.value="N";
					go();
				}
		}
	}
	
	function submitComboCostos(){
	  document.cOfertaTecnologicaDetalleActionForm.action = 'cOfertaTecnologicaDetalleAction.do?accion=populateCosto';
	  document.cOfertaTecnologicaDetalleActionForm.submit();
	}

	function go(){
		var id = <bean:write name="cOfertaTecnologicaDetalleActionForm" property="idSelected" />;
		var app = "<bean:write name="cOfertaTecnologicaDetalleActionForm" property="aplicacion"/>";
		var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
		window.open('/'+urlAppName+'/cOfertaTecnologicaPDFAction.do?id='+id+'&aplicacion='+app,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
	}

	
</script>

<bean:define id="responsablesTecnicos" name="cOfertaTecnologicaDetalleActionForm" property="responsablesTecnicos" />

<br>
<html:form action="cOfertaTecnologicaDetalleAction.do" method="POST">
	<capplication:isApplication application="SVTP">
	  <html:hidden property="generarPDF" />
	</capplication:isApplication> 

	<logic:equal property="accion" value="formulario"	name="cOfertaTecnologicaDetalleActionForm">
	  
		<h1 align="center" class="titulo">Detalle de la Oferta Tecnológica</h1>
		<capplication:isApplication application="SVT"> 
		    <logic:equal value="S" property="tienePreOTActiva" name="cOfertaTecnologicaDetalleActionForm">
		       <h2 class="mensajeSuperior">El Prestador o el Administrador esta realizando correcciones en esta Oferta Tecnológica.</h2>
		    </logic:equal> 
	    </capplication:isApplication>
		<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<table align="center" width="100%">
					<tr>
						<td>
						<table width="100%">
							<tr bgcolor="#BFDFFF">
								<td><strong><bean:write
									name="cOfertaTecnologicaDetalleActionForm"
									property="tipoOfertaDescripcion" />&nbsp;</strong></td>
							</tr>
						</table>

						<!-- CONOCIMIENTO--> <logic:equal property="tipoOferta" value="1" name="cOfertaTecnologicaDetalleActionForm">
							<table width="100%" cellpadding="0" cellspacing="0">
								<logic:notEmpty property="codigoId" name="cOfertaTecnologicaDetalleActionForm">
								  <tr>
									 <td class="CformNombre" width="114">Código:&nbsp;</td>
									 <td class="CformDato">
									   <bean:write name="cOfertaTecnologicaDetalleActionForm" property="codigoId" />
									 </td>
								  </tr>
								</logic:notEmpty>
								<tr>
									<td class="CformNombre" width="114">Título:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="descripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="114">Detalle:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm" property="detalle" />
									</td>
								</tr>
								<tr>
							        <td class="CformNombre" width="150">Responsable Técnico:&nbsp;</td>
							        <td class="CformDato">
							          <bean:write name="cOfertaTecnologicaDetalleActionForm" property="responsable" />
							        </td>
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
										name="sessionScope.cOfertaTecnologicaDetalleActionForm.titularLote"
										id="ofertaTecnologicaDetalle"
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
							<logic:equal value="true" property="mostrarUVT"	name="cOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>UVT:&nbsp;</strong></td>
									</tr>
								</table>
								<logic:notEmpty property="colGestor" name="cOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td colspan="10">
											  <display:table	name="sessionScope.cOfertaTecnologicaDetalleActionForm.colGestor"	decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
											    <display:column property="indiceGestor" title="#"	style="width:10px" headerClass="tableCellHeader" />
												  <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
												  <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
												  <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
											  </display:table>
											</td>
										</tr>
									</table>
								</logic:notEmpty>
								<logic:empty property="colGestor" name="cOfertaTecnologicaDetalleActionForm">
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
								name="cOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cOfertaTecnologicaDetalleActionForm.equiposLote" style="width:100%" 
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
                    						<display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
												
										</display:table></td>
									</tr>
								</table>
							</logic:notEmpty>
							<logic:empty property="equiposLote"
								name="cOfertaTecnologicaDetalleActionForm">
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="principalDPDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDP"
										name="cOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="principalDDDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDD"
										name="cOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="principalCADescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteCA"
										name="cOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="principalCODescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otros:&nbsp;</td>
									<logic:notEmpty property="loteCO"
										name="cOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave1" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="80">2ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave2" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="80">3ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave3" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="80">4ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave4" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="80">5ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
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
            

			</logic:equal> 
						
			<!-- STAN --> 
			<logic:equal property="tipoOferta" value="3"
							name="cOfertaTecnologicaDetalleActionForm">
							<table width="100%" cellpadding="0" cellspacing="0">
								<logic:notEmpty property="codigoId" name="cOfertaTecnologicaDetalleActionForm"> 
								<tr>
									<td class="CformNombre" width="130">Código:&nbsp;</td>
									<td class="CformDato" colspan="3"><bean:write
										name="cOfertaTecnologicaDetalleActionForm" property="codigoId" />
									</td>
								</tr>
								</logic:notEmpty>
               					
										   <tr>
										         <td class="CformNombre" width="130">
										           Es Servicio:&nbsp;
										         </td>
										         <td class="CformDato" width="50">
										           <html:radio property="tipoStan" value="ST" disabled="true" />
										         </td>
										         <td class="CformNombre" width="200">
										           Es Asesoramiento:&nbsp;
										         </td>
										         <td class="CformDato">
										           <html:radio property="tipoStan" value="AINS" disabled="true" />
										         </td>
									       </tr>
									     
								<tr>
									<td class="CformNombre" width="130">Título:&nbsp;</td>
									<td class="CformDato" colspan="3"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="descripcion" /></td>
								</tr>

								<tr>
									<td class="CformNombre">Prestación:&nbsp;</td>
									<td class="CformDato" colspan="3"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
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
										name="sessionScope.cOfertaTecnologicaDetalleActionForm.titularLote"
										id="ofertaTecnologicaDetalle"
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
										name="cOfertaTecnologicaDetalleActionForm" property="detalle" />
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Detalle Prestación:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm" property="prestacionDetalle" />
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Metodología:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="especificacionMetodologia" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Unidad de
									Prestación:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="unidadPrestacion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Capacidad
									Operativa:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="capacidadOperativa" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Cantidad Mínima:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="cantidadMinima" /></td>
								</tr>
								
								<logic:empty property="responsablesTecnicos" name="cOfertaTecnologicaDetalleActionForm">
									<logic:notEmpty property="responsable" name="cOfertaTecnologicaDetalleActionForm">
										<tr>
											<td class="CformNombre" width="150">Responsable Técnico:&nbsp;</td>
											<td class="CformDato"><bean:write
												name="cOfertaTecnologicaDetalleActionForm"
												property="responsable" /></td>
										</tr>
									</logic:notEmpty>
								</logic:empty>
							</table>
							
							<logic:notEmpty property="responsablesTecnicos" name="cOfertaTecnologicaDetalleActionForm">
						        <table width="100%">
							      <tr bgcolor="#BFDFFF">
							        <td><strong>Responsables Técnicos&nbsp;</strong></td>
							      </tr>
							    </table>
						      	<table width="100%">
							        <tr>
							          <td colspan="10">
							            <display:table name="sessionScope.cOfertaTecnologicaDetalleActionForm.responsablesTecnicos" style="width: 100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
							            
							              <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
							              <display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
										  <display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
										  <display:column property="documentacion" title="Documentación" headerClass="tableCellHeader" />	
							            </display:table>
							          </td>
							        </tr>
						        </table>
						    </logic:notEmpty>
							<logic:empty property="responsablesTecnicos" name="cOfertaTecnologicaDetalleActionForm">
								<logic:empty property="responsable" name="cOfertaTecnologicaDetalleActionForm">
							        <table width="100%">
									      <tr bgcolor="#BFDFFF">
									        <td><strong>Responsables Técnicos&nbsp;</strong></td>
									      </tr>
								    </table>
									<table width="100%">
											<tr>
												<td>No se seleccionaron responsables técnicos&nbsp;</td>
											</tr>
									</table>
								</logic:empty>
							</logic:empty>									
							
						    
						    

							<!-- <logic:equal value="true" property="mostrarUVT"
								name="cOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>UVT:&nbsp;</strong></td>
									</tr>
								</table>
								<logic:notEmpty property="colGestor"
									name="cOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td colspan="10"><display:table
												name="sessionScope.cOfertaTecnologicaDetalleActionForm.colGestor"
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
									name="cOfertaTecnologicaDetalleActionForm">
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
								name="cOfertaTecnologicaDetalleActionForm">
								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cOfertaTecnologicaDetalleActionForm.equiposLote" style="width:100%"
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
                    						<display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
												
										</display:table></td>
									</tr>
								</table>
							</logic:notEmpty>
							<logic:empty property="equiposLote"
								name="cOfertaTecnologicaDetalleActionForm">
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="principalDPDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDP"
										name="cOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="principalDDDescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteDD"
										name="cOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="principalCADescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otras:&nbsp;</td>
									<logic:notEmpty property="loteCA"
										name="cOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="principalCODescripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">Otros:&nbsp;</td>
									<logic:notEmpty property="loteCO"
										name="cOfertaTecnologicaDetalleActionForm">
										<td class="CformDato"><html:select
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
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave1" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">2ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave2" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">3ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave3" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">4ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave4" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="100">5ª:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaDetalleActionForm"
										property="palabraClave5" /></td>
								</tr>
							</table>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Costos&nbsp;</strong></td>
								</tr>
							</table>
							<logic:notEmpty property="stanCostos"
								name="cOfertaTecnologicaDetalleActionForm">

								<table width="100%">
									<tr>
										<td colspan="10"><display:table
											name="sessionScope.cOfertaTecnologicaDetalleActionForm.stanCostosCfm"
											id="detalleOferta" style="width:100%" 
											requestURI="cOfertaTecnologicaDetalleAction.do"
											
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
								name="cOfertaTecnologicaDetalleActionForm">
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
											name="cOfertaTecnologicaDetalleActionForm">
											<bean:write name="cOfertaTecnologicaDetalleActionForm"
												property="nroExpediente" /> /
                      						<bean:write
												name="cOfertaTecnologicaDetalleActionForm"
												property="anioExpediente" />
										</logic:notEmpty></td>
									</tr>
									<tr>
										<td class="CformNombre" width="130">Fecha
										Autorización:&nbsp;</td>
										<td class="CformDato"><bean:write
											name="cOfertaTecnologicaDetalleActionForm"
											property="fechaAutorizacion" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="130">Resolución:&nbsp;</td>
										<td class="CformDato"><logic:notEmpty
											property="nroResolucion"
											name="cOfertaTecnologicaDetalleActionForm">
												Tipo:&nbsp;
												<html:select disabled="true" property="tipoResolucion">
												<html:options collection="comboTipoResolucion"
													property="value" labelProperty="label" />
											</html:select>
				    					    	Nro: <bean:write
												name="cOfertaTecnologicaDetalleActionForm"
												property="nroResolucion" />
											
											&nbsp;&nbsp;Fecha:&nbsp;<bean:write
												name="cOfertaTecnologicaDetalleActionForm"
												property="fechaResolucion" />
										</logic:notEmpty> <logic:greaterThan value="-1" property="estadoResolucion"
											name="cOfertaTecnologicaDetalleActionForm">
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
            


		</logic:equal>
		
		<!-- PROP.INTELECTUAL--> 
		<logic:equal property="tipoOferta" value="2" name="cOfertaTecnologicaDetalleActionForm">
				<table width="100%" cellpadding="0" cellspacing="0">
					<logic:notEmpty property="codigoId" name="cOfertaTecnologicaDetalleActionForm">
	                  <tr>
	                   <td class="CformNombre" width="114">Código:&nbsp;</td>
	                   <td class="CformDato">
	                     <bean:write name="cOfertaTecnologicaDetalleActionForm" property="codigoId" />
	                   </td>
	                  </tr>
	                </logic:notEmpty>
	                
					<tr>
						<td class="CformNombre" width="114">Número:&nbsp;</td>
						<td class="CformDato">
						  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="numeroPropiedad" /></td>
					</tr>
					<tr>
	                  <td class="CformNombre" width="114">Título:&nbsp;</td>
	                  <td class="CformDato">
	                   <bean:write name="cOfertaTecnologicaDetalleActionForm" property="descripcion" /></td>
	                </tr>
	                <tr>
	                  <td class="CformNombre" width="114">Detalle:&nbsp;</td>
	                  <td class="CformDato">
	                    <bean:write name="cOfertaTecnologicaDetalleActionForm" property="detalle" />
	                  </td>
	                </tr>
				</table>
						<table width="100%" cellpadding="0" cellspacing="0">
									<!--Si es propiedad intelectual, mostrar tipo-->
									<tr>
										<td class="CformNombre" width="114">Tipo Propiedad:&nbsp;</td>
										<td class="CformDato">
										  <html:select disabled="true" property="tipoPropiedad">
											  <html:options collection="comboTipoPropiedad" property="value" labelProperty="label" />
										  </html:select>
										</td>
									</tr>
								</table>
	
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>Prestador / Titular &nbsp;</strong></td>
									</tr>
								</table>
	
								<table width="100%">
									<tr>
										<td colspan="10">
										  <display:table name="sessionScope.cOfertaTecnologicaDetalleActionForm.titularLote" style="width:100%"  id="ofertaTecnologicaDetalle" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
												<display:column property="indiceEntidadesEnDetalleOferta"	title="#" style="width:10px" headerClass="tableCellHeader" />
												<display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
												<display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
												<display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
												<display:column property="comboDetalleEsTitularCfm"	title="Rol" headerClass="tableCellHeader"	style="width: 100px;" media="html" />
												<display:column property="titularidadDetalle" title="%Titularidad" headerClass="tableCellHeader" style="text-align:right;width:100px;" />
												<display:column property="comboEsScpDetalle" title="SCP" headerClass="tableCellHeader" style="width: 20px;"	media="html" />
										  </display:table>
										</td>
									</tr>
								</table>
								<table width="100%">
									<tr class="tableRowFooter">
										<td align="left" width="40%">%Total dentro del SCP:&nbsp;</td>
										<td class="CformNombre" width="100%">
										  <html:text style="text-align:right" readonly="true" maxlength="12" property="totalScp" name="cOfertaTecnologicaDetalleActionForm"	size="16" />
										</td>
									</tr>
								</table>
				
	              <table width="100%">
	                <tr bgcolor="#BFDFFF">
	                  <td><strong>Equipamientos&nbsp;</strong></td>
	                </tr>
	              </table>
	              <logic:notEmpty property="equiposLote" name="cOfertaTecnologicaDetalleActionForm">
	                <table width="100%">
	                  <tr>
	                    <td colspan="10">
	                      <display:table  name="sessionScope.cOfertaTecnologicaDetalleActionForm.equiposLote" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
	                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
	                        <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
	                        <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
	                        <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
	                        <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
	                   
	                      </display:table>
	                    </td>
	                  </tr>
	                </table>
	              </logic:notEmpty>
	              <logic:empty property="equiposLote" name="cOfertaTecnologicaDetalleActionForm">
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
										<td class="CformDato">
										  <bean:write name="cOfertaTecnologicaDetalleActionForm" property="principalDPDescripcion" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">Otras:&nbsp;</td>
										<logic:notEmpty property="loteDP"	name="cOfertaTecnologicaDetalleActionForm">
											<td class="CformDato">
											  <html:select	property="loteDP" multiple="true" size="3">
												  <html:options collection="comboOtDP" property="value"	labelProperty="label" />
											  </html:select>
											</td>
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
										<td class="CformDato">
										  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="principalDDDescripcion" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">Otras:&nbsp;</td>
										<logic:notEmpty property="loteDD"	name="cOfertaTecnologicaDetalleActionForm">
											<td class="CformDato">
											<html:select	property="loteDD" multiple="true" size="3">
												<html:options collection="comboOtDD" property="value"	labelProperty="label" />
											</html:select>
										  </td>
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
										<td class="CformDato">
										  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="principalCADescripcion" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">Otras:&nbsp;</td>
										<logic:notEmpty property="loteCA" name="cOfertaTecnologicaDetalleActionForm">
											<td class="CformDato">
											  <html:select property="loteCA" multiple="true" size="3">
												  <html:options collection="comboOtCA" property="value"	labelProperty="label" />
											  </html:select>
											</td>
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
										<td class="CformDato">
										  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="principalCODescripcion" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">Otros:&nbsp;</td>
										<logic:notEmpty property="loteCO"	name="cOfertaTecnologicaDetalleActionForm">
											<td class="CformDato">
											  <html:select property="loteCO" multiple="true" size="3">
												  <html:options collection="comboOtCO" property="value"	labelProperty="label" />
											  </html:select>
											</td>
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
										<td class="CformDato">
										  <bean:write name="cOfertaTecnologicaDetalleActionForm" property="cip" />
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
										<td class="CformDato">
										  <bean:write name="cOfertaTecnologicaDetalleActionForm" property="palabraClave1" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">2ª:&nbsp;</td>
										<td class="CformDato">
										  <bean:write name="cOfertaTecnologicaDetalleActionForm" property="palabraClave2" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">3ª:&nbsp;</td>
										<td class="CformDato">
										  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="palabraClave3" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">4ª:&nbsp;</td>
										<td class="CformDato">
										  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="palabraClave4" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">5ª:&nbsp;</td>
										<td class="CformDato">
										  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="palabraClave5" /></td>
									</tr>
								</table>
	
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>Inventores&nbsp;</strong></td>
									</tr>
								</table>
								<logic:notEmpty property="inventores"	name="cOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td colspan="10">
											  <display:table name="sessionScope.cOfertaTecnologicaDetalleActionForm.inventores" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDisplayWrapper">
												  <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 120px;" />
												  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
												  <display:column property="comboEsScpInventorDetalle" title="SCP" headerClass="tableCellHeader" style="width: 20px;" media="html" />
												  <display:column property="autoria" title="%Autoría"	headerClass="tableCellHeader"	style="text-align:right;width:100px;" />
												  <display:column property="participacionPorcentajeDetalle"	title="%Participación" headerClass="tableCellHeader" style="text-align:right;width:100px;" />
											  	<display:column property="distribucionPorcentajeDetalle" title="Total % de Distribución" headerClass="tableCellHeader" style="text-align:right;width:100px;" />
										  	</display:table>
									  	</td>
								  	</tr>
							  	</table>
								</logic:notEmpty>
								<logic:empty property="inventores" name="cOfertaTecnologicaDetalleActionForm">
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
	                  <logic:iterate id="distribucion" name="cOfertaTecnologicaDetalleActionForm" property="colDistribucionHistorial">
	                    <div id="overviewPane2" class="accordion-pane">
	                    <div id="overviewHeader" class="menuTitle">Desde: 
	                    <bean:write name="distribucion" property="fechaDesde" format="dd/MM/yyyy" />
	                    - Hasta: <bean:write name="distribucion" property="fechaHasta" format="dd/MM/yyyy" /></div>
	                    <bean:define id="distribucionId" name="distribucion" property="id" />
	                    <div id="panel1Content" class="accordion-cont">
	                    <div class="content">
	                    <table align="center" class="CformTable">
	                      <tr>
	                        <td>
	                        <table width="100%">
	                          <tr>
	                            <td colspan="10">
	                              <display:table name='<%="sessionScope.cOfertaTecnologicaDetalleActionForm.armarDistribucionPorId("+ distribucionId + ")"%>' id="distribucionDetalleEnOferta" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
	                                <display:column property="tipoEgresoDescripcion" title="Tipo Imputación" headerClass="tableCellHeader" style="width: 400px;" />
	                                <display:column property="importePorcentual" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width: 300px;" />
	                                <display:column property="sugerido" title="% Sugerido" headerClass="tableCellHeader" style="width: 300px;" />
	                              </display:table>
	                            </td>
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
	
								<logic:empty property="colDistribucionHistorial" name="cOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td>El Historial de la Distribución de Beneficios está vacio.&nbsp;</td>
										</tr>
									</table>
								</logic:empty>
	
								<!-- distribucion de beneficios por inventor -->
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>Distribución de Beneficios&nbsp;</strong></td>
									</tr>
								</table>
								<logic:notEmpty property="distribucionLote"	name="cOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td colspan="10">
											  <display:table name="sessionScope.cOfertaTecnologicaDetalleActionForm.distribucionLote" id="distribucionDetalleEnOferta" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
												  <display:column property="tipoEgresoDescripcion" title="Tipo Imputación" headerClass="tableCellHeader" style="width: 40%" />
												  <display:column property="importePorcentual" title="% Asignado" headerClass="tableCellHeader"	style="text-align:right;width: 30%" />
												  <display:column property="sugerido" title="% Sugerido" headerClass="tableCellHeader" style="width: 30%" />
											  </display:table>
											</td>
										</tr>
									</table>
								</logic:notEmpty>
	
								<logic:empty property="distribucionLote" name="cOfertaTecnologicaDetalleActionForm">
									<table width="100%">
										<tr>
											<td>No se seleccionó distribución&nbsp;</td>
										</tr>
									</table>
								</logic:empty>
								<table width="100%">
									<tr class="tableRowFooter">
										<td align="left" width="40%">%Total fuera del SCP:&nbsp;</td>
										<td class="CformNombre" width="30%">
										  <html:text style="text-align:right" readonly="true" maxlength="12" property="totalNoScp" name="cOfertaTecnologicaDetalleActionForm" size="16" /></td>
										  <td class="CformNombre" width="30%"> </td>
									</tr>
								</table>
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>Instancias&nbsp;</strong></td>
									</tr>
								</table>
								<table width="100%" align="center">
									<tr>
										<td>
										  <display:table name="sessionScope.cOfertaTecnologicaDetalleActionForm.instancias" style="width:100%"	decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
										    <display:column property="descripcionCfm" title="Instancia" headerClass="tableCellHeader" style="width: 400px;" />
										    <display:column property="fechaCfm" title="Fecha" headerClass="tableCellHeader" style="width: 200px;" />
										  </display:table>
										</td>
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
										<td class="CformDato">
										  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="fechaRegistrada" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="100">Denominación:&nbsp;</td>
										<td class="CformDato">
										  <bean:write	name="cOfertaTecnologicaDetalleActionForm" property="denominacion" /></td>
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
										<logic:notEmpty property="organismoRegistroLote" name="cOfertaTecnologicaDetalleActionForm">
											<table width="100%">
												<tr>
													<td colspan="10">
													  <display:table	name="sessionScope.cOfertaTecnologicaDetalleActionForm.organismoRegistroLote" style="width:100%"	decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
														  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader"  />
														  <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 100px;" />
														  <display:column property="pais" title="País" headerClass="tableCellHeader" style="width:350px;" />
													  </display:table>
													</td>
												</tr>
											</table>
										</logic:notEmpty> <logic:empty property="organismoRegistroLote" name="cOfertaTecnologicaDetalleActionForm">
											<table width="100%">
												<tr>
													<td>No se seleccionó organismo de Registro&nbsp;</td>
												</tr>
											</table>
										</logic:empty>
									 </td>
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
					                    <td class="CformDato">
						                    Sí <html:radio property="publica" value="S" disabled="true" /> 
						                    No <html:radio property="publica" value="N" disabled="true" />
					                    </td>
					                  </tr>
					                </capplication:isApplication>
				                </table>
	              
								<!-- tr No borrar>
	              <td class="CformNombre" colspan="2">
	                <html:submit property="btnSubidaArchivo" styleClass="CformBotonTransp" value="Subir Archivo."/>
	              </td>
	            </tr-->
	            
	            <table width="100%" >
					   <tr>
					        <td class="CformNombre" colspan="2">
					          <html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Ver Presentaciones"/>
					           </td>
						   </tr>
	    		</table> 
	            		
			</logic:equal>
			</td>
			</tr>
			</table>
			<tr>
				<td class="CformAreaBotones" height="35">
				<div align="right">
			           <jsp:include page="/jsp/layout/botones.jsp">
			                <jsp:param name="formulario" value="cOfertaTecnologicaDetalleActionForm" />
			                <jsp:param name="entidad" value="ot" />
			           </jsp:include> 
				</div>
				</td>
			</tr>
		</table>
	</logic:equal>

	

</html:form>
