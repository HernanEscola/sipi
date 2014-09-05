<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<%@ page import="conicet.apps.svt.object.asesoria.EEstadoTramite"%>
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<script type="text/javascript" src="./js/comboPaisAjax.js"></script>
<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />

<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<bean:define id="botones" name="formulario" property="botones" />
<bean:define id="asesoriaEntidadAnio" name="formulario" property="asesoriaEntidadAnio" />
<bean:define id="asesoriaEntidadItemDistribucion" name="formulario" property="asesoriaEntidadItemDistribucion" />
<bean:define id="itemDistribucion" name="formulario" property="itemDistribucion" />
<bean:define id="asesoriaEntidadCampoAplicacion" name="formulario" property="asesoriaEntidadCampoAplicacion" />
<bean:define id="asesoriaEntidadDisciplinaDesagregada" name="formulario" property="asesoriaEntidadDisciplinaDesagregada" />
<bean:define id="asesoriaEntidadDisciplinaPrimaria" name="formulario" property="asesoriaEntidadDisciplinaPrimaria" />

<script>

function btnDetallePersona(obj){
	
	  submitAction("?method=detalle Persona&idEntidad="+obj);
}


$(document).ready(function() {
	
   var input = new CInputNumero(true); // si false verifica que sea un nro. y NO lo trata como un importe
	   input.bind("input[id='monto']");//selector de jquery
	   input.bind("input[id='porcentajeItem']");//selector de jquery
	   input.bind("input[id='importeItem']");//selector de jquery

    var input = new CInputNumero(false); // si false verifica que sea un nro. y NO lo trata como un importe
	   input.bind("input[id='actuacionMesaEntradas']");//selector de jquery

	   generarCombos("",null,"<%=CConstantes.paisArgentina%>");
	   calcularDistribucion();
	   mostrarObligatorioByEstadoTramite();

});



function mostrarObligatorioByEstadoTramite(){
	  var estadoTramite = $("#estadoTramite").val();
	  if(estadoTramite != null  && estadoTramite == "<%=EEstadoTramite.TR%>"){
		  $("[id^=actuacionMesaEntradas_obl]").hide();
		  $("[id^=fechaIngreso_obl]").hide();
	  }else{
		  $("[id^=actuacionMesaEntradas_obl]").show();
		  $("[id^=fechaIngreso_obl]").show();
	  }
}



  function quitar(tipo ,index)
		{
		  submitAction("?method=remove "+tipo+"&removeIndex="+index);
		}

function redondear(number, digits)
{
	var x = 1;
	for(var i=0; i<digits;i++)
	{
		x*=10;
	}
	return Math.round(number*x)/x;
}

//saca la coma que separa los miles, para realizar calculos
function sinSeparadorMiles(obj){
  var str= obj.value;
  var outstr='';
  for( var i = 0; i < str.length; i++ )
	  {
	  if (str.charAt(i)!=','){
		  outstr= outstr+str.charAt(i);
	  }
  }
  obj.value = outstr;
  return obj;
}



//CALCULA LA DISTRIBUCION Y TOTALES EN PANTALLA. LO HACE AL INICIAR Y DESPUES DE MODIF.PORCENTAJES O IMPORTES DE LA DISTR.
function calcularDistribucion() {
	  var i = Number(0);
	  var importe=0;
	  var totalDistribucion=0;
	  var montoImporte=eval($('#monto').attr('value'));
	  
	  if (montoImporte>0){
		  var i = Number(0);
		  $("[id^='importeDistribucionComision_']").each(function() {
			  if ($(this).attr('value') != "" ) {
		          formatImporte(sinSeparadorMiles($(this)[0]));
			      importe=Number($(this).attr('value'));
    	  		  totalDistribucion=Number(totalDistribucion)+Number((importe).toFixed(2));
    	  		  $('#importeDistribucionComision_'+i).attr('value', Number(importe).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") );
			  }
	    	i= Number(i)+Number(1); 
		  });
	  }
	  $('#totalDistribucion').attr('value', totalDistribucion.toFixed(2));
	  $('#totalDistribucionFormateaMiles').attr('value', totalDistribucion.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") );
	  $('#montoFormateaMiles').attr('value', montoImporte.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") );
	  
}

function reCalcularDistribucion(obj) {
	  formatImporte(sinSeparadorMiles($(obj)[0]));
	  var importeNuevo=obj.value;
	  $('#monto').attr('value', importeNuevo);
	  var i = Number(0);
	  var importe=0;
	  var totalDistribucion=0;
	  var montoImporte=eval($('#monto').attr('value'));
	  if (montoImporte>0){
		  var i = Number(0);
		  $("[id^='porcentajeDistribucionComision_']").each(function() {
		       if ($(this).attr('value') != "" ) {
		    	   formatImporte(sinSeparadorMiles($(this)[0]));
				   if (Number($(this).attr('value'))>0){
				       importe=Number($(this).attr('value'))*Number(montoImporte)/Number(100);
				       $('#importeDistribucionComision_'+i).attr('value', Number(importe).toFixed(2) );
				       totalDistribucion=Number(totalDistribucion)+Number(importe);
				       $('#importeDistribucionComision_'+i).attr('value', Number(importe).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") );
				   }
			   }
		       i= Number(i)+Number(1); 
		  });
	  }
	  if (montoImporte>0){
		  i = Number(0);
		   var i = Number(0);
		  $("[id^='porcentajeDistribucionComision_']").each(function() {
		       i= Number(i)+Number(1); 
		  });
	  }
	  $('#totalDistribucion').attr('value', totalDistribucion.toFixed(2) );
	  $('#totalDistribucionFormateaMiles').attr('value', totalDistribucion.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") );
	  $('#montoFormateaMiles').attr('value', montoImporte.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") );
}




/**
 * MODIFICACIONES DE IMPORTES Y PORCENTAJES EN LA PANTALLA
 */

// recalculan PORCENTAJE cuando modifica el importe y recalcula toda la distr.
function calcularPorcentajeDesdeImporte(obj,pos){
	var importe=0;
	var montoImporte=eval($('#monto').attr('value'));
	if (montoImporte!=0){
		formatImporte(sinSeparadorMiles($(obj)[0]));
		importe =obj.value;
		importe=Number(importe)/Number(montoImporte)*Number(100);
	}
	
	$('#porcentajeDistribucionComision_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularDistribucion();
}
// calcula importe cuando modifica el porcentaje y recalcula toda la distr.
function calcularImporteDesdePorcentaje(obj,pos){
	var importe=0;
	var montoImporte=eval($('#monto').attr('value'));
	if (montoImporte!=0){
		formatImporte(sinSeparadorMiles($(obj)[0]));
		importe =obj.value;
		importe=Number(importe)*Number(montoImporte)/Number(100);
	}
	$('#importeDistribucionComision_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularDistribucion();
}



</script>
 
<logic:equal value="input" name="tipoPantalla">
<html:hidden property="monto" styleId="monto" />
<html:hidden property="totalDistribucion" styleId="totalDistribucion" />
<html:hidden property="estadoTramite" styleId="estadoTramite" />
<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fechaIngreso,id_fechaInicio,id_fechaFinalizacion" />
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	    <tr>
	      <td>
	        <table align="center" cellpadding="0" cellspacing="0" width="100%">
	        	<tr>
                 <td>
		        	 <table width="100%">
						<tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Nro.Orden: &nbsp;<bean:write property="nroOrden" name="formulario" /> </strong>
						        </td>
						      </tr>
						</table>
						
						
						<table width="100%">
							 <tr>					            
				             <td class="CformNombre" width="25%">
					            	Apellido y Nombre:
				            </td>
					            		                         	
	                     	 <td class="CformDato" width="75%">
	                     	  			<logic:notEmpty property="personaSvt" name="formulario">
														<logic:equal value="si" name="displayLinks">
																<input type="button" class=CformBotonTransp onclick="btnDetallePersona('<bean:write name="formulario" property="personaSvt.id" />')" 
						 										value="<bean:write  property="personaSvtDescripcion" name="formulario" />" />
														</logic:equal>
														<logic:notEqual value="si" name="displayLinks">
																<bean:write  property="personaSvtDescripcion" name="formulario" />
														</logic:notEqual>
										</logic:notEmpty>				
										<logic:empty property="personaSvt" name="formulario">
					                          <bean:write  property="personaSvtDescripcion" name="formulario" />
										</logic:empty>
	                     	 
	                     	 
		                      </td>
	                         </tr>
							
						</table>
						 <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Detalle del asesoramiento </strong>
						        </td>
						      </tr>
						</table>
						
						
						<table width="100%">
								
														
					       <tr>
		                      <td class="CformNombre">Descripción:  <span class="dato_obligatorio">*</span></td>
		                      <td class="CformDato" >
		                          <html:textarea property="descripcionAsesoria" rows="3"/>
		                      </td>
		                 	</tr>
		                 	<tr>
		                      <td class="CformNombre">Impacto:</td>
		                      <td class="CformDato" >
		                          <html:textarea property="impacto" rows="3"/>
		                      </td>
		                      </tr>


							<tr>	
  								 <td class="CformNombre" width="25%">Ingreso a Mesa de Entradas: <span id="fechaIngreso_obl" class="dato_obligatorio">*</span></td>
		                      <td class="CformDato"  width="75%"> 
		                          <html:text styleId="id_fechaIngreso" property="fechaIngreso" maxlength="10" size="10" onkeypress="validarNumero()"/>
		                      	&nbsp;&nbsp;Actuación N°:<span id="actuacionMesaEntradas_obl" class="dato_obligatorio">*</span> &nbsp;<html:text styleId="actuacionMesaEntradas"  property="actuacionMesaEntradas" maxlength="9" size="10" />     
			                    </td>
							</tr>
						
							
						     <tr>
		                      <td class="CformNombre">Observaciones:</td>
		                      <td class="CformDato" >
		                          <html:textarea property="observacionesAsesoria" rows="3" />
		                      </td>
		                      </tr>
		                  
		                  </table>
	                    <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Lugar donde se realiza la asesoría &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						
						
						<table width="100%">
							 <tr>					            
					            <td class="CformNombre" width="20%">
					            	Domicilio:
					            </td> 
					             <td class="CformDato" >
		                          <html:text property="lugarDomicilio" maxlength="100" size="80" />
		                    	 </td>
							</tr>
								<tr>
									<td class="CformNombre">Pa&iacute;s:</td>
									<td class="CformDato"><html:select styleId="cboPais" property="lugarPaisId">
											<html:options collection="comboPais" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>					            
					            <td class="CformNombre" width="20%">
					            	Provincia:
					            </td> 
					             <td class="CformDato" >
					                <html:select  property="lugarProvinciaId" styleId="cboProvincia" >
									       <html:options collection="comboProvincia" property="value" labelProperty="label"  />
									</html:select>
								</td>
								</tr>			
						<logic:notEmpty property="lugarProvinciaTexto" name="formulario">
								 <tr>					            
						            <td class="CformNombre" width="20%">
						            	Provincia Carga Inicial:
						            </td> 
						             <td class="CformDato" >
			                          <bean:write name="formulario" property="lugarProvinciaTexto"  />
			                    	 </td>
								</tr>
						</logic:notEmpty>				
							
							 <tr>					            
					            <td class="CformNombre" width="20%">
					            	Partido:
					            </td> 
					             <td class="CformDato" >

					                <html:select  property="lugarPartidoId" styleId="cboPartido" onchange="habilitarLocalidades(this)">
									       <html:options collection="comboPartido" property="value" labelProperty="label"  />
									</html:select>
								</td>
								</tr>

							 <tr>					            
					            <td class="CformNombre" width="20%">
					            	Localidad:
					            </td> 
					             <td class="CformDato" >

					                <html:select  property="lugarLocalidadId" styleId="cboLocalidad">
									       <html:options collection="comboLocalidad" property="value" labelProperty="label"  />
									</html:select>
								</td>
								</tr>
						<logic:notEmpty property="lugarLocalidadTexto" name="formulario">
								 <tr>					            
						            <td class="CformNombre" width="20%">
						            	Localidad Carga Inicial:
						            </td> 
						             <td class="CformDato" >
			                          <bean:write name="formulario" property="lugarLocalidadTexto"  />
			                    	 </td>
								</tr>
						</logic:notEmpty>
																											                    

							</table>


					


						

				       <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Duración de la Actividad &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
						  <tr>
		                      <td class="CformNombre" width="20%">Fecha Inicio:<span class="dato_obligatorio">*</span></td>
		                      <td class="CformDato" width="10%"> <html:text styleId="id_fechaInicio" property="fechaInicio" maxlength="10" size="10" onkeypress="validarNumero()"/>
		                      </td>
		                      <td class="CformNombre" width="10%"> Finalización:<span class="dato_obligatorio">*</span></td>
		                       <td class="CformDato"width="20%" >
		                          <html:text styleId="id_fechaFinalizacion" property="fechaFinalizacion" maxlength="10" size="10" onkeypress="validarNumero()"/>
			                    </td>
			                    <td class="CformDato"width="40%" > &nbsp;&nbsp;           </td>
			                    
		                 	</tr>
						</table>						
 						<table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Cantidad de horas &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
					      <tr>
					        <td>
					        <table id="asesoriaEntidad" style="width: 100%" class="displayTable">
									<thead>
										<tr>
										<th class="tableCellHeader">Año Inicio <span class="dato_obligatorio">*</span></th>
										<th class="tableCellHeader">Horas 1° Año</th>
										<th class="tableCellHeader">Horas 2° Año</th>
										<th class="tableCellHeader">Horas 3° Año</th>
										<th class="tableCellHeader">Horas 4° Año</th>
										</tr>
									</thead>
									
									<tfoot>
									<tr style="background-color: #FAFAFA;">
											<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;">
												<html:text name="formulario" styleId="anioInicio" property="anioInicio"   size="5" maxlength="4"/>
											</td>
											<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;">
 											 	<html:text name="formulario" styleId="horas1anio" property="horas1anio"   size="8" maxlength="8"/>
											</td>
											<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;">
 											 	<html:text name="formulario" styleId="horas2anio" property="horas2anio"   size="8" maxlength="8"/>
											</td>
											<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;">
 											 	<html:text name="formulario" styleId="horas3anio" property="horas3anio"   size="8" maxlength="8"/>
											</td>
											<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;">
 											 	<html:text name="formulario" styleId="horas4anio" property="horas4anio"   size="8" maxlength="8"/>
											</td>
									</tr>
									</tfoot>
							</table>
					        </td>
					      </tr>
						</table>
					   <table width="100%">
						      <tr bgcolor="#BFDFFF" >
						        <td>
						          <strong>Importe y Distribución de Fondos &nbsp;</strong>
						        </td>
						      </tr>
					      
						</table>
 						<table width="100%">
			                  <tr class="odd">
								<td class="CformDatoVerdana" width="25%">Importe a Distribuir:<span class="dato_obligatorio">*</span>
									<html:select  property="tipoMonedaId" styleId="tipoMonedaId"  >
									       <html:options filter="false" collection="comboTipoMoneda" property="value" labelProperty="label"  />
									</html:select>
								</td>
								<td style="width:25%;" >
									<html:text property="montoFormateaMiles" style="text-align:right" maxlength="12" size="12" styleId="montoFormateaMiles" onchange="reCalcularDistribucion(this)"/>
									&nbsp;&nbsp; Total Distribuído:
								</td>
								<td style="width:25%;">
	 								<html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalDistribucionFormateaMiles" size="12" maxlength="12" styleId="totalDistribucionFormateaMiles"/>						
								</td>	
								<td style="width:25%;">&nbsp;&nbsp;
								</td>
								</tr>
						  </table>


							<table align="center" width="100%">
								<tr>
									<td><display:table style="width: 100%" name='<%= itemDistribucion %>' id='<%= pageName %>'
											decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadItemDistribucionDisplayWrapper">
											<logic:notEqual name="formulario" property="modalidadFacturacion" value="S">
												<display:column property="descripcionComision" title="Comisiones&nbsp; <span class='dato_obligatorio'>*</span>" headerClass="tableCellHeader" style="width:25%;" />
											</logic:notEqual>
											<logic:equal name="formulario" property="modalidadFacturacion" value="S">
												<display:column property="descripcionComision" title="Comisiones&nbsp; " headerClass="tableCellHeader" style="width:25%;" />
											</logic:equal>
											<display:column property="porcentajeComision" title="%" headerClass="tableCellHeader" style="width:25%;" />
											<display:column property="importeComision" title="Importe ($)" headerClass="tableCellHeader" style="width:25%;" />
											<display:column property="botonAgregar" title="  Instituto " headerClass="tableCellHeader" style="width:25%;text-align:center;" />

										</display:table></td>
								</tr>
							</table>



							<table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Campos de Aplicación &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
					      <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidadCampoAplicacion %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="campoAplicacionId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
					            <display:column property="campoAplicacionDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />
					          	<display:column property="removeCA" title="  " headerClass="tableCellHeader" style="width: 10px;" />
					          <display:footer>
					          		<tr style="background-color: #FAFAFA;">
									<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 50%;">
										<html:select name="formulario" property="nuevoCampoAplicacionId">
										<html:options name="formulario" collection="comboCampoAplicacion" property="value" labelProperty="label" />
										</html:select>
									</td>
									<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 50%;">
										<html:submit style="width:200px;" property="btnSubmit" value="Agregar Campo Aplicacion" styleClass="CformBoton" />
									</td>
									</tr>
									</display:footer>
					          
					          
					          </display:table>
					        </td>
					      </tr>
						</table>

					   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Disciplinas Primarias &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
					      <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidadDisciplinaPrimaria %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="disciplinaPrimariaId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
					            <display:column property="disciplinaPrimariaDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />
								<display:column property="removeDP" title="  " headerClass="tableCellHeader" style="width: 10px;" />
					          <display:footer>
					          		<tr style="background-color: #FAFAFA;">
										<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 50%;">
											<html:select name="formulario" property="nuevoDisciplinaPrimariaId">
											<html:options name="formulario" collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
											</html:select>
										</td>
										<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 50%;">
											<html:submit style="width:200px;" property="btnSubmit" value="Agregar Disciplina Primaria" styleClass="CformBoton" />
										</td>
									</tr>
								</display:footer>

					          </display:table>
					        </td>
					      </tr>
						</table>


					   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Disciplinas Desagregadas &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
					      <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidadDisciplinaDesagregada %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="disciplinaDesagregadaId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
					            <display:column property="disciplinaDesagregadaDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />
								<display:column property="removeDD" title="  " headerClass="tableCellHeader" style="width: 10px;" />
					          <display:footer>
					          		<tr style="background-color: #FAFAFA;">
									<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 50%;">
										<html:select name="formulario" property="nuevoDisciplinaDesagregadaId">
										<html:options name="formulario" collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
										</html:select>
									</td>
									<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 50%;"><html:submit style="width:200px;" property="btnSubmit"
											value="Agregar Disciplina Desagregada" styleClass="CformBoton" />
									</td>
									</tr>
									</display:footer>

					          </display:table>
					        </td>
					      </tr>
						</table>
						


		                    
						
					</td>
				 </tr>	
    		</table>   
		  	</td>
		 </tr>	                    

<tr>
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
            <jsp:param name="entidad" value="asesoria" />
          </jsp:include>
        </div>
      </td>
</tr>
</table>

</logic:equal>
    
<logic:equal value="view" name="tipoPantalla"> 

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	<tr>
	 <td>
	 <table align="center" cellpadding="0" cellspacing="0" width="100%">

				<tr>
                   <td>
		        	   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Nro.Orden: &nbsp; <bean:write name="formulario" property="nroOrden"  /></strong>
						        </td>
						      </tr>
						</table>
						
						
						<table width="100%">
							 <tr>
					             <td class="CformNombre" width="25%">
					            	Apellido y Nombre:
					            </td>
					            		                         	
		                         <td class="CformDato" width="75%">
									 <bean:write name="formulario" property="personaSvtDescripcion"/>
							 	</td>
	                         </tr>
						
						</table>
						
						
						<table width="100%">
						
						   <tr>
		                      <td class="CformNombre" width="25%">Descrición:</td>
		                      <td class="CformDato" width="75%">
		                         <bean:write name="formulario" property="descripcionAsesoria" />
		                      </td>
		                 	</tr>
		                 	  <tr>
		                      <td class="CformNombre" width="25%">Impacto:</td>
		                      <td class="CformDato"  width="75%">
		                          <bean:write name="formulario" property="impacto" />
		                      </td>
		                      </tr>
   						
						   <tr>
		                      <td class="CformNombre" width="25%">Mesa de Entradas:</td>
		                      <td class="CformDato"  width="75%">Fecha: 
		                         <bean:write name="formulario" property="fechaIngreso" />
		                      	Actuación N°: <bean:write name="formulario"  property="actuacionMesaEntradas" />       
			                    </td>
		                 	</tr>
						</table>
						<table width="100%">
		                    
						     <tr>
		                      <td class="CformNombre" width="25%">Observaciones:</td>
		                      <td class="CformDato" width="75%">
		                         <bean:write name="formulario"  property="observacionesAsesoria" />
		                      </td>
		                      </tr>
		                      
		                  </table>
		                 
						<table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Lugar de Trabajo de la Asesoría &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						
						
						<table width="100%">
							 <tr>					            
					            <td class="CformNombre" width="25%">
					            	Domicilio:
					            </td> 
					             <td class="CformDato"  width="75%">
		                          <bean:write name="formulario" property="lugarDomicilio"/>
		                    	 </td>
							</tr>
							 <tr>					            
					            <td class="CformNombre" width="25%">
					            	Localidad:
					            </td> 
					             <td class="CformDato"  width="75%">

					                <html:select  property="lugarLocalidadId" styleId="lugarLocalidadId" disabled="true">
									       <html:options collection="comboLocalidades" property="value" labelProperty="label"  />
									</html:select>
								</td>
								</tr>
						
						<logic:notEmpty property="lugarLocalidadTexto" name="formulario">
								 <tr>					            
						            <td class="CformNombre" width="25%">
						            	Localidad Carga Inicial:
						            </td> 
						             <td class="CformDato"  width="75%">
			                          <bean:write name="formulario" property="lugarLocalidadTexto"  />
			                    	 </td>
								</tr>
						</logic:notEmpty>
							 <tr>					            
					            <td class="CformNombre" width="25%">
					            	Provincia:
					            </td> 
					             <td class="CformDato"  width="75%">

					                <html:select  property="lugarProvinciaId" styleId="lugarProvinciaId" disabled="true">
									       <html:options collection="comboProvincias" property="value" labelProperty="label"  />
									</html:select>
								</td>
								</tr>
						<logic:notEmpty property="lugarProvinciaTexto" name="formulario">
								 <tr>					            
						            <td class="CformNombre" width="25%">
						            	Provincia Carga Inicial:
						            </td> 
						             <td class="CformDato"  width="75%">
			                          <bean:write name="formulario" property="lugarProvinciaTexto"  />
			                    	 </td>
								</tr>
							
						</logic:notEmpty>																									                    
						</table>

						
					   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Duración de la Actividad &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						
						<table width="100%">
							<tr>
		                      <td class="CformNombre" width="25%">Fecha Inicio:</td>
		                      <td class="CformDato" width="25%">
		                         <bean:write name="formulario"  property="fechaInicio" />
		                      </td>
		                      <td class="CformNombre"  width="25%">Fe.Finalización: </td>
			                    <td class="CformDato"  width="25%">
		                          <bean:write name="formulario"  property="fechaFinalizacion" />
			                    </td>
		                 	</tr>
		               </table>
		                 <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Cantidad de Horas &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
					      <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidadAnio %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="nroAño" title="Año" headerClass="tableCellHeader" style="width: 20%;" />
					            <display:column property="cantidadHoras" title="Cantidad Horas" headerClass="tableCellHeader" style="width: 80%;" />
					          </display:table>
					        </td>
					      </tr>
						</table>
					   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Importe y Distribución de Fondos &nbsp;</strong>
						        </td>
						      </tr>
						  
						</table>
						<table width="100%">
			                  <tr class="odd">
								<td style="width:25%;">Total Importe :&nbsp;&nbsp;
									<html:select  property="tipoMonedaId" styleId="tipoMonedaId"  >
									       <html:options collection="comboTipoMoneda" filter="false" property="value" labelProperty="label"  />
									</html:select>
								</td>
								<td style="width:25%;" >
									<html:text property="montoFormateaMiles" style="text-align:right" maxlength="12" size="12" />
								</td>		
								<td style="width:25%;">&nbsp;&nbsp;
								</td>
								</tr>
						  </table>
			    	   
						<table width="100%">
					        
					      <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidadItemDistribucion %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="distribucionTipoItemDescrip" title="Comisiones" headerClass="tableCellHeader" style="width: 40%;" />
					            <display:column property="distribucionPorcentaje" title="Porcentaje" headerClass="tableCellHeader" style="width: 30%;" />
					            <display:column property="distribucionImporte" title="Importe($)" headerClass="tableCellHeader" style="width: 30%;" />
					          </display:table>
					        </td>
					      </tr>
						</table>
					   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Campos de Aplicación &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
					      <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidadCampoAplicacion %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="campoAplicacionId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
					            <display:column property="campoAplicacionDescripción" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />
					          </display:table>
					        </td>
					      </tr>
						</table>
						
						 <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Disciplinas Primarias &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
					      <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidadDisciplinaPrimaria %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="disciplinaPrimariaId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
					            <display:column property="disciplinaPrimariaDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />

					          </display:table>
					        </td>
					      </tr>
						</table>
						
					   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Disciplinas Desagregadas &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						<table width="100%">
					      <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidadDisciplinaDesagregada %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="disciplinaDesagregadaId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
					            <display:column property="disciplinaDesagregadaDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />

					          </display:table>
					        </td>
					      </tr>
						</table>
						
						
						
						
						
					</td>
				 </tr>	
		</table>
    </td>
  </tr>
	
	
    <tr>
    
    
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
            <jsp:param name="entidad" value="asesoriaEntidad" />
          </jsp:include>
        </div>
      </td>
    </tr>
      
</table> 


</logic:equal> 


