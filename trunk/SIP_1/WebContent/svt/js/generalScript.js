function trim (myString)
{
    return myString.replace(/^\s+/g,'').replace(/\s+$/g,'');
}
function deshabilitarCampos(idCampo){
	$('#'+idCampo).attr('disabled',true);
	$('#'+idCampo).addClass('CformTextDisabled');
}

function habilitarCampos(idCampo){
	$('#'+idCampo).attr('disabled',false);
	$('#'+idCampo).addClass('CformTextEnabled');
}

function borrarDatos(idCampo){
	$('#'+idCampo).attr('value',"");
}

function quitar(tipo ,index)
{
  submitAction("?method=remove "+tipo+"&removeIndex="+index);
}

function removeFromDisplayWrapper(tipo, index, formAttribute)
{
	/* Si es null, le asigno el valor por default */
	formAttribute = typeof formAttribute !== 'undefined' ? formAttribute : 'method';
	submitAction("?" + formAttribute + "=remove" + tipo + "&removeIndex=" + index);
}

function armarComboBase() {
	return "<option value='-1'>Seleccionar</option><option value='-2'>-----------</option>";
}

function submitAction(val, formIndex){
	//Sirve para llamar al action haciendo submit mandandondolo por parametro
	// Si no se setea el formIndex, por default es 0 ( si solo hay un form en lantalla llamarlo sin este paratmetro)
	// por ejemplo para llamar al metodo remove enviando por request el indice seria algo asi submitAction("?method=remove&removeIndex=1); 
	var form;
	if(formIndex == null)
		form = document.forms[0];
	else{
		form = document.forms[formIndex];
	}
	
	var temp = form.action;
	form.action = temp + val;
	form.submit();
	form.action = temp;
}

function isEmpty(idCampo){
	var val = $('#'+idCampo).val();
	if (val == "" || val == null){
		return true;
	}else{
		return false;
	}
}

function isNumero(idCampo){
	var val = $('#'+idCampo).val();
	if (!isEmpty(idCampo)){
		if ( !isNaN(val)){
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}
}

function sumar(primerValor, segundoValor){
	var importePrimerValor;
	var importeSegundoValor;
	var total;
	importePrimerValor= Math.round((primerValor) * 100) / 100;
	importeSegundoValor= Math.round((segundoValor) * 100) / 100;
	total = Math.round((importePrimerValor + importeSegundoValor) * 100) /100;
	total = total.toFixed(2);
	return total;
	
}

function isSelected(idCampo){
	var val = $('#'+idCampo).val();
	if(!isEmpty(idCampo) && val != "-1" && val != "-2"){
		return true;
	}else{
		return false;
	}
}
/**
 * Devuelve un objeto json. Recibe como parámetro una lista donde cada elemento
 * es una tupla con key y value.
 * @return
 */
function cargarJson(datos){
	var myJson = "";
	for (var index = 0; index < datos.length; index++){		
		if (myJson == ""){
			myJson += "{";
		}
		var valor = "\""+datos[index].value+"\"";
		myJson += '"'+datos[index].key+'":'+valor;
		if ( index != (datos.length-1)){
			myJson += ",";
		}else{
			myJson += "}";
		}	
	}
	if(myJson.charAt(myJson.length -1) == ','){
		myJson = myJson.substring(0, myJson.length - 2);
	}
	var myJsonObj = jsonParse(myJson);
	return myJsonObj;
}

function Class() { }
Class.prototype.construct = function() {};
Class.extend = function(def) {
    var classDef = function() {
        if (arguments[0] !== Class) { this.construct.apply(this, arguments); }
    };
    
    var proto = new this(Class);
    var superClass = this.prototype;
    
    for (var n in def) {
        var item = def[n];                        
        if (item instanceof Function) item.$ = superClass;
        proto[n] = item;
    }

    classDef.prototype = proto;
    
    //Give this new class the same static extend method    
    classDef.extend = this.extend;        
    return classDef;
};

function stringNotEmpty(string) {
	return ((string != null) && (string != ""));
}

function eliminarOpcionSeleccionadaAC(id, optionalCallbacks) {
	$('#autoComplete' + id).val("");
	$('#id' + id).val("");
	$("#label" + id).text("");
	setVisibilidadSeleccionAutocomplete(id);
	
	if (optionalCallbacks != null && stringNotEmpty(optionalCallbacks['afterRemove'])) {
		optionalCallbacks['afterRemove'](id);
	}
	
}

function setVisibilidadSeleccionAutocomplete(id) {
	var select = $("#autoComplete" + id).val();
	var conicetGral = new ConicetGeneral();
	if(!conicetGral.isEmptyString(select) && !conicetGral.isBlankString(select)) {
		$('#autoComplete' + id).hide();
		$('#descripcion' + id + 'Div').show();
		$("#label" + id).text(select);
	} else {
		$('#autoComplete' + id).show();
		$('#descripcion' + id + 'Div').hide();
		$("#label" + id).text("");
	}
}

function prepararBusquedaMethod(id, metodoIngresarNuevo, optionalCallbacks) {
	prepararBusquedaBase(id, metodoIngresarNuevo, "method", optionalCallbacks);
}

function prepararBusquedaBtnSubmit(id, metodoIngresarNuevo, optionalCallbacks) {
	prepararBusquedaBase(id, metodoIngresarNuevo, "btnSubmit", optionalCallbacks);
}

//
// Ejemplo de USO DEL AUTOCOMPLETE
//<tr>
//<td class="CformNombre">Marca: <span class="dato_obligatorio">*</span>
//</td>
//<td class="CformDato">
//<html:hidden property="idMarca" styleId="idMarca" name="equipoForm" />
//<html:text styleId="autoCompleteMarca" property="autoCompleteMarca" size="50" />
//	<div id="descripcionMarcaDiv">
//		<label id="labelMarca"> </label> &nbsp; <img id="botonBorrarMarca" src="./imagenes/close.png" align="top" style="cursor: hand; cursor: pointer;"
//			onclick='eliminarOpcionSeleccionadaAC("Marca");' />
//	</div></td>
//</tr>

function prepararBusquedaBase(id, metodoIngresarNuevo, tipo, optionalCallbacks) {
	var conicetGeneral = new ConicetGeneral();
	//agregarNevoBtnSubmit es el nombre del metodo
	if ($("#id" + id).val() == null || $("#id" + id).val() == '') {
		$("#autoComplete" + id).val("");
	}

	setVisibilidadSeleccionAutocomplete(id);
	
	//var actionName = document.forms[0].action+"?"+tipo+"=";
	var actionName = document.forms[0].action+"?tipo="+id+"&"+tipo+"=";
	conicetGeneral.autocomplete({
				idInput : "autoComplete" + id,
				url : actionName+"autoComplete",
				onSelectFunction : function(data) {
					if ((data.data.id == 0) && (metodoIngresarNuevo != "")) {
						this.form.action = actionName + metodoIngresarNuevo;
						this.form.submit();
					}
					$("#id" + id).val(data.data.id);
					$("#autoComplete" + id).val(data.data.nombre);
					setVisibilidadSeleccionAutocomplete(id);
					
					if (optionalCallbacks != null && stringNotEmpty(optionalCallbacks['afterSelect'])) {
						optionalCallbacks['afterSelect'](id);
					}
				},
				valueDefault : "",
				formatItem : function(data) {
						return data.nombre;
				}
			});
}




var ConicetGeneral = Class.extend({
    generarComboHtml:function(comboValueJson){
        var comboHtml = "";
        for(var i = 0; i< comboValueJson.length; i++){
            comboHtml+= "<option value='"+comboValueJson[i].value+"'>"+comboValueJson[i].label+"</option>";
        }
        return comboHtml;
    },
    
    generarComboHtmlVector:function(vector){
    	var comboHtml = "";
    	for(var i = 0; i< vector.length; i++){
            comboHtml+= "<option value='"+vector[i][0]+"'>"+vector[i][1]+"</option>";
        }
        return comboHtml;
    },
    
    addWaitingImage:function addWaitingImage(parameters){
    	parameters.imageFile = parameters.imageFile || "./js/imagenes/ajax-loader.gif";
    	if(!parameters.idElement) throw new Error("addWaitingImage: parametro idElement no seteado");
    	this.deshabilitarCampos(parameters.idElement);
    	parameters.width = parameters.width || 12;
    	parameters.height = parameters.height || 12; 
    	parameters.classText = parameters.classText || "";
    	if(parameters.classText) parameters.classText = "class='"+parameters.classText+"'";
    	parameters.text = parameters.text || "";
    	$("#"+parameters.idElement).after($("<span "+parameters.classText+" id='cargando-id-"+parameters.idElement+"-text'>"+parameters.text+"</span>")).after($("<img style='height:"+parameters.height+"px;width:"+parameters.width+"px' id='cargando-id-"+parameters.idElement+"' src='"+parameters.imageFile+"' alt='cargando'/>"));
    },

    removeWaitingImage: function removeWaitingImage(idElement){
    	$("*[id^=cargando-id-"+idElement+"]").detach();
    	this.habilitarCampos(idElement);
    },
    deshabilitarCampos: function (idCampo) {
        $('#' + idCampo).attr('disabled', true);
        //$('#' + idCampo).readonly(true);
    },
    deshabilitarCamposByName: function (nameCampo) {
        $('.' + nameCampo).attr('disabled', true);
    },
    deshabilitarCamposWildCard: function (wildCard) {
        $(wildCard).attr('disabled', true);
    },
    deshabilitarCamposObject: function(object){
    	object.attr('disabled', true);
    },
    habilitarCampos: function (idCampo) {
        $('#' + idCampo).attr('disabled', false);
    },
    habilitarCamposByName: function (nameCampo) {
        $('.#' + nameCampo).attr('disabled', false);
    },
    habilitarCamposWildCard: function (wildCard) {
        $(wildCard).attr('disabled', false);
    },
    borrarDatos: function (idCampo) {
        $('#' + idCampo).attr('value', "");
    },
    isEmpty: function (idCampo) {
        var val = $('#' + idCampo).val();
        if (val == "" || val == null) {
            return true;
        } else {
            return false;
        }
    },
    isEmptyString: function (str) {
        return (!str || 0 === str.length);
    },
    isBlankString: function (str) {
        return (!str || /^\s*$/.test(str));
    },
    putFoco: function(idCampo){
        $('#' + idCampo).focus();
    },
    isObjectEmpty: function (object) {
        return (object == "" || object == null);
    },
    isNumero: function (idCampo) {
        var val = $('#' + idCampo).val();

        if (!this.isEmpty(idCampo)) {
            if (!isNaN(val)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    },
    isEntero: function (idCampo) {
        var val = $('#' + idCampo).val();
        if (!this.isEmpty(idCampo)) {
            var pattern = /^[0-9]*$/g;
            var match = val.match(pattern);
            return match != null;
        } else {
            return false;
        }
    },
    sumar: function (primerValor, segundoValor) {
        var importePrimerValor;
        var importeSegundoValor;
        var total;
        importePrimerValor = Math.round((primerValor) * 100) / 100;
        importeSegundoValor = Math.round((segundoValor) * 100) / 100;
        total = Math.round((importePrimerValor + importeSegundoValor) * 100) / 100;
        total = total.toFixed(2);
        return total;
    },
    restar: function (primerValor, segundoValor) {
        var importePrimerValor;
        var importeSegundoValor;
        var total;
        importePrimerValor = Math.round((primerValor) * 100) / 100;
        importeSegundoValor = Math.round((segundoValor) * 100) / 100;
        total = Math.round((importePrimerValor - importeSegundoValor) * 100) / 100;
        total = total.toFixed(2);
        return total;
    },
    multiplicar: function (primerValor, segundoValor) {
        var importePrimerValor;
        var importeSegundoValor;
        var total;
        importePrimerValor = Math.round(parseFloat(primerValor) * 100) / 100;
        importeSegundoValor = Math.round(parseFloat(segundoValor) * 100) / 100;
        total = Math.round((importePrimerValor * importeSegundoValor) * 100) / 100;
        total = total.toFixed(2);
        return total;
    },
    dividir: function (primerValor, segundoValor) {
        var importePrimerValor;
        var importeSegundoValor;
        var total;
        importePrimerValor = Math.round(parseFloat(primerValor) * 100) / 100;
        importeSegundoValor = Math.round(parseFloat(segundoValor) * 100) / 100;
        total = Math.round((importePrimerValor / importeSegundoValor) * 100) / 100;
        total = total.toFixed(2);
        return total;
    },
    isSelected: function (idCampo) {
        var val = $('#' + idCampo).val();
        if (!this.isEmpty(idCampo) && val != "-1" && val != "-2") {
            return true;
        } else {
            return false;
        }
    },
    wrappID: function (id) {
        return "#" + id;
    },
    allowNumbersOnly: function (idCampo) {
        $('#' + idCampo).keyup(function () {
            if (this.value.match(/[^0-9 ]/g)) {
                this.value = this.value.replace(/[^0-9 ]/g, '');
            }
        });
    },
    formatDecimal: function(idCampo){
        var value = $("#"+idCampo).val();
        value = value.replace(",", ".");
        var sValue = value.split(".", 2);
        if (sValue == 0){
            value = "0.";
        }else{
            value = sValue[0]+".";
        }
        if (sValue.length > 1){
            value += sValue[1];
        }else{
            value += "00";
        }
        $("#"+idCampo).attr("value",value);

    },
    getTipoElemento: function(idElemento){
            var elemento = $("#"+idElemento);
            return elemento[0].tagName;
    },
    generarComboDependiente: function(idCboPadre,idCboHijo,urlDataCboHijo,elemntsDesactivar, funcion,urlBaseImage){
        
            var conicetGeneral = new ConicetGeneral();
            if (conicetGeneral.isSelected(idCboPadre)){
              var varlue_province =  $('#'+idCboPadre).val();
              var data = {"idElementSelected":varlue_province};
              var url = urlDataCboHijo;
              $.ajax({
                    url: url,
                    type: "POST",
                    async: true,
                    data: data,
                    dataType:'json',
                    beforeSend: function(){
                          for(var i = 0; i< elemntsDesactivar.length; i++){
                               conicetGeneral.deshabilitarCampos(elemntsDesactivar[i]);
                          }
						  if (typeof urlBaseImage != "undefined"){
							   general = new ConicetGeneral();
							 parameter = {
								imageFile: urlBaseImage,
								idElement: idCboPadre												
							};
							general.addWaitingImage(parameter);
						}
                     },
                    success:  function (data) {
                        if (!data.success){
                            alert('Error Succes');
                        }else{
                            var comboValue = data.comboDependent;
                            $("#" + idCboHijo).html(conicetGeneral.generarComboHtml(comboValue));
                        }

                    },
                    complete: function (data) {
                         for(var i = 0; i< elemntsDesactivar.length; i++){
                               conicetGeneral.habilitarCampos(elemntsDesactivar[i]);
                          }
                       general = new ConicetGeneral();
						general.removeWaitingImage(idCboPadre);
                        if(funcion){
                            funcion.call(this);
                        }
                    },
                    error: function (textStatus) {
                        alert(textStatus.responseText);
                        alert("Error");
                    }
                    });
            }else{
                $("#"+idCboHijo).html("");
                conicetGeneral.deshabilitarCampos(idCboHijo);
            }
        
    },
    
    le: function(value1, value2){
    	if(isNaN(value1) && isNaN(value2)) return value1 < value2;
    	if(isNaN(value1)) value1 = 0.00;
    	if(isNaN(value2)) value2 = 0.00;
    	return parseFloat(value1) <= parseFloat(value2);
    },
    
    lt: function(value1, value2){
    	if(isNaN(value1) && isNaN(value2)) return value1 < value2;
    	if(isNaN(value1)) value1 = 0.00;
    	if(isNaN(value2)) value2 = 0.00;
    	return parseFloat(value1) < parseFloat(value2);
    },
    
    ge: function(value1, value2){
    	if(isNaN(value1) && isNaN(value2)) return value1 > value2;
    	if(isNaN(value1)) value1 = 0.00;
    	if(isNaN(value2)) value2 = 0.00;
    	return parseFloat(value1) >= parseFloat(value2);
    },
    
    gt: function(value1, value2){
    	if(isNaN(value1) && isNaN(value2)) return value1 > value2;
    	if(isNaN(value1)) value1 = 0.00;
    	if(isNaN(value2)) value2 = 0.00;
    	return parseFloat(value1) > parseFloat(value2);
    },
    eq: function(value1, value2){
    	if(isNaN(value1) && isNaN(value2)) return value1 == value2;
    	if(isNaN(value1)) value1 = 0.00;
    	if(isNaN(value2)) value2 = 0.00;
    	return parseFloat(value1) == parseFloat(value2);
    },
    
    alertar: function(message){
    	alert(message);
    },
    
    confirmar: function(idVentana,message,fn,parametros){
    	$("#"+idVentana).dialog({
    		title: "Atenci&oacute;n!",
    		resizable: false,
    		width: 500,
    		position: [400,100],
			modal: true,
    		buttons: [
                        {
                            text: "Aceptar",
                            click: function() {
                            	fn(parametros);
                            	$(this).dialog("close"); 
                            }
                        },
                        {
                            text: "Cancelar",
                            click: function() { 
                            	$(this).dialog("close");
                            }
                        },
                     ] 
    	});
    	$("#"+idVentana).html("<p><span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>"+message+"</p>");
    	
    },
    mensaje: function(idVentana,message,fn,parametros){
    	$("#"+idVentana).dialog({
    		title: "Atenci&oacute;n!",
    		resizable: false,
    		width: 500,
    		position: [400,100],
			modal: true,
    		buttons: [
                        {
                            text: "Aceptar",
                            click: function() {
                            	fn(parametros);
                            	$(this).dialog("close"); 
                            }
                        },
                        {
                            text: "Cancelar",
                            click: function() { 
                            	$(this).dialog("close");
                            }
                        },
                     ] 
    	});
    	$("#"+idVentana).html("<p><span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>"+message+"</p>");
    	
    },
	autocomplete : function(options) {
		var idInput = options.idInput;
		var url = options.url;
		var onSelectFunction = options.onSelectFunction;
		
		var valueDefault = options.formatItem;
		
		var formatItem = function(item){
			return item.nombre;
		};
		
		$("#" + idInput).autocomplete(
						{
							source : function(request, response) {
								$(this).addClass( "ui-autocomplete-loading" );
								
								var dataJson = {match : request.term};
								if(options.dataJson != null) {
									dataJson = jsonConcat(dataJson, options.dataJson());
								}
								
								
								$.ajax({
											url : url,
											type : 'POST',
											dataType : "json",
											data : dataJson,
											success : function(data) {
													$(this).removeClass( "ui-autocomplete-loading" );
													if(options.formatItem != null){
														formatItem = options.formatItem;
													}
													sort(data);
													response($.map(data,function(item){
																		return {
																			label : formatItem(item),
																			value : item.nombre,
																			data : item
																		};
																	}));
											},
											error: function (xhr, ajaxOptions, thrownError) {
												$(this).removeClass( "ui-autocomplete-loading" );
												if (thrownError != "") {
											        alert("Ocurrio el siguiente error: "+thrownError);													
												}
										      }
										});
							},
							minLength : 2,
							select : function(event, ui) {
								if (ui.item) {
									// seleccionó algo
									onSelectFunction
											.call(this, ui.item);
								} else {
									this.value = valueDefault;
								}
							}/*,
							open : function() {
								$(this).removeClass("ui-corner-all")
										.addClass("ui-corner-top");
							},
							close : function() {
								$(this).removeClass("ui-corner-top")
										.addClass("ui-corner-all");
							}*/
						})/*.each( function(){
							if(options.width!=null){
								$(this).attr("witdh", options.width);
							}
							
						})*/;
			
	},
    
    agregarCerosIzq: function(numero,cantidad){
    	var nroS = numero.toString();
    	for(var i=0;i<cantidad;i++){
    		nroS = "0"+nroS;
    	}
    	return nroS;
    }    
      
    
});

function jsonConcat(o1, o2) {
	for (var key in o2) {
		o1[key] = o2[key];
	}
	return o1;
}

function SortByResult(a,b)
{ 
	if(a.id == "0")
	{
			return -1;
	}
	else if(b.id == "0")
	{
		return 1;
	}
	else if(a.id == "-1")
	{
		return -1;
	}
	else if(b.idvalue == "-1")
		return 1;
	else
	{	
		val1 = a.nombre.toUpperCase();
		val2 = b.nombre.toUpperCase();
		if (val1 < val2) return -1;
		if (val1 > val2) return 1;
		return 0;
	}
}

function sort(data)
{
	if(data!=null)
		return data.sort(SortByResult);
	else
		return data;
}

function parse(data) {
	var parsed = [];
	var rows = data.split("\n");
	for (var i=0; i < rows.length; i++) {
		var row = $.trim(rows[i]);
		if (row) {
			row = row.split("|");
			parsed[parsed.length] = {
				data: row,
				value: row[0],
				result: options.formatResult && options.formatResult(row, row[0]) || row[0]
			};
		}
	}
	return parsed;
};


var CCuit = Class.extend({
	validarCuit: function(cuit){
		cuit = cuit.replace(/[-]/g, "");
		if (cuit.length != 11){  
			   return false;   
		}
		var mult = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2];
		var total = 0;
		for (var i = 0; i < mult.length; i++){
			   total += parseInt(cuit.toString().charAt(i)) * parseInt(mult[i]);
		}
		
		var mod = parseInt(total % 11);
		
		
		 var digito = 11 - mod;
	     if (digito==11){
	            digito=0;
	     }
	     if (digito == 1){
	    	 digito =9;
	     }
	     if (parseInt(digito) == parseInt(cuit.toString().charAt(10))){
	        return true;
	     }else{
	    	return false;
	     }
	}
});


var CFecha = Class.extend({
	getCantDias: function (anio,mes){
   //de acuerdo al mes y año elegidos hay una cantidad de dias
		var bisiesto = (anio%4 == 0 && anio%100 != 0) || (anio%400 ==0);
		if (mes == "01" || mes == "03" || mes == "05" || mes == "07" || mes == "08" || mes == "10" || mes == "12")
			return 31;
		else if (mes == "04" || mes == "06" || mes == "09" || mes == "11")
			return 30;
		else if (mes == "02" && bisiesto)
			return 29;
		else//si no entro en las otras condiciones no es bisiesto y es Febrero.
			return 28;
	},

	validarPattern:function (valor, pattern){
		return valor.match(pattern) != null;
	},
	
	/**
	 * Valida que tenga el formato 'dd-MM-yyyy'.
	 * @param fecha: 
	 * string con fecha.
	 * 
	 * @return false si no es un formato válido.
	 */
	validarFormatoFechaLatina:function (fecha){
		var pattern = /^[0-9]{2}-[0-9]{2}-[0-9]{4}$/g
		//valido que tenga el formato dd-MM-yyyy
		if(this.validarPattern(fecha,pattern)){
			return true;
		}
		return false;
	},
	/**
	 * Valida que tenga el formato 'dd/MM/yy'.
	 * 
	 * @param fecha:
	 *            string con fecha.
	 * @return false si no es un formato válido.
	 */
	validarFormatoFechaLatinaBarra:function (fecha){
		var pattern = /^[0-9]{2}\/[0-9]{2}\/[0-9]{2}$/g;
		// valido que tenga el formato dd-MM-yyyy
		if(this.validarPattern(fecha,pattern)){
			return true;
		}
		return false;
	},
	
	/**
	 * Método que se fija si la fecha (string de tipo dd/mm/yy) es válida.<br>
	 * PRECONDICION: La fecha debe tener un formato válido.
	 * 
	 * @param fecha:
	 *            string con formato 'dd/MM/yy'.
	 * 
	 * @return false si no es válida, true si lo es.
	 */
	validarValidezFechaLatinaBarra:function(fecha){
		// veo que los meses sean correctos:
		dato_fecha = fecha.split("/");
		mes = dato_fecha[1];
		// valido que sea un número comprendido entre 1 y 12
		if(!isNaN(mes) && mes < 13 && mes > 0){
			// Ahora valido el año (tomo a partir del año 1950):
			anio = dato_fecha[2];
			if(!isNaN(anio)){
				anio = parseInt(dato_fecha[2]) < 50?(2000+parseInt(dato_fecha[2])):(1900+parseInt(dato_fecha[2]));  
				// Ahora obtengo la cantidad de días del mes para ese año:
				cant_dias = this.getCantDias(anio, mes);
				dia = dato_fecha[0];
				if(dia >0 && dia <= cant_dias){
					return true;
				}
			}
		}
		return false;
	},
	
	/**
	 * Método que se fija si la fecha (string de tipo dd-mm-yyyy) es válida.<br>
	 * PRECONDICION: La fecha debe tener un formato válido.
	 * 
	 * @param fecha: string con formato 'dd-MM-yyyy'.
	 * 
	 * @return false si no es válida, true si lo es.
	 */
	validarValidezFechaLatina:function(fecha){
		//veo que los meses sean correctos:
		dato_fecha = fecha.split("-");
		mes = dato_fecha[1];
		//valido que sea un número comprendido entre 1 y 12
		if(!isNaN(mes) && mes < 13 && mes > 0){
			//Ahora valido el año:
			anio = dato_fecha[2];
			//me fijo que sea un número y mayor a 1950 por convención.
			if(!isNaN(anio) && anio > 1950){
				//Ahora obtengo la cantidad de días del mes para ese año:
				cant_dias = this.getCantDias(anio, mes);
				dia = dato_fecha[0];
				if(dia >0 && dia <= cant_dias){
					return true;
				}
			}
		}
		return false;
	},
	
	validarFormatoFechaLatinaById:function (id_fecha){
		var fecha = $("#"+id_fecha).val();
		return this.validarFormatoFechaLatina(fecha);
	},
	
    hoy:function(){
    	var hoy = new Date();
    	var dia = hoy.getDate().toString();
    	var mes = (hoy.getMonth()+1).toString();
    	var ano = hoy.getFullYear().toString();
    	if (dia.length == 1){
    		var cero = "0";
    		dia = cero.concat(dia);
    	}
    	if (mes.length == 1){
    		var cero = "0";
    		mes = cero.concat(mes);
    	}	
	    var ret = dia+"/"+mes+"/"+ano;
	    return ret;
    },
	
	validarValidezFechaLatinaById:function (id_fecha){
		var fecha = $("#"+id_fecha).val();
		return this.validarValidezFechaLatina(fecha);
	}
});

var CInputNumero = Class
		.extend({

			construct : function(isDecimal) {
					this.hasDecimal = isDecimal;
					this.isNegative = true;
			},
			isNegative : null,
			hasDecimal : null,
			jQPattern : null,

			bind : function(jQSelector) {
				this.jQPattern = jQSelector;

				var instance = this;

				$(this.jQPattern).each(function() {

					$(this).bind({

						keydown : function(event) {
							return instance.keyDown(event);
						},

						keypress : function(event) {
							return instance.keyPress(event);
						},

						focusout : function() {

							return instance.focusOut();

						}

					});

				}

				);

			},

			unbind : function(jQPattern) {
				$(jQPattern).each(function() {
					$(this).unbind('keydown');
					$(this).unbind('keypress');
					$(this).unbind('focusout');
				});
			},

			keyPress : function(e)

			{

				key = (document.all) ? e.keyCode : e.which;

				if (key == 0) {

					return true;

				}

				if ((47 < key && key < 60)
						|| key == 8
						|| key == 46
						|| key == 9
						|| key == 37
						|| key == 38
						|| key == 39
						|| key == 40
						|| (this.isNegative && this
								.signoNegativo(key, e.target))) {

					return true;
				}

				return false;
			},

			keyDown : function(e) {

				key = (document.all) ? e.keyCode : e.which;

				if (navigator.userAgent.indexOf("MSIE") > 0 && key == 8) {

					return true;

				} else {

					if ((47 < key && key < 60)
							|| key == 8
							|| key == 46
							|| key == 9
							|| key == 37
							|| key == 38
							|| key == 39
							|| key == 40
							|| (95 < key && key < 106)
							|| (this.hasDecimal && (key == 110 || key == 190))
							|| (this.isNegative && this.signoNegativo(key,
									e.target))) {

						return true;

					} else {

						return false;

					}

				}

				return true;

			},

			focusOut : function() {
				if (this.hasDecimal) {
					$(this.jQPattern).each(function() {
						var value = $(this).val();
						value = value.replace(",", ".");
						var sValue = value.split(".", 2);
						value = sValue[0] + ".";
						if (sValue.length > 1) {
							value += sValue[1];
						} else {
							value += "00";
						}
						$(this).attr("value", value);
					});
				}

			},
			signoNegativo : function(key, target) {
				var txt = target.value;
				var valor = false;

				if ((key == 109 || key == 189) && txt.length == 0) {
					valor = true;
				}

				return valor;
			}

		});

/**
 * Clase que maneja errores de ajax.
 */
var CAJAXErrorManager = Class.extend({
	construct: function(xhr, textStatus, errorThrown,usuarioNro, sistema){
		
	var timestamp = Math.round(((new Date()).getTime()-Date.UTC(1970,0,1))/1000);
	 	var errorCode = timestamp+"_"+usuarioNro;
		/*
	 	var url = "";
		if(sistema.match(/[sS][aA][sS]-[sS][cC]/g) != null){//sas-sc
			url = "/sctJsp";
		}else if(sistema.match(/[sS][aA][sS]-[uU][eE]/g) != null){//sas-ue
			url = "/dir";
		}else if(sistema.match(/[sS][aA][sS]-[aA][dD][mM]/g) != null){//sas-adm
			url = "/adm";
		}
		url += "errorAjax.jsp";
		$.ajax({
			url: url,
			type: 'POST',
			cache:false,
			data: {responseText: xhr.responseText,textStatus: textStatus, errorThrown: errorThrown, errorCode: errorCode},
			success:function(){},
			error: function(){}
		});
		*/
		alert("Ups!... Hubo un error, por favor intente nuevamente. De persistir el inconveniente notifique a Sistemas informando error #"+errorCode);
	}
});



function descargarArchivo(tipo, index) {
	$("#descargarArchivo" + tipo).val(index);
	document.forms[0].submit();
	$("#descargarArchivo" + tipo).val("");
}

function quitarArchivo(tipo, index) {
	$("#removerArchivo" + tipo).val(index);
	document.forms[0].submit();
	$("#removerArchivo" + tipo).val("");
}
