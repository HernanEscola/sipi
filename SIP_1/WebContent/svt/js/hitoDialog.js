$( document ).ready(function() {
   	$( "#hitoDialog" ).dialog({
      autoOpen: false,
      modal: true,
      resizable: false,
      show: {
          effect: "blind",
          duration: 300
        },
        hide: {
          effect: "explode",
          duration: 300
        },      
      height: 400,
      width: 350,      
      close: function() {    	         
      },
      create: function() {
    	  ieFix();  
      }
    });
   	
   	$( "#marcarVisto" ).dialog({
        autoOpen: false,
        modal: true,
        resizable: false,
        show: {
            effect: "blind",
            duration: 300
          },
          hide: {
            effect: "explode",
            duration: 300
          },      
        height: 400,
        width: 350,      
        close: function() {    	         
        },
        create: function() {
      	  ieFix();  
        }
      });   	
   	
   	$( "#deleteHitoConfirm" ).dialog({
        autoOpen: false,
        modal: true,
        resizable: false,
        show: {
            effect: "blind",
            duration: 300
          }, 
          hide: {
            effect: "explode",
            duration: 300
          },      
        height: 230,
        width: 350,      
        close: function() {    	         
        },
        create: function() {
      		ieFix();      		  
        }
      });  	
  	
    $(".hitoMarcarRealizado").on('click', function(elem) {
    	openHitoMarcarRelizadoDialog($(this));
    });
        
    $(".hitoBaja").on('click', function(elem) {
    	openHitoBajaDialog($(this));
    });
    
    $(".hitoVisto").on('click', function(elem) {
    	openHitoMarcarVistoDialog($(this));
    });    
     
    $("#observacionRealizacion").autosize();
    
    jQuery.ajaxSetup({
    	  beforeSend: function() {    		  
    		  loading();
    	  },
    	  complete: function(){
    		  stopLoading();
    	  },
    	  error: function() {
    		  alert("La operación fallo, cierre la sesión y vuelva a ingresar");    			 
    	  }
    	});     
  });


var isProcessing = false;

function openHitoMarcarRelizadoDialog(elem) {
	cleanInputs();
	$("#hitoId").attr("value", elem.attr('id'));    
	getHitoData($("#hitoId").attr("value"));
	$("#fechaCumplimientoHito").datepicker({dateFormat: 'dd-mm-yy'});
	$("#hito_realizado_message").hide();
	 $('#hitoDialog').dialog("option",{buttons:{
	 "Registrar": function() {
		 hitoMarcarRealizado();
       },
       Cerrar: function() {
           $( this ).dialog( "close" );
         } },title:"Marcar Hito Como Realizado"});    	 
	$( "#hitoDialog" ).dialog( "open" ); 
	$("#fechaCumplimientoHito").attr( 'readOnly' , 'true' );
	$("#descripcionCorta").focus();
	maxCharactesAutoSize("observacionRealizacion");

}


function openHitoBajaDialog(elem) {
	cleanInputs(); 
	$("#hitoId").attr("value",elem.attr('id'));  
	getHitoData($("#hitoId").attr("value"));
	updateMessage("hito_baja_message","", "¿Esta seguro que desea quitar esta Acción? <br> Presione \"Eliminar\" para confirmar.",false);
	$("#deleteHitoConfirm").dialog("option", {buttons:{
	        "Eliminar": function(){
	        	deleteHito();
	        },
	        Cerrar: function() {
	          $( this ).dialog( "close" );
	        }
	      },
	      title:"Eliminar Hito."
	});
	$("#deleteHitoConfirm").dialog( "open" ); 
}

function openHitoMarcarVistoDialog(elem) {
	cleanInputs();
	$("#hitoId").attr("value", elem.attr('id'));    
	getHitoData($("#hitoId").attr("value"));	
	$("#hito_visto_message").hide();
	 $('#marcarVisto').dialog("option",{buttons:{
	 "Registrar": function() {
		 hitoMarcarVisto();
       },
       Cerrar: function() {
           $( this ).dialog( "close" );
         } },title:"Marcar Hito Como Visto"});    	 
	$( "#marcarVisto" ).dialog( "open" ); 		
	maxCharactesAutoSize("observacionVisto");

}

function cleanInputs() {
	$(".limpiable").attr("value",""); 
	$(".limpiable").removeAttr("disabled");
	$(".limpiable").prop('checked', false); 
	$("#hito_baja_message").hide();
	$("#hito_realizado_message").hide();
}

 
function deleteHito() {
	if(isProcessing){
        return;
    }
	isProcessing = true;
	$.ajax({
		url : "cHitoAction.do",
		dataType : "json",
		data : {
			method : "Baja",
			id : $("#hitoId").attr('value')
		},
		success : function(data) {
			if (data.errores.length > 0) {
				isProcessing = false;
				for (var i = 0; i < data.errores.length; i++) {
					updateMessage("hito_baja_message", "ui-state-error",	data.errores[i], false);
				}
			} else {
				updateMessage("hito_baja_message", "ui-state-success", "Se eliminó correctamente!", true);
				if (data.predecesorId)
					marcarPadreBajable(data.predecesorId);
				deleteRowHito($("#hitoId").attr('value'));
				setTimeout(function() {	$("#deleteHitoConfirm").dialog("close");isProcessing = false;}, 1600);
			}
		}
	});
}
	
function hitoMarcarRealizado() {
	if(isProcessing){
        return;
    }
	isProcessing = true;
	$.ajax({
		url : "cHitoAction.do",
		dataType : "json",
		contentType : 'application/json;charset=iso-8859-1',
		data : {
			method : "marcarRealizado",
			fechaCumplimientoHito : $("#fechaCumplimientoHito").attr("value"),
			observacionRealizacion : encodeURIComponent($("#observacionRealizacion").attr("value")),
			impactaHojaRuta : $("#impactaHojaRuta").is(':checked')
		},
		success : function(data) {
			if (data.errores.length > 0) {
				isProcessing = false;
				for (var i = 0; i < data.errores.length; i++) {
					updateMessage("hito_realizado_message", "ui-state-error", formatErrors(data.errores), false);
				}
			} else {
				updateMessage("hito_realizado_message", "ui-state-success", "Se ha registrado correctamente la operación! ", true);
				if ($("#selectEstado :selected").attr('value') == 'N')
					deleteRowHito($("#hitoId").attr('value'));
				else
					updateHitoRealizadoRowData(data.hojaRuta);
				marcarHijosRealizables($("#hitoId").attr('value'));
				if (data.hojaRuta) 
					createRowHojaRuta(data.hojaRuta);				 
				setTimeout(function() {	$("#hitoDialog").dialog("close");isProcessing = false;}, 1600);
			}
		}
	});
}	
	 

function hitoMarcarVisto() {
	if(isProcessing){
        return;
    }
	isProcessing = true;
	$.ajax({
		url : "cHitoAction.do",
		dataType : "json",
		contentType : 'application/json;charset=iso-8859-1',
		data : {
			method : "marcarVisto",			
			observacionVisto : encodeURIComponent($("#observacionVisto").attr("value")),
			impactaHojaRuta : $("#impactaHojaRutaVisto").is(':checked')
		},
		success : function(data) {
			if (data.errores.length > 0) {
				isProcessing = false;
				for (var i = 0; i < data.errores.length; i++) {
					updateMessage("hito_visto_message", "ui-state-error", formatErrors(data.errores), false);
				}
			} else {
				updateMessage("hito_visto_message", "ui-state-success", "Se ha registrado correctamente la operación! ", true);
				if ($("#selectEstado :selected").attr('value') == 'N')
					deleteRowHito($("#hitoId").attr('value'));
				else
					updateHitoVistoRowData(data.hojaRuta);				
				if (data.hojaRuta) 
					createRowHojaRuta(data.hojaRuta);				 
				setTimeout(function() {	$("#marcarVisto").dialog("close");isProcessing = false;}, 1600);
			}
		}
	});
}	

function marcarHijosRealizables(hitoPadreId) {
	$(".hito_predecesor_mr_"+hitoPadreId).each(function( index ) {
		$(this).removeClass('icon-elusive-none-svt');
		$(this).addClass('el-icon-ok');
		$(this).attr('title', "Marcar como realizado");
	});
}

function marcarPadreBajable(hitoPadreId) {
	if ($(".hito_predecesor_baja_"+hitoPadreId).length == 1) {
		bajaIcon = $('#hito_'+hitoPadreId).children('.hito_seleccionar').find(".hitoBaja:first");
		bajaIcon.removeClass('icon-elusive-none-svt');
		bajaIcon.addClass('el-icon-trash');
		bajaIcon.attr('title', "Baja");
	}
	//tiene padre -> remuevo clase hito_predecesor_baja_PadreId
	//Si no existen mas elemento con la clase hito_predecesor_baja_PadreId -> marco el padre com bajable
}

function getHitoData(id) {
	$.ajax({
		url : "cHitoAction.do",
		dataType : "json",
		async: false,
		data : {
			method : "getData",
			id : id
		},
		success : function(data) {
			$(".hito_dialog_codigo_instrumento").html(data.instrumentoCodigo);
			$(".hito_dialog_fecha").html(data.fecha);
			$(".hito_dialog_descripcionCorta").html(data.descripcionCorta);
			$(".hito_dialog_actor").html(data.actor);
		}
	});
}

function updateHitoVistoRowData() {
 	row = $('#hito_'+$("#hitoId").attr('value'));
 	
 	row.removeClass('hito_vencido');
 	row.removeClass('hito_proximo_vencer');
 	row.addClass('hito_visto');
 	
	row.children('.hito_estado').html("Visto");
	vistoIcon = row.children('.hito_seleccionar').find(".hitoVisto:first");
	if (vistoIcon.hasClass('el-icon-time')) {
		vistoIcon.removeClass('el-icon-time');
		vistoIcon.addClass('icon-elusive-none-svt');
		vistoIcon.attr('title', "");
	}
}
	 
function updateHitoRealizadoRowData() {
 	row = $('#hito_'+$("#hitoId").attr('value'));
 	
 	row.removeClass('hito_vencido');
 	row.removeClass('hito_visto');
 	row.removeClass('hito_proximo_vencer');
 	
	row.children('.hito_estado').html("Realizado");
	realizarIcon = row.children('.hito_seleccionar').children(":first");
	bajaIcon = row.children('.hito_seleccionar').find(".hitoBaja:first");
	vistoIcon = row.children('.hito_seleccionar').find(".hitoVisto:first");
	if (realizarIcon.hasClass('el-icon-ok')) {
		realizarIcon.removeClass('el-icon-ok');
		realizarIcon.addClass('icon-elusive-none-svt');
		realizarIcon.attr('title', "");
	}
	if (bajaIcon.hasClass('el-icon-trash')) {
		bajaIcon.removeClass('el-icon-trash');
		bajaIcon.addClass('icon-elusive-none-svt');
		bajaIcon.attr('title', "");
	}
	if (vistoIcon.hasClass('el-icon-time')) {
		vistoIcon.removeClass('el-icon-time');
		vistoIcon.addClass('icon-elusive-none-svt');
		vistoIcon.attr('title', "");
	}
}

function deleteRowHito(hitoId) {
	$("#hito_"+hitoId).fadeOut(300, function(){
		$("#hito_"+hitoId).remove();
		if (!$('#hitoTabla tbody tr').length) {
			$('#hitoTabla').append('<tr class="empty"><td colspan="100%">No se encontraron resultados.</td></tr>');
			$('#hitoTabla').next().hide();
		}	
		refreshRowsHito();
	});
}

function refreshRowsHito() {
	$("#hitoTabla tr").each(function(index) {
		$(this).children('.hr_indice').children('a').html(index);
	});	
    $("#hitoTabla tr").removeClass("even").removeClass("odd");
    $("#hitoTabla").each(function() {
      $('tr:even', $(this)).addClass('even');
      $('tr:odd', $(this)).addClass('odd');
    });
}

function ieFix(){
	var ie = $("#ie").val();
	if(ie=="true"){
		$(".ui-corner-all").removeClass("ui-dialog-titlebar");
		$(".ui-corner-all").removeClass("ui-dialog-titlebar-close");		
		$("span:contains('Registrar')").css("color","red");
	}
}
