$( document ).ready(function() {
   	$( "#altaHojaRuta" ).dialog({
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
      height: 480,
      width: 600,      
      close: function() {    	         
      },
      create: function() {
    		  ieFix();      		  
      }
    });
   	
   	$("#descripcion").autosize();
   	
   	
   	$(".hojaRutaMappedButton").click(function(elem) {
   		$("#convenioId").attr("value",$(this).attr('id'));
   		openHojaRutaAltaDialog();
   	});
   	
    $(".hojaRutaButton").click(function(elem) {
    	openHojaRutaAltaDialog();
    });
    
    $(".deleteHojaRuta").on('click', function(elem) { 
    	openHojaRutaElimiarDialog($(this));
    });
        
    $(".editHojaRuta").on('click', function(elem) {
    	openHojaRutaModificarDialog($(this));
    });
    
    $( ".detalleHojaRuta" ).on('click', function(elem) {
    	openHojaRutaDetalleDialog($(this));   	
    });    
    
    $(".decargarFileHojaRuta").on('click', function(){
  		descargarArchivoHojaRuta($(this));
    });
    
    $(':file').change(function(){
    	uploadFile();
    });
    
    
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

function openHojaRutaAltaDialog() {	 		
	getConvenioData();
	cleanForm();
	$(".limpiable").attr("value",""); 
	$("#fileNameDiv").hide();
	$("#fileUpload").show();		
   	$('#altaHojaRuta').dialog("option",{buttons:{
        "Registrar": function() {
           	registrarHojaRuta();
          },
           Cerrar: function() {
               $( this ).dialog( "close" );                    
     } },title:"Registro de Hoja de Ruta"});    	
    $( "#altaHojaRuta" ).dialog( "open" );        
    $("#fechaHojaRuta").datepicker({dateFormat: 'dd-mm-yy'});
    $("#alta_message").hide();
    $("#fileNameDiv").css("display","none");
    $("#fechaHojaRuta").attr( 'readOnly' , 'true' );
    maxCharactesAutoSize("descripcion");
   
}


function openHojaRutaModificarDialog(elem) {
	getConvenioData();
	$(".limpiable").attr("value",""); 
	$(".limpiable").removeAttr("disabled");
	$("#hojaRutaId").attr("value", elem.attr('id'));    
	getData($("#hojaRutaId").attr("value"));
	$("#fechaHojaRuta").datepicker({dateFormat: 'dd-mm-yy'});
	$("#fechaHojaRuta").attr( 'readOnly' , 'true' );
	$("#alta_message").hide();
	 $('#altaHojaRuta').dialog("option",{buttons:{
	 "Registrar": function() {
        	updateHojaRuta();
       },
       Cerrar: function() {
           $( this ).dialog( "close" );
         } },title:"Modificar Hoja de Ruta"});    	 
	$( "#altaHojaRuta" ).dialog( "open" );  
	$("#descripcionCorta").focus();
	maxCharactesAutoSize("decripcion");
	$("#quitarFile").show();
	$("#quitarFile").click(function(){
		$("#fileNameDiv").hide(); $("#fileUpload").show();	
		quitarFile();
   });
	maxCharactesAutoSize("descripcion");
}

function openHojaRutaDetalleDialog(elem) {	
	getConvenioData();
	$(".limpiable").attr("value",""); 
	$("#hojaRutaId").attr("value", elem.attr('id'));    
	getData($("#hojaRutaId").attr("value"));    
	$("#alta_message").hide();
	 $('#altaHojaRuta').dialog("option",{buttons:{
       Cerrar: function() {
    	   $(".limpiable").removeAttr("disabled");
           $( this ).dialog( "close" );               
         } },title:"Detalle hoja de ruta"});    	 
	$( "#altaHojaRuta" ).dialog( "open" );  	
	$("#quitarFile").hide();
	$(".limpiable").attr("disabled","true");
} 

function openHojaRutaElimiarDialog(elem) {
	$(".limpiable").attr("value",""); 
	$("#hojaRutaId").attr("value",elem.attr('id'));  
	updateMessage("baja_message","", "¿Esta seguro que desea quitar esta Acción?. <br> Presione \"Eliminar\" para confirmar.",false);
	$( "#deleteHojaRutaConfirm" ).dialog({	      	      
	      minHeight:160,
	      minWidth:320,
          modal: true,
          resizable: false,
          create: function() {
        		  ieFix();    	  
          },
	      buttons: {
	        "Eliminar": function(){
	        	deleteHojaRuta();
	        },
	        Cerrar: function() {
	          $( this ).dialog( "close" );
	        }
	      },
	      open: function( event, ui ) {
	    	  $.ajax({
			       url: "cHojaRutaAltaAction.do",
			       dataType: "json",
			       data: {
			    	 method:"getDataHojaRuta",
			         id: $("#hojaRutaId").attr('value')        				         
			       },
			       success: function( data ) {
			    	   datos = "<div class=\"row_div\"><div class=\"label\">N° Proyecto: </div>";
			    	   datos += "<div class=\"hoja_ruta_dialog_fecha\">"+data.instrumentoCodigo+"</div></div>";
			    	   datos += "<div class=\"row_div\"><div class=\"label\">Fecha: </div>";
			    	   datos += "<div class=\"hoja_ruta_dialog_fecha\">"+data.fecha+"</div></div>";
			   		   datos += "<div class=\"row_div\"><div class=\"label\">Descripción: </div>";
			   		   datos += "<div class=\"hoja_ruta_dialog_descripcionCorta\">"+data.descripcion+"</div></div>";
			   		   $("#hoja_ruta_data").html(datos);
			       }
	    	  });	
	      },
	      title:"Eliminar Acción de la Hoja de Ruta."
	});
}

function descargarArchivoHojaRuta(elem) {
	window.open('cHojaRutaAltaAction.do?method=downloadFile&id='+elem.attr("id"),'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}

 
  function uploadFile(){		  
	  	  var oMyForm;	  	  
	  	  oMyForm = new FormData();
	  		  
	      oMyForm.append("file", document.getElementById("file").files[0]);	    
	      $.ajax({
	        url: "cHojaRutaAltaAction.do?method=uploadFile",
	        data: oMyForm,
	        processData: false,
	        contentType: false,
	        type: 'POST',		    
	        beforeSend: function( ) {
	        	loading();
	        	var size = document.getElementById("file").files[0].size;	       
	        	var TAMMAX = 3;
	        	if(size>TAMMAX*1024*1024){
	        		updateMessage("alta_message","ui-state-error","El tamaño del archivo no debe exceder los "+TAMMAX+" Mb",false);
	        		$(':file').attr("value","");
	        		stopLoading();
	        		return false;
	        	}
	        	return true;
	        },
		    success: function( data ) {
			         if(data.errores.length>0){
			 			for (var i = 0; i < data.errores.length; i++) {  
			 				updateMessage("alta_message","ui-state-error",formatErrors(data.errores),false);			 							 				
						}
			 			$(':file').attr("value","");
			         }
			         else{
			        	 updateMessage("alta_message","ui-state-success","Se subió el archivo correctamente!",true);			
			        	 setTimeout(function(){$( "#alta_message" ).hide(500);},1600);
			         }
			 }       
	      });
	      return false;

  }
  
  
  function registrarHojaRuta(){    	
		  $.ajax({
			       url: "cHojaRutaAltaAction.do",
			       dataType: "json",
			       contentType:'application/json;charset=iso-8859-1',
			       data: {
			    	 method:"Registrar",
			    	 descripcionCorta: encodeURIComponent($("#descripcionCorta").attr("value")),
			    	 descripcion: encodeURIComponent($("#descripcion").attr("value")),
			         instrumentoId: $("#convenioId").attr("value"),
			         fecha: $("#fechaHojaRuta").attr("value")					         
			       },
			       success: function( data ) {
			         if(data.errores.length>0){
			 			for (var i = 0; i < data.errores.length; i++) {  
			 				updateMessage("alta_message","ui-state-error", formatErrors(data.errores),false);
						}		        	 
			         }
			         else{
			        	 updateMessage("alta_message","ui-state-success","Se ha registrado correctamente la operación! ",true);
			        	 createRowHojaRuta(data.hojaRuta);
			        	 setTimeout(function(){$( "#altaHojaRuta" ).dialog( "close");},1600);
			         }
			       }
			     });	  
  }
  
  
	
	function deleteHojaRuta(){
		  $.ajax({
		       url: "cHojaRutaAltaAction.do",
		       dataType: "json",
		       data: {
		    	 method:"Baja",
		         id: $("#hojaRutaId").attr('value')        				         
		       },
		       success: function( data ) {
			         if(data.errores.length>0){
				 		for (var i = 0; i < data.errores.length; i++) {  
				 			updateMessage("baja_message","ui-state-error",data.errores[i],false);
						}		        	 
				      }
				      else{
				         updateMessage("baja_message","ui-state-success","Se elimino correctamente!",true);	
				         deleteRow($("#hojaRutaId").attr('value'));
				         setTimeout(function(){$( "#deleteHojaRutaConfirm" ).dialog( "close");},1600);
				      }	
		       }
		     });	
	}
	
	 function updateHojaRuta(){    	
		  $.ajax({
			       url: "cHojaRutaAltaAction.do",
			       dataType: "json",
			       contentType:'application/json;charset=iso-8859-1',
			       data: {
			    	 method:"Modificar",
			    	 descripcionCorta: encodeURIComponent($("#descripcionCorta").attr("value")),
			    	 descripcion: encodeURIComponent($("#descripcion").attr("value")),
			         instrumentoId: $("#convenioId").attr("value"),
			         fecha: $("#fechaHojaRuta").attr("value")					         
			       },
			       success: function( data ) {
			         if(data.errores.length>0){
			 			for (var i = 0; i < data.errores.length; i++) {  
			 				updateMessage("alta_message","ui-state-error",formatErrors(data.errores),false);
						}		        	 
			         }
			         else{			        	 
			        	 updateMessage("alta_message","ui-state-success","Se ha registrado correctamente la operación! ",true);
			        	 updateRowData(data.hojaRuta);
			        	 setTimeout(function(){$( "#altaHojaRuta" ).dialog( "close");},1600);
			         }
			       }
			     });	  
	 }	
	 
	 function getData(id){
		  $.ajax({
		       url: "cHojaRutaAltaAction.do",
		       dataType: "json",
		       data: {
		    	 method:"getData",
		    	 id: id					         
		       },
		       success: function( data) {
		    	   
		    	   $("#fechaHojaRuta").attr("value",data[0].fecha);	
		    	   $("#descripcionCorta").attr("value",data[0].descripcionCorta);
		    	   $("#descripcion").attr("value",data[0].descripcion).trigger('autosize.resize'); 
		    	   if(data[0].fileName!=""){
		    		   $("#fileUpload").hide();
		    		   $("#fileNameDiv").show();
		    		   $("#fileNameDiv input").css("display","inline");
		    		   $("#fileName").attr("value",data[0].fileName);
		    	   }
		    	   else{
		    		   $("#fileNameDiv").hide();
		    		   $("#fileUpload").show();
		    	   }
		       }
		     });		 
		 
	 }
	 
	 function getConvenioData(){
		  $.ajax({
		       url: "cHojaRutaAltaAction.do",
		       dataType: "json",
		       async: false,
		       data: {
		    	 method:"getConvenioData",
		    	 instrumentoId: $("#convenioId").attr("value")			         
		       },
		       success: function( data) {		    
		    	   $("#codigoProyecto").html("<b>N° Proyecto: </b>"+data[0].codigo);
		    	   if(data[0].expedienteNumero!=null)
		    		   $("#expedienteNumero").html("<b>N° Expediente: </b>"+data[0].expedienteNumero);	
		    	   if(data[0].contratante!=null)
		    		   $("#contratante").html("<b>Contratante: </b> "+data[0].contratante);
		    	   if(data[1].length>0){
		    		   $("#resoluciones").html("<b>Resolución: </b>");
		    		   $("#resoluciones").append(data[1][0].numero);	
		    		   for(var i=1;i<data[1].length;i++){
		    			   $("#resoluciones").append(" - " + data[1][i].numero);	
		    		   }		    		   
		    	   }
		       }       
		     });		 
		 
	 }	 
	 
	 function quitarFile(){
		  $.ajax({
		       url: "cHojaRutaAltaAction.do",
		       dataType: "json",
		       data: {
		    	 method:"quitarFile",
		    	 id: $("#hojaRutaId").attr("value")					         
		       },
		       success: function( data) {
		    	   $("#fileNameDiv").css("display","none");	
	    		   $("#fileUpload").css("display","block");
		       }
		     });
		 
	 }
	 
//Updetea la fila de al Hoja de Ruta
function updateRowData(hojaRuta) {
 	row = $('#hoja_ruta_'+hojaRuta.id);
	row.children('.hr_fecha').html(hojaRuta.fecha);
	row.children('.hr_usr').html(hojaRuta.usuario);
	row.children('.hr_accion').children('p').html(hojaRuta.descCorta);
	row.children('.hr_accion').children('p').attr('title', hojaRuta.descripcion);
	downloadIcon = row.children('.hr_seleccionar').children(":first");
	if(hojaRuta.archivoId < 0) {
		if (downloadIcon.hasClass('el-icon-download-alt')) {
			downloadIcon.removeClass('el-icon-download-alt');
			downloadIcon.addClass('icon-elusive-none-svt');
		}
	} else {
		if (downloadIcon.hasClass('icon-elusive-none-svt')) {
			downloadIcon.removeClass('icon-elusive-none-svt');
			downloadIcon.addClass('el-icon-download-alt');
		}
	}
}

function createRowHojaRuta(hojaRuta) {
	var iconoDescarga = "";
	if (hojaRuta.archivoId < 0)
		iconoDescarga = "icon-elusive-none-svt";
	else
		iconoDescarga = "el-icon-download-alt ";
	var htmlRow = "<tr id=\"hoja_ruta_"+hojaRuta.id+"\">";
	htmlRow += "<td style=\"width: 20px;\" class=\"hr_indice\"><a id=\""+hojaRuta.id+"\" class=\"CformBotonTransp detalleHojaRuta\"></a></td>";
	htmlRow += "<td style=\"width: 120px;\" class=\"hr_fecha\">"+hojaRuta.fecha+"</td>";
	htmlRow += "<td style=\"width: 160px;\" class=\"hr_usr\">"+hojaRuta.usuario+"</td>";
	htmlRow += "<td class=\"hr_accion\"><p>"+hojaRuta.descCorta+"</p></td>";
	htmlRow += "<td style=\"width: 80px;\" class=\"hr_seleccionar\"><a id=\""+hojaRuta.id+"\" class=\""+iconoDescarga+" tooltip icon-elusive-svt decargarFileHojaRuta\" title=\"Descargar\"></a>";
	htmlRow += "<a id=\""+hojaRuta.id+"\" class=\"el-icon-check icon-elusive-svt tooltip editHojaRuta\" title=\"Modificar\"></a>";
	htmlRow += "<a id=\""+hojaRuta.id+"\" class=\"el-icon-trash icon-elusive-svt tooltip deleteHojaRuta\" title=\"Eliminar\"></a></td></tr>";
	
	var $fila = $(htmlRow);
	$('#hojaRutaTabla > tbody > tr:first').before($fila);
	if ($('#hojaRutaTabla').find('tr.empty').length) {
		$('#hojaRutaTabla tr.empty').remove();
	}
	refreshRows();
	$fila.effect("highlight", 4500);
	$(".detalleHojaRuta").on('click', function(){openHojaRutaDetalleDialog($(this));});
	$('.editHojaRuta').on('click', function(){openHojaRutaModificarDialog($(this));});
	$('.deleteHojaRuta').on('click', function(){openHojaRutaElimiarDialog($(this));});
	$('.hr_accion p').tooltip();
	if (hojaRuta.archivoId >= 0)
		$(".decargarFileHojaRuta").on('click', function(){descargarArchivoHojaRuta($(this));});
	//refreshRows();
}

function deleteRow(hojaRutaId) {
	$("#hoja_ruta_"+hojaRutaId).fadeOut(300, function(){
		$("#hoja_ruta_"+hojaRutaId).remove();
		if (!$('#hojaRutaTabla tbody tr').length)
			$('#hojaRutaTabla').append('<tr class="empty"><td colspan="100%">No se encontraron resultados.</td></tr>');
		refreshRows();
	});
}

function refreshRows() {
	$("#hojaRutaTabla tr").each(function(index) {
		$(this).children('.hr_indice').children('a').html(index);
	});	
    $("#hojaRutaTabla tr").removeClass("even").removeClass("odd");
    $("#hojaRutaTabla").each(function() {
      $('tr:even', $(this)).addClass('even');
      $('tr:odd', $(this)).addClass('odd');
    });
}

function cleanForm(){
	  $.ajax({
	       url: "cHojaRutaAltaAction.do",
	       dataType: "json",
	       data: {
	    	 method:"cleanForm"	   	 				        
	       },
	       success: function(data) {
	    	   $(".limpiable").removeAttr("disabled");
	       }
	       
	     });	
}


