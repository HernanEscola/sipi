  function ieFix(){
		var ie = $("#ie").val();
		if(ie=="true"){
			$(".ui-corner-all").removeClass("ui-dialog-titlebar");
			$(".ui-corner-all").removeClass("ui-dialog-titlebar-close");		
			$("span:contains('Registrar')").css("color","red");
		}
	}
  
  function updateMessage(id,className, content,hideMessage){
		 element = $("#"+id);
		 element
		 	 .show()
		 	 .removeClass()
			 .html( content )
		     .addClass( className );
		 if(hideMessage){
			 setTimeout(function(){$( "#"+id ).hide(800);},1600);
		 }
	 }
  
  function maxCharactesAutoSize(id){
		$("#"+id)
		.prop('maxlength', '800')
		.trigger('autosize.resize');
	}
  
  function formatErrors(errores) {
		var mensaje = "";
		mensaje += "Errores encontrados:</br><ul>";
		for (var i = 0; i < errores.length; i++) {
			mensaje += "<li>"+errores[i]+"</li>";
		}
		mensaje += "</ul>";	
		return mensaje;
	}
  

  function loading(){
      $('.loadingDiv').show();  	   
      $('.ui-dialog :button').attr("disabled",true);   
  }

  function stopLoading(){
      $('.loadingDiv').hide().fadeOut("slow");    	
      $('.ui-dialog :button').attr("disabled",false);      
  }