<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>


<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />

<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />


<bean:define id="distribucionFacturacion" name="formulario" property="distribucionFacturacion" />
<bean:define id="productividadEntidad" name="formulario" property="productividadEntidad" />
<bean:define id="facturaCobro" name="formulario" property="facturaCobro" />
<bean:define id="transferencias" name="formulario" property="facturaTransferencias" />
<bean:define id="comisionContraparte" name="formulario" property="comisionContraparte" />
<bean:define id="tipoUvt" name="formulario" property="tipoUvt" />
<bean:define id="posibilidadDeCobroEn" name="formulario" property="posibilidadDeCobroEn" />
<bean:define id="tipoMoneda" name="formulario" property="tipoMoneda" />
<bean:define id="copia" name="formulario" property="copia" />
<bean:define id="importe" name="formulario" property="importe" />
<bean:define id="botones" name="formulario" property="botones" />
<bean:define id="cobrado" name="formulario" property="cobrado" />


<script>

// autocomplete de prestador y contratante

 
function prepararBusquedaPrestador(){
	var conicetGeneral = new ConicetGeneral();

	conicetGeneral.autocomplete({
		idInput : "autoCompletePrestador",
		url : "<%=actionName%>?method=auto Complete Prestador",
		onSelectFunction : function(item) {
			// si eligió Ingresar Nuevo se va a ventana de alta
			if (item.data.id == 0){
				document.<%= request.getParameter("formulario") %>.action = "<%=actionName%>?btnSubmit=ingresar Nuevo Prestador";
				document.<%= request.getParameter("formulario") %>.submit();	
			}
			$("#prestadorSeleccionado").attr("value", item.data.id);
			$("#prestadorDescripcion").attr("value", item.data.nombre);
			$("#autoCompletePrestadorTexto").text(item.data.nombre);
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
  
  function prepararBusquedaContratante(){
		var conicetGeneral = new ConicetGeneral();

		conicetGeneral.autocomplete({
			idInput : "autoCompleteContratante",
			url : "<%=actionName%>?method=auto Complete Contratante",
			onSelectFunction : function(item) {
				// si eligió Ingresar Nuevo se va a ventana de alta
				if (item.data.id == 0){
					document.<%= request.getParameter("formulario") %>.action = "<%=actionName%>?btnSubmit=ingresar Nuevo Contratante";
					document.<%= request.getParameter("formulario") %>.submit();	
				}

				$("#contratanteSeleccionado").attr("value", item.data.id);
				
				if(item.data.documento != null && item.data.documento.length > 1)
				{
					$("#autoCompleteContratanteTexto").text(item.data.nombre+"("+item.data.documento+")");
					$("#contratanteDescripcion").attr("value", item.data.nombre+"("+item.data.documento+")");
				}else{
					$("#autoCompleteContratanteTexto").text(item.data.nombre);
					$("#contratanteDescripcion").attr("value", item.data.nombre);
				}
				
				intercambiarContratante();
			},
			valueDefault : ""
			,
		  	formatItem: function(data)
			{
			  			if(data.nombreFantasia != null && data.nombreFantasia.length > 1)
			  			{
			  				return data.nombre + " // " + data.nombreFantasia;
			  			}
			  			else
			  			{
			  				if (data.documento != null && data.documento.length > 1)
			  					{
				  					return data.nombre+"("+data.documento+")";
			  					}else{
			  						return data.nombre;
			  					}
			  			}
			}
			
			
			
			
		});
	}

	  function removeContratante(url)
	  {  
		  $("#contratanteSeleccionado").attr("value","");
		  $("#autoCompleteContratante").attr("value","");
		  intercambiarContratante();
	  }
	  
	  function intercambiarContratante()
	  {
		  var select = $("#contratanteSeleccionado").val();	  
		  if(select != "" && select != null)
		  {
			  $('#autoCompleteContratante').hide();
			  $('#autoCompleteContratanteDescripcion').show();	
		  }
		  else{
			  $('#autoCompleteContratanteDescripcion').hide();
			  $('#autoCompleteContratante').show();
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
	  	
		prepararBusquedaContratante();
	  	
	  	var select = $("#contratanteSeleccionado").val();	
	  	
	  	if(select != "" && select != null)
	  	{
	  		$('#autoCompleteContratante').hide();
	  		$('#autoCompleteContratanteDescripcion').show();
	  		
	  	}
	  	else
	  	{
	  		$('#autoCompleteContratante').show();
  			$('#autoCompleteContratanteDescripcion').hide();
	  	}
	  	
	
	  	
	  	
	
	   var input = new CInputNumero(true);
	   input.bind("input[id='importe']");//selector de jquery
	   input.bind("input[id='importeOtraMoneda']");//selector de jquery 
	   input.bind("input[id^='porcentajeComision_']");
	   var input2 = new CInputNumero(false);
	   input2.bind("input[id='facturaSufijo']");//selector de jquery
	   
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
/*
function removePrestador()
{
		$('#prestadorText').val("");
		document.forms[0].submit();
}*/


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
	  



//TOTALES EN PANTALLA
function calcularComisiones() {
	  var i = Number(0);
	  var importe=0;
	  var importeComision=0;
	  var totalComisiones=0;
	  var totalParcial=0;
	  var saldoAD=0;
	  var precioFinal=eval($('#importe').attr('value'));
	  
	  if (precioFinal>0){
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

		  
		  saldoAD=Number(precioFinal)-Number(saldoAD);

		  $("[id^='importeDistribucion_']").each(function() {
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
      	  		  totalComisiones=Number(totalComisiones)+Number((importe).toFixed(2));
			  }
	    	i= Number(i)+Number(1); 
		  });
	  
	  }
	  
	  $('#totalParcialComisiones').attr('value', totalParcial.toFixed(2));
	  $('#totalComisiones').attr('value', totalComisiones.toFixed(2));
	  
	  saldoAD = deshabilitarDistribucion(saldoAD,totalComisiones);
	  
	  
	  
	  $('#saldoADistribuir').attr('value', redondear(saldoAD,2).toFixed(2));
}

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
			
			
			$('#porcentajeDistribucion_6').removeClass('CformTextDisabled');
			$('#porcentajeDistribucion_6').removeClass('readonly');
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
	var importe=0;
	var saldoADistribuir=eval($('#saldoADistribuir').attr('value'));
	if (saldoADistribuir!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)/Number(saldoADistribuir)*Number(100);
	}

	$('#porcentajeDistribucion_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularComisiones();
	
	//corregirPorcentaje($('#porcentajeDistribucion_'+pos));
}
/*
function corregirPorcentaje(obj){
	var sumaPorcentajes = calcularSumaPorcentajes();
	var sumaImportes = Number($('#totalComisiones').val());
	
	if(sumaImportes == $('#importeId').val() && sumaPorcentajes!= Number(100))
	{
		var diferencia = sumaPorcentajes - Number(100);
		
		obj.val(Number(obj.val()-diferencia).toFixed(2));
		
	}
}
function corregirImporte(obj){
	var sumaPorcentajes = calcularSumaPorcentajes()
	var sumaImportes = Number($('#totalComisiones').val());
	
	if(sumaPorcentajes == Number(100) && sumaImportes != $('#importeId').val() )
	{
		var diferencia = sumaImportes - Number($('#importeId').val());
		
		obj.val(Number(obj.val()-diferencia).toFixed(2));
		calcularComisiones();
	}
}

function calcularSumaPorcentajes()
{
	var sumaPorcentajes = Number(0);
	
	$('input[name^="porcentaje"]').each(function() {
		  
		  if ($(this).attr('value') != "" && $(this).attr("id") != "porcentajeIva") {
	          formatImporte($(this)[0]);
		      var importe=Number($(this).attr('value'));
			  sumaPorcentajes += Number((importe).toFixed(2));
		  }
	  });
	
	return sumaPorcentajes;
}
*/


function calcularImporteDesdePorcentaje(obj,pos){
	var importe=0;
	
	var saldoADistribuir=eval($('#saldoADistribuir').attr('value'));
	if (saldoADistribuir!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)*Number(saldoADistribuir)/Number(100);
	}
	$('#importeDistribucion_'+pos).attr('value', Number(importe).toFixed(2));
	calcularComisiones();
	
	//corregirImporte($('#importeDistribucion_'+pos));
}

// recalculan importe o porcentaje de comision de la distribucion
function calcularPorcentajeComisionDesdeImporte(obj,pos){
	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)/Number(precioFinal)*Number(100);
	}
	$('#porcentajeDistribucionComision_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularComisiones();
	//corregirPorcentaje($('#porcentajeDistribucionComision_'+pos));
	
}

function calcularImporteComisionDesdePorcentaje(obj,pos){
	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)*Number(precioFinal)/Number(100);
	}
	$('#importeDistribucionComision_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularComisiones();
	//corregirImporte($('#importeDistribucionComision_'+pos));
}
// recalculan imoprte o porcentaje recupero de la distribucion
function calcularPorcentajeRecuperoDesdeImporte(obj,pos){
	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)/Number(precioFinal)*Number(100);
	}
	$('#porcentajeDistribucionRecupero_'+pos).attr('value',redondear(importe,2).toFixed(2));
	calcularComisiones();
	
}

function calcularImporteRecuperoDesdePorcentaje(obj,pos){
	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)*Number(precioFinal)/Number(100);
	}
	$('#importeDistribucionRecupero_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularComisiones();
	
}

//recalculan imoprte o porcentaje retencion de la distribucion
function calcularPorcentajeRetencionDesdeImporte(obj,pos){
	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)/Number(precioFinal)*Number(100);
	}
	$('#porcentajeDistribucionRetencion_'+pos).attr('value',redondear(importe,2).toFixed(2));
	calcularComisiones();
	
}

function calcularImporteRetencionDesdePorcentaje(obj,pos){
	var importe=0;
	var precioFinal=eval($('#importe').attr('value'));
	if (precioFinal!=0){
		formatImporte($(obj)[0]);
		importe =obj.value;
		importe=Number(importe)*Number(precioFinal)/Number(100);
	}
	$('#importeDistribucionRetencion_'+pos).attr('value', redondear(importe,2).toFixed(2));
	calcularComisiones();
	
}



</script>
    
<logic:equal value="input" name="tipoPantalla">

<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_factura_fecha"/>




<div id="factura">
<table class="tablaMin" align="center" cellpadding="0" cellspacing="0" width="720">
  <tr>
    <td class="CformAreaBotones">
      <div align="center">
        <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" onclick="irTabInicial()" />
        <input type="button" class="CformBotonTranspBorde" value="&lt;" onclick="irTabAnterior()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;"  onclick="irTabSiguiente()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|"  onclick="irTabFinal()" />
      </div>
    </td>
  </tr>
</table>


 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	      <td>
	        <table align="center" cellpadding="0" cellspacing="0" width="100%">
	        	<tr>
                 <td>
		        	 <table width="100%">
		        	 		<!--  tr>
		                      <td class="CformNombre" width="13%">Uvt: </td>
		                      <td class="CformDato" ><bean:write name="formulario" property="uvtFacturaDescripcion"/></td>
		                     </tr -->
		                     
		        	 		<tr>
		                      <td class="CformNombre">Fecha:<span class="dato_obligatorio">*</span></td>
		                      <td class="CformDato" width="27%">
		                          <html:text styleId="id_factura_fecha" property="facturaFecha" maxlength="10" size="10" onkeypress="validarNumero()"/>
		                      </td>
		                      
		                      <td class="CformNombre" width="10%">Número:<span class="dato_obligatorio">*</span></td>
			                    <td class="CformDato">
					                 <html:select  property="facturaTipo">
					                 <html:options collection="comboTipoFactura" property="value" labelProperty="label"  />
					                 </html:select>

					                 <html:select  property="facturaPrefijo">
					                 <html:options collection="comboPrefijoFactura" property="value" labelProperty="label"  />
					                 </html:select>- 
			                      <html:text styleId="facturaSufijo" property="facturaSufijo" maxlength="8" size="9" onchange="completarCeros(this,8)" />
			                    </td>
		                      
		                 	</tr>
		                 	
			                 <tr>
			                    <td class="CformNombre" >Tipo Servicio:<span class="dato_obligatorio">*</span> </td>
			                    <td class="CformDato">
					                 <html:select  property="tipoServicio" styleId="tipoServicio">
					                 	<html:options collection="comboTipoServicio" property="value" labelProperty="label"  />
					                 </html:select>
					            </td>
					            
					             <td class="CformNombre">
					            	Prestador:<span class="dato_obligatorio">*</span>
					            </td>
					            		                         	
		                         <td class="CformDato">
									   <div id="autoCompletePrestadorDescripcion"> 
										   <label id="autoCompletePrestadorTexto"><bean:write name="formulario" property="prestadorDescripcion"/></label> 
											<!-- puede modificar prestador si no tiene transf. si es alta directa o si es o.facturacion -->
											  <logic:notEqual value="T" name="cobrado">
											  		    <logic:equal name="formulario" property="valueEAccion" value="alta">
															<a href="#" onclick="removePrestador(this)"><img src="./imagenes/close.png" align="top"/></a>
														</logic:equal>
														<logic:equal value="cOrdenFacturacionBuscarAction"  name="formulario" property="input">
															<a href="#" onclick="removePrestador(this)"><img src="./imagenes/close.png" align="top"/></a>
														</logic:equal>
											   </logic:notEqual>
									   </div>
										<input type="text" name="autoCompletePrestador" id="autoCompletePrestador"  />
							 	</td>
	                         </tr>
								 	
					            
					            
					            
					            
					            
					            
					            
							
					         </table>
					         
					         
					         <table width="100%">
						         <tr>
						            
						          <td class="CformNombre" width="13%">
					            		Contratante:<span class="dato_obligatorio">*</span>
						            </td>
					            		                         	
			                        <td class="CformDato" width="50%">
									   <div id="autoCompleteContratanteDescripcion"> 
										   <label id="autoCompleteContratanteTexto"><bean:write name="formulario" property="contratanteDescripcion"/></label> 
											  <logic:equal value="N" property="facturaIncluidaEnCobroMultiple" name="formulario" >	
											   <a href="#" onclick="removeContratante(this)"><img src="./imagenes/close.png" align="top"/></a>
											   </logic:equal>
									   </div>
										<input type="text" name="autoCompleteContratante" id="autoCompleteContratante" />
								 	</td>
						            
						            
									
									<td class="CformNombre" width="15%">Cliente De: </td>
				                    <td class="CformDato">
						                 <html:select  property="clienteDe">
						                 <html:options collection="comboClienteDe" property="value" labelProperty="label"  />
						                 </html:select>
						            </td>
						         </tr>
					         </table>
					         
					     <table width="100%">
					         <!-- si la factura tiene transferencias no podrá modificar el importe de la factura -->
							<logic:notEqual value="T" name="cobrado">	
				 				 <tr>
				                      <td class="CformNombre" width="22%">Importe Sin Iva:<span class="dato_obligatorio">*</span></td>
				                      <td class="CformDato"   width="30%"><html:text styleId="importeSinIva" style="text-align:right;" maxlength="12" size="10"  property="importeSinIva" onblur="formatImporte(this)" onchange="calcularIvaYTotalImporte(this)" /></td>
				                      <td/>
				                      <td/>
				                 </tr>
	
				 				 <tr>
				                      <td class="CformNombre">% Iva:<span class="dato_obligatorio">*</span></td>
				                      <td class="CformDato" ><html:text styleId="porcentajeIva" style="text-align:right;" maxlength="12" size="10"  property="porcentajeIva" onblur="formatImporte(this)"  onchange="calcularTotalImporte(this)" /></td>
				                 </tr>
	
				 				 <tr>
				                      <td class="CformNombre">Importe Total:<span class="dato_obligatorio">*</span></td>
				                      <td class="CformDato" ><html:text readonly="true" styleId="importe" style="text-align:right;" maxlength="12" size="10"  property="importe" onblur="formatImporte(this)" onchange="reCalculoComisiones()" /></td>
				                 </tr>
							</logic:notEqual>
							<logic:equal value="T" name="cobrado">	
				 				 <tr>
				                      <td class="CformNombre"  width="22%">Importe Sin Iva:<span class="dato_obligatorio">*</span></td>
				                      <td class="CformDato"  width="30%"><html:text styleClass="textDisabled" readonly="true" styleId="importeSinIva" style="text-align:right;" maxlength="12" size="10"  property="importeSinIva" onblur="formatImporte(this)" onchange="calcularIvaYTotalImporte(this)" /></td>
					                 	<td/>
					                 	<td/>
				                 </tr>
	
				 				 <tr>
				                      <td class="CformNombre">% Iva:<span class="dato_obligatorio">*</span></td>
				                      <td class="CformDato" ><html:text styleClass="textDisabled" readonly="true" styleId="porcentajeIva" style="text-align:right;" maxlength="12" size="10"  property="porcentajeIva" onblur="formatImporte(this)"  onchange="calcularTotalImporte(this)" /></td>
				                 </tr>
	
				 				 <tr>
				                      <td class="CformNombre">Importe:<span class="dato_obligatorio">*</span></td>
				                      <td class="CformDato" ><html:text styleClass="textDisabled" readonly="true" styleId="importe" style="text-align:right;" maxlength="12" size="10"  property="importe" onblur="formatImporte(this)" onchange="reCalculoComisiones()" /></td>
				                 </tr>
							</logic:equal>
							
			                 <tr>
			                    <td class="CformNombre" >Importe Otra Moneda: </td>
			                    <td class="CformDato">
					                 <html:select  property="tipoMoneda">
					                 <html:options collection="comboTipoMoneda" filter="false" property="value" labelProperty="label"  />
					                 </html:select> 
					             <html:text  property="importeOtraMoneda" styleId="importeOtraMoneda" style="text-align:right;" maxlength="12" size="10" onblur="formatImporte(this)" />
					            </td>	
			                    <td class="CformNombre"  width="22%">Posibilidad de Cobro en: </td>
			                    <td class="CformDato">
					                 <html:select  property="posibilidadDeCobroEn">
					                 <html:options collection="comboPosibilidadDeCobroEn" property="value" labelProperty="label"  />
					                 </html:select>
					            </td>
							</tr>
				    </table>   
		    	</td>
			  </tr>	                    
              <tr>
			  	<td>
					<table width="100%">
					   <tr bgcolor="#BFDFFF">
					        <td>
					          <strong>Servicios</strong>
					        </td>
					      </tr>
					    </table>
					    <table width="100%">
					    <tr>
		                      <td class="CformNombre">Descripción:<span class="dato_obligatorio">*</span> </td>
		                      <td class="CformDato" ><html:textarea  property="detalle"  rows="3"  /></td>
		                </tr>
				       	<tr>
		                      <td class="CformNombre" width="30%">Datos Identificación Servicio:&nbsp;</td>
		                      <td class="CformDato" ><html:textarea property="datosIdentificacionServicio" rows="3" />
		                 </tr>
					</table>
				</td>
			  </tr>	 
	</table>
	</td>
</tr>

  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="left">
     <span class="dato_obligatorio">* Datos obligatorios</span>
     </div>
      <div align="right">
      	<logic:equal value="facturaAlta" name="pageName">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
        </logic:equal>
        <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
      	<logic:equal value="facturaAlta" name="pageName">
	      	<logic:equal value="true" property="copia" name="formulario">
	          <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
	        </logic:equal>
        </logic:equal>
        
        
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
	                  Atención: Factura con cobros con transferencias. No podrá modificar el importe y los items transferidos.
						</b>
	                </td>
	              </tr>
	           </table>
		</logic:equal>
		
	</table>	


</div>


<div id="distribucion">
  <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td class="CformAreaBotones">
        <div align="center">
          <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irTabInicial()" />
          <input type="button" class="CformBotonTranspBorde" value="<" onclick="irTabAnterior()" />
          <input type="button" class="CformBotonTranspBorde" value=">" onclick="irTabSiguiente()" />
          <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabFinal()" />
        </div>
      </td>
    </tr>
  </table>
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
			   <td>
			 		<table width="100%" align="center" >
			                      <td class="CformNombre" width="240" >Total Facturado: $
			                      </td>
			                      <td class="CformDato">
						          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="importe" size="12" maxlength="12" styleId="importeId"/> 
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
			                        <display:table style="width: 100%" name='<%= distribucionFacturacion %>' id='<%= pageName %>'  decorator="conicet.apps.siuvt.web.ingreso.decorator.CFacturaItemDistribucionDisplayWrapper">
									  
				                          <display:column property="descripcionComision" title="Comisiones"  headerClass="tableCellHeader" style="width:200px;" />
				                          <display:column property="porcentajeComision" title="%" headerClass="tableCellHeader" style="width: 200px;" />
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
			                      <td class="CformNombre" width="240">Total Distribuido: $
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
		                <jsp:param name="entidad" value="factura" />
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
	                  Atención: Factura con cobros con transferencias. No podrá modificar el importe y los items transferidos.
						</b>
	                </td>
	              </tr>
	           </table>
		</logic:equal>
		
	</table>	
	  </div>
	</div>

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
						          <strong>Factura &nbsp;</strong>
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
				                       <td class="CformNombre">Fecha:</td>
		                       		   <td class="CformDato" ><bean:write name="formulario" property="facturaFecha"/></td>
				                      
				                       <td class="CformNombre">Número:</td>
		                       		   <td class="CformDato">
									       <bean:write name="formulario" property="facturaTipo"/>
									       <bean:write name="formulario" property="facturaPrefijo"/>
									       - <bean:write name="formulario" property="facturaSufijo"/>
									   </td>
				                      
				                 	</tr>
				                 	
					                 <tr>
					                    <td class="CformNombre" >Tipo Servicio: </td>
					                    <td class="CformDato">
							                 <html:select  property="tipoServicio" disabled="true">
							                 <html:options collection="comboTipoServicio" property="value" labelProperty="label"  />
							                 </html:select>
							            </td>
							            
							            <td class="CformNombre">
							            	Prestador:
							            </td> 
										<td class="CformDato" >
											<bean:write name="formulario" property="prestadorDescripcion"/>
												
										</td>
							         </tr>
							         </table>
							         
							         
							         <table width="100%">
								         <tr>
								            <td class="CformNombre" width="19%">
							            		Contratante:
								            </td> 
											<td class="CformDato" width="37%">
												<bean:write name="formulario" property="contratanteDescripcion"/>
											</td>
											
											<td class="CformNombre" >Cliente De: </td>
						                    <td class="CformDato">
								                 <html:select  property="clienteDe" disabled="true">
								                 <html:options collection="comboClienteDe" property="value" labelProperty="label"  />
								                 </html:select>
								            </td>
								         </tr>
							         </table>
							         
							     <table width="100%">
							         	
						 				 <tr>
						                      <td class="CformNombre" width="29%">Importe Sin Iva:</td>
			                      			  <td class="CformDato" ><bean:write name="formulario" property="importeSinIva"  /></td>
						                 </tr>
			
						 				 <tr>
						                      <td class="CformNombre">% Iva:</td>
			                      			  <td class="CformDato" ><bean:write name="formulario" property="porcentajeIva"  /></td>
						                 </tr>
			
						 				 <tr>
						                      <td class="CformNombre">Importe Total:</td>
		                      				  <td class="CformDato" ><bean:write name="formulario" property="importe"  /></td>
						                 </tr>
									
									
						                 <tr>
						                    <td class="CformNombre" >Importe otra Moneda: </td>
						                    <td class="CformDato">
								                 <html:select  property="tipoMoneda" disabled="true">
								                 <html:options collection="comboTipoMoneda" filter="false" property="value" labelProperty="label"  />
								                 </html:select>  
						                         <bean:write name="formulario" property="importeOtraMoneda"/>
							            	
							            	</td>
							          	</tr>	
								     	<tr>
						                    <td class="CformNombre" >Posibilidad de Cobro en: </td>
						                    <td class="CformDato">
								                <logic:notEmpty name="posibilidadDeCobroEn"> 
									                 <html:select  property="posibilidadDeCobroEn" disabled="true">
									                 <html:options collection="comboPosibilidadDeCobroEn" property="value" labelProperty="label"  />
									                 </html:select>
								                 </logic:notEmpty>
								                <logic:empty name="posibilidadDeCobroEn">
								                No se seleccionó 
												</logic:empty>					                 
								            </td>
								         </tr>
									
						    	</table>   
				    	</td>
					  </tr>	                    
		              <tr>
					  	<td>
							<table width="100%">
							   <tr bgcolor="#BFDFFF">
							        <td>
							          <strong>Servicios</strong>
							        </td>
							      </tr>
							    </table>
							    <table width="100%">
							    <tr>
				                      <td class="CformNombre" width="170">Descripción: </td>
		                     		  <td class="CformDato" ><bean:write name="formulario" property="detalle"/></td>
				                </tr>
						       	<tr>
				                      <td class="CformNombre" width="170">Datos Identificación Servicio:</td>
		                      		  <td class="CformDato" ><bean:write name="formulario" property="datosIdentificacionServicio"/></td>
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
	                        <display:table style="width: 100%" name='<%= distribucionFacturacion %>' id='<%= pageName %>' decorator="conicet.apps.siuvt.web.ingreso.decorator.CFacturaItemDistribucionDisplayWrapper">
	                          <display:column property="descripcionComision" title="Comisiones"  headerClass="tableCellHeader" style="width:200px;" />
	                          <display:column property="porcentajeComisionCfm" title="%" headerClass="tableCellHeader" style="width: 200px;text-align:right;" />
	                          <display:column property="importeComisionCfm" title="Importe ($)" headerClass="tableCellHeader" style="width:200px;text-align:right;" />
	                          <display:column property="botonAgregarCfm" title=" Instituto/Personas " headerClass="tableCellHeader" style="width:400px;text-align:center;" />
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
		    
      		 <tr>
              	<td>
              	<div></div>
		  		</td>
		    </tr>
		    
		    <logic:notEqual name="formulario" property="valueEAccion" value="alta">
				<logic:notEqual value="cOrdenFacturacionBuscarAction"  name="formulario" property="input">
            <tr>
			   <td>
			       <table align="center" width="100%">
	                    <tr bgcolor="#BFDFFF">
	                       <td>
	                       <strong>Cobros:</strong></td>
	                    </tr>
	                    <tr>
	                      <td colspan="10">
	                        <display:table name='<%= facturaCobro %>' id='<%= pageName %>' decorator="conicet.apps.siuvt.web.ingreso.decorator.CFacturaCobroDisplayWrapper" style="width: 100%;">
	                          <logic:equal value="si" name="displayLinks">
	                          	<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 15px;" />
	                          </logic:equal>
	                          <display:column property="cobroFecha" title="Fecha de Cobro" headerClass="tableCellHeader" style="" />
	                          <display:column property="cobroNro" title="Nro. Recibo"  headerClass="tableCellHeader" style="" />                  
	                          <display:column property="cobroImporte" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;" />          
	                        </display:table>
	                      </td>
	                    </tr>
			       </table>
               </td>
		 	</tr> 
		 	<tr>
			   <td>
			       <table align="center" width="100%">
	                    <tr bgcolor="#BFDFFF">
	                       <td>
	                       <strong>Transferencias:</strong></td>
	                    </tr>
	                    <tr>
	                      <td colspan="10">
	                        <display:table name='<%= transferencias %>' id='<%= pageName %>' decorator="conicet.apps.siuvt.web.ingreso.decorator.CEgresosImporteDisplayWrapper" style="width: 100%;">
	                          	<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 15px;" />
	                          <display:column property="fechaTransferencia" title="Fecha de Transferencia" headerClass="tableCellHeader" style="" />
	                          <display:column property="tipoTransferencia" title="Tipo"  headerClass="tableCellHeader" style="" /> 
	                          <display:column property="parteTransferencia" title="Cont. / Prestador / Bene"  headerClass="tableCellHeader" style="" />                               
	                          <display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;" />          
	                        </display:table>
	                      </td>
	                    </tr>
			       </table>
               </td>
		 	</tr> 
		 	</logic:notEqual>
		 	
		 	</logic:notEqual>
	</table>
    </td>
  </tr>
	
	
    <tr>
    
    
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
            <jsp:param name="entidad" value="factura" />
          </jsp:include>
        </div>
      </td>
    </tr>
      
</table> 


</logic:equal> 

