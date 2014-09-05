<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>


<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />

<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />


<bean:define id="distribucionFacturacion" name="formulario" property="distribucionFacturacion" />
<bean:define id="productividadEntidad" name="formulario" property="productividadEntidad" />
<bean:define id="comisionContraparte" name="formulario" property="comisionContraparte" />
<bean:define id="importe" name="formulario" property="importe" />
<bean:define id="facturaFecha" name="formulario" property="facturaFecha" />
<bean:define id="botones" name="formulario" property="botones" />
<bean:define id="cobrado" name="formulario" property="cobrado" />
<bean:define id="accion" name="formulario" property="accion" />

<script>

//autocomplete de prestador 

function prepararBusquedaPrestador(){
	var conicetGeneral = new ConicetGeneral();

	conicetGeneral.autocomplete({
		idInput : "autoCompletePrestador",
		url : "<%=actionName%>?method=auto Complete Prestador",
		onSelectFunction : function(item) {
			$("#prestadorSeleccionado").attr("value", item.data.id);
			$("#autoCompletePrestadorTexto").text(item.data.nombre);
			$("#prestadorDescripcion").attr("value", item.data.nombre);
			intercambiarPrestador();
		},
		valueDefault : ""
		,
		formatItem: function(data)
		{
					  			if(data.denominacion != null && data.denominacion.length > 1)
					  			{
					  				return data.nombre + " // " + data.denominacion;
					  			}
					  			else
					  			{
					  				return data.nombre;
					  			}
		}
		
	});
}

  function removePrestador(url)
  {  
	  $("#prestadorSeleccionado").attr("value","");
	  $("#autoCompletePrestador").attr("value","");
	  intercambiarPrestador();
  }
  
  function intercambiarPrestador()
  {
	  var select = $("#prestadorSeleccionado").val();	  
	  if(select != "" && select != null)
	  {
		  $('#autoCompletePrestador').hide();
		  $('#autoCompletePrestadorDescripcion').show();	
	  }
	  else{
		  $('#autoCompletePrestadorDescripcion').hide();
		  $('#autoCompletePrestador').show();
	  }
  }



  var importeTotal = Number(0), porcentajeTotal = Number(0);

  
  $(document).ready(function() {
	  	prepararBusquedaPrestador();
	  	
	  	var select = $("#prestadorSeleccionado").val();	
	  	
	  	if(select != "" && select != null)
	  	{
	  		$('#autoCompletePrestador').hide();
	  		$('#autoCompletePrestadorDescripcion').show();
	  		
	  	}
	  	else
	  	{
	  		$('#autoCompletePrestador').show();
  			$('#autoCompletePrestadorDescripcion').hide();
	  	}
		
	
	   var input = new CInputNumero(true);
	   //input.bind("input[id='importe']");//selector de jquery
	   input.bind("input[id^='porcentajeComision_']");
	 
	   input.bind("input[id^='importeDistribucion']");
	   
	   var saldoAD = Number($('#saldoADistribuir').val());
	// si tipo servicio es ases indiv. o iNV.en empr. debe estar bloqueado u.divisional, solo puede desbloquear productividad
		if ($('#tipoServicio').attr('value')=="4" || $('#tipoServicio').attr('value')=="6"){
			$('#porcentajeDistribucion_5').addClass('CformTextDisabled');
			$('#porcentajeDistribucion_5').attr('readonly', 'true');
			$('#porcentajeDistribucion_5').val("0.00");
			$('#importeDistribucion_5').addClass('CformTextDisabled');
			$('#importeDistribucion_5').attr('readonly', 'true');
			$('#importeDistribucion_5').val("0.00");
		}
	   
	   if(saldoAD == Number(0))
		{
		   deshabilitarDistribucion(saldoAD);
		}

});

function redondear(number, digits)
{
	var x = 1;
	for(var i=0; i<digits;i++)
	{
		x*=10;
	}
	return Math.round(number*x)/x;
}
/*
function calcularIvaYTotalImporte(obj) {
	  formatImporte($(obj)[0]);
	  var importeSinIva=obj.value;  
	  var importeConIva=0;
	  var importeIva=0;
	  var iva=eval($('#porcentajeIva').attr('value'));
	  if (importeSinIva>0){
		  
		  if (iva>0){
			  importeIva=Number(importeSinIva)/Number(100)*Number(iva);
		  }
		  importeConIva=Number(importeSinIva)+Number(importeIva);
		 
		  $('#importeIva').attr('value', Number(importeIva).toFixed(2));
		  $('#importe').attr('value', Number(importeConIva).toFixed(2));
		  reCalculoComisiones();
	  }else {
		  $('#importeIva').attr('value', Number(importeIva).toFixed(2));
		  $('#importe').attr('value', Number(importeConIva).toFixed(2));
		  reCalculoComisiones();
	  }
}

function removePrestador()
{
		$('#prestadorText').val("");
		document.forms[0].submit();
}

function calcularTotalImporte(obj) {
			var importe=0;	
			var importeIva=0;
			var importeSinIva=eval($('#importeSinIva').attr('value'));
			formatImporte($(obj)[0]);
			var iva=obj.value;
			importeIva =Number(importeSinIva)/100*Number(iva);
			
			importe =Number(importeIva)+importeSinIva;
			$('#importeIva').attr('value', Number(importeIva).toFixed(2));
		    $('#importe').attr('value', Number(importe).toFixed(2));
		    reCalculoComisiones();
}	  
*/	  



//TOTALES EN PANTALLA
function calcularComisiones() {
	  var i = Number(0);
	  var importe=0;
	  var importeComision=0;
	  var totalComisiones=0;
	  var totalParcial=0;
	  var saldoAD=0;
////	  var precioFinal=eval($('#importe').attr('value'));
	  
	//  if (precioFinal>0){
		  var i = Number(0);
		  $("[id^='importeDistribucionComision_']").each(function() {
			  
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
      	  		  totalComisiones=Number(totalComisiones)+Number((importe).toFixed(2));
	    		  totalParcial=Number(totalParcial)+Number(importe);
				  saldoAD= Number(saldoAD)+Number(importe);
			  }
	    	i= Number(i)+Number(1); 
		  });
		  
		  $("[id^='importeDistribucionRetencion_']").each(function() {
			  
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
      	  		  totalComisiones=Number(totalComisiones)+Number((importe).toFixed(2));
				  saldoAD= Number(saldoAD)+Number(importe);
			  }
	    	i= Number(i)+Number(1); 
		  });

		  $("[id^='importeDistribucionRecupero_']").each(function() {
			  
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
      	  		  totalComisiones=Number(totalComisiones)+Number((importe).toFixed(2));
				  saldoAD= Number(saldoAD)+Number(importe);
			  }
	    	i= Number(i)+Number(1); 
		  });

		  
		//  saldoAD=Number(precioFinal)-Number(saldoAD);

		  $("[id^='importeDistribucion_']").each(function() {
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
      	  		  totalComisiones=Number(totalComisiones)+Number((importe).toFixed(2));
			  }
	    	i= Number(i)+Number(1); 
		  });
	  
	//  }
	  
	  $('#totalParcialComisiones').attr('value', totalParcial.toFixed(2));
	  $('#totalComisiones').attr('value', totalComisiones.toFixed(2));
	  $('#importe').attr('value', totalComisiones.toFixed(2));
	 // saldoAD = deshabilitarDistribucion(saldoAD,totalComisiones);
	  
	  
	  
	 // $('#saldoADistribuir').attr('value', redondear(saldoAD,2).toFixed(2));
}
/*
function reCalculoComisiones() {
	  var i = Number(0);
	  var importe=0;
	  var totalParcial=0;
	  var totalComisiones=0;
	  var totalSaldoAD=0;
	  var precioFinal=eval($('#importe').attr('value'));
	  if (precioFinal>0){
		  var i = Number(0);
		  $("[id^='porcentajeDistribucionComision_']").each(function() {
		       if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
		      
				   if (Number($(this).attr('value'))>0){
				       importe=Number($(this).attr('value'))*Number(precioFinal)/Number(100);
				       $('#importeDistribucionComision_'+i).attr('value', Number(importe).toFixed(2));
		    	  	   totalComisiones=Number(totalComisiones)+Number(importe);
		      		   totalParcial=Number(totalParcial)+Number(importe);
		      	   	   totalSaldoAD=Number(totalSaldoAD)+Number(importe.toFixed(2));
				   }
			   }
		       i= Number(i)+Number(1); 
		  });
		  
		  $("[id^='porcentajeDistribucionRetencion_']").each(function() {
		       if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
		       	   
				   if (Number($(this).attr('value'))>0){
				       importe=Number($(this).attr('value'))*Number(precioFinal)/Number(100);
				       $('#importeDistribucionRetencion_'+i).attr('value', Number(importe).toFixed(2));
			      	   totalComisiones=Number(totalComisiones)+Number(importe);
			      	   totalSaldoAD=Number(totalSaldoAD)+Number(importe.toFixed(2));
				   }
			   }
		       i= Number(i)+Number(1); 
		  });
		  $("[id^='porcentajeDistribucionRecupero_']").each(function() {
		       if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
		       
				   if (Number($(this).attr('value'))>0){
				       importe=Number($(this).attr('value'))*Number(precioFinal)/Number(100);
				       $('#importeDistribucionRecupero_'+i).attr('value', Number(importe).toFixed(2));
			      	   totalComisiones=Number(totalComisiones)+Number(importe);
			      	   totalSaldoAD=Number(totalSaldoAD)+Number(importe.toFixed(2));
				   }
			   }
		       i= Number(i)+Number(1); 
		  });
		  
		  $("[id^='porcentajeDistribucion_']").each(function() {
		    	      	  
		       i= Number(i)+Number(1); 
		  });

		  totalSaldoAD=Number(precioFinal)-Number(totalSaldoAD.toFixed(2));
	  }
	
	  var controlSaldoAD=0;
	  if (precioFinal>0){
		  i = Number(0);
		   var i = Number(0);
		  $("[id^='porcentajeDistribucionComision_']").each(function() {
		       i= Number(i)+Number(1); 
		  });
		  $("[id^='porcentajeDistribucionRecupero_']").each(function() {
		       i= Number(i)+Number(1); 
		  });
		  $("[id^='porcentajeDistribucionRetencion_']").each(function() {
		       i= Number(i)+Number(1); 
		  });
		  
		  totalSaldoAD = redondear(totalSaldoAD,2);
	
		  
		  $("[id^='porcentajeDistribucion_']").each(function() {
			      if ($(this).attr('value') != "" ) {
			          formatImporte($(this)[0]);
					  if (Number($(this).attr('value'))>0){
						   importe=Number($(this).attr('value'))*Number(totalSaldoAD)/Number(100);
					
						   controlSaldoAD=Number(controlSaldoAD.toFixed(2))+Number(importe.toFixed(2));
						   var diferencia =Number(totalSaldoAD.toFixed(2))-Number(controlSaldoAD);
						   if (diferencia<0.01 && diferencia >(-0.01) && diferencia !=0 ){
							   importe = Number(importe)+diferencia;
						   }
					       
						   $('#importeDistribucion_'+i).attr('value', Number(importe).toFixed(2));
				      	   totalComisiones=Number(totalComisiones)+Number(importe);
					  }
				   }	      	  
			       i= Number(i)+Number(1); 
		  });
	  }
	  
	  // calculo el saldo a distribuir y luego distribuyo segun los porcentajes en pantalla
	  $('#saldoADistribuir').attr('value', totalSaldoAD.toFixed(2));
	  $('#totalParcialComisiones').attr('value', totalParcial.toFixed(2));
	  $('#totalComisiones').attr('value', totalComisiones.toFixed(2));
	  
	  totalSaldoAD = deshabilitarDistribucion(totalSaldoAD, totalComisiones);

	  
	  

	  $('#importeId').attr('value', precioFinal.toFixed(2));

}
*/

function deshabilitarDistribucion(total, totalDistribuido)
{
	if(Number(total.toFixed(2)) <= 0)
	{
		var diferenciaTotalDistribuido = Number(0);
	  
	  $("[id^='porcentajeDistribucion_']").each(function() {
		  	$(this).attr('readonly', 'true');
		  	
			 $(this).val("0.00");
			 $(this).addClass('CformTextDisabled');
		 });
	
	  
	  $("[id^='importeDistribucion_']").each(function() {
		  $(this).attr('readonly', 'true');
		  diferenciaTotalDistribuido += Number($(this).val());
		  $(this).addClass('CformTextDisabled');
			$(this).val("0.00");
		 });
	  
	  if(diferenciaTotalDistribuido > 0)
		{
	 	 totalDistribuido-= diferenciaTotalDistribuido;
	 	$('#totalComisiones').attr('value', totalDistribuido.toFixed(2));
		}
	  
	  return Number (0);
	}else{
		// si tipo servicio es ases indiv. o iNV.en empr. debe estar bloqueado u.divisional, solo puede desbloquear productividad
		if ($('#tipoServicio').attr('value')=="4" || $('#tipoServicio').attr('value')=="6"){
			
			
		//	$('#porcentajeDistribucion_6').removeClass('CformTextDisabled');
		//	$('#porcentajeDistribucion_6').removeClass('readonly');
			$('#importeDistribucion_6').removeClass('CformTextDisabled');
			$('#importeDistribucion_6').removeAttr('readonly');
		}else{
				$("[id^='porcentajeDistribucion_']").each(function() {
					$(this).removeClass('CformTextDisabled');
					$(this).removeAttr('readonly');
					
				 });
				
				$("[id^='importeDistribucion_']").each(function() {
					
						$(this).removeClass('CformTextDisabled');
						$(this).removeAttr('readonly');
					
				 }) ;

		}
		return total;
	}
	  
}

/**
 * MODIFICACIONES DE IMPORTES Y PORCENTAJES EN LA PANTALLA
 */
//recalculan importe o porcentaje desde la distribucion 


function calcularPorcentajeDesdeImporte(obj,pos){
/*
	var importe=0;
	var saldoADistribuir=eval($('#saldoADistribuir').attr('value'));
	if (saldoADistribuir!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)/Number(saldoADistribuir)*Number(100);
	}

	$('#porcentajeDistribucion_'+pos).attr('value', redondear(importe,2).toFixed(2));
	*/
	calcularComisiones();
	
	//corregirPorcentaje($('#porcentajeDistribucion_'+pos));
}


function calcularImporteDesdePorcentaje(obj,pos){
/*
	var importe=0;
	
	var saldoADistribuir=eval($('#saldoADistribuir').attr('value'));
	if (saldoADistribuir!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)*Number(saldoADistribuir)/Number(100);
	}
	$('#importeDistribucion_'+pos).attr('value', Number(importe).toFixed(2));
	calcularComisiones();
	*/
	//corregirImporte($('#importeDistribucion_'+pos));
}

// recalculan importe o porcentaje de comision de la distribucion
function calcularPorcentajeComisionDesdeImporte(obj,pos){
/*	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)/Number(precioFinal)*Number(100);
	}
	$('#porcentajeDistribucionComision_'+pos).attr('value', redondear(importe,2).toFixed(2));
*/	
	calcularComisiones();
	//corregirPorcentaje($('#porcentajeDistribucionComision_'+pos));
	
}

function calcularImporteComisionDesdePorcentaje(obj,pos){
/*	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)*Number(precioFinal)/Number(100);
	}
	$('#importeDistribucionComision_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularComisiones();
	*/
	//corregirImporte($('#importeDistribucionComision_'+pos));
}
// recalculan imoprte o porcentaje recupero de la distribucion
function calcularPorcentajeRecuperoDesdeImporte(obj,pos){
/*	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)/Number(precioFinal)*Number(100);
	}
	$('#porcentajeDistribucionRecupero_'+pos).attr('value',redondear(importe,2).toFixed(2));
*/	
	calcularComisiones();
	
}

function calcularImporteRecuperoDesdePorcentaje(obj,pos){
/*	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)*Number(precioFinal)/Number(100);
	}
	$('#importeDistribucionRecupero_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularComisiones();
*/	
}

//recalculan imoprte o porcentaje retencion de la distribucion
function calcularPorcentajeRetencionDesdeImporte(obj,pos){
/*	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)/Number(precioFinal)*Number(100);
	}
	$('#porcentajeDistribucionRetencion_'+pos).attr('value',redondear(importe,2).toFixed(2));
*/	
	calcularComisiones();
	
}

function calcularImporteRetencionDesdePorcentaje(obj,pos){
/*	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)*Number(precioFinal)/Number(100);
	}
	$('#importeDistribucionRetencion_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularComisiones();
*/	
	
}



</script>
    
<logic:equal value="input" name="tipoPantalla">


<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_factura_fecha"/>
<html:hidden property="importe" styleId="importe" />
 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
  <tr >
    <td class="CformRowHeader" colspan="10">&nbsp;  Saldo Inicial </td>
  </tr>
	    
   <tr>
     <td>
	        <table align="center" cellpadding="0" cellspacing="0" width="100%">
	        	<tr>
                 <td>
		        	 <table width="100%">
		        	 		<tr>
				                        <td class="CformNombre" width="10%" >Uvt: <span class="dato_obligatorio">*</span> </td>
					                    <td class="CformDato" width="35%">
											 <logic:equal property="accion" value="alta" name="formulario">
							                 <html:select  property="uvtId" styleId="uvtId" onchange="recargaUvt()" >
							                 <html:options collection="comboUvts" property="value" labelProperty="label"  />
							                 </html:select>
							                 </logic:equal>
											 <logic:equal property="accion" value="modificar" name="formulario">
											 <bean:write name="formulario" property="uvtFacturaDescripcion"/>
											 </logic:equal>
							                 
							            </td>
							 </tr> 
		        	 
		        	 		 <tr>
		        	 		 	<td class="CformNombre" width="22%">Fecha:&nbsp;</td>
		                       	<td class="CformDato" ><bean:write name="formulario" property="facturaFecha"/></td>
				             </tr>        
		                 	
			                 <tr>
			                    <td class="CformNombre" width="22%" >Tipo Servicio:<span class="dato_obligatorio">*</span> </td>
			                    <td class="CformDato">
					                 <html:select  property="tipoServicio" styleId="tipoServicio">
					                 	<html:options collection="comboTipoServicio" property="value" labelProperty="label"  />
					                 </html:select>
					            </td>
					          </tr>  
					          <tr>  
					            
					            <td class="CformNombre" width="22%">
					            	Prestador:<span class="dato_obligatorio">*</span>
					            </td> 
								
		                         <td class="CformDato">
									   <div id="autoCompletePrestadorDescripcion"> 
										   <label id="autoCompletePrestadorTexto"><bean:write name="formulario" property="prestadorDescripcion"/></label> 
											  <logic:notEqual value="T" name="cobrado">
											   <a href="#" onclick="removePrestador(this)"><img src="./imagenes/close.png" align="top"/></a>
											   </logic:notEqual>
									   </div>
										<input type="text" name="autoCompletePrestador" id="autoCompletePrestador" />
							 	</td>
					         </tr>
					   
					     <tr>
		                      <td class="CformNombre" width="22%">Descripción:&nbsp; </td>
		                      <td class="CformDato" ><html:textarea  property="detalle"  rows="3"  /></td>
		                </tr>
					   
					    </table>
					         
					         
					        
<!--  					         
					     <table width="100%">
					         
							<logic:notEqual value="T" name="cobrado">	
				 				 <tr>
				                      <td class="CformNombre" width="22%">Importe:<span class="dato_obligatorio">*</span></td>
				                      <td class="CformDato"   ><html:text styleId="importe" style="text-align:right;" maxlength="12" size="10"  property="importe" onblur="formatImporte(this)" onchange="reCalculoComisiones()" /></td>
				                      <td/>
				                      <td/>
				                 </tr>
	
				 				
							</logic:notEqual>
							<logic:equal value="T" name="cobrado">	
				 				
				 				 <tr>
				                      <td class="CformNombre" width="22%" >Importe :<span class="dato_obligatorio">*</span></td>
				                      <td class="CformDato" ><html:text styleClass="textDisabled" readonly="true" styleId="importe" style="text-align:right;" maxlength="12" size="10"  property="importe" onblur="formatImporte(this)" onchange="reCalculoComisiones()" /></td>
				                 </tr>
							</logic:equal>
							
			                
				    </table>
				    
-->				       
		    	</td>
			  </tr>	                    
             
	</table>
	</td>
</tr>

<tr>
	<td>
       <table class="tablaMin" align="center" width="100%">
			                   
			                    <tr>
			                      <td colspan="10">
			                        <display:table style="width: 100%" name='<%= distribucionFacturacion %>' id='<%= pageName %>'  decorator="conicet.apps.siuvt.web.ingreso.decorator.CSaldoInicialItemDistribucionDisplayWrapper">
									  
				                          <display:column property="descripcionComision" title="Comisiones"  headerClass="tableCellHeader" style="width:200px;" />
				                          <!-- display:column property="porcentajeComision" title="%" headerClass="tableCellHeader" style="width: 200px;" /-->
				                          <display:column property="importeComision" title="Importe ($)" headerClass="tableCellHeader" style="width:200px;" />
				                          <display:column property="botonAgregar" title="  Instituto/Personas " headerClass="tableCellHeader" style="width:400px;text-align:center;" />
			                          
			                        </display:table>
			                      </td>
			                    </tr>
   	   </table>
     </td>
 </tr>
 <tr>
  <td>
		<table width="100%">
			                   <tr>
			                      <td class="CformNombre" width="239">Importe Total:<span class="dato_obligatorio">*</span> $
			                      </td>
			                      <td class="CformDato">
			                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalComisiones" size="12" maxlength="12" styleId="totalComisiones"/>
			                     
			                      </td>
			                    </tr>
		</table>
     </td>
</tr>

<tr>
        <td class="CformAreaBotones">
		           <div align="left"><span class="dato_obligatorio">* Datos obligatorios</span>
					</div>		          
		           <div align="right">
		             <jsp:include page="/jsp/layout/botones.jsp">
		                <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
		                <jsp:param name="entidad" value="saldoInicial" />
		             </jsp:include> 
		           </div>
	   </td>
</tr>
</table>

<table>
    
	    <logic:equal value="T" name="cobrado">
	        <table align="center" cellpadding="0" cellspacing="0" width="100%">
	              <tr >
	                <td >
	                  <b>
	                  Atención: Saldo Inicial con transferencias. No podrá modificar el prestador ni los items transferidos.
						</b>
	                </td>
	              </tr>
	           </table>
		</logic:equal>
		
</table>	


</logic:equal>
    
<logic:equal value="view" name="tipoPantalla"> 
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
	<tr>
	 <td>
	 <table align="center" cellpadding="0" cellspacing="0" width="100%">
    

				<tr>
                 <td>
		        	 <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Saldo Inicial &nbsp;</strong>
						        </td>
						      </tr>
						</table>
					</td>
				 </tr>	

	        	<tr>
                 <td>
                 
                 
                 <table align="center" cellpadding="0" cellspacing="0" width="100%">
			        	<tr>
		                 <td>
				        	 <table width="100%">
									<tr>
				                        <td class="CformNombre" width="10%" >Uvt: </td>
					                    <td class="CformDato" width="35%">
							                 <bean:write name="formulario" property="uvtFacturaDescripcion"/>
							            </td>
							         </tr> 

				        	 		<tr>
				                       <td class="CformNombre" width="10%">Fecha:</td>
		                       		   <td class="CformDato" width="35%" ><bean:write name="formulario" property="facturaFecha"/></td>
				                      
				                 	
					                    <td class="CformNombre" width="10%" >Tipo Servicio: </td>
					                    <td class="CformDato" width="35%">
							                 <html:select  property="tipoServicio" disabled="true">
							                 <html:options collection="comboTipoServicio" property="value" labelProperty="label"  />
							                 </html:select>
							            </td>
							         </tr> 
							         <tr> 
							            
							            <td class="CformNombre" width="10%">
							            	Prestador:
							            </td> 
										<td class="CformDato"  width="35%">
											<bean:write name="formulario" property="prestadorDescripcion"/>
												
										</td>
							         
						                      <td class="CformNombre" width="10%">Importe Total:</td>
		                      				  <td class="CformDato" width="35%" ><bean:write name="formulario" property="importe"  /></td>
					                 </tr>
								<tr>
				                      <td class="CformNombre" width="170">Descripción: </td>
		                     		  <td class="CformDato" ><bean:write name="formulario" property="detalle"/></td>
				                </tr>
						    	</table>   
				    	</td>
					  </tr>	                    
		             
				</table>
              </td>
            </tr>
                 
            <tr>
			   <td>
			       <table class="tablaMin" align="center" width="100%">
	                    <tr bgcolor="#BFDFFF">
	                       <td>
	                       <strong>Distribución:</strong></td>
	                    </tr>
	                    <tr>
	                      <td colspan="10">
	                      	<!-- si es detalle o eliminar levanta decorator de facturas -->
	                        
		                      <display:table style="width: 100%" name='<%= distribucionFacturacion %>' id='<%= pageName %>' decorator="conicet.apps.siuvt.web.ingreso.decorator.CSaldoInicialItemDistribucionDisplayWrapper" >
	                          <display:column property="descripcionComision" title="Comisiones"  headerClass="tableCellHeader" style="width:400px;" />
	                          <!-- display:column property="porcentajeComisionCfm" title="%" headerClass="tableCellHeader" style="width: 200px;text-align:right;" /-->
	                          <display:column property="importeComisionCfm" title=" Importe ($)" headerClass="tableCellHeader" style="width:200px;text-align:right;" />
	                          <display:column property="botonAgregarCfm" title=" Instituto" headerClass="tableCellHeader" style="width:400px;text-align:center;" />
							 </display:table>
	                        
	                      </td>
	                    </tr>
			       </table>
               </td>
		 	</tr>
		 
		    <tr>
              <td>
		       <table class="tablaMin" align="center" width="100%">
		            <tr>
		              <td colspan="10" width="100%">
		                <display:table style="width: 100%" name='<%= comisionContraparte %>' id='<%= pageName %>' decorator="conicet.apps.siuvt.web.ingreso.decorator.CSeleccionContraparteDisplayWrapper">
		                  <display:column property="descripcion" title="Contraparte" headerClass="tableCellHeader" maxLength="400" style="width: 300px;" />
		                  <display:column property="tipoOrganismo" title="Tipo" headerClass="tableCellHeader" style="width: 300px;" />
		                  <display:column property="importeCfm" title="Importe ($)" headerClass="tableCellHeader" style="width: 300px;text-align:right;" />
		                </display:table>
		              </td>
		            </tr>
				</table>		 
              </td>
		    </tr>
		    
		    <logic:notEmpty name="formulario" property="productividadEntidad" >
		    <tr>
              <td>
		       <table class="tablaMin" align="center" width="100%">
		            <tr>
		              <td colspan="10" width="100%">
		                <display:table style="width: 100%" name='<%= productividadEntidad %>' id='<%= pageName %>' decorator="conicet.apps.siuvt.web.ingreso.decorator.CSeleccionProductividadDisplayWrapper">
		                  <display:column property="descripcion" title="Productividad" headerClass="tableCellHeader" maxLength="400" style="width: 300px;" />
		                  <display:column property="documento" title="Documento" headerClass="tableCellHeader" style="width: 300px;" />
		                  <display:column property="importeCfm" title="Importe ($)" headerClass="tableCellHeader" style="width: 300px;text-align:right;" />
		                </display:table>
		              </td>
		            </tr>
				</table>		 
              </td>
		    </tr>
		    
		    </logic:notEmpty>
		    <logic:empty name="formulario" property="productividadEntidad" >
		    
		    </logic:empty>
      		 <tr>
              	<td>
              	<div></div>
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
            <jsp:param name="entidad" value="saldo_inicial" />
          </jsp:include>
        </div>
      </td>
    </tr>
      
</table> 


</logic:equal> 

