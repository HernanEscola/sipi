var actionName;

function documentReadyContratanteOtro(actionNameParam) {
	actionName = actionNameParam;
	
	if (esPersonaJuridicaExtranjera($('#personaJuridicaNacionalidadCombo').val())) {
		deshabilitarCuitCategoriaIva();	
		borrarCategoriaIva();
	} else {
		habilitarCuitCategoriaIva();
	}
	cargarDatosDeCentralElegida();
	botonCentralChange(false);
    
	setCombosPersonaJuridicaOnChange();
	setComboComitenteOnChange();
	setCombosPersonaJuridicaVisibilidadInicial();
	if (esSucursal()) {
		deshabilitarCuit();
		deshabilitarCombosNacionalidad();
	}
	$("#tipoComitente").val('-1');
	$("#tipoComitente").change();
	
	deshabilitarMigrado();

}

function setComboComitenteOnChange() {
	$("#tipoComitente").change(function() {
		var opcion = $("#tipoComitente").val();

		$('#autoCompleteComitenteOrganismo').val('');
		$('#autoCompleteComitenteContratante').val('');
		if (opcion == "contratante") {
			setVisibilidadComitenteInput("Contratante", "Organismo");
		} else if (opcion == "organismo") {
			setVisibilidadComitenteInput("Organismo", "Contratante");
		} else {
			$("#autoCompleteComitenteContratante").hide();
			$("#autoCompleteComitenteOrganismo").hide();
			$('#comitenteContratanteDiv').hide();
			$('#comitenteOrganismoDiv').hide();
			$('#descripcionComitenteContratanteDiv').hide();
			$('#descripcionComitenteOrganismoDiv').hide();
		}
	});
}

function setVisibilidadComitenteInput(mostrar, ocultar) {
	$('#autoCompleteComitente' + mostrar).show();
	$('#comitente' + mostrar + 'Div').show();
	$('#descripcionComitente' + mostrar + 'Div').hide();
	$('#comitente' + ocultar + 'Div').hide();
}

function setCombosPersonaJuridicaOnChange() {
	$("#personaJuridicaNacionalidadCombo").change(function() {
		personaJuridicaNacionalidadOnChange();
	});
	$("#personaJuridicaClasificacionCombo").change(function() {
		personaJuridicaClasificacionOnChange();
	});
	$("#personaJuridicaTipoCombo").change(function() {
		personaJuridicaTipoOnChange();
	});
}

function personaJuridicaNacionalidadOnChange() {
	var nacionalidadPJId = $('#personaJuridicaNacionalidadCombo').val();
	
	resetHijosPJNacionalidad();
	ocultarHijosPJNacionalidad();
	habilitarCuitCategoriaIva();
	
	
	if (nacionalidadPJId > 0) {
		if (esPersonaJuridicaExtranjera(nacionalidadPJId)) {
			deshabilitarCuitCategoriaIva();
		} if (esPersonaJuridicaNacional(nacionalidadPJId)) {
			$('#personaJuridicaClasificacionCombo').show();			
		}
	}
	deshabilitarMigrado();
}

function personaJuridicaClasificacionOnChange() {
	var clasificacionPJId = $('#personaJuridicaClasificacionCombo').val();	
	resetHijosPJClasificacion();
	ocultarHijosPJClasificacion();
	
	if (clasificacionPJId > 0) {
		if (esPersonaJuridicaComitentesMultiples(clasificacionPJId)) {
			$('#comitenteMultipleTableRow').show();

		} else {
			cargarComboAjax("personaJuridicaTipoCombo",
					actionName + '.do?btnSubmit=prepararComboPersJuridicaTipo&tipoPersonaId=' + clasificacionPJId, 
					limpiarComitentesYOrganismo);
			$('#personaJuridicaTipoCombo').show();
		}
	}
	
}

function personaJuridicaTipoOnChange() {
	var clasificacionPJId = $('#personaJuridicaClasificacionCombo').val();	
	var tipoPJId = $('#personaJuridicaTipoCombo').val();
	resetHijosPJTipo();
	ocultarHijosPJTipo();
	if (tipoPJId > 0 && esPersonaJuridicaEstatal(clasificacionPJId)) {
		$('#autoCompleteOrganismoRow').show();
		
	}
}

function resetHijosPJNacionalidad() {
	resetHijosPJClasificacion();
    $("#personaJuridicaClasificacionCombo").attr('value', '-1');
}

function ocultarHijosPJNacionalidad() {
	ocultarHijosPJClasificacion();
	$('#personaJuridicaClasificacionCombo').hide();
}

function resetHijosPJClasificacion() {
	resetHijosPJTipo();
    $("#personaJuridicaTipoCombo").attr('value', '-1');
	$("#autoCompleteComitenteContratante").val('');
	$("#autoCompleteComitenteOrganismo").val('');
	$("#tipoComitente").attr('value', '-1');
}

function ocultarHijosPJClasificacion() {
	ocultarHijosPJTipo();
	$('#comitenteContratanteDiv').hide();
	$('#comitenteOrganismoDiv').hide();
	$('#comitenteMultipleTableRow').hide();
	$('#personaJuridicaTipoCombo').hide();
	$('#autoCompleteOrganismoRow').hide();
}

function resetHijosPJTipo() {
	$("#labelOrganismo").val('');	
	$("#autoCompleteOrganismo").val('');
	$("#autoCompleteOrganismo").show();
	$("#botonBorrarOrganismo").show();	
}

function ocultarHijosPJTipo() {	
	$("#descripcionOrganismoDiv").hide();
	$('#autoCompleteOrganismoRow').hide();
}

function setCombosPersonaJuridicaVisibilidadInicial() {
	var nacionalidadPJId = $('#personaJuridicaNacionalidadCombo').val();	
	
	if (nacionalidadPJId > 0) {
		if (esPersonaJuridicaExtranjera(nacionalidadPJId)) {
			resetHijosPJNacionalidad();
			ocultarHijosPJNacionalidad();
			deshabilitarCuitCategoriaIva();
			borrarCategoriaIva();

		} if (esPersonaJuridicaNacional(nacionalidadPJId)) {
			$('#personaJuridicaClasificacionCombo').show();
			var clasificacionPJId = $('#personaJuridicaClasificacionCombo').val();
			
			if (clasificacionPJId > 0) {
				
				if (esPersonaJuridicaComitentesMultiples(clasificacionPJId)) {
					$('#comitenteMultipleTableRow').show();
					resetHijosPJTipo();
					ocultarHijosPJTipo();
					$('#personaJuridicaTipoCombo').hide();
					$('#personaJuridicaTipoCombo').val('-1');
				} else {
					$('#personaJuridicaTipoCombo').show();
					$('#comitenteMultipleTableRow').hide();
					var tipoPJId = $('#personaJuridicaTipoCombo').val();
					
					if ((tipoPJId > 0) && esPersonaJuridicaEstatal(clasificacionPJId)) {
						$('#autoCompleteOrganismoRow').show();
						
						var Organismo = $("#autoCompleteOrganismo").val();
						if (Organismo != null && Organismo != "") {
							$("#labelOrganismo").text(Organismo);
							$("#descripcionOrganismoDiv").show();
							$("#autoCompleteOrganismo").hide();
						} else {
							$("#descripcionOrganismoDiv").hide();
							$("#autoCompleteOrganismo").show();
						}
					} else {
						resetHijosPJTipo();
						ocultarHijosPJTipo();
					}
				}
			} else {
				resetHijosPJClasificacion();
				ocultarHijosPJClasificacion();
			}
		} else {
			resetHijosPJClasificacion();
			ocultarHijosPJClasificacion();
		}
	} else {
		resetHijosPJNacionalidad();
		ocultarHijosPJNacionalidad();
	}
}

function habilitarProvinciaPartidoLocalidad(tipo,esBloqueable,paisArgentina) {
	$('#cboPais'+tipo).change(function() {
		//si no es Argentina deshabilito los combos
		verificarPaisArgentina(tipo,esBloqueable,paisArgentina);  
	});
	verificarPaisArgentina(tipo,esBloqueable,paisArgentina);  
}

function verificarPaisArgentina(tipo,esBloqueable,paisArgentina) {
	if ($('#cboPais'+tipo).val()!=paisArgentina){
		$('#cboProvincia'+tipo).attr('disabled', true);
		$('#cboPartido'+tipo).attr('disabled', true);
		$('#cboLocalidad'+tipo).attr('disabled', true);
	} else {
		if (!esBloqueable || (document.forms[0].bloquearDatos == null ||
			document.forms[0].bloquearDatos.value == "no")) {
			 $("#cboProvincia"+tipo).removeAttr('disabled');
			 var sel =  $("#cboProvincia"+tipo).val();
			 if( sel != "-1" && sel != "-2" && sel != null && sel != ""){
					 $("#cboPartido"+tipo).removeAttr('disabled');
					 var sel =  $("#cboPartido"+tipo).val();
					 if( sel != "-1" && sel != "-2" && sel != null && sel != ""){
						 $("#cboLocalidad"+tipo).removeAttr('disabled');
					 }else{
						 $("#cboLocalidad"+tipo).attr('disabled', 'disabled');
					 }
			 }else{
					 $("#cboLocalidad"+tipo).attr('disabled', 'disabled');
					 $("#cboPartido"+tipo).attr('disabled', 'disabled');
			 }
			
/*			$('#cboProvincia'+tipo).removeAttr('disabled');
			$('#cboPartido'+tipo).removeAttr('disabled');
			$('#cboLocalidad'+tipo).removeAttr('disabled');*/
			 
		}
	}
}


function esSucursal() {
	return ($('input[name=sucursal]:checked').val() == 'S');
}


function deshabilitarCuitCategoriaIva() {
	deshabilitarCuit();
	deshabilitarCategoriaIva();
}

function habilitarCuitCategoriaIva() {
	habilitarCuit();
	habilitarCategoriaIva();
}

function deshabilitarCategoriaIva() {
	$('#iva').attr('disabled', true);
	$('#iva').addClass('CformTextDisabled');
}

function habilitarCategoriaIva() {
	$('#iva').removeAttr('disabled');
	$('#iva').removeClass('CformTextDisabled');
}


function deshabilitarCuit(){
	$('#cuit :input').addClass('CformTextDisabled');
	if (esMigrado()){
		$('#cuit :input').attr('readonly', 'true');
	}else{
		$('#cuit :input').attr('disabled', true);
	}
	
}

function habilitarCuit() {
	if (esMigrado()){
		$('#cuit :input').removeClass('readonly');	
	}else{
		$('#cuit :input').removeAttr('disabled');
	}
	$('#cuit :input').removeClass('CformTextDisabled');
	
}


function borrarCuit() {
		$('#cuitPrefijo').attr('value', '');
		$('#cuitNumero').attr('value', '');
		$('#cuitSufijo').attr('value', '');
}

function borrarCategoriaIva() {
	$('#iva').attr('value', '-1');
}

function habilitarComboCentral() {
	$('#centralSeleccionada').attr('disabled', false);	
}

function deshabilitarComboCentral() {
	$('#centralSeleccionada').val('-1');
	$('#centralSeleccionada').attr('disabled', true);	
}

function prepararBusquedaContratante(actionName) {

	var conicetGeneral = new ConicetGeneral();

	conicetGeneral
			.autocomplete({
				idInput : "autoCompleteContratante",
				url : actionName + '.do?btnSubmit=autoCompleteContratante',
				onSelectFunction : function(data) {
					if (data.value != "-1" && data.value != "-2") {
						this.form.idBuscar.value = data.data.id;
						this.form.submit();
					}
				},
				valueDefault : "",
				formatItem : function(data) {
					if (data.nombreFantasia != null && data.nombreFantasia.length > 1) {
						return data.nombre + " - " + data.nombreFantasia;
					} else {
						return data.nombre;
					}
				}
			});
}


function quitar(tipo, id) {
	submitAction("?btnSubmit=remove " + tipo + "&removeId=" + id);
}

function limpiarAutocompletes() {
	$('#autoCompleteComitenteOrganismo').val('');
	$('#autoCompleteComitenteContratante').val('');
	$('#autoCompleteOrganismo').val('');			
}

function ocultarControlesTipoPersonaJuridica() {
    $("#personaJuridicaNacionalidadCombo").attr('value', '-1');
    resetHijosPJNacionalidad();
	ocultarHijosPJNacionalidad();
}

function esPersonaJuridicaEstatal(id) {	
	if (id == 3) {
		return true;
	}
	return false;
}

function esPersonaJuridicaComitentesMultiples(id) {
	if (id == 5) {
		return true;
	}
	return false;
}

function habilitarComboPersonaJuridicaTipo() {
	var clasificacionSeleccionada = $('#personaJuridicaClasificacionCombo').val();
	
	if (esPersonaJuridicaComitentesMultiples(clasificacionSeleccionada)) {
		$('#comitenteMultipleTableRow').show();
		$('#autoCompleteOrganismoRow').hide();		
		$('#personaJuridicaTipoCombo').hide();
        $("#personaJuridicaTipoCombo").attr('value', '-1');
        $("#tipoComitente").attr('value', '-1');
        $("#tipoComitente").val("");
        
	} else if (clasificacionSeleccionada < 0) {
		$('#personaJuridicaTipoCombo').hide();
	    $("#personaJuridicaTipoCombo").attr('value', '-1');
		$('#comitenteMultipleTableRow').hide();
		$('#autoCompleteOrganismoRow').hide();
	} else {
		$('#comitenteMultipleTableRow').hide();
	}
	
	if (!esPersonaJuridicaEstatal(clasificacionSeleccionada)) {
		$('#autoCompleteOrganismoRow').hide();					
	}
}

function cargarComboAjax(comboId, targetUrl, funcionPreviaATerminar) {
    $.ajax({
        type: "POST",
        url: targetUrl,
        data: {},
        dataType: "json",
        success: function(data) {
	     	if (data.length > 0) {
	            var select = generarOpcionesHTMLCombo(data);
	            $("#" + comboId).html(select);
	            $("#" + comboId).attr('value', '-1');
	            $("#" + comboId).show();
	     	} else {
	     		$("#" + comboId).hide();
	     	}
	     	funcionPreviaATerminar();
        }
    });
}

function setContratanteExtranjeroReadOnly() {
	$('#personaJuridicaNacionalidadCombo').attr('value', getPersonaJuridicaExtranjeraId());
	$('#personaJuridicaNacionalidadCombo').attr('disabled', true);
	$('#personaJuridicaNacionalidadCombo').change();
}

function setContratanteNacionalReadOnly() {
	$('#personaJuridicaNacionalidadCombo').attr('value', getPersonaJuridicaNacionalId());
	$('#personaJuridicaNacionalidadCombo').attr('disabled', true);
	$('#personaJuridicaNacionalidadCombo').change();
}

function resetContratanteNacional() {
	$('#personaJuridicaNacionalidadCombo').attr('value', '-1');
	$('#personaJuridicaNacionalidadCombo').removeAttr('disabled');
}

function limpiarComitentesYOrganismo() {
	eliminarOpcionSeleccionadaAC("Organismo");
	eliminarOpcionSeleccionadaAC("Contratante");
	$("#tablaComitentes > tbody").html("No se encontraron resultados.");
	
	$("#tipoComitente").attr('value', '-1');
    $("#tipoComitente").val("");
}

function centralValidaSeleccionada() {
	return ($('#centralSeleccionada').val() != "-1" && $('#centralSeleccionada').val() != "-2");
}

function botonCentralChange(eliminarDatos) {
	
	if (eliminarDatos) {
		if (!esSucursal() &&  centralValidaSeleccionada() ){
					borrarCuit();
		}
		ocultarControlesTipoPersonaJuridica();
		$("#botonBorrarOrganismo").show();
		$("#comitenteMultipleCentralTableRow").hide();
		$("#autoCompleteOrganismoRow").hide();
	}

	/* Habilita o deshabilita el combo central y el campo cuit */
	if (esSucursal()) {		
		habilitarComboCentral();
		deshabilitarCuit();
		deshabilitarCombosNacionalidad();
	} else {		
		habilitarCuit();
		deshabilitarComboCentral();
		habilitarCombosNacionalidad();
		habilitarCategoriaIva();
	}
	deshabilitarMigrado();
	
}

function habilitarCombosNacionalidad() {
	$('#personaJuridicaNacionalidadCombo').removeAttr('disabled');
	$('#personaJuridicaClasificacionCombo').removeAttr('disabled');
	$('#personaJuridicaTipoCombo').removeAttr('disabled');
}

function deshabilitarCombosNacionalidad() {
	$('#personaJuridicaNacionalidadCombo').attr('disabled', 'disabled');	
	$('#personaJuridicaClasificacionCombo').attr('disabled', 'disabled');	
	$('#personaJuridicaTipoCombo').attr('disabled', 'disabled');
}

function cargarDatosDeCentralElegida() {
	/*  Si elije una central cargará el cuit de esa central en el campo cuil */
	if (esSucursal()) { // TODO es necesario este if? revisar
		if (!centralValidaSeleccionada()) {
			borrarCuit();
			ocultarControlesTipoPersonaJuridica();
		} else {
			
			$.ajax({
				url : actionName + ".do?btnSubmit=cargarDatosCentral", //centralSeleccionada
				type : 'POST',
				dataType : "json",
				data : {
					match : $('#centralSeleccionada').val()
				},
				success : function(datos) {
					
					if ((datos == null) || (datos.length == 0)) {									
						return;
					}
					
					var central = datos[0];
					if (central.cuit.length > 0) {
							cargarCuit(central.cuit);
					} else {
							borrarCuit();
					}
					
					cargarNacionalidad(central);
					if (esPersonaJuridicaEstatal(central.clasificacionPersonaJuridicaId)) {
						cargarOrganismo(central);						
					} else {
						$("#autoCompleteOrganismoRow").hide();
						$("#botonBorrarOrganismo").show();
					}
					
					$('#comitenteMultipleTableRow').hide();
					if (esPersonaJuridicaComitentesMultiples(central.clasificacionPersonaJuridicaId)) {
						cargarComitentes(central);
					} else {
						$("#comitenteMultipleCentralTableRow").hide();
					}
					
				},
				timeout : function() {
					//TODO
				},
				error : function() {
					//TODO
				}
			});
			
		}
		deshabilitarMigrado();
	}
	
	
}

function cargarCuit(cuit){
$('#cuitPrefijo').val(cuit.substring(0, 2));
$('#cuitNumero').val(cuit.substring(2, 10));
$('#cuitSufijo').val(cuit.substring(10));		
}

function cargarNacionalidad(datos) {
	cargarComboNacionalidadPersonaJuridica(datos);
	cargarComboClasificacionPersonaJuridica(datos);
	cargarComboTipoPersonaJuridica(datos);
	
	var esExtranj = esPersonaJuridicaExtranjera(datos.nacionalidadPersonaJuridicaId);
	
	if (esExtranj) {
		deshabilitarCategoriaIva();
		borrarCategoriaIva();
	} else {
		habilitarCategoriaIva();
	}
}

function cargarComboNacionalidadPersonaJuridica(datos) {
	$("#personaJuridicaNacionalidadCombo").val(datos.nacionalidadPersonaJuridicaId);	
    $("#personaJuridicaNacionalidadCombo").attr("disabled", "disabled");			
}			

function cargarComboClasificacionPersonaJuridica(datos) {
	if (datos.clasificacionPersonaJuridicaId != "") {
		$("#personaJuridicaClasificacionCombo").val(datos.clasificacionPersonaJuridicaId);
        $("#personaJuridicaClasificacionCombo").show();
        $("#personaJuridicaClasificacionCombo").attr("disabled", "disabled");
	} else {
		$("#personaJuridicaClasificacionCombo").hide();
	}
}

function cargarComboTipoPersonaJuridica(datos) {
	if (datos.tipoPersonaJuridicaId != "") {
		var select = generarHTMLComboUnicaOpcion(datos.tipoPersonaJuridicaId, datos.tipoPersonaJuridicaDescripcion);				
		$("#personaJuridicaTipoCombo").html(select);
		$("#personaJuridicaTipoCombo").val(datos.tipoPersonaJuridicaId);
        $("#personaJuridicaTipoCombo").show();
        $("#personaJuridicaTipoCombo").attr("disabled", "disabled");		            
	} else {
		$("#personaJuridicaTipoCombo").hide();
	}
}

function generarHTMLComboUnicaOpcion(id, descripcion) {
	var combo = [{"codigo":id, "descripcion":descripcion}];
	return generarOpcionesHTMLCombo(combo);
}

function cargarOrganismo(central) {
	$("#autoCompleteOrganismo").val(central.organismo);
	$("#autoCompleteOrganismoRow").show();
	//$("#labelOrganismo").text(central.organismo);
	$("#botonBorrarOrganismo").hide();
	
	setVisibilidadSeleccionAutocomplete("Organismo");
}

function cargarComitentes(central) {
	var comitentes = central.comitentes;
	var html = "";
	
	html += armarTabla(function() {
			return armarHtmlColumnasHeaders(["Tipo de Comitente", "Razón Social", "%"]);
		},
		function(dato, index) {
			return armarHtmlFilaTabla(getEstiloFila(index), [dato.tipo, dato.razonSocial, 
			       "<input type='text' disabled='true' maxlength='12' size='12' style='text-align:right;' value='" + dato.porcentaje + "' />"]);
		},
		function() {
			return "";
		},
		comitentes
	);
	
	$("#tablaComitentesCentral").html(html);
	$("#comitenteMultipleCentralTableRow").show();
	
}

function esPersonaJuridicaNacional() {
	var nacionalidad = $('#personaJuridicaNacionalidadCombo').val();
	return esPersonaJuridicaNacional(nacionalidad);
}

function getPersonaJuridicaExtranjeraId() {
	return 8;
}

function esPersonaJuridicaExtranjera(id) {
	if (id == getPersonaJuridicaExtranjeraId()) {
		return true;
	}
	return false;
}

function getPersonaJuridicaNacionalId() {
	return 7;
}

function esPersonaJuridicaNacional(id) {
	if (id == getPersonaJuridicaNacionalId()) {
		return true;
	}
	return false;
}

function esContratanteOtro() {
	return ($("#tipoContratante").val() == 1);
}

function esContratanteCF() {
	return ($("#tipoContratante").val() == 0);
}

function esMigrado() {
	if ($("#estado").val()!=""){
		return ($("#estado").val() == "M");
	}
	return false;
}

function deshabilitarRazonSocial() {
	$('#razonSocial').addClass('CformTextDisabled');
	$('#razonSocial').attr('disabled', true);
	
}

function deshabilitarMigrado(){
	if (esMigrado()){
		deshabilitarCuit();
		deshabilitarRazonSocial();
	}
}
