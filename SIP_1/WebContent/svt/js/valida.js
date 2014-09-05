// Funcion para validar el ingreso de importes, acepta unicamenente numeros y el punto
function validarImporte(obj) {
   var tecla=window.event.keyCode;
   if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
 	 window.event.keyCode=0;
}

function validarNumerolo(evt) {
  var tecla = ( evt.which ) ? evt.which : evt.keyCode;
  return (((tecla >= 48) && (tecla <= 57)) || (tecla == 8));
}

function validarImportelo(obj,evt) {
   var tecla = ( evt.which ) ? evt.which : evt.keyCode;
   var cantDec = obj.value.length-obj.value.indexOf(".",0)-1;
   //valido que no ingrese más de dos decimales luego del punto
   if ((obj.value.indexOf(".",0)!=-1) && ((cantDec)>1) && tecla!=8 && tecla!=9){
   	return (cantDec>2);
   }
   return (((tecla>=48)&&(tecla<=57))||(tecla==46)||(tecla==37)||(tecla==8)||(tecla==39)||((tecla==9)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
}

// Funcion para validar el ingreso de importes, acepta unicamenente numeros y el punto
// permite cargar 9 enteros solamente.
function validarImporteConDecimales(evt, obj) {
	
	var tecla = ( evt.which ) ? evt.which : evt.keyCode;
	if (((tecla>=48)&&(tecla<=57))||(tecla==46)) {
		if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
	 	 return false;
		if (obj.value.length==9 && (tecla!=46) && (obj.value.indexOf(".",0)==-1) )
	     return false;
	}
	return (((tecla >= 48) && (tecla <= 57)) || (tecla == 46) || tecla == 8);
}

function validarLongitudMaximaImporte(evt, obj, longitudMaxEntero, longitudMaxDecimal) {
	var tecla = ( evt.which ) ? evt.which : evt.keyCode;
	var valorActual = obj.value;
	var posicionPunto = obj.value.indexOf(".", 0);
	var valorEntero;
	var valorDecimal;
	var posicionCursor;
	
	if (posicionPunto == -1) {
		valorEntero = valorActual;
		valorDecimal = "";
		posicionCursor = -2;
	} else {
		valorEntero = valorActual.substring(0, posicionPunto);
		valorDecimal = valorActual.substring(posicionPunto + 1);
		posicionCursor = getPosicionCursor(obj);
	}	
	
	if ((evt.keyCode == 37) || (evt.keyCode == 39))
		return true;
	
	if (tecla == 8) {
		if ((posicionPunto != -1) && (posicionCursor == (posicionPunto + 1)) && 
				((valorEntero.length + valorDecimal.length) > longitudMaxEntero)) {
			return false;
		}
		return true;
	}

	
	if ( ((tecla >= 48) && (tecla <= 57)) || (tecla == 46) ) {
		if ((tecla == 46) && (posicionPunto != -1))
			return false;
		
		if ((valorEntero.length >= longitudMaxEntero) && (posicionCursor <= posicionPunto) && (tecla != 46))
			return false;
		
		if ((valorDecimal.length >= longitudMaxDecimal) && (posicionCursor > posicionPunto) && (tecla != 46))
			return false;
		
		return true;
	}
	
	return false;
}

function getPosicionCursor(o) {
	if (o.createTextRange) {
		var r = document.selection.createRange().duplicate();
		r.moveEnd('character', o.value.length);
		if (r.text == '') return o.value.length;
		return o.value.lastIndexOf(r.text);
	} else {
		return o.selectionStart;
	}
} 

function validarPorcentajeConDecimales(event, obj){
   var tecla=window.event.keyCode;
   // UNA COMA
   if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
 	 window.event.keyCode=0;

   // DOS ENTEROS
   if (obj.value.length==2 && (tecla!=46) && (obj.value.indexOf(".",0)==-1) )
        window.event.keyCode=0;

  /* parte = obj.value.split(".");
   if (parte.length!=1) {
	if (parte[1].length==2){
          window.event.keyCode=0;
	}
   }*/
}

/***********************************************

* Textarea Maxlength script- © Dynamic Drive (www.dynamicdrive.com)

* This notice must stay intact for legal use.

* Visit http://www.dynamicdrive.com/ for full source code

***********************************************/

function isMaxLength(ta,maxlength){
       var mlength = parseInt(maxlength);
       if (ta.value.length>mlength){
             ta.value=ta.value.substring(0,mlength);
       }
}


// Funcion para validar un numero, acepta unicamenente numeros
function validarNumero() {
   var tecla=window.event.keyCode;
   if (!((tecla>=48)&&(tecla<=57)||(tecla==13)))
        window.event.keyCode=0;
}

// valida carga de nros de factura, nros de recibo, etc hasta 4 caracteres, guion,hasta 8 caracteres
//solo podrá cargar números y un guión
function validarNumeroComprobante(obj) {

  var tecla=window.event.keyCode;
// si es nro o tecla - y no permite cargar 2 veces el guión
   if (!(((tecla>=48)&&(tecla<=57))||(tecla==45)&&(obj.value.indexOf("-",0)==-1)&&(obj.value.length!=0)))
 	 window.event.keyCode=0;

   if ((obj.value.length>11)&&(obj.value.indexOf("-",0)==-1)&&(!tecla==45))
   	 window.event.keyCode=0;



}

function completarCeros(obj,len){
        pp = "";
	//si es objeto
	if (obj.value!=null){
		for(i=0; i<(len-obj.value.length);i++){
			pp= pp+"0";
		}
	pp=pp+obj.value;
	obj.value=pp;
	}

	//document.comprobanteAlta.numero.value=pp+obj.value;
	return obj;
}

function completarCerosSiInforma(obj,len){
    pp = "";
//si es objeto
if (obj.value!=null && obj.value.length>0){
	
	for(i=0; i<(len-obj.value.length);i++){
		pp= pp+"0";
	}
pp=pp+obj.value;
obj.value=pp;
}

//document.comprobanteAlta.numero.value=pp+obj.value;
return obj;
}



/**
* Formatea los numeros de factura de la siguiente forma:
* si obj = "123" --> "00000000000123"   (lo lleva a 12 cifras)
*
* si obj = "1-5" --> "0001-00000005" (lo lleva a XXXX-XXXXXXXX)
*/
function formatearNroComprobante(obj){

  parte = obj.value.split("-");
	if (parte.length==1) {
		obj = completarCeros(obj,12);
	} else {
		parte[0] = completarCeros(parte[0],4);
		parte[1] = completarCeros(parte[1],8);
		obj.value = parte[0] + "-" + parte[1];
	}
	//alert("tam: " + parte.length +" 1: " + parte[0] + " -- 2: " + parte[1]);
       // alert("numero" + obj.value);

}

function validarUltimoPuntoImporte(obj) {
   if (obj.value.length=="0")
	obj.value="0.00";
   else
     if (obj.value.indexOf(".",0)==(obj.value.length-1))
	obj.value+="00";
     else {
	if (obj.value.indexOf(".",0)==-1)
           obj.value+=".00";
        //si agrego un decimal sólo, le completo con cero el segundo
	else{
              if ((obj.value.substring(obj.value.indexOf(".",0)+1)).length==1){
           	obj.value+="0";
              }
            }
        }
}

// le formatea dos decimales a un porcentaje. se puede usar en los display
function formatPorcentaje(obj) {
  var porcentaje = obj.value;
  porcenataje = Math.round((porcentaje) * 100) /100 ;
  //Esto valida que no sea una cadena de caracteres la que se ingreso
  //si es una cadena de caracteres, pone vacío en lugar de la cadena.
  if (porcentaje >= 0)
  	obj.value = porcentaje.toFixed(2);
  else
  {
  	porcentaje = "";
        obj.value = "";
  }
  //controlAcumulado();
}


function checkMail(mail)
{
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(mail))
        	return true;
	else
        	return false;
}

// le formatea dos decimales a un importe. se puede usar en los display
function formatImporte(obj) {
  var importe = obj.value;
  importe = Math.round((importe) * 100) /100 ;
  //Esto valida que no sea una cadena de caracteres la que se ingreso
  //si es una cadena de caracteres, pone un cero en lugar de la cadena.
  //Esto fue agregado ya que el firefox no toma window.event.keyCode
  //que usa la función validaImporteConDecimales()
  if (importe >= 0)
  	obj.value = importe.toFixed(2);
  else
  {
  	importe = 0;
        obj.value = importe.toFixed(2);
  }
}


//le formatea dos decimales a un importe. se puede usar en los display
function formatImporteConSeparadorMiles(obj) {
  var importe = obj.value;
  importe = Math.round((importe) * 100) /100 ;
  //Esto valida que no sea una cadena de caracteres la que se ingreso
  //si es una cadena de caracteres, pone un cero en lugar de la cadena.
  //Esto fue agregado ya que el firefox no toma window.event.keyCode
  //que usa la función validaImporteConDecimales()
  if (importe >= 0)
  	obj.value = importe.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
  else
  {
  	importe = 0;
        obj.value = importe.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
  }
}

//le formatea dos decimales a un importe. se puede usar en los display
function formatEntero(obj) {
  var numero = obj.value;
  numero = Math.round((numero) * 100) /100 ;
  if (numero >= 0)
  	obj.value = numero.toFixed(0);
  else {
	numero = 0;
    obj.value = numero.toFixed(0);
  }
}

function validarUltimoPuntoPorcentaje(obj) {
   if (obj.value.length=="0")
	obj.value="";
   else
     if (obj.value.indexOf(".",0)==(obj.value.length-1))
	obj.value+="00";
     else {
	if (obj.value.indexOf(".",0)==-1)
           obj.value+=".00";
        //si agrego un decimal sólo, le completo con cero el segundo
	else{
              if ((obj.value.substring(obj.value.indexOf(".",0)+1)).length==1){
           	obj.value+="0";
              }
            }
        }
}

function agregarDecimalesCeros(obj) {
	 if (obj.value != '') {
	    var a = 0;
	    a = eval(obj.value);
	    a = Math.round((a) * 100) / 100;
	    a = a.toFixed(2);
	    obj.value = a;
	  }
	  return 1;
}

function isNumeric(obj){
	var filter  = /^[-+]?[0-9]+(\.[0-9]+)?$/;
	if (filter.test(obj.value))
       	return true;
	else
	  	return false;
}

//le formatea dos decimales a un porcentaje.
//en el caso del que el valor no sea un número no pone cero
function formatPorcentajeNoCero(obj) {
	if (obj.value.length != 0){
	    if (isNumeric(obj)){
	    	var importe = obj.value;
	    	importe = Math.round((importe) * 100) /100 ;
	    	//Esto valida que no sea una cadena de caracteres la que se ingreso
	    	//si es una cadena de caracteres, pone un cero en lugar de la cadena.
	    	//Esto fue agregado ya que el firefox no toma window.event.keyCode
	    	//que usa la función validaImporteConDecimales()
	    	if (importe >= 0)
	    		obj.value = importe.toFixed(2);
	    	else {
	    	    obj.value = "";
	    	}
	    }
	    else {
	    	obj.value = "";
	    }
	}	
}
function validarNumeroCompatible(e) {
	var key;

	if(window.event) // IE
	{
		key = e.keyCode;
		if (!((key>=48)&&(key<=57)||(key==13))){
			window.event.keyCode=0;
			return true;
		}
	}
	else if(e.which) // Netscape/Firefox/Opera
	{
		key = e.which;
	}
	if (key < 48 || key > 57)
	{
		return false;
	}

	return true;	
}
//Este metodo solo permite que se ingresen numeros o el punto
function filterKeyImporte(event) {
	var key = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	
}

