var actionName = "cEntidadExternaRelacionBuscarAction";

$( document ).ready(function() {
   	$( "#modificacionEntidadRelacion" ).dialog({
      autoOpen: false,
      modal: true,
      resizable: false,
      show: {
          effect: "blind",
          duration: 300
        },
        hide: {
          effect: "fade",
          duration: 300
        },      
      height: 300,
      width: 450,      
      close: function() {    	         
      },
      create: function() {
    		  ieFix();      		  
      }
    });
   	
   	jQuery.ajaxSetup({
   		  beforeSend: function() {
   			  loading();
   		  },
   		  complete: function(){
   			  stopLoading();
   		  },
   		  error: function() {
   			  alert("La operación falló, cierre la sesión y vuelva a ingresar");    			 
   		  }
   	});
   	
   	$(".entidadRelacionMappedButton").click(function(elem) {   		
   		$("#entidadRelacionId").attr("value",$(this).attr('id'));
   		openEntidadRelacionDialog();
   	});
   	
});

function openEntidadRelacionDialog() {
	$("#stateMsg").hide(); 
	eliminarOpcionSeleccionadaAC('Prestador', {'afterSelect':'', 'afterRemove':''});
	eliminarOpcionSeleccionadaAC('Contraparte', {'afterSelect':'', 'afterRemove':''});
	eliminarOpcionSeleccionadaAC('Beneficiario', {'afterSelect':'', 'afterRemove':''});
	getEntidadRelacionData();
	
   	$('#modificacionEntidadRelacion').dialog("option",{
   		buttons:{
   			"Registrar": function() {
   				var tipo = $("#tipoEntidad").attr('value');
   				var idOriginal = $("#entidadRelacionadaId").attr('value');
   				var idSeleccionado = $("#id" + tipo).attr('value');
   				
   				if (idSeleccionado != "") {
   					if (idSeleccionado != idOriginal) {
   						registrarEntidadRelacion();
   					} else {
   						$("#modificacionEntidadRelacion").dialog("close");
   					}
   				} else {
   					updateMessage("stateMsg", "ui-state-error", "Por favor, seleccione un/a " + tipo, false);
   				}
   			},
           Cerrar: function() {
               $( this ).dialog( "close" );
           } 
   	},
   		title:"Modificacion de entidad relacionada"});
   	
    $( "#modificacionEntidadRelacion" ).dialog( "open" );
    $("#descripcion").keyup(function(){
    	maxCharactes("descripcion", 500);
    });
}

function loading() {
    $('#loadingDiv').show();  	   
    $('.ui-dialog :button').attr("disabled",true);
}

function stopLoading() {
    $('#loadingDiv').hide();
    $('.ui-dialog :button').removeAttr("disabled");
}

function ieFix(){
	var ie = $("#ie").val();
	if(ie=="true"){
		$(".ui-corner-all").removeClass("ui-dialog-titlebar");
		$(".ui-corner-all").removeClass("ui-dialog-titlebar-close");		
		$("span:contains('Registrar')").css("color","red");
	}
}

function registrarEntidadRelacion() {
	var tipo = $("#tipoEntidad").attr("value");
	var idAutoComplete = $("#id" + tipo).attr("value");
	
	$.ajax({
		url : actionName + ".do?method=actualizarRelacion",
		dataType : "json",
		contentType : 'application/json;charset=iso-8859-1',
		data : {
			entidadRelacionId : $("#entidadRelacionId").attr("value"),
			tipo : $("#tipoEntidad").attr("value"),
			idSeleccionado: idAutoComplete
		},
		success : function(data) {
			if (data.returnCode == 0) {
				updateMessage("stateMsg", "ui-state-success", "Se ha registrado correctamente la operación! ", true);
				$("#entidadSVTDescripcion_" + data.id).html(data.entidadDescripcion);
				setTimeout(function() { $("#modificacionEntidadRelacion").dialog("close"); }, 1600);
			} else {
				errorMsg = "Se ha producido un error";
				if (data.error != null && data.error != "") {
					errorMsg += ": " + data.error;
				}
				updateMessage("stateMsg", "ui-state-error", errorMsg, false);
			}
		}
	});
}

function updateMessage(id, className, content, hideMessage) {
	 element = $("#"+id);
	 element
	 	 .show()
	 	 .removeClass()
		 .html( content )
	     .addClass( className );
	 if (hideMessage) {
		 setTimeout(function(){$( "#"+id ).hide(800);},1600);
	 }
}

function getEntidadRelacionData() {
	  $.ajax({
	       url: actionName + ".do?method=cargarDatos",
	       dataType: "json",
	       async: false,
	       data: {
	    	 entidadRelacionId: $("#entidadRelacionId").attr("value")
	       },
	       success: function(data) {
	    	   if (data == null || data.tipo == null || data.uvt == null || data.descripcion == null) {
	    		   alert("La operación falló, cierre la sesión y vuelva a ingresar");
	    	   } else {
		    	   $("#tipoEntidad").attr('value', data.tipo);
		    	   $("#tipo").html("<b>Tipo: </b>" + data.tipo);
		    	   $("#uvt").html("<b>Uvt: </b> " + data.uvt);
		    	   $("#descripcion").html("<b>Descripción: </b> " + data.descripcion);
		    	   
		    	   $("#autoCompletePrestadorDiv").hide();
		    	   $("#autoCompleteBeneficiarioDiv").hide();
		    	   $("#autoCompleteContraparteDiv").hide();
		    	   
	    		   $("#autoComplete" + data.tipo + "Div").show();
	    		   if (data.descripcionEntidadAsociada != null) {
	        		   setAutocompleteData(data.tipo, data.idEntidadRelacionada, data.descripcionEntidadAsociada);
			    	   $("#entidadRelacionadaId").attr('value', data.idEntidadRelacionada);
	    		   } else {
			    	   $("#entidadRelacionadaId").attr('value', "0");
	    		   }
	    	   }
	    	   stopLoading();
	       }
	     });
	 
}

function setAutocompleteData(tipo, idEntidadRelacionada, descripcionEntidadAsociada) {
	$("#id" + tipo).val(idEntidadRelacionada);
	$("#autoComplete" + tipo).val(descripcionEntidadAsociada);
	setVisibilidadSeleccionAutocomplete(tipo);
}