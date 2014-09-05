<%@include file="/jsp/layout/include.jsp"%>

<bean:define id="form" name='<%= request.getParameter("formulario") %>' />
<bean:define id="stan" name="form" property="stan" />
<bean:define id="costosNoRecuperados" name="form" property="costosNoRecuperados" />
<bean:define id="prestador" name="form" property="listaPrestador" />
<bean:define id="unidadPrestacion" name="stan" property="unidadPrestacion" />
<bean:define id="costos" name="form" property="costos" />
<bean:define id="stanCosto" name="form" property="listaStanCosto" />
<bean:define id="costosAdicionales" name="form" property="costosAdicionales" />
<bean:define id="distribucion" name="form" property="distribucionStruct" />
<bean:define id="distribucionAdicional" name="form" property="distribucionAdicional" />
<bean:define id="botones" name="form" property="botones" />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="costoCfm" name="form" property="costoCfm" />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<bean:define id="beneficiarios" name="form" property="listaBeneficiarios" />

<style>
#debug {
    align: center;
}
</style>
<script>
//Esta variable es para activar y desactivar el div de debug
debug=false;

var deltaPrecio = Number(0.00);
var deltaComisiones = Number(0.00);
var delta = Number(0.00);

function prepare() {
  disableAndInicialize('totalCostosAdicionales');
  disableAndInicialize('ajusteComisiones');
  disableAndInicialize('costoTotal');
  disableAndInicialize('porcentajeGanancia');
  disableAndInicialize('margenGananciaPorcentual');
  disableAndInicialize('margenGananciaNeto');
  disableAndInicialize('ajusteComisionesGanancia');
  disableAndInicialize('ofertaPrecio');
  disableAndInicialize('porcentajeBonificacion');
  disableAndInicialize('bonificacionPorcentual');
  disableAndInicialize('bonificacionNeta');
  disableAndInicialize('precioFinal');
  var tipoBonificacion = $("input[name='tipoBonificacion']:checked").val();
  if (tipoBonificacion == "ninguno") {
    deshabilitarElemento('porcentajeBonificacion');
    $('#porcentajeBonificacion').attr('value',"0.00");
    deshabilitarElemento('bonificacionNeta');
    $('#bonificacionNeta').attr('value',"0.00");
  } else if (tipoBonificacion == "porcentual") {
    deshabilitarElemento('bonificacionNeta');
    $('#bonificacionNeta').attr('value',"0.00");
    habilitarElemento('porcentajeBonificacion');
  } else if (tipoBonificacion == "neto") {
    deshabilitarElemento('porcentajeBonificacion');
    $('#porcentajeBonificacion').attr('value',"0.00");
    habilitarElemento('bonificacionNeta');
  }
  var tipoGanancia = $("input[name='tipoMargenGanacia']:checked").val();
  if (tipoGanancia == "porcentual") {
    deshabilitarElemento('margenGananciaNeto');
    $('#margenGananciaNeto').attr('value',"0.00");
    habilitarElemento('porcentajeGanancia');
  } else if (tipoGanancia == "neto") {
    deshabilitarElemento('porcentajeGanancia');
    $('#margenGananciaPorcentual').attr('value',"0.00");
    habilitarElemento('margenGananciaNeto'); 
  }
  calcularPrecioOferta();
  
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
    var modificable = '<bean:write name="form" property="modificable"/>';
    if (modificable == 'N') {
      $(".desactivable").each(function() {
        if ($(this).is('div') ) {
          $(this).hide();
        } else {
          deshabilitarElement($(this));
        }      
      });  
    }
}


//Funciones para limpiar la pantalla
function limpiarTabPrecio(costoSeleccionado, precio, comisiones, sumaCostos, importeRiesgo, manoDeObra, porcentajeRiesgo){
	seleccionarCosto(costoSeleccionado, precio, comisiones, sumaCostos, importeRiesgo, manoDeObra, porcentajeRiesgo);
	controlAcumulado();
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

function getCostoValues(index) {
  //Cada vez que se selecciona un costo mando por Post el indice seleccionado 
  url='<bean:write name="actionName" />';
  $.post(url, { btnSubmit: "sendCostoSeleccionado", costoSeleccionado: index });
}

//Funciones de la seccion de Costo Minimo
function seleccionarCosto(index,costoPesos,comision,sumCostos,factorRiesgo, manoObra, porcentajeImprevisto){
  getCostoValues(index);
  var selected = 'costo['+index+']';
	$("[id^=costo\\[]").each(function() {
     if ($(this).attr('id') != selected) {
    	  $(this).attr('checked', false);
     } else
    	 $(this).attr('checked', true);    
	});
	precio=costoPesos;
  comisiones= comision;
  sumaCostos=sumCostos;
  importeRiesgo=factorRiesgo;
  manoDeObra=manoObra;
  costoSeleccionado=index;
  porcentajeRiesgo=porcentajeImprevisto; 
  calcularSubtotalPrecio();
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
  var cantidad = $('#cantidad');
  formatoEntero(cantidad);
  subtotal = Number(precio)*Number(cantidad.val());
	$('#subtotalPrecio').val(subtotal.toFixed(2));
	calculoComisionesSobreAdicionales(); 
}

//Funciones de la Seccion de Costos Adicionales

function formatCostoAdicionalCalcularTotal(obj) {
  formatImporte(obj);
  controlAcumulado();
}

function controlAcumulado() {
  var total = Number(0.00);
  var costo = Number(0.00);
	$("[id^=costoAdicional_]").each(function() {
    if ($(this).attr('value') != '') {
      costo = eval($(this).attr('value'));
      costo = Math.round((costo) * 100) / 100;
      total = Math.round((total + Number(costo)) * 100) / 100;  
    }  
  });
  $('#totalCostosAdicionales').val(total.toFixed(2));
  calculoComisionesSobreAdicionales();       
}

function calculoComisionesSobreAdicionales() {
  var totalAdicionles = $('#totalCostosAdicionales').val();
  var comisionesAdic = (totalAdicionles/(1 - (Number(comisiones) / 100)))-totalAdicionles;
  $('#ajusteComisiones').val(Number(comisionesAdic).toFixed(2)); 
  calcularCostoTotal();      
}

function calcularCostoTotal() {
  var suma = Number($('#subtotalPrecio').val())+Number($('#totalCostosAdicionales').val());
  suma = Number(suma)+Number(+$('#ajusteComisiones').val());
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
	var modificable = '<bean:write name="form" property="modificable"/>';
  var element = $('#'+elemento+'');
  if (modificable != 'N' || !element.hasClass('desactivable')) {
  	element.attr('readonly', false);
    element.removeClass('textDisabled');
  }   
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
}
function calcularAjusteComisionesGanancia() {
	var valor = $('#margenGananciaNeto').val();
  var comisionesGanacia = (valor/(1-(Number(comisiones)/100)))-valor;
  valor = $('#margenGananciaPorcentual').val();
  comisionesGanacia = comisionesGanacia + (valor/(1-(Number(comisiones)/100)))-valor;
  $('#ajusteComisionesGanancia').val(comisionesGanacia.toFixed(2)); 
  calcularPrecioOferta();      
}

function calcularGananciaPorcentual() {
  var elemento = $('#porcentajeGanancia');
	formatImporte(elemento[0]);
	var aux = Number($('#porcentajeGanancia').val()) / Number(100);
  aux = Number(aux)*Number($('#costoTotal').val());
  $('#margenGananciaPorcentual').attr('value', aux.toFixed(2)); 
}

function calcularGananciaNeta() {
	var elemento = $('#margenGananciaNeto');
  formatImporte(elemento[0]);
}

function calcularPrecioOferta() {
  var aux = Number($('#costoTotal').val()) + Number($('#margenGananciaPorcentual').val());
  aux = Number(aux) + Number($('#margenGananciaNeto').val());
  aux = Number(aux) + Number($('#ajusteComisionesGanancia').val());
  $('#ofertaPrecio').attr('value',aux.toFixed(2));
  cambioTipoBonificacion();
}

//Funciones de la seccion Bonficacion

function calcularPrecioFinal() {
  var aux = Number($('#ofertaPrecio').val()) - Number($('#bonificacionPorcentual').val());
  aux = Number(aux) - Number($('#bonificacionNeta').val());
  deltaPrecio=Math.ceil(aux) - Number(aux);
  $('#precioFinal').attr('value',Math.ceil(aux).toFixed(2));
  $('#precioFinalDistribucion').attr('value',Math.ceil(aux).toFixed(2));
  calcularComisiones();
}

function calculoPorcentajesSobrePrecioFinal() {
	  var pf = $('#precioFinal').val();
  
	  var psd = (100 / Number(pf)*Number($('#saldoADistribuir').val())) ;
	  $('#porcentajeSaldoADistribuir').val(Number(psd).toFixed(2)); 
	  var prf = (100 / Number(pf)*Number($('#recuperoDeFondos').val())) ;
	  $('#porcentajeRecuperoDeFondos').val(Number(prf).toFixed(2)); 
	  
	  var pca0 = (100 / Number(pf)*Number($('#importeComisionAdicional_0').val())) ;
	  $('#porcentajeComisionAdicionalPF_0').val(Number(pca0).toFixed(2)); 
	  var pca1 =Number(psd).toFixed(2)-Number(pca0).toFixed(2);

	  var totalCA =Number($('#porcentajeComisionAdicional_0').val()) +Number($('#porcentajeComisionAdicional_1').val())  ;
	  if (totalCA != 100){
		  pca1 = (100 / Number(pf)*Number($('#importeComisionAdicional_1').val())) ;
	  }
	  $('#porcentajeComisionAdicionalPF_1').val(Number(pca1).toFixed(2));
	  
	  
}


function calCularDeltaPrecio() {
	var aux = Number($('#ofertaPrecio').val()) - Number($('#bonificacionPorcentual').val());
	aux = Number(aux) - Number($('#bonificacionNeta').val());
	deltaPrecio=Math.ceil(aux) - Number(aux);    
}

function cambioTipoBonificacion() {
  var tipo = $("input[name='tipoBonificacion']:checked").val();
  if (tipo == "ninguno") {
	  deshabilitarElemento('porcentajeBonificacion');
    $('#porcentajeBonificacion').attr('value',"");
    deshabilitarElemento('bonificacionNeta');
  } else if (tipo == "porcentual") {
	  deshabilitarElemento('bonificacionNeta');
	  $('#bonificacionNeta').attr('value',"");
	  habilitarElemento('porcentajeBonificacion');
  } else if (tipo == "neto") {
	  deshabilitarElemento('porcentajeBonificacion');
    $('#porcentajeBonificacion').attr('value',"");
    habilitarElemento('bonificacionNeta');
  }
  calculoBonificacion();
}

function calculoBonificacion() {
	calcularBonificacionPorcentual();
  calcularBonificacionNeta();
  calcularPrecioFinal();
}

function calcularBonificacionPorcentual() {
  var elemento = $('#porcentajeBonificacion');
  formatImporte(elemento[0]);
  var aux = Number($('#porcentajeBonificacion').val()) / Number(100);
  aux = Number(aux)*Number($('#ofertaPrecio').val());
  $('#bonificacionPorcentual').attr('value', aux.toFixed(2));
}

function calcularBonificacionNeta() {
  var elemento = $('#bonificacionNeta');
  formatImporte(elemento[0]);
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
	       $('#porcentajeComisionPF_'+i).attr('value',Number($(this).attr('value')).toFixed(2));
         if (fixed)
        	  totalComisiones=Number(totalComisiones)+Number((importe).toFixed(2));
         else 
        	 totalComisiones=Number(totalComisiones)+Number(importe);
	       i= Number(i)+Number(1); 
	  });
    return totalComisiones;
}

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

 //Calculo Ajuste de Comisiones sobre Costos Adicionales
 var totalCostosAdicionles = Number($('#totalCostosAdicionales').val());
 ajusteComisionesAdicionales = Number(totalCostosAdicionles)*Number(aux);

 //Calculo Ajuste de Comisiones sobre Margen de Ganancia
 var valor = Number($('#margenGananciaNeto').val()) + Number($('#margenGananciaPorcentual').val());
 ajusteMargenGanancia = Number(valor)*Number(aux);
  
 ret = comisionesCosto*Number($('#cantidad').val()) + ajusteComisionesAdicionales + ajusteMargenGanancia; 
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

function tipoCaso() {
	var comisionesPrecio = Number(0);
  var tipo = 0;
  deltaComisiones = calcularDeltaComisiones();
  $("[id^=porcentajeComision_]").each(function() {
      if ($(this).attr('value') != "" ) {
         comisionesPrecio += Number($(this).attr('value'));
      }
  });
  if (comisionesPrecio == Number(comisiones)) {
	  if (Number($('#precioFinal').val()) < Math.ceil($('#costoTotal').val())) {
      tipo = 2;
    } else {
      tipo = 1;
    }   
  } else {
    if (Number($('#precioFinal').val()) < Math.ceil($('#costoTotal').val())) {
      tipo = 2;
    } else {
      tipo = 4;
    }    
  }
  return tipo;
}

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

function calcularRecuperoDeFondos() {
	var tipo = tipoCaso();
	delta = calcularDelta();
	var recupero = Number(0);
  var cantidad = $('#cantidad').val();
	if (tipo == 2) {
		recupero = Number($('#precioFinalDistribucion').val()) - Number($('#totalComisiones').val());
		recupero = Number(recupero)+Number(delta);
    formula='Costos = Precio Final - Total de Comisiones';
    data=recupero+' = '+$('#precioFinalDistribucion').val()+' - '+$('#totalComisiones').val();
  } else if (tipo == 4 || tipo == 1) {
	  recupero = Number(sumaCostos)+Number(importeRiesgo)-Number(manoDeObra);
	  recupero=Number(recupero)-Number(porcentajeRiesgo)*Number(manoDeObra);
	  recupero=Number(recupero)*Number(cantidad);
	  recupero=Number(recupero)+Number($('#totalCostosAdicionales').val())+Number(delta);
	  var formula='Costos = (Costos + Importe Riesgo - Costo No Recuperable - % Factor riesgo * Costo No Recuperable)*cantidad + Costos Adicionales + delta'
	  var data=recupero+' = ('+ sumaCostos+' + '+importeRiesgo+' - '+manoDeObra;
	  data=data+' - '+porcentajeRiesgo+'*'+manoDeObra+')*'+cantidad+'+'+$('#totalCostosAdicionales').val()+'+'+delta.toFixed(2);
  }
  //Esto no aparece en lo documentado por Lety      
	if ((Number(calculoComisiones(false)) + Number(recupero)) > Number($('#precioFinalDistribucion').val())) {
		recupero = Number($('#precioFinalDistribucion').val()) - Number($('#totalComisiones').val());
		formula='Costos = Precio Final - Total de Comisiones';
		data=recupero+' = '+$('#precioFinalDistribucion').val()+' - '+$('#totalComisiones').val();
	}   
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
  var formula ='Saldo a Distribuir = Precio Final - Total Comisiones - Costos';
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
	deshabilitarElemento('porcentajeComisionAdicional_0');
	deshabilitarElemento('porcentajeComisionAdicional_1');
	$('#porcentajeComisionCalculadoAdicional_0').attr('value', '0.00'); 
	$('#porcentajeComisionCalculadoAdicional_1').attr('value', '0.00');
	
	calcularComisionesAdicionales(); 
}

function habilitarComisionesAdicionales() {
    habilitarElemento('porcentajeComisionAdicional_0');
    habilitarElemento('porcentajeComisionAdicional_1');
}

function calcularComisionesAdicionales() {
  var importe=Number(0);
  var total=Number(0);
  /*INSTITUTO*/
  
  var porcentajeInstituto;
  if ($('#porcentajeComisionAdicional_0').val() != "") {
	  formatImporte($('#porcentajeComisionAdicional_0')[0]);
	  porcentajeInstituto = $('#porcentajeComisionAdicional_0').val();
  } else {
	  porcentajeInstituto = "0";
  }
  porcentajeInstituto = Number(porcentajeInstituto) / Number(100);
  importe = Number(porcentajeInstituto) * Number($('#saldoADistribuir').val());
  total = Number(importe) + Number($('#recuperoDeFondos').val());
  if (Number($('#precioFinalDistribucion').val()) != Number(0)) {
      porcentajeInstituto=(Number(total)*Number(100)) / Number($('#precioFinalDistribucion').val());
  } else {
	  porcentajeInstituto = 0.00;
  }
  $('#importeComisionAdicional_0').attr('value', importe.toFixed(2));
  $('#porcentajeComisionCalculadoAdicional_0').attr('value', porcentajeInstituto.toFixed(2));
  
  /*PRODUCTIVIDAD*/  
  var porcentajeProductividad = $('#porcentajeComisionAdicional_1').val();
  if ($('#porcentajeComisionAdicional_1').val() != "") {
	formatImporte($('#porcentajeComisionAdicional_1')[0]);
	porcentajeProductividad = $('#porcentajeComisionAdicional_1').val();
  } else {
	  porcentajeInstituto = "0";
  }
  porcentajeProductividad = Number(porcentajeProductividad) / Number(100);
  importe = Number(porcentajeProductividad) * Number($('#saldoADistribuir').val());
  if (Number($('#precioFinalDistribucion').val()) != Number(0)) {
      porcentajeProductividad = Number(importe) * Number(100) / Number($('#precioFinalDistribucion').val());
  } else {
  	  porcentajeProductividad = 0.00;
  }
  $('#importeComisionAdicional_1').attr('value', importe.toFixed(2));
  $('#totalProductividadId').attr('value', importe.toFixed(2));
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
  var data = "("+sumaCostos+"+"+importeRiesgo+"-"+manoDeObra+"-"+porcentajeRiesgo+"*"+manoDeObra+")*"+$('#cantidad').val()+"+"+$('#totalCostosAdicionales').val()+"-"+$('#recuperoDeFondos').val();
	var importe = Number(sumaCostos)+Number(importeRiesgo)-Number(manoDeObra);
	importe=Number(importe)-Number(porcentajeRiesgo)*Number(manoDeObra);
	importe=Number(importe)*Number($('#cantidad').val());
	importe=Number(importe)+Number($('#totalCostosAdicionales').val());
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
  calculoPorcentajesSobrePrecioFinal();
  
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
   var cantidad = $('#cantidad').val();
   var CA =  $('#totalCostosAdicionales').val();
   var CNR = $('#costosNoRecuperados').val();
   RF = $('#recuperoDeFondos').val();
   r = Number(subtotalCosto)*Number(cantidad)+Number(CA)-Number(RF)-Number(CNR);
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
<div id="stan">
<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">

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
                      <td class="labelSeparador">STAN</td>
                    </tr>
                  </table>
                  <table width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="CformNombre" width="130">Código:&nbsp;</td>
                      <td class="CformDato">
                        <html:submit property="btnCodigoOferta" styleClass="CFormBotonDato">
                          <bean:write name="stan" property="codigoOferta" />
                        </html:submit>  
                        
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="130">Título:&nbsp;</td>
                      <td class="CformDato">
                        <bean:write name="stan" property="descripcion" />
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="130">Prestación:&nbsp;</td>
                      <td class="CformDato">
                        <bean:write name="stan" property="prestacionDescripcion" />
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="labelSeparador">Prestador</td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table class="displayTable" name='<%= prestador %>' id='<%= pageName %>' style="width: 100%" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                          <display:column property="indiceSeleccion" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="CformNombre" width="130">Unidad de Prestación:&nbsp;</td>
                      <td class="CformDato">
                        <bean:write name="unidadPrestacion" property="descripcion" />
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
      <div align="right">
        <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
      </div>
    </td>
  </tr>
</table>
</div>

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
                        Costo Mínimo&nbsp;<span class="dato_obligatorio">*</span>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table class="displayTable" style="width: 100%" name='<%= stanCosto %>' id='<%= pageName %>' defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
                          <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 400px;" />
                          <display:column property="costoPesos" title="Importe ($)" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="CformNombre" width="130">
                        Cantidad:&nbsp;<span class="dato_obligatorio">*</span>
                      </td>
                      <td class="CformDato">
                        <html:text size="16" property="cantidad" maxlength="10" styleId="cantidad" onblur="calcularSubtotalPrecio()" styleClass="desactivable"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="130">Subtotal:&nbsp;</td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right"  maxlength="12" property="subtotal" readonly="true" size="16" styleId="subtotalPrecio" />
                        <html:hidden property="subtotal"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="labelSeparador">Costos Adicionales&nbsp;</td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table class="displayTable" style="width: 100%" name='<%= costosAdicionales %>' id='<%= pageName %>' defaultsort="1" defaultorder="ascending" decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioStanComposicionDisplayWrapper">
                          <display:column property="tipoEgreso" title="Descripción" headerClass="tableCellHeader"  />
                          <display:column property="costoAdicional" title="Importe ($)" headerClass="tableCellHeader" style="align:left;text-align:right;width: 100px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr class="tableRowFooter">
                      <td align="left">
                        Total Gastos Adicionales:&nbsp;
                      </td>
                      <td class="CformDato" align="right" width="100">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalCostosAdicionales" size="16" maxlength="12" styleId="totalCostosAdicionales"/>
                      </td>
                    </tr>
                    <tr>
                      <td  align="left">
                        Ajuste Comisiones sobre costos adicionales:&nbsp;
                      </td>
                      <td class="CformDato" align="right" width="100">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="ajusteComisiones" styleId="ajusteComisiones" size="16" maxlength="12"/>
                      </td>
                    </tr>
                    <tr class="tableRowFooter">
                      <td align="left">
                        Costo Total:&nbsp;
                      </td>
                      <td class="CformDato" align="right" width="100">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="costoTotal" size="16" maxlength="12" styleId="costoTotal"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="labelSeparador">
                        Precio Oferta&nbsp;<span class="dato_obligatorio">*</span>
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
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="labelSeparador">
                        Bonificación&nbsp;<span class="dato_obligatorio">*</span>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="CformDato" width="10">
                        <html:radio property="tipoBonificacion" value="ninguno" name="form" onclick="cambioTipoBonificacion()" styleClass="desactivable"/>
                      </td>
                      <td width="120" class="CformNombre" style="text-align: left;">
                        Ninguna
                      </td>
                    </tr>
                    <tr>
                      <td class="CformDato" width="10">
                        <html:radio property="tipoBonificacion" value="porcentual" name="form" onclick="cambioTipoBonificacion()" styleClass="desactivable"/>
                      </td>
                      <td width="140" class="CformNombre" style="text-align: left;">
                        % de Bonificación
                      </td>
                      <td class="CformDato" width="112">
                        <html:text property="porcentajeBonificacion" style="text-align:right" size="6" maxlength="6" styleId="porcentajeBonificacion" onblur="calculoBonificacion()" styleClass="desactivable"/>
                      </td>
                      <td class="CformDato">
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="bonificacionPorcentual" size="16" maxlength="12" styleId="bonificacionPorcentual"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformDato" width="10">
                        <html:radio property="tipoBonificacion" value="neto" name="form" onclick="cambioTipoBonificacion()" styleClass="desactivable"/>
                      </td>
                      <td width="100" class="CformNombre"  style="text-align: left;">
                        Importe:&nbsp;$
                      </td>
                      <td/>
                      <td class="CformDato">
                        <html:text style="text-align:right" property="bonificacionNeta" size="16" maxlength="12" styleId="bonificacionNeta" onblur="calculoBonificacion()" styleClass="desactivable"/>
                      </td>
                    </tr>
                    <tr>
                      <td width="140" class="CformNombre" style="text-align: left;" colspan="3">
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
                        Distribución&nbsp;<span class="dato_obligatorio">(1)</span>
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
                        <display:table name='<%= distribucion %>' style="width: 100%" id='<%= pageName %>' decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioStanComisionesDisplayWrapper">
                          <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                          <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                          <display:column property="porcentajeComision" title="% Comisiones" headerClass="tableCellHeader" style="width: 100px;" />
                          <display:column property="importeComision" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                          <display:column property="porcentajeComisionPF" title="% Sobre Precio Final" headerClass="tableCellHeader" style="width:150px;" />
                        </display:table>
                      </td>
                    </tr>
                 </table>
                 <table width="100%">
                    <tr>
                      <td width="380" class="CformNombre" style="text-align: left;" colspan="3">
                        Total Comisiones
                      </td>
                      <td class="CformDato">&nbsp;
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalComisiones" size="16" maxlength="12" styleId="totalComisiones"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td width="380" class="CformNombre" style="text-align: left;" colspan="3">
                        Costos
                      </td>
                      <td class="CformDato">&nbsp;
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="recuperoDeFondos" size="16" maxlength="12" styleId="recuperoDeFondos"/>
                      </td>
                      <td class="CformDato">&nbsp;
                        <input type="text" disabled="disabled" style="text-align:right" name="porcentajeRecuperoDeFondos" id="porcentajeRecuperoDeFondos"  size="12" style="text-align:right" />
                      </td>
                    </tr>
                    <tr>
                      <td width="380" class="CformNombre" style="text-align: left;" colspan="3">
                        Saldo a Distribuir (Beneficio)
                      </td>
                      <td class="CformDato">&nbsp;
                        <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="saldoADistribuir" size="16" maxlength="12" styleId="saldoADistribuir"/>
                      </td>
                      <td class="CformDato">&nbsp;
                        
                        <input type="text" disabled="disabled"  style="text-align:right" readonly="true" name="porcentajeSaldoADistribuir" size="12"  id="porcentajeSaldoADistribuir"  />
                      </td>
                    </tr>
                  </table>
                  <table align="center" width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name='<%= distribucionAdicional %>' style="width: 100%" id='<%= pageName %>' decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioStanComisionesDisplayWrapper">
                          <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                          <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                          <display:column property="porcentajeComisionAdicional" title="% Comisiones" headerClass="tableCellHeader" style="width: 100px;" />
                          <display:column property="importeComisionAdicional" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                          <display:column property="porcentajeComisionAdicionalPF" title="% Sobre Precio Final" headerClass="tableCellHeader" style="width:150px;" />

                        </display:table>
                      </td>
                    </tr>
                  </table>
                  <div class="divCostosNoRecuperados">
                    <table width="100%">
                      <tr>
                      <td width="380" class="CformNombre" style="text-align: left;color: red;font-weight: bold;" colspan="3">
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
        <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
        <logic:equal value="precioAlta" name="pageName">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
        </logic:equal>
      </div>
    </td>
  </tr>
  
  
  
 
</table>
<table  align="center" cellpadding="0" cellspacing="0" class="tablaMin">
  <tr>
    <td ><span class="dato_obligatorio">(1)</span>
      Si el estado es Aceptado los datos de la distribución son obligatorios.
    </td>
  </tr>
</table>
</div>



  <!-- tabFacturacion-->
  <div id="beneficiario">
    <table align="center" cellpadding="0" cellspacing="5" class="tablaMin">
      <tr>
        <td class="CformAreaBotones">
          <div align="center">
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPresupuestoActionForm" onclick="irTabInicial()" /> 
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPresupuestoActionForm"   onclick="irTabAnterior()" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cPresupuestoActionForm" onclick="irTabSiguiente()" /> 
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPresupuestoActionForm" onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="5">
      <tr>
        <td>
          <table width="100%">
          	<tr>
	          	<td class="CformNombre" >Productividad ($):</td>
	          	<td class="CformDato" >
	          	 <html:text styleClass="textDisabled" style="text-align:right" readonly="true" name="form" property="importeComisionAdicionalMapped(1)"  size="16" maxlength="12" styleId="totalProductividadId"/>
	          	</td>
	          	<td class="CformNombre" >Asignado a Beneficiarios ($):</td>
	          	<td class="CformDato" >
	          	 <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalBeneficiarios" size="16" maxlength="12" styleId="totalBeneficiarios"/>
	          	</td>
	          	
	        </tr>
          </table>
 		   <table width="100%">
										<tr bgcolor="#DDEEFF">
											<td><strong>Beneficiarios:</strong></td>
										</tr>
										<tr>
											<td colspan="10"><display:table class="CFormDisplayTable"  style="width: 100%" name='<%= beneficiarios %>' decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioStanBeneficiarioDisplayWrapper">
													<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
													<display:column property="nombre" title="Nombre" headerClass="tableCellHeader"  />
													<display:column property="documento" title="Documento" headerClass="tableCellHeader" />
													<display:column property="categoria" title="Categoría" headerClass="tableCellHeader"/>
													<display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" />
                  									<display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="width: 150px;" />
													<display:column property="remove" title="  " headerClass="tableCellHeader"  />
													<display:footer>
														<tr style="background-color: #FAFAFA;">
															<td style="text-align: right; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;" colspan="2">Ingresar Nuevo:</td>
															<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 300px;" colspan="3"><capplication:autoComplete
																	tipoAutocomplete="beneficiario" /></td>
																	
															<td  style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;">														
																	 <html:text name="form" styleId="importeBeneficiario" property="importeBeneficiario" style="text-align:right;" maxlength="12" size="10"  onblur="formatImporte(this)" />
															</td>
															
															<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 105px;" colspan="1"><html:submit style="width:105px;" property="btnSubmit"
																	value="Agregar Beneficiario" styleClass="CformBoton" /></td>
														
														
														</tr>
													</display:footer>
												</display:table></td>
										</tr>
          </table>
        </td>
      </tr>
         <tr>
        <td>
          <table width="100%">
      
		       <tr>
			    <td class="CformAreaBotones" height="35">
			      <span class="dato_obligatorio">* Datos obligatorios</span>
			    </td>
			    <td class="CformAreaBotones" height="35">
			      <div align="right">
			        <jsp:include page="/jsp/layout/botones.jsp">
			            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
			            <jsp:param name="entidad" value="precio_stan" />
			        </jsp:include> 
			      </div>
			    </td>
			  </tr>
          </table>
        </td>
      </tr>
 
    </table>
  
  
	<logic:equal value="S" property="hayOrdenFacturacionEmitida" name="cPresupuestoActionForm">
	        <table align="center" cellpadding="0" cellspacing="5" class="tablaMin">
	              <tr >
	                <td >
	                  <b>
	                  Atención: No podrá eliminar los acuerdos de factura que tienen una orden de facturación emitida relacionada.
						</b>
	                </td>
	              </tr>
	           </table>
	</logic:equal>

  
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
                    <table width="100%">
                      <tr>
                        <td class="labelSeparador">STAN</td>
                      </tr>
                    </table>
                    <table width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="CformNombre" width="130">Código:&nbsp;</td>
                        <td class="CformDato">
                          <logic:equal value="si" name="displayLinks">
                            <html:submit property="btnCodigoOferta" styleClass="CFormBotonDato">
                              <bean:write name="stan" property="codigoOferta" />
                            </html:submit>  
                          </logic:equal>
                          <logic:notEqual value="si" name="displayLinks">
                            <bean:write name="stan" property="codigoOferta" />
                          </logic:notEqual>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="130">Título:&nbsp;</td>
                        <td class="CformDato">
                          <bean:write name="stan" property="descripcion" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="130">Prestación:&nbsp;</td>
                        <td class="CformDato">
                          <bean:write name="stan" property="prestacionDescripcion" />
                        </td>
                      </tr>
                    </table>
                    <table width="100%">
                      <tr>
                        <td class="labelSeparador">Prestador</td>
                      </tr>
                    </table>
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table class="displayTable" style="width: 100%" name='<%= prestador %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                            <logic:equal value="si" name="displayLinks">
                              <display:column property="indiceSeleccion" title="#" style="width:10px" headerClass="tableCellHeader" />
                            </logic:equal>
                            <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                            <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                            <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                    <table width="100%">
                      <tr>
                        <td class="CformNombre" width="130">Unidad de Prestación:&nbsp;</td>
                        <td class="CformDato">
                          <bean:write name="unidadPrestacion" property="descripcion" />
                        </td>
                      </tr>
                    </table>
                    <table width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                        <td>
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
                                <display:table class="displayTable" style="width: 100%" name='<%= costoCfm %>' id='<%= pageName %>' defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
                                  <logic:equal value="si" name="displayLinks">
                                    <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
                                  </logic:equal>
                                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 400px;" />
                                  <display:column property="costoPesos" title="Importe ($)" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 150px;" />
                                </display:table>
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                            <tr>
                              <td class="CformNombre" width="130">
                                Cantidad:&nbsp;
                              </td>
                              <td class="CformDato">
                                <html:text size="16" styleClass="textDisabled" readonly="true" style="text-align:right" property="cantidad" maxlength="10" styleId="cantidad"/>
                              </td>
                            </tr>
                            <tr>
                              <td class="CformNombre" width="130">Subtotal:&nbsp;</td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right"  maxlength="12" property="subtotal" readonly="true" size="16" styleId="subtotalPrecio" />
                                <html:hidden property="subtotal"/>
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                            <tr>
                              <td class="labelSeparador">Costos Adicionales&nbsp;</td>
                            </tr>
                          </table>
                          <table width="100%">
                            <tr>
                              <td colspan="10">
                                <display:table class="displayTable" style="width: 100%" name='<%= costosAdicionales %>' id='<%= pageName %>' defaultsort="1" defaultorder="ascending" decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioStanComposicionDisplayWrapper">
                                  <display:column property="tipoEgreso" title="Descripción" headerClass="tableCellHeader"  />
                                  <display:column property="costoAdicionalCfm" title="Importe ($)" headerClass="tableCellHeader" style="align:left;text-align:right;width: 100px;" />
                                </display:table>
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                            <tr class="tableRowFooter">
                              <td align="left">
                                Total Gastos Adicionales:&nbsp;
                              </td>
                              <td class="CformDato" align="right" width="100">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalCostosAdicionales" size="16" maxlength="12" styleId="totalCostosAdicionales"/>
                              </td>
                            </tr>
                            <tr>
                              <td  align="left">
                                Ajuste Comisiones sobre costos adicionales:&nbsp;
                              </td>
                              <td class="CformDato" align="right" width="100">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="ajusteComisiones" styleId="ajusteComisiones" size="16" maxlength="12"/>
                              </td>
                            </tr>
                            <tr class="tableRowFooter">
                              <td  align="left">
                                Costo Total:&nbsp;
                              </td>
                              <td class="CformDato" align="right" width="100">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="costoTotal" size="16" maxlength="12" styleId="costoTotal"/>
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
                              <td width="130" class="CformNombre">
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
                          </table>
                          <table width="100%">
                            <tr>
                              <td class="labelSeparador">
                                Bonificación
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                            <tr>
                              <td class="CformDato" width="10">
                                <html:radio property="tipoBonificacion" disabled="true" value="ninguno" name="form"/>
                              </td>
                              <td width="120" class="CformNombre" style="text-align: left;">
                                Ninguna
                              </td>
                            </tr>
                            <tr>
                              <td class="CformDato" width="10">
                                <html:radio property="tipoBonificacion" disabled="true" value="porcentual" name="form"/>
                              </td>
                              <td width="140" class="CformNombre" style="text-align: left;">
                                % de Bonificación
                              </td>
                              <td class="CformDato" width="112">
                                <html:text styleClass="textDisabled" readonly="true" property="porcentajeBonificacion" style="text-align:right" size="6" maxlength="6" styleId="porcentajeBonificacion"/>
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="bonificacionPorcentual" size="16" maxlength="12" styleId="bonificacionPorcentual"/>
                              </td>
                            </tr>
                            <tr>
                              <td class="CformDato" width="10">
                                <html:radio property="tipoBonificacion" disabled="true" value="neto" name="form" onclick="cambioTipoBonificacion()" />
                              </td>
                              <td width="100" class="CformNombre"  style="text-align: left;">
                                Importe:&nbsp;$
                              </td>
                              <td/>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" readonly="true" style="text-align:right" property="bonificacionNeta" size="16" maxlength="12" styleId="bonificacionNeta"/>
                              </td>
                            </tr>
                            <tr>
                              <td width="140" class="CformNombre" style="text-align: left;" colspan="3">
                                Precio Final
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
                          <display:table name='<%= distribucion %>' id='<%= pageName %>' style="width: 100%" decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioStanComisionesDisplayWrapper">
                            <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                            <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                            <display:column property="porcentajeComisionCfm" title="% Comisiones" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="importeComision" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                   <table width="100%">
                      <tr>
                        <td width="344" class="CformNombre" style="text-align: left;" colspan="3">
                          Total Comisiones
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalComisiones" size="16" maxlength="12" styleId="totalComisiones"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="344" class="CformNombre" style="text-align: left;" colspan="3">
                          Costos
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="recuperoDeFondos" size="16" maxlength="12" styleId="recuperoDeFondos"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="344" class="CformNombre" style="text-align: left;" colspan="3">
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
                          <display:table name='<%= distribucionAdicional %>' id='<%= pageName %>' style="width: 100%" decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioStanComisionesDisplayWrapper">
                            <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                            <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:140px;" />
                            <display:column property="porcentajeComisionAdicionalCfm" title="% Comisiones" headerClass="tableCellHeader" style="width: 150px;" />
                            <display:column property="importeComisionAdicional" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                    <logic:notEqual name="costosNoRecuperados" value="0.00">
                      <table width="100%">
                        <tr>
                        <td width="344" class="CformNombre" style="text-align: left;" colspan="3">
                          Costos no recuperados:
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="costosNoRecuperados" size="16" maxlength="12" styleId="costosNoRecuperados"/>
                        </td>
                      </tr>
                      </table>
                    </logic:notEqual>
                  
                  
					<table width="100%">
						<tr bgcolor="#DDEEFF">
							<td><strong>Beneficiarios:</strong></td>
						</tr>
						<tr>
							<td colspan="10"><display:table class="CFormDisplayTable" name='<%= beneficiarios %>' decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioStanBeneficiarioDisplayWrapper">
											
											<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
											<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
											<display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                  							<display:column property="categoria" title="Categoría" headerClass="tableCellHeader" />
											<display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" />
                  							
                  							<display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="width: 150px;" />
										</display:table>
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
        <div align="right">
          <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
            <jsp:param name="entidad" value="precio_stan" />
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