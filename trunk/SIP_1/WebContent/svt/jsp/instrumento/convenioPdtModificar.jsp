<%@include file="/jsp/layout/include.jsp"%>
<%@page import="conicet.apps.svt.object.instrumento.EEstadoInstrumento"%>
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script>


  $(document).ready(function() {
	
		
  });
  
</script>


<bean:define id="loteResoluciones" property="resoluciones" name="cConvenioPdtForm"/>


<br />
<logic:equal property="valueEAccion" value="modificar" name="cConvenioPdtForm">




	<h1 align="center" class="titulo">Modificación de Convenio-PDTS</h1>
	<html:form method="post"  styleId="instrumentoForm"  action="cPdtsModificarConvenioPdtAction.do" enctype="multipart/form-data">
		<html:hidden property="accion"/>
		<html:hidden property="tab" />
		
		<logic:equal property="accion" value="modificar" name="cConvenioPdtForm">
		
			<script>
  $(document).ready(function() {
	  
	  
		habilitarCamposPDT();
		//mostrarFechasEjecucionObligatorio();
		
		var input2 = new CInputNumero(false);
		input2.bind("#pctiNro_id");//selector de jquery	
		$("#id_es_pdt").change(function(e) {
				
				habilitarCamposPDT();
				//mostrarFechasEjecucionObligatorio();
			});
		
});

function quitar(tipo ,index)
	{
	 var esPdtChecked = $("#id_es_pdt").is(':checked') || $("#id_es_pdt").val() == "true" ;
	  
	  if(esPdtChecked) {
	  submitAction("?method=remove "+tipo+"&removeIndex="+index);
	  }
}
  
function mostrarFechasEjecucionObligatorio(){
  var esPdtChecked = $("#id_es_pdt").is(':checked')  || $("#id_es_pdt").val() == "true" ;
  var enEjecucion = $("#estado_id").val();
  if(esPdtChecked || (enEjecucion != null  && enEjecucion == "<%=EEstadoInstrumento.EJE%>")){
	  $("[id^=id_fecha_inicio_obl]").show();
	  $("[id^=id_fecha_fin_obl]").show();
  }else{
	  
	  $("[id^=id_fecha_inicio_obl]").hide();
	  $("[id^=id_fecha_fin_obl]").hide();
  }
}

function habilitarCamposPDT(){
  var esPdtChecked = $("#id_es_pdt").is(':checked') || $("#id_es_pdt").val() == "true" ;
  
  if(esPdtChecked) {
      $('#pctiNro_id').removeAttr('disabled');
      $('#tituloPdts').removeAttr('disabled');
      $('#clasificacionPDT').removeAttr('disabled');
      $('#categoriaPDT').removeAttr('disabled');
      $('#id_inicio_fecha').removeAttr('disabled');
      $('#id_fin_fecha').removeAttr('disabled');
      $('#id_tipoResolucion').removeAttr('disabled');
      $('#id_numeroResolucion').removeAttr('disabled');
      $('#id_anioResolucion').removeAttr('disabled');
      $('#id_pdtResolucion').removeAttr('disabled');
      $('#id_agregar').removeAttr('disabled');

  }
  else{
	  $("#pctiNro_id").attr('disabled', true);  
	  $("#tituloPdts").attr('disabled', true);  
	  $('#clasificacionPDT').attr('disabled', true);  
      $('#categoriaPDT').attr('disabled', true);
      $('#id_inicio_fecha').attr('disabled', true);
      $('#id_fin_fecha').attr('disabled', true);
      $('#id_tipoResolucion').attr('disabled', true);
      $('#id_numeroResolucion').attr('disabled', true);
      $('#id_anioResolucion').attr('disabled', true);
      $('#id_pdtResolucion').attr('disabled', true);
      $('#id_agregar').attr('disabled', true);

      
  } 
  
}  

</script>
		
	<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_inicio_fecha,id_fin_fecha" />	
				<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
					<tr>
					<td>
						<table align="center" cellpadding="0" cellspacing="0" width="100%">
							
									<tr bgcolor="#BFDFFF">
													<td colspan="10"><strong>PDT &nbsp;</strong></td>
									</tr>
									<tr>
										<td class="CformNombre">Nro. PCTI:</td>
										<td class="CformDato">
										<html:text styleId="pctiNro_id" name="cConvenioPdtForm" property="pctiNro"  size="6" maxlength="6" style="text-align:right;"/>
										</td>
									</tr>
								
									
									<tr>
									    <td class="CformNombre">Titulo: </td>
											<td class="CformDato" colspan="3"><html:textarea styleId="tituloPdts" name="cConvenioPdtForm" property="tituloPdts" />
										</td>
									</tr>	
									<tr>
									<td class="CformNombre" width="75">Es PDT:</td>
									<td class="CformDato"><html:checkbox styleId="id_es_pdt" name="cConvenioPdtForm" property="esPDT" />
									
									</td>
										<td class="CformNombre" width="100">Categoría PDT:</td>
										<td class="CformDato"><html:select styleId="categoriaPDT" property="categoriaPDT">
												<html:options name="cConvenioPdtForm" collection="comboCategoriaPDT" property="value" labelProperty="label" />
											</html:select>
										</td>
									
									</tr>
									<tr>
									<td class="CformNombre" width="100">Área de conocimiento:</td>
										<td class="CformDato" colspan="5">
											<html:select styleId="clasificacionPDT" property="clasificacionPDT" style=" width:800px">
												<html:options name="cConvenioPdtForm" collection="comboClasificacionPDT" property="value" labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr bgcolor="#BFDFFF">
										<td colspan="10"><strong>Datos Ejecución &nbsp;</strong></td>
									</tr>

									

									<tr>
										<td class="CformNombre">Fecha Inicio:
										</td>
										<td class="CformDato">
											<html:text name="cConvenioPdtForm" property="fechaInicio" styleId="id_inicio_fecha" maxlength="10" size="10" />
										</td>
										<td class="CformNombre">Fecha Fin: 
										</td>
										<td class="CformDato"><html:text name="cConvenioPdtForm" property="fechaFin" styleId="id_fin_fecha" maxlength="10" size="10" /></td>
										  
									<!-- <tr>
										<td class="CformNombre">Observaciones FIN:</td>
										<td class="CformDato" colspan="3"><html:textarea name="cConvenioPdtForm" property="observacionesFin" />
										</td>
									</tr>  -->
									<tr>
										<td colspan="10">
											<table width="100%">
												<tr bgcolor="#DDEEFF">
													<td><strong>Resoluciones/Disposición:</strong>
													</td>
												</tr>
												<tr>
													<td colspan="10">
														<display:table class="CFormDisplayTable" name='<%= loteResoluciones %>' 
															decorator="conicet.apps.svt.web.instrumento.decorator.CPDTConvenioResolucionDisplayWrapper">
															<display:column property="numeroConDisposicion" title="Numero" headerClass="tableCellHeader" style="width: 300px;" />
															<display:column property="año" title="Año" headerClass="tableCellHeader" style="width: 80px;" />
															<display:column property="pdt" title="Actividad/PDT" headerClass="tableCellHeader" style="width: 80px;" />
															
																<display:column  property="remove" title="  " headerClass="tableCellHeader" style="width: 10px;" />

															<display:footer>
																
																	<tr style="background-color: #FAFAFA;">
												
																		<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 400px;">
																			<html:select name="cConvenioPdtForm" styleId="id_tipoResolucion" property="tipoResolucion">Ingresar Nuevo: 
																				<html:options name="cConvenioPdtForm" collection="comboTiposResolucion" property="value" labelProperty="label" />
																			</html:select> 
																			<html:text name="cConvenioPdtForm" styleId="id_numeroResolucion" property="numeroResolucion"  style="text-align: right;" size="8" maxlength="8"/>
																		</td>
																		<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
																			<html:select name="cConvenioPdtForm" styleId="id_anioResolucion" property="añoResolucion">
																				<html:options name="cConvenioPdtForm" collection="comboAños" property="value" labelProperty="label" />
																			</html:select>
																		</td>
																		<td class="CformDato">
																			<html:select name="cConvenioPdtForm" styleId="id_pdtResolucion" property="pdtResolucion">
																				<html:options name="cConvenioPdtForm" collection="comboActividadPdt" property="value" labelProperty="label" />
																			</html:select> 
																		</td>
																		<td   style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;">
																			<html:submit styleId="id_agregar" style="width:100px;" property="btnSubmit" value="Agregar" styleClass="CformBoton" />
																		</td>
																	</tr>
																</div>	
															</display:footer>
														</display:table>
													</td>
												</tr>
											</table></td>
									</tr>
						</table>
						</td>
						</tr>
						<tr>
						<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cConvenioPdtForm" />
									<jsp:param name="entidad" value="instrumento" />
								</jsp:include>
							</div>
						</td>
						</tr>
				</table>						
		
		</logic:equal>

		<logic:equal property="accion" value="confirmar" name="cConvenioPdtForm">
		
		<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
			<td>
				<table width="100%" cellpadding="2" cellspacing="2">
					
							<tr bgcolor="#BFDFFF">
						<td colspan="10"><strong>PDT &nbsp;</strong></td>
					</tr>
					<tr>
						<td class="CformNombre">Nro. PCTI:</td>
						<td class="CformDato" width="100">
						<logic:equal value="true" name="cConvenioPdtForm" property="esPDT" >
						<bean:write name="cConvenioPdtForm" property="pctiNro" />
						</logic:equal>
						</td>
					</tr>
					<tr>
						<td class="CformNombre">Título:</td>
						<td class="CformDato" colspan="3"><logic:equal value="true" name="cConvenioPdtForm" property="esPDT" >
						<bean:write name="cConvenioPdtForm" property="tituloPdts" /></logic:equal>
						</td>
					</tr>
					<tr>
						
					<td class="CformNombre" width="100">Es PDT:</td>
					<td class="CformDato" width="100"><html:checkbox disabled="true" name="cConvenioPdtForm" property="esPDT" />
					<html:hidden name="cConvenioPdtForm" property="esPDT" />
					</td>
					<td class="CformNombre" width="100">Categoría PDT:</td>
					<td class="CformDato" width="250"><logic:equal value="true" name="cConvenioPdtForm" property="esPDT" >
					<bean:write name="cConvenioPdtForm" property="categoriaPDT" /></logic:equal>
					</td>
					</tr>

					<tr>
						<td class="CformNombre" width="100">Área de conocimiento:</td>
						<td class="CformDato" colspan="5"><logic:equal value="true" name="cConvenioPdtForm" property="esPDT" >
							<html:select styleId="clasificacionPDT" property="clasificacionPDT" disabled="true" style=" width:800px">
								<html:options name="cConvenioPdtForm" collection="comboClasificacionPDT" property="value" labelProperty="label" />
							</html:select>
							</logic:equal>
						</td> 
					</tr>
					
					<tr bgcolor="#BFDFFF">
						<td colspan="10"><strong>Datos Ejecución &nbsp;</strong></td>
					</tr>			

					<tr>
						<td class="CformNombre">Fecha Inicio:</td>
						<td class="CformDato"><bean:write name="cConvenioPdtForm" property="fechaInicio"/></td>
						<td class="CformNombre">Fecha Fin:</td>
						<td class="CformDato"><bean:write name="cConvenioPdtForm" property="fechaFin" /></td>
					</tr>
					<!-- <tr>
						<td class="CformNombre">Observaciones FIN:</td>
						<td class="CformDato" colspan="3"><bean:write name="cConvenioPdtForm" property="observacionesFin" /></td>
					</tr>  -->
					<tr>
						<td colspan="10">
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td><strong>Resoluciones/Disposición:</strong>
									</td>
								</tr>
								<tr>
									<td colspan="10">
										<display:table class="CFormDisplayTable" name='<%= loteResoluciones %>' 
											decorator="conicet.apps.svt.web.instrumento.decorator.CPDTConvenioResolucionDisplayWrapper">
											<display:column property="numeroConDisposicion" title="Numero" headerClass="tableCellHeader" style="width: 300px;" />
											<display:column property="año" title="Año" headerClass="tableCellHeader" style="width: 80px;" />
											<display:column property="pdt" title="Actividad/PDT" headerClass="tableCellHeader" style="width: 80px;" />
										</display:table>
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</td>
			</tr>
			<tr>
			
			<td class="CformAreaBotones" colspan="10">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cConvenioPdtForm" />
									<jsp:param name="entidad" value="instrumento" />
								</jsp:include>
							</div>
			</td>
			</tr>
				
		</table>
		
		
		
		
		
			
		</logic:equal>
	</html:form>
</logic:equal>
