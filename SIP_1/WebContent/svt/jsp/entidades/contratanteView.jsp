<%@include file="/jsp/layout/include.jsp"%>

<script type="text/javascript">	

window.onload=function(){
    collapseOthers('none');
  }
  
function collapseOthers(ignore){
    var elementos = document.getElementsByTagName('div');
    var pattern = new RegExp("(^| )" + 'collapsable' + "( |$)");
    var listado = new Array();
    for(var i=0;i<elementos.length;i++){
      if (pattern.test(elementos[i].className)) {
        if (elementos[i].visible() && elementos[i].id != ignore){
          Effect.toggle(elementos[i], 'slide');
          if($(elementos[i]).visible()){
            data= elementos[i].id;
        	new Effect.Highlight($(elementos[i].id+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#E2EBF3' });
            $(elementos[i].id+'_label').update(data);
          } else {
        	  data= elementos[i].id;  
            new Effect.Highlight($(elementos[i].id+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#5998d9' });
            $(elementos[i].id+'_label').update(data);
          }
        } 
      }
    }
  }
  
  function toggleLayer(whichLayer){
	 	  
	  if(whichLayer == "Facturas" ){
		 cargarFacturas();
	  }else if (whichLayer == "Convenios"){
		  cargarConvenios();
	  }
    Effect.toggle(whichLayer, 'slide', { delay: 0.0 });
	    if($(whichLayer).visible()){
	  		data= whichLayer;
	    	new Effect.Highlight($(whichLayer+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#E2EBF3' });
	        $(whichLayer+'_label').update(data);
	    } else {
	    	data= whichLayer;
	        new Effect.Highlight($(whichLayer+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#5998d9' });
	        $(whichLayer+'_label').update(data);
	    }
	    collapseOthers(whichLayer);
	    return false;
	  }

</script>
<style>
.label {
	cursor: pointer;
	padding-left: 6px;
	font-weight: bold;
	font-size: 11px;
	margin-bottom: 1px;
	padding-bottom: 3px;
	color: #2f3d31;
	padding-top: 6px;
	border-bottom: #ddd 1px solid;
	height: 10px;
	background-color: #E2EBF3;
}
</style>

<bean:define id="contratanteForm" name='<%= request.getParameter("contratanteForm") %>' />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="loteDocumentos" name="contratanteForm" property="documentos(ContratanteDoc)" />
<html:hidden property="descargarArchivoMapped(ContratanteDoc)" styleId="descargarArchivoContratanteDoc" />

<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table align="center" cellpadding="0" cellspacing="5" width="100%">
				<tr>
					<td colspan="100%">
						<table width="100%" cellpadding="2" cellspacing="2">
							<logic:equal name="contratanteForm" property="esConsumidorFinal" value="false">
								<tr>
									<td class="CformNombre" width="25%">Sucursal:</td>
									<td class="CformDato" width="75%">
										No 
										<html:radio disabled="true" property="sucursal" value="N"/> 
										Sí 
										<html:radio disabled="true" property="sucursal"	value="S" /> 
										<html:hidden property="sucursal" />
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Central:</td>
									<td class="CformDato" width="75%"><html:select disabled="true" property="seleccionadoComboCentral">
											<html:options collection="comboCentral" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Razón Social:</td>
									<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="razonSocial" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Nombre Fantasía:</td>
									<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="nombreFantasia" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Nacionalidad:</td>
									<td class="CformDato">
										<html:select styleId="personaJuridicaNacionalidadCombo" property="nacionalidadPersonaJuridicaId" disabled="true">
											<html:options collection="comboNacionalidadPersonaJuridica" property="value" labelProperty="label" />
										</html:select> 
										<logic:equal name="contratanteForm" property="esPJNacional" value="true">
											<html:select styleId="personaJuridicaClasificacionCombo" property="clasificacionGeneralPersonaJuridicaId" disabled="true">
												<html:options collection="comboClasificacionPersonaJuridica" property="value" labelProperty="label" />
											</html:select>

											<logic:equal name="contratanteForm" property="esPJComitentesMultiples" value="false">
												<html:select styleId="personaJuridicaTipoCombo" property="tipoPersonaJuridicaId" disabled="true">
													<html:options collection="comboTipoPersonaJuridica" property="value" labelProperty="label" />
												</html:select>
											</logic:equal>
										</logic:equal>
									</td>
								</tr>
								<logic:equal name="contratanteForm" property="esPJEstatal" value="true">
									<tr id="autoCompleteOrganismoRow">
										<td class="CformNombre" width="25%">Denominación:</td>
										<td class="CformDato" width="75%"><capplication:autoCompleteView name="contratanteForm" tipoAutocomplete="Organismo"/></td>

									</tr>
								</logic:equal>

								<logic:equal name="contratanteForm" property="esPJComitentesMultiples" value="true">
									<bean:define id="comitentes" name="contratanteForm" property="comitentesMultiples" />
									<tr id="contratanteDetalleComitenteMultipleTableRow">
										<td class="CformNombre"></td>
										<td>
											<logic:notEqual name="pageName" value="contratanteAnalisis">
												<display:table class="CFormDisplayTable" name='<%= comitentes %>' decorator="conicet.apps.svt.web.contratante.decorator.CComitenteDisplayWrapper">
													<display:column property="tipo" title="Tipo de Comitente" headerClass="tableCellHeader" style="width: 200x;" />
													<display:column property="razonSocial" title="Razón Social" headerClass="tableCellHeader" style="width: 350px;" />
													<display:column property="porcentajeSoloLectura" title="%" headerClass="tableCellHeader" style="width: 50px;text-align: right;" />
												</display:table>
											</logic:notEqual> 
											<logic:equal name="pageName" value="contratanteAnalisis">
												<display:table class="CFormDisplayTable" name='<%= comitentes %>' decorator="conicet.apps.svt.web.contratante.decorator.CComitenteDisplayWrapper">
													<display:column property="tipo" title="Tipo de Comitente" headerClass="tableCellHeader" style="width: 200x;" />
													<display:column property="razonSocial" title="Razón Social" headerClass="tableCellHeader" style="width: 350px;" />
													<display:column property="porcentajeSoloLectura" title="%" headerClass="tableCellHeader" style="width: 50px;text-align: right;" />
												</display:table>
											</logic:equal>
										</td>
									</tr>
								</logic:equal>

								<tr>
									<td class="CformNombre" width="25%">CUIT:</td>
									<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="cuitPrefijo" /> - <bean:write name="contratanteForm" property="cuitNumero" /> - <bean:write
											name="contratanteForm" property="cuitSufijo" />
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Situaci&oacute;n IVA:</td>
									<td class="CformDato" width="75%"><html:select disabled="true" property="categoriaIva">
											<html:options collection="comboCategoriaIva" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Actividad Industrial:</td>
									<td class="CformDato" width="75%"><logic:notEmpty name="contratanteForm" property="actividadIndustrialDescripcion">
											<div id="autoCompleteActividadIndustrialDescripcion" style='display: inline-block;'>
												<div>
													<strong> Categoría: </strong>
													<bean:write name="contratanteForm" property="actividadIndustrialCategoria" />
												</div>
												<div>
													<strong> Subcategoría: </strong>
													<bean:write name="contratanteForm" property="actividadIndustrialSubcategoria" />
												</div>
												<div>
													<strong> Actividad: </strong>
													<bean:write name="contratanteForm" property="actividadIndustrialDescripcion" />
												</div>
											</div>
										</logic:notEmpty>
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Campo Aplicación:</td>
									<td class="CformDato" width="75%"><html:select disabled="true" property="campoAplicacion">
											<html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="CformNombre">WEB:&nbsp;</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="web"/></td>
								</tr>
								<tr>
									<td class="CformNombre">Origen del Contacto:&nbsp;</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="origenContacto"/></td>
								</tr>
								<tr>
									<td class="CformNombre">Mail General de la Empresa:&nbsp;</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="mailEmpresa" /></td>
								</tr>
								<tr>
									<td height="10" />
								</tr>
								<tr bgcolor="#DDEEFF">
									<td colspan="2" width="100%">Domicilio Legal</td>
								</tr>
								<tr>
									<td height="10" />
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Domicilio:</td>
									<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="domicilio" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Pa&iacute;s:</td>
									<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboPais" property="pais">
											<html:options collection="comboPais" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Provincia:</td>
									<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboProvincia" property="provincia">
											<html:options collection="comboProvincia" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Partido:</td>
									<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboPartido" property="partido">
											<html:options collection="comboPartido" property="value" labelProperty="label" />
										</html:select></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Localidad:</td>
									<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboLocalidad" property="localidad">
											<html:options collection="comboLocalidad" property="value" labelProperty="label" />
										</html:select></td>
								</tr>

								<tr>
									<td class="CformNombre" width="25%">C&oacute;digo Postal:</td>
									<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="codigoPostal" /></td>
								</tr>
								<logic:equal name="contratanteForm" property="tieneDomicilioAdministrativo" value="true">
									<tr bgcolor="#DDEEFF">
										<td colspan="2" width="100%">Domicilio Administrativo</td>
									</tr>
									<tr>
										<td height="10" />
									</tr>
									
									<tr>
										<td class="CformNombre" width="25%">Domicilio:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="domicilioAdm" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Pa&iacute;s:</td>
										<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboPaisAdm" property="paisAdm">
												<html:options collection="comboPais" property="value" labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Provincia:</td>
										<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboProvinciaAdm" property="provinciaAdm">
												<html:options collection="comboProvinciaAdm" property="value" labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Partido:</td>
										<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboPartidoAdm" property="partidoAdm">
												<html:options collection="comboPartidoAdm" property="value" labelProperty="label" />
											</html:select></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Localidad:</td>
										<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboLocalidadAdm" property="localidadAdm">
												<html:options collection="comboLocalidadAdm" property="value" labelProperty="label" />
											</html:select></td>
									</tr>
	
									<tr>
										<td class="CformNombre" width="25%">C&oacute;digo Postal:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="codigoPostalAdm" /></td>
									</tr>
								</logic:equal>
								<tr>
									<td height="10" />
								</tr>
								<logic:equal name="contratanteForm" property="contactoHabilitado" value="true">
									<tr bgcolor="#DDEEFF">
										<td colspan="2" width="100%">Contacto</td>
									</tr>
									<tr>
										<td height="10" />
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Nombre:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="nombre" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Apellido:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="apellido" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Cargo:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="cargo" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Tel&eacute;fono:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="telefono" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">E-mail:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="email" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Fax:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="fax" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Observaciones:</td>
										<td class="CformDato" width="75%"><bean:write property="observaciones" name="contratanteForm" /></td>
									</tr>
									<tr>
										<td height="10"></td>
									</tr>
									<tr bgcolor="#DDEEFF">
										<td colspan="2" width="100%">Domicilio Administrativo</td>
									</tr>
									<tr>
										<td height="10"></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Domicilio:</td>
										<td class="CformDato" width="75%"><bean:write name="contratanteForm" property="domicilioContacto" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Pa&iacute;s:</td>
										<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboPaisContacto" property="paisContacto">
												<html:options collection="comboPais" property="value" labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Provincia:</td>
										<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboProvinciaContacto" property="provinciaContacto">
												<html:options collection="comboProvinciaContacto" property="value" labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Partido:</td>
										<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboPartidoContacto" property="partidoContacto">
												<html:options collection="comboPartidoContacto" property="value" labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="25%">Localidad:</td>
										<td class="CformDato" width="75%"><html:select disabled="true" styleId="cboLocalidadContacto" property="localidadContacto">
												<html:options collection="comboLocalidadContacto" property="value" labelProperty="label" />
											</html:select>
										</td>
									</tr>

									<tr>
										<td class="CformNombre" width="25%">C&oacute;digo Postal:</td>
										<td class="CformDato" width="75%" colspan="3"><bean:write name="contratanteForm" property="codigoPostalContacto" /></td>
									</tr>
									<tr>
										<td height="10"></td>
									</tr>
								</logic:equal>

								<capplication:isApplication application="SVT">
									<tr bgcolor="#DDEEFF">
										<td colspan="2" width="100%">Documentaci&oacute;n</td>
									</tr>
									<tr>
										<td colspan="2"><display:table class="displayTable" style="width: 100%" name='<%= loteDocumentos %>' id="documentaciones"
												decorator="conicet.apps.svt.web.contratante.decorator.CContratanteDocumentacionDisplayWrapper">
												<display:column property="tipoDocumentacion" title="Tipo" headerClass="tableCellHeader" style="width: 50px;" />
												<display:column property="vigencia" title="Vigencia" headerClass="tableCellHeader" style="width: 100px;" />
												<display:column property="lugarFisico" title="Lugar Físico" headerClass="tableCellHeader" style="width: 50px;" />
												<display:column property="observacion" title="Observación" headerClass="tableCellHeader" style="width: 100px;" />
												<display:column property="archivoDescargar" title="Documento" headerClass="tableCellHeader" style="width: 150px;" />
											</display:table>
										</td>
									</tr>
								</capplication:isApplication>
							</logic:equal>

							<logic:equal name="contratanteForm" property="esConsumidorFinal" value="true">
								<tr bgcolor="#DDEEFF">
									<td colspan="2" width="100%">Persona Física sin CUIT</td>
								</tr>

								<tr>
									<td height="10"></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Nombre:</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="nombre" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Apellido:</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="apellido" /></td>
								</tr>
								<tr id="formConsumidorFinalDNi">
									<td class="CformNombre" width="25%">Documento:</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="documento" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Cargo:</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="cargo" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Tel&eacute;fono:</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="telefono" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">E-mail:</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="email" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Fax:</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="fax" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Observaciones:</td>
									<td class="CformDato"><bean:write property="observaciones" name="contratanteForm" /></td>
								</tr>
								<tr>
									<td height="10"></td>
								</tr>
								<tr bgcolor="#DDEEFF">
									<td colspan="2" width="100%">Domicilio</td>
								</tr>
								<tr>
									<td height="10"></td>
								</tr>


								<tr>
									<td class="CformNombre" width="25%">Domicilio:</td>
									<td class="CformDato"><bean:write name="contratanteForm" property="domicilio" /></td>
								</tr>



								<tr>
									<td class="CformNombre" width="25%">Pa&iacute;s:</td>
									<td class="CformDato"><html:select disabled="true" styleId="cboPais" property="pais">
											<html:options collection="comboPais" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>

								<tr>
									<td class="CformNombre" width="25%">Provincia:</td>
									<td class="CformDato"><html:select disabled="true" styleId="cboProvincia" property="provincia">
											<html:options collection="comboProvincia" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Partido:</td>
									<td class="CformDato"><html:select disabled="true" styleId="cboPartido" property="partido">
											<html:options collection="comboPartido" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="CformNombre" width="25%">Localidad:</td>
									<td class="CformDato"><html:select disabled="true" styleId="cboLocalidad" property="localidad">
											<html:options collection="comboLocalidad" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>

								<tr>
									<td class="CformNombre" width="25%">C&oacute;digo Postal:</td>
									<td class="CformDato" colspan="3"><bean:write name="contratanteForm" property="codigoPostal" /></td>
								</tr>

								<tr>
									<td height="10"></td>
								</tr>
							</logic:equal>
							<logic:equal value="contratanteAnalisis" name="pageName">
								<tr>
									<td colspan="2" width="100%">
										<div id="contratanteLazyContent">
											<h3>Facturas</h3>
											<div id="divFacturaContratante">Cargando...</div>
											<h3>Convenios</h3>
											<div id="divConvenioContratante">Cargando...</div>
											<h3>Presupuestos</h3>
											<div id="divPresupuestoContratante">Cargando...</div>
											<h3>Asesorías</h3>
											<div id="divAsesoriaContratante">Cargando...</div>
										</div>
									</td>
								</tr>
							</logic:equal>
						</table>
					</td>
				</tr>
				<tr>
					<td class="CformAreaBotones">
						<div align="right">
							<jsp:include page="/jsp/layout/botones.jsp">
								<jsp:param name="formulario" value='<%= request.getParameter("contratanteForm") %>' />
								<jsp:param name="entidad" value="contratante" />
							</jsp:include>

						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
