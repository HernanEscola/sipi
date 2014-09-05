<%@include file="/jsp/layout/include.jsp"%>



<bean:define id="form" name='<%= request.getParameter("formulario") %>' />

<bean:define id="costosNoRecuperados" name="form" property="costosNoRecuperados" />
<bean:define id="prestador" name="form" property="listaPrestador" />
<bean:define id="costos" name="form" property="costos" />

<bean:define id="costosAdicionales" name="form" property="costosAdicionales" />
<bean:define id="distribucion" name="form" property="distribucionStruct" />
<bean:define id="distribucionAdicional" name="form" property="distribucionAdicional" />
<bean:define id="botones" name="form" property="botones" />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />

<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<style>
#debug {
    align: center;
}
</style>
<script>


/**
 * Después de seleccionar un Costo, el mismo es redondeado para dar origen al PrecioFinal.
 * 
 * COMISIONES DE PS
 * Los %comisiones del Costo serán los del PS(Precio Sugerido)
 * El total y los importes de las comisiones pueden diferir de los del costo debido a que se hacen en base al PrecioFinal(COSTO redondeado)
 *
 * RECUPERO DE FONDOS 
 * Se calcula con datos del costo: suma de los costos +importe Riesgo- manoDeObra- (porcentajeRiesgo*manoDeObra)+ DELTA
 
 * DELTA:
 *	Es un valor que surge de diferencias en el redondeo por la diferencia entre el valor del Costo y el del PrecioFinal 
 *	Se calcula: (preciofinal-costo)-(suma de comisiones del costo - suma de comisiones del PS)	
 *	Este valor debe ser considerado o no según el tipo de operación (caso) que se está cargando 
 *	
 *
 * tipos de caso:
 * 2:NO HABILITADO PARA PS: Surge al cargar bonificaciones,donde el precio final puede ser menor al costo elegido ya redondeado. 
 * 1:Es cuando asigno los mismos % comisiones del costo al PS. 
 *	 Aquí se debe agregar al recupero de fondos la diferencia de redondeo (DELTA).
 *	 Esta diferencia surge debido a que se redondea el costo para dar origen al precioFinal. Al hacer esto se generará
 *   una diferencia también en el total de comisiones por calcular las comisiones a partir de un nuevo valor.
 *
 * 4:Los %asignados de comision del PS son distintos a los del costo.
 * Aquí no se calcula DELTA, será igual a 0. Las diferencias que puedan existir de redondeo van a
 * Saldo a Distribuir (si la suma de %comis PS < suma %comis.costo) o a
 * Costos no recuperados porque va a pérdida (Si la suma %comis PS > suma %comis.costo).
 *
 * SALDO A DISTRIBUIR
 * Si se cargan ganancias o si se cargan %comisiones < %coms.costo, esta diferencia a favor se deberá distribuir 
 * entre la UD y Productividad.
 *
 * COSTOS NO RECUPERADOS:
 * Si se decide aumentar las comisiones del PS este incremento no se podrá recuperar e irá directamente a pérdida,
 * y se restará de recuperoDeFondos. Si se aumet
 * 	 
 */





//Esta variable es para activar y desactivar el div de debug
debug=false;

var deltaPrecio = Number(0.00);
var deltaComisiones = Number(0.00);
var delta = Number(0.00);

var porcentajeAdicionalTemp1 = "0";
var porcentajeAdicionalTemp2 = "0";


function prepare() {
	 disableAndInicialize('totalCostosAdicionales');
	  disableAndInicialize('ajusteComisiones');
	  //disableAndInicialize('costoTotal');
	  disableAndInicialize('porcentajeGanancia');
	  disableAndInicialize('margenGananciaPorcentual');
	  disableAndInicialize('margenGananciaNeto');
	  disableAndInicialize('ajusteComisionesGanancia');
	  disableAndInicialize('ofertaPrecio');
	  disableAndInicialize('precioFinal');
	  
	  var tipoGanancia = $("input[@name='tipoMargenGanacia']:checked").val();
	  if (tipoGanancia == "porcentual") {
	    deshabilitarElemento('margenGananciaNeto');
	    $('#margenGananciaNeto').attr('value',"0.00");
	    habilitarElemento('porcentajeGanancia');
	  } else if (tipoGanancia == "neto") {
	    deshabilitarElemento('porcentajeGanancia');
	    $('#margenGananciaPorcentual').attr('value',"0.00");
	    habilitarElemento('margenGananciaNeto'); 
	  }
	  //Es necesario habilitar los radio en el caso de la modificacion, ya q al llamar 
	  //a modificar llama a deshabilitarCampos()
	  $("input[name='tipoMargenGanacia']").removeAttr('disabled');

}

function disableAndInicialize(elemento) {
  if($('#'+elemento).val() == "") {
	  $('#'+elemento).attr('value',"0.00");
  }
}

function deshabilitarElement(element) {
	if(element.is('input:radio')) {
		element.attr('disabled', true);
	} else {  
    element.attr('readonly', true);
    element.addClass('textDisabled');
	}  
}
function deshabilitarCampos() {
      $(".desactivable").each(function() {
        if ($(this).is('div') ) {
          $(this).hide();
        } else {
          deshabilitarElement($(this));
        }      
      });  
 
}


function limpiarTabDistribucion() {
	$("#debugLeft").text("");
	$("#debugRight").text("");
	calCularDeltaPrecio();
	calcularComisiones();
	data='Costo: '+precio;
	agregar(data);
	data='Comisiones: '+comisiones;
	agregar(data);
	data='Total Costos: '+sumaCostos;
	agregar(data);
	data='Importe Factor Riesgo: '+importeRiesgo;
	agregar(data);
	data='Costo No recuperable: '+manoDeObra;
	agregar(data);
	data='% Factor riesgo: '+porcentajeRiesgo;
  agregar(data); 
}

function formatoEntero(obj) {
  var test_result = /^\d+$/.test(obj.val());
  if (!test_result) {
    obj.attr('value', 0);
  }
}





function agregar(data) {
  if (debug) {
  	$('#debugLeft').append('<p>');
  	$('#debugLeft').append(data);
  	$('#debugLeft').append('</p>');
  }    
}

function agregarDerecha(data) {
  if (debug) {
    $('#debugRight').append('<p>');
    $('#debugRight').append(data);
    $('#debugRight').append('</p>');
  }      
}

function calcularSubtotalPrecio() {
	var subtotal = Number("0.00");
 
  subtotal = Number(precio);
	$('#subtotalPrecio').val(subtotal.toFixed(2));
	calcularCostoTotal(); 
}


function calcularCostoTotal() {
  var suma = Number($('#subtotalPrecio').val());
  $('#costoTotal').val(suma.toFixed(2));
  cambioTipoGanancia();
}

//Funciones de la seccion Precio Oferta

function deshabilitarElemento(elemento) {
  var element = $('#'+elemento+'');
	element.attr('value',"");
  element.attr('readonly', true);
  element.addClass('textDisabled');
}

function habilitarElemento(elemento) {
	
  var element = $('#'+elemento+'');
  //if (!element.hasClass('desactivable')) {
  	element.attr('readonly', false);
    element.removeClass('textDisabled');
  //}   
}


function cambioTipoGanancia() {
	var tipo = $("input[name='tipoMargenGanacia']:checked").val();
  if (tipo == "porcentual") {
    deshabilitarElemento('margenGananciaNeto');
    habilitarElemento('porcentajeGanancia');
  } else if (tipo == "neto") {
	  deshabilitarElemento('porcentajeGanancia');
    $('#margenGananciaPorcentual').attr('value',"");
    habilitarElemento('margenGananciaNeto'); 
  }
  calculoGanancia();
}

function calculoGanancia() {
	calcularGananciaPorcentual();
	calcularGananciaNeta();
	calcularAjusteComisionesGanancia();
	calcularPrecioOferta();      
	calcularPrecioFinal();
}
function calcularAjusteComisionesGanancia() {
	var valor = $('#margenGananciaNeto').val();
  var comisionesGanacia = (valor/(1-(Number(comisiones)/100)))-valor;
  valor = $('#margenGananciaPorcentual').val();
  comisionesGanacia = comisionesGanacia + (valor/(1-(Number(comisiones)/100)))-valor;
  $('#ajusteComisionesGanancia').val(comisionesGanacia.toFixed(2)); 
  
}

function calcularGananciaPorcentual() {
  var elemento = $('#porcentajeGanancia');
	formatImporte(elemento[0]);
	var aux = Number($('#porcentajeGanancia').val()) / Number(100);
	aux = Number(aux)*Number(precio);
	//aux = Number(aux)*Number($('#costoTotal').val());  // costoTotal, precio y subTotalPrecio son iguales 
  $('#margenGananciaPorcentual').attr('value', aux.toFixed(2)); 
}

function calcularGananciaNeta() {
	var elemento = $('#margenGananciaNeto');
  formatImporte(elemento[0]);
}

function calcularPrecioOferta() {
//  var aux = Number($('#costoTotal').val()) + Number($('#margenGananciaPorcentual').val());

  var aux = Number(precio) + Number($('#margenGananciaPorcentual').val());

  aux = Number(aux) + Number($('#margenGananciaNeto').val());
  aux = Number(aux) + Number($('#ajusteComisionesGanancia').val());
  $('#ofertaPrecio').attr('value',aux.toFixed(2));
 
}



function calcularPrecioFinal() {
  var aux = Number($('#ofertaPrecio').val()) ;
  deltaPrecio=Math.ceil(aux) - Number(aux);
  $('#precioFinal').attr('value',Math.ceil(aux).toFixed(2));
  $('#precioFinalDistribucion').attr('value',Math.ceil(aux).toFixed(2));
  calcularComisiones();
}

function calCularDeltaPrecio() {
	var aux = Number($('#ofertaPrecio').val())
	deltaPrecio=Math.ceil(aux) - Number(aux);    
}


//Funciones de la seccion Distribución

function formatPorcentajeCalcularComisiones(obj) {
	formatImporte(obj);
}

function calculoComisiones(fixed) {
	  var i = Number(0);
	  var importe=0;
	  var totalComisiones=0;
	  var precioFinal=eval($('#precioFinal').attr('value'));
	  $("[id^='porcentajeComision_']").each(function() {
	       if ($(this).attr('value') != "" ) {
	          formatImporte($(this)[0]);
	       }
	       importe=Number($(this).attr('value'))*Number(precioFinal)/Number(100);
	       $('#importeComision_'+i).attr('value', Number(importe).toFixed(2));
         if (fixed)
        	  totalComisiones=Number(totalComisiones)+Number((importe).toFixed(2));
         else 
        	 totalComisiones=Number(totalComisiones)+Number(importe);
	       i= Number(i)+Number(1); 
	  });
	totalComisiones= Number((totalComisiones).toFixed(2));
    return totalComisiones;
}
/**
 * El calculo de las comisionesCosto lo hace para poder generar el DELTA de la comisionCosto.
 * Sería la suma de comisiones del costo+ margen de ganancia asignado en esta ventana
 * El total de comisiones de PS - éste valor será DELTAcomisionCosto, que se utiliza para agregar 
 * al recupero de costos y solucionar los problemas de redondeo (según el tipo de operación "CASO" que se esta cargando)
 */

function calcularComisionesCosto() {
 var comisionesCosto = Number(0);
 var ajusteComisionesAdicionales = Number(0);
 var ajusteMargenGanancia = Number(0);
 var ret = Number(0);
 
 var aux = Number(comisiones) / Number(100);
 aux = (1 / (1 - Number(aux)) - 1);

 //Calculo Comisiones del Costo
 var subtotalCosto = Number(sumaCostos)*(Number(1)+Number(porcentajeRiesgo));
 comisionesCosto = Number(subtotalCosto)*Number(aux);

 //Calculo Ajuste de Comisiones sobre Margen de Ganancia
 var valor = Number($('#margenGananciaNeto').val()) + Number($('#margenGananciaPorcentual').val());
 ajusteMargenGanancia = Number(valor)*Number(aux);
  
 ret = comisionesCosto + ajusteComisionesAdicionales + ajusteMargenGanancia; 
 return ret;
}

function calcularDeltaComisiones() {
	var i = Number(0);
  var importe=0;
  var totalComisiones = 0;
  var comisionesCosto = Number(0.00);
  var valor=Number(eval($('#precioFinal').attr('value')));
  $("[id^=porcentajeComision_]").each(function() {
       importe=Number($(this).attr('value'))*Number(valor)/Number(100);
       $('#importeComision_'+i).attr('value', Number(importe).toFixed(2));
       totalComisiones=Number(totalComisiones)+Number((importe).toFixed(2));
       i= Number(i)+Number(1); 
  });
  
  comisionesCosto = Number(calcularComisionesCosto());
  comisionesCosto = comisionesCosto.toFixed(2);
  
  return (Number(totalComisiones)-Number(comisionesCosto)); 
}

function getDeltaComisiones() {
  var comisionesPrecio = Number(0);
  $("[id^=porcentajeComision_]").each(function() {
      if ($(this).attr('value') != "" ) {
         comisionesPrecio += Number($(this).attr('value'));
      }
  });
  if (comisionesPrecio == Number(comisiones)) {
      return calcularDeltaComisiones();
  } else {
	 // if (Number($('#precioFinal').val()) < Number(precio)) {
	  if (Number($('#precioFinal').val()) < Number($('#costoTotal').val())) {
        return Number(0);
    } else {
      return calcularDeltaComisiones();
    }    
  }
}
function calcularComisiones() {
  var totalComisiones = calculoComisiones(true);
  
 
  $('#totalComisiones').attr('value', totalComisiones.toFixed(2));
  calcularRecuperoDeFondos();
}

/**
 * tipos de caso:
 * 2:Cuando se cargan bonificaciones, que en PS (precio sugerido) no se puede, el precio final puede ser menor al costo elegido ya redondeado. 
 * 1:Es cuando asigno los mismos % comisiones del costo al PS. 
 *	 Aquí se debe agregar al recupero de fondos la diferencia de redondeo (DELTA) dada por (preciofinal-costo)-(suma de comisiones del costo - suma de comisiones del PS).
 *	 Esta diferencia surge debido a que se redondea el costo para dar origen al precioFinal. Al hacer esto se generará
 *   una diferencia también en el total de comisiones por calcular las comisiones a partir de un nuevo valor.
 *
 * 4:Los %asignados de comision del PS son distintos a los del costo.
 * No se calcula DELTA, las diferencias que puedan existir de redondeo van a
 * Saldo a Distribuir (si la suma de %comis PS es menor que la del costo) o a
 * Costos no recuperados porque va a pérdida (Si la suma %comis PS es menor a la del costo). 
 */
 

function tipoCaso() {
	var comisionesPrecio = Number(0);
  var tipo = 0;
  deltaComisiones = calcularDeltaComisiones();
  $("[id^=porcentajeComision_]").each(function() {
      if ($(this).attr('value') != "" ) {
         comisionesPrecio += Number($(this).attr('value'));
      }
  });
  // el caso tipo 2 ocurre solo en presupuestos porque allá se pueden cargar bonificaciones 
  if (Number($('#precioFinal').val()) < Math.ceil($('#costoTotal').val())) {
	  tipo = 2;
  } else{
	  // si la suma de %comis del costo = suma de %comis del PS se calculará DELTA( importe que corrige problemas de redondeo 
	  // generados por  la dif. entre costo y Preciofinal) para sumar a recuperodefondos
	  if (comisionesPrecio == Number(comisiones)) {
	      tipo = 1;
	    } else {//si la suma de %comis costo <> a suma %comis.PS las dif.de redondeo existentes irán a saldo a distribuir o a costos no recuperados
    	  tipo = 4;
    	}    
  }
  
  return tipo;
}
/**
 * DELTA:
	 *	Es un valor que surge de diferencias en el redondeo por la diferencia entre el valor del Costo y el del PrecioFinal 
	 *	Se calcula: (preciofinal-costo)-(suma de comisiones del costo - suma de comisiones del PS)	
	 *	Este valor debe ser considerado o no según el tipo de operación (caso) que se está cargando. 
 *	
 *
 * DELTA será un valor a sumar en recuperoDefondos para solucionar los problemas en los redondeos en Tipo Caso:1
 * 	
 * deltaPrecio es la diferencia entre el costo y el precioFinal (éste último es el costo redondeado)
 * deltaComisiones es el Total de comisiones de PS - (la suma de las comisiones del costo+ margen de ganancia informado)
 */
  
function calcularDelta() {
  var tipo = tipoCaso();
  var delta = Number(0);
  if (tipo == 2 || tipo == 4) {
    delta = Number(0);
  } else {
    delta = (Number(deltaPrecio) - Number(deltaComisiones));
  }
  if (delta < Number(0)) {
    delta = Number(0);
  } 
  return delta;
}

/*
* RECUPERO DE FONDOS 
* Se calcula con datos del costo: suma de los costos +importe Riesgo- manoDeObra- (porcentajeRiesgo*manoDeObra)+ DELTA
* Ver DELTA->se calcula en este jsp
*/

function calcularRecuperoDeFondos() {
	var tipo = tipoCaso();
	calCularDeltaPrecio();
	delta = calcularDelta();
	var recupero = Number(0);
 
	if (tipo == 2) {
		recupero = Number($('#precioFinalDistribucion').val()) - Number($('#totalComisiones').val());
		recupero = Number(recupero)+Number(delta);
    formula='Recupero = Precio Final - Total de Comisiones';
    data=recupero+' = '+$('#precioFinalDistribucion').val()+' - '+$('#totalComisiones').val();
  } else if (tipo == 4 || tipo == 1) {
	  recupero = Number(sumaCostos)+Number(importeRiesgo)-Number(manoDeObra);
	  recupero=Number(recupero)-Number(porcentajeRiesgo)*Number(manoDeObra);
	 
	  recupero=Number(recupero)+Number(delta);
	  var formula='Recupero = (Costos + Importe Riesgo - Costo No Recuperable - % Factor riesgo * Costo No Recuperable) + Costos Adicionales + delta'
	  var data=recupero+' = ('+ sumaCostos+' + '+importeRiesgo+' - '+manoDeObra;
	  data=data+' - '+porcentajeRiesgo+'*'+manoDeObra+')+'+delta.toFixed(2);
  }
  //Esto no aparece en lo documentado por Lety      
	if ((Number(calculoComisiones(false)) + Number(recupero)) > Number($('#precioFinalDistribucion').val())) {
		recupero = Number($('#precioFinalDistribucion').val()) - Number($('#totalComisiones').val());
		formula='Recupero = Precio Final - Total de Comisiones';
		data=recupero+' = '+$('#precioFinalDistribucion').val()+' - '+$('#totalComisiones').val();
	}   
	
	//$('#recuperoDeFondos').attr('value',Math.ceil(recupero).toFixed(2));
	$('#recuperoDeFondos').attr('value', recupero.toFixed(2));
  agregarDerecha(formula);
  agregarDerecha(data);
  calcularSaldoDistribuir();	
}


function calcularSaldoDistribuir() {
  var distribuir=Number($('#precioFinalDistribucion').val());
  var totalComisiones = calculoComisiones(true);
  distribuir=Number(distribuir)-Number(totalComisiones);
  distribuir=Number(distribuir)-Number($('#recuperoDeFondos').val())
  distribuir = distribuir.toFixed(2);
  distribuir = Number(distribuir);
  distribuir = distribuir.toFixed(2);
  var formula ='Saldo a Distribuir = Precio Final - Total Comisiones - Recupero Fondos';
  var data=distribuir+' = '+$('#precioFinalDistribucion').val()+' - '+totalComisiones+' - '+$('#recuperoDeFondos').val();
  agregarDerecha(formula);
  agregarDerecha(data);
  $('#saldoADistribuir').attr('value', distribuir);
  if (Number(distribuir) <= Number(0)) {
    deshabilitarComisionesAdicionales();
    arreglarNumeros();
  } else {
    habilitarComisionesAdicionales();
	  calcularComisionesAdicionales();
  }  
}

function deshabilitarComisionesAdicionales() {

	if($('#porcentajeComisionAdicional_0').val() != "" )
		porcentajeAdicionalTemp1 = $('#porcentajeComisionAdicional_0').val();
	if($('#porcentajeComisionAdicional_1').val() != "" )
	porcentajeAdicionalTemp2 = $('#porcentajeComisionAdicional_1').val();
	
	deshabilitarElemento('porcentajeComisionAdicional_0');
	deshabilitarElemento('porcentajeComisionAdicional_1');
	$('#porcentajeComisionCalculadoAdicional_0').attr('value', '0.00'); 
	$('#porcentajeComisionCalculadoAdicional_1').attr('value', '0.00');
	calcularComisionesAdicionales(); 
}

function habilitarComisionesAdicionales() {

    habilitarElemento('porcentajeComisionAdicional_0');
    habilitarElemento('porcentajeComisionAdicional_1');
	if($('#porcentajeComisionAdicional_0').val() != "" )
		porcentajeAdicionalTemp1 = $('#porcentajeComisionAdicional_0').val();
	if($('#porcentajeComisionAdicional_1').val() != "" )
	porcentajeAdicionalTemp2 = $('#porcentajeComisionAdicional_1').val();
	
    $('#porcentajeComisionAdicional_0').attr('value', porcentajeAdicionalTemp1); 
	$('#porcentajeComisionAdicional_1').attr('value', porcentajeAdicionalTemp2);
}

function calcularComisionesAdicionales() {
  var importe=Number(0);
  var total=Number(0);
	/*INSTITUTO*/
	var porcentajeInstituto=$('#porcentajeComisionAdicional_0').val();
	var porcentajeProductividad=$('#porcentajeComisionAdicional_1').val();
  if (porcentajeInstituto.length != 0 && porcentajeInstituto > 0) {
    formatImporte($('#porcentajeComisionAdicional_0')[0]);
  } else {
	  if (porcentajeProductividad.length != 0 && porcentajeProductividad > 0) {
		  porcentajeInstituto=Number(100)-Number(porcentajeProductividad);
	  } else {
		  porcentajeInstituto=Number(0);
    }
  }
  porcentajeInstituto = Number(porcentajeInstituto)/Number(100);
  importe = Number(porcentajeInstituto)*Number($('#saldoADistribuir').val());
  total = Number(importe)+Number($('#recuperoDeFondos').val());
  if (Number($('#precioFinalDistribucion').val()) != Number(0))
      porcentajeInstituto=(Number(total)*Number(100))/Number($('#precioFinalDistribucion').val());
  else
	  porcentajeInstituto = 0.00;
  if ($('#porcentajeComisionAdicional_0').val().length == 0)
    importe = Number(0.00);
  $('#importeComisionAdicional_0').attr('value', importe.toFixed(2));
  $('#porcentajeComisionCalculadoAdicional_0').attr('value', porcentajeInstituto.toFixed(2));
  
  /*PRODUCTIVIDAD*/
  if (porcentajeProductividad.length != 0 && porcentajeProductividad > 0) {
	  formatImporte($('#porcentajeComisionAdicional_1')[0]);
	  porcentajeProductividad=Number(porcentajeProductividad)/Number(100);
    importe=Number(porcentajeProductividad)*Number($('#saldoADistribuir').val());
    if (Number($('#precioFinalDistribucion').val()) != Number(0))
    		  porcentajeProductividad=Number(importe)*Number(100)/Number($('#precioFinalDistribucion').val());
    else
    	  porcentajeProductividad = 0.00;
  } else {
	  porcentajeProductividad=Number(0);
    importe=Number(0);
  }
  $('#importeComisionAdicional_1').attr('value', importe.toFixed(2));
  $('#porcentajeComisionCalculadoAdicional_1').attr('value', porcentajeProductividad.toFixed(2)); 
	arreglarNumeros();
}

function arreglarNumeros() {
  casosEspeciales();
}

function casosEspeciales() {
    agregarDerecha('Casos Especiales:');
    if (Number($('#precioFinalDistribucion').val()) == Number(0)) {
        rec = $('#recuperoDeFondos').val();
        rec = Number(0) - Number(rec);
        $('#recuperoDeFondos').attr('value', rec.toFixed(2));
        var data ='Precio Final = 0 => Recupero Negativo';
        agregarDerecha(data);
    }
    if (Number($('#saldoADistribuir').val()) < Number(0)) {
    	$('#saldoADistribuir').attr('value', '0.00');
    	var data ='Saldo a distribuir < 0 => Saldo a Distribuir = 0';
      agregarDerecha(data);
    }

    /*Esto arregla el porcentaje de Instituto cuando la suma no da*/
    if (Number($('#saldoADistribuir').val()) == Number(0)) {
    	arreglarComisionesAdicionales();
    } else {
    	totalPorcentajes = Number(0);
    	totalPorcentajes = Number(totalPorcentajes) + Number($('#porcentajeComisionAdicional_0').val());
  	  totalPorcentajes = Number(totalPorcentajes) + Number($('#porcentajeComisionAdicional_1').val());
  	  if (Number(totalPorcentajes) == Number(100)) {
  		  arreglarComisionesAdicionales();
  	  }
    }
    calcularFondosNoRecuperados();      
}

function arreglarComisionesAdicionales() {
	totalPorcentajes = Number(0);
  $("[id^=porcentajeComision_]").each(function() {
      if ($(this).attr('value') != "" ) {
         totalPorcentajes = Number(totalPorcentajes) + Number($(this).val());               
      }     
  });
  totalPorcentajes = Number(totalPorcentajes) + Number($('#porcentajeComisionCalculadoAdicional_0').val());
  totalPorcentajes = Number(totalPorcentajes) + Number($('#porcentajeComisionCalculadoAdicional_1').val());
  if (totalPorcentajes != Number(100)) {
    resto = Number(100) - Number(totalPorcentajes);
    valor = Number($('#porcentajeComisionCalculadoAdicional_0').val()) + Number(resto); 
    $('#porcentajeComisionCalculadoAdicional_0').attr('value', valor.toFixed(2));
  } 
}

function calcularFondosNoRecuperados() {
  var formula = 'FondosNoRecup=(sumaCostos+importeRiesgo-manoDeObra-%Riesgo*manoDeObra)*cantidad+totalCostosAdicionales-RecuperoFondos';
  var data = "("+sumaCostos+"+"+importeRiesgo+"-"+manoDeObra+"-"+porcentajeRiesgo+"*"+manoDeObra+")-"+$('#recuperoDeFondos').val();
	var importe = Number(sumaCostos)+Number(importeRiesgo)-Number(manoDeObra);
	importe=Number(importe)-Number(porcentajeRiesgo)*Number(manoDeObra);
	
	//importe=Number(importe)+Number($('#totalCostosAdicionales').val());
  importe = Number(importe)-Number($('#recuperoDeFondos').val());
  importe = importe.toFixed(2)
  if (Number(importe) <= Number(0)) {
     $(".divCostosNoRecuperados").each(function() {
         $(this).hide();
     });
     $('#costosNoRecuperados').attr('value', "0.00");
  } else {
     $(".divCostosNoRecuperados").each(function() {
         $(this).show();
     });
     $('#costosNoRecuperados').attr('value', importe);
  }
  agregarDerecha(formula);
  agregarDerecha(data);
  //controlarNumeros();
}

function controlarNumeros() {
 var PF = $('#precioFinalDistribucion').val();
 var RF = $('#recuperoDeFondos').val();
 var TC = $('#totalComisiones').val();
 var SD = $('#saldoADistribuir').val();
 var r = Number(0);
 if($('.divCostosNoRecuperados').is(':visible')) {
   //SubtotalCosto*cantidad+CostosAdicionales=RecuperoFondos+CostoNoRecuperado
   var subtotalCosto = Number(sumaCostos)*(Number(1)+Number(porcentajeRiesgo));
   subtotalCosto = subtotalCosto.toFixed(2);
   //var cantidad = $('#cantidad').val();
   //var CA =  $('#totalCostosAdicionales').val();
   var CNR = $('#costosNoRecuperados').val();
   RF = $('#recuperoDeFondos').val();
   r = Number(subtotalCosto)-Number(RF)-Number(CNR);
   r = Number(r)+Number(RF);
   $('#recuperoDeFondos').attr('value' , r.toFixed(2));
 } else {
   //TotalComisiones+RecuperoFondos+SaldoDistribuir=PrecioFinal
   r = Number(PF)-Number(TC)-Number(RF)-Number(SD);
   r = Number(r)+Number(RF);
   $('#recuperoDeFondos').attr('value' , r.toFixed(2));
 }
}

</script>

<logic:equal value="input" name="tipoPantalla">

<div id="precio">
<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
  <tr>
    <td class="CformAreaBotones">
      <div align="center" >
        <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" onclick="irTabInicial()" />
        <input type="button" class="CformBotonTranspBorde" value="&lt;" onclick="irTabAnterior()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;"  onclick="irTabSiguiente()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|"  onclick="irTabFinal()" />
      </div>
    </td>
  </tr>
</table>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" width="100%">
      <table align="center" cellpadding="0" cellspacing="0" width="100%" >
        <tr>
          <td>
            <table width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td>

                 <table width="100%">
                    <tr>
                      <td class="labelSeparador">
                        Precio Sugerido
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                     <tr>
                      <td class="CformNombre">
                        Descripción:&nbsp;<span class="dato_obligatorio">*</span>
                      </td>
                      <td class="CformDato">
                        <html:text style="text-align:left" property="descripcionPrecioSugerido" size="50" maxlength="50" />
                      </td>
                    </tr>
                   </table>
				</td>
			  </tr>	                    
              
              
              <tr>
                <td>
                  <table width="100%">
                    <tr>
                      <td class="labelSeparador">
                        Costo Mínimo&nbsp;<span class="dato_obligatorio">*</span>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table class="displayTable" name='<%= costos %>' id='<%= pageName %>' defaultsort="1" defaultorder="descending" style="width:100%;" decorator="conicet.apps.svt.web.precioSugerido.decorator.CCostoSeleccionarPrecioSugeridoDisplayWrapper">
                          <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 400px;" />
                          <display:column property="costoPesos" title="Importe ($)" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 150px;" />
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
				     
				        <td class="CformAreaBotones" >
			              <div align="right" >
		  	                <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar"/>
			              </div>
			 	        </td>
			 	     
				      </tr>
			        </table>
		          </td>
		    </tr>
                         
            <tr>
              <td>          
                  
                  
                 
                 <table width="100%">
                    <tr>
                      <td class="labelSeparador">
                        Precio Oferta&nbsp;
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    
                    <tr>
                      <td width="130" class="CformNombre">
                        Margen de Ganancia:&nbsp;
                      </td>
                      <td class="CformDato" width="8">
                        <html:radio property="tipoMargenGanacia" value="porcentual" name="form" onclick="cambioTipoGanancia()" styleClass="desactivable"/>
                      </td>
                      <td width="15" class="CformNombre">
                        %
                      </td>
                      <td class="CformDato" width="102">
                        <html:text property="porcentajeGanancia" style="text-align:right" size="6" maxlength="6" styleId="porcentajeGanancia" onblur="calculoGanancia()" styleClass="desactivable"/>
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="margenGananciaPorcentual" size="16" maxlength="12" styleId="margenGananciaPorcentual"/>
                      </td>
                    </tr>
                    <tr>
                      <td/>
                      <td class="CformDato" width="8">
                        <html:radio property="tipoMargenGanacia" value="neto" name="form" onclick="cambioTipoGanancia()" styleClass="desactivable" />
                      </td>
                      <td width="15" class="CformNombre">
                        $
                      </td>
                      <td/>
                      <td class="CformDato">
                        <html:text property="margenGananciaNeto" style="text-align:right" size="16" maxlength="12" styleId="margenGananciaNeto" onblur="calculoGanancia()" styleClass="desactivable" />
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td width="285" class="CformNombre">
                        Ajuste comisiones sobre margen de ganancia:&nbsp;
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="ajusteComisionesGanancia" size="16" maxlength="12" styleId="ajusteComisionesGanancia"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">
                        Precio Oferta:&nbsp;
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="ofertaPrecio" size="16" maxlength="12" styleId="ofertaPrecio"/>
                      </td>
                    </tr>
                  
                    <tr>
                      <td class="CformNombre">
                        Precio Final&nbsp;<span class="dato_obligatorio">(1)</span>
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="precioFinal" size="16" maxlength="12" styleId="precioFinal"/>
                      </td>
                    </tr>
                  </table>
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
      <span class="dato_obligatorio">* Datos obligatorios</span>
    </td>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
        <logic:equal value="precioAlta" name="pageName">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
        </logic:equal>
      </div>
    </td>
  </tr>
</table>
<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
  <tr>  
    <td ><span class="dato_obligatorio">(1)</span>
      El precio final ha sido redondeado al valor entero superior.
    </td>
  </tr>
</table>
</div>
<div id="distribucion">
<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
  <tr>
    <td class="CformAreaBotones">
      <div align="center" >
        <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" onclick="irTabInicial()" />
        <input type="button" class="CformBotonTranspBorde" value="&lt;" onclick="irTabAnterior()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;"  onclick="irTabSiguiente()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|"  onclick="irTabFinal()" />
      </div>
    </td>
  </tr>
</table>
<div id="debug">
  <div id ="debugLeft" style="float: left; padding-right: 30;">
  </div>
  <div id ="debugRight" style="float: left; text-align: left;">
  </div>
</div>
<div style="clear: both"></div>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td colspan="2" width="100%">
      <table align="center" cellpadding="0" cellspacing="0" width="100%" >
        <tr>
          <td>
            <table width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                  <table width="100%">
                    <tr>
                      <td class="labelSeparador">
                        Distribución&nbsp;
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td width="140" class="CformNombre" style="text-align: left;" colspan="3">
                        Precio Final
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="precioFinal" size="16" maxlength="12" styleId="precioFinalDistribucion"/>
                      </td>
                    </tr>
                  </table>
                  <table align="center" width="100%">
                    <tr bgcolor="#DDEEFF">
                       <td>Comisiones:<span class="dato_obligatorio">*</span></td>
                    </tr>
                    <tr>
                      <td colspan="10">
                        <display:table name='<%= distribucion %>' id='<%= pageName %>' style="width:100%;" decorator="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoComisionesDisplayWrapper">
                          <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                          <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                          <display:column property="porcentajeComision" title="%" headerClass="tableCellHeader" style="width: 100px;" />
                          <display:column property="importeComision" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                        </display:table>
                      </td>
                    </tr>
                 </table>
                 <table width="100%">
                    <tr>
                      <td width="362" class="CformNombre" style="text-align: left;" colspan="3">
                        Total Comisiones
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalComisiones" size="16" maxlength="12" styleId="totalComisiones"/>
                      </td>
                    </tr>
                    <tr>
                      <td width="362" class="CformNombre" style="text-align: left;" colspan="3">
                        Costos
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="recuperoDeFondos" size="16" maxlength="12" styleId="recuperoDeFondos"/>
                      </td>
                    </tr>
                    <tr>
                      <td width="362" class="CformNombre" style="text-align: left;" colspan="3">
                        Saldo a Distribuir (Beneficio)
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="saldoADistribuir" size="16" maxlength="12" styleId="saldoADistribuir"/>
                      </td>
                    </tr>
                  </table>
                  <table align="center" width="100%">
                    <tr>
                      <td colspan="10">
       
                        <display:table name='<%= distribucionAdicional %>' id='<%= pageName %>' style="width:100%;" decorator="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoComisionesDisplayWrapper">
                          <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                          <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                          <display:column property="porcentajeComisionAdicional" title="%" headerClass="tableCellHeader" style="width: 100px;" />
                          <display:column property="importeComisionAdicional" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                        </display:table>
       
                      </td>
                    </tr>
                  </table>
                  <div class="divCostosNoRecuperados">
                    <table width="100%">
                      <tr>
                      <td width="362" class="CformNombre" style="text-align: left;" colspan="3">
                        Costos no recuperados:
                      </td>
                      <td class="CformDato">
                        <html:text readonly="true" styleClass="textDisabled" style="text-align:right" property="costosNoRecuperados" size="16" maxlength="12" styleId="costosNoRecuperados"/>
                      </td>
                    </tr>
                    </table>
                  </div>
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
      <span class="dato_obligatorio">* Datos obligatorios</span>
    </td>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
            <jsp:param name="entidad" value="precio_sugerido" />
        </jsp:include> 
      </div>
    </td>
  </tr>
</table>
<!--  table  align="center" cellpadding="0" cellspacing="0" width="500">
  <tr>
    <td ><span class="dato_obligatorio">(1)</span>
      Si el estado es Aceptado los datos de la distribución son obligatorios.
    </td>
  </tr>
</table-->
</div>
</logic:equal>

<logic:equal value="view" name="tipoPantalla">
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
    <tr>
      <td colspan="2" width="100%">
        <table align="center" cellpadding="0" cellspacing="0" width="100%" >
          <tr>
            <td>
              <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td>
                                       
                 
                    <table width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                        <td>
                         
                           <table width="100%">
                            <tr>
                              <td class="labelSeparador">
                                Precio Sugerido
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                             <tr>
		                      <td  width="10" class="CformNombre">
		                        Descripción:&nbsp;
		                      </td>
		                      <td class="CformDato">
		                        
		                        <bean:write property="descripcionPrecioSugerido" name="form" />
		                      </td>
		                    </tr>
		                  </table>
                         
                         
                          <table width="100%">
                            <tr>
                              <td class="labelSeparador">
                                Costo Mínimo&nbsp;
                              </td>
                            </tr>
                          </table>
                           
                           
	                          <table width="100%">
	                            <tr>
	                              <td colspan="10">
	                                <display:table class="displayTable" name='<%= costos %>' id='<%= pageName %>' defaultsort="1" defaultorder="descending" style="width:100%;" decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
	                                  <logic:equal value="si" name="displayLinks">
	                                    <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
	                                  </logic:equal>
	                                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 450px;" />
	                                  <display:column property="costoPesos" title="Importe ($)" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 150px;" />
	                                </display:table>
	                              </td>
	                            </tr>
	                          </table>
                           

                         
                         
                          <table width="100%">
                            <tr>
                              <td class="labelSeparador">
                                Precio Oferta
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                            <tr>
                              <td width="280" class="CformNombre">
                                Margen de Ganancia:&nbsp;
                              </td>
                              <td class="CformDato" width="8">
                                <html:radio disabled="true" property="tipoMargenGanacia" value="porcentual" name="form"/>
                              </td>
                              <td width="15" class="CformNombre">
                                %
                              </td>
                              <td class="CformDato" width="102">
                                <html:text styleClass="textDisabled" readonly="true" property="porcentajeGanancia" style="text-align:right" size="6" maxlength="4" styleId="porcentajeGanancia"/>
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="margenGananciaPorcentual" size="16" maxlength="12" styleId="margenGananciaPorcentual"/>
                              </td>
                            </tr>
                            <tr>
                              <td/>
                              <td class="CformDato" width="8">
                                <html:radio disabled="true" property="tipoMargenGanacia" value="neto" name="form"/>
                              </td>
                              <td width="15" class="CformNombre">
                                $
                              </td>
                              <td/>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" readonly="true" property="margenGananciaNeto" style="text-align:right" size="16" maxlength="12" styleId="margenGananciaNeto"/>
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                            <tr>
                              <td width="150"> </td>
                              <td width="280" class="CformNombre">
                                Ajuste comisiones sobre margen de ganancia:&nbsp;
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="ajusteComisionesGanancia" size="16" maxlength="12" styleId="ajusteComisionesGanancia"/>
                              </td>
                            </tr>
                            <tr>
                             <td width="150"> </td>
                              <td class="CformNombre">
                                Precio Oferta:&nbsp;
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="ofertaPrecio" size="16" maxlength="12" styleId="ofertaPrecio"/>
                              </td>
                            </tr>
                          <tr>
                             <td width="150"> </td> 
                              <td class="CformNombre">
                                Precio Final:&nbsp;
                                <logic:equal value="precioDetalle" name="pageName">                           
                                  	<span class="dato_obligatorio">(1)</span>
                                </logic:equal>
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="precioFinal" size="16" maxlength="12" styleId="precioFinal"/>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    
                    <table align="center" width="100%">
                      <tr bgcolor="#DDEEFF">
                         <td>Comisiones:</td>
                      </tr>
                      <tr>
                        <td colspan="10">
                       
                          <display:table name='<%= distribucion %>' id='<%= pageName %>' style="width:100%;" decorator="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoComisionesDisplayWrapper">
                            <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                            <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                            <display:column property="porcentajeComisionCfm" title="%" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="importeComision" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                   <table width="100%">
                      <tr>
                        <td width="358" class="CformNombre" style="text-align: left;" colspan="3">
                          Total Comisiones:&nbsp;
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalComisiones" size="16" maxlength="12" styleId="totalComisiones"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="300" class="CformNombre" style="text-align: left;" colspan="3">
                          Costos:&nbsp;
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="recuperoDeFondos" size="16" maxlength="12" styleId="recuperoDeFondos"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="300" class="CformNombre" style="text-align: left;" colspan="3">
                          Saldo a Distribuir (Beneficio):&nbsp;
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="saldoADistribuir" size="16" maxlength="12" styleId="saldoADistribuir"/>
                        </td>
                      </tr>
                    </table>
                    <table align="center" width="100%">
                      <tr>
                        <td colspan="10">
                    
                          <display:table name='<%= distribucionAdicional %>' id='<%= pageName %>' style="width:100%;" decorator="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoComisionesDisplayWrapper">
                            <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                            <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                            <display:column property="porcentajeComisionAdicionalCfm" title="%" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="importeComisionAdicionalCfm" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                          </display:table> 
                   
                          
                        </td>
                      </tr>
                    </table>
                    <logic:notEqual name="costosNoRecuperados" value="0.00">
                      <table width="100%">
                        <tr>
                        <td width="362" class="CformNombre" style="text-align: left;" colspan="3">
                          Costos no recuperados:&nbsp;
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="costosNoRecuperados" size="16" maxlength="12" styleId="costosNoRecuperados"/>
                        </td>
                      </tr>
                      </table>
                    </logic:notEqual>
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
            <jsp:param name="entidad" value="precio_sugerido" />
          </jsp:include>
        </div>
      </td>
    </tr>
  </table>
  <logic:equal value="precioDetalle" name="pageName">  
  <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>  
        <td ><span class="dato_obligatorio">(1)</span>
          El precio final ha sido redondeado al valor entero superior.
        </td>
      </tr>
  </table>
  </logic:equal>
</logic:equal>