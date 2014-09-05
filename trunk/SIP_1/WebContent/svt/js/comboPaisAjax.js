
function generarCombos(actionForm, parametro, paisArgentina){
	
	
	
	 if(parametro ==  null){
		 parametro = "";
	 }
	 
	 bloquearSiEsExtranjero(parametro,paisArgentina);
	 
	 var actionForm = "cComboPaisAction.do";
	
	 $("#cboPais"+parametro).change(function(){
		 $.ajax({
		   type: "POST",
		   url: actionForm,
		   data: "btnSubmit=prepararComboProvincias&codSelect="+$("#cboPais"+parametro).val()+"&tipoCombo="+parametro,
		   dataType: "json",
		   success: function(data){
			    var select = generarOpcionesHTMLCombo(data);
			    $("#cboProvincia"+parametro).html(select);
			    $("#cboProvincia"+parametro).attr('value', '-1');
			    //esto lo hago para que si y habia seleccionado algo en los combos y se modifica el de pais,
			    //se limpie el resto, excepto el de provincias, que es el que se genera aca al modificar el pais
			    var selectVacio = "";
			    selectVacio+="<option value=\"-1\">Seleccionar</option>";
			    selectVacio+="<option value=\"-2\">---------------</option>";
			    $("#cboPartido"+parametro).html(selectVacio);
			    $("#cboPartido"+parametro).attr('value', '-1');
			    $("#cboLocalidad"+parametro).html(selectVacio);
			    $("#cboLocalidad"+parametro).attr('value', '-1');
			    bloquearSiEsExtranjero(parametro,paisArgentina);
		   },
		   error: function (XMLHttpRequest, textStatus, errorThrown) {
			   // typically only one of textStatus or errorThrown 
			   // will have info
			   this; // the options for this ajax request
		   }
		 });
	 });
	 

	
	 
	 $("#cboProvincia"+parametro).change(function(){
	     $.ajax({
	         type: "POST",
	         url: actionForm,
	         data: "btnSubmit=prepararComboPartidos&codSelect="+$("#cboProvincia"+parametro).val()+"&tipoCombo="+parametro,
	         dataType: "json",
	         success: function(data){
	            var select = generarOpcionesHTMLCombo(data);
	            $("#cboPartido"+parametro).html(select);
	            $("#cboPartido"+parametro).attr('value', '-1');
	            //esto lo hago para que si y habia seleccionado algo en los combos y se modifica la provincia,
			    //se limpie el combo de localidades
	            var selectVacio = "";
			    selectVacio+="<option value=\"-1\">Seleccionar</option>";
			    selectVacio+="<option value=\"-2\">---------------</option>";
			    $("#cboLocalidad"+parametro).html(selectVacio);
			    $("#cboLocalidad"+parametro).attr('value', '-1');
			    bloquearSiEsExtranjero(parametro,paisArgentina);
	         }
	     });
	 });
	 
	 $("#cboPartido"+parametro).change(function(){
	     $.ajax({
	         type: "POST",
	         url: actionForm,
	         data: "btnSubmit=prepararComboLocalidades&codSelect="+$("#cboPartido"+parametro).val()+"&tipoCombo="+parametro,
	         dataType: "json",
	         success: function(data){
	            var select = generarOpcionesHTMLCombo(data);
	            $("#cboLocalidad"+parametro).html(select);
	            $("#cboLocalidad"+parametro).attr('value', '-1');
	            bloquearSiEsExtranjero(parametro,paisArgentina);
	         }
	     });
	 });
	 

}

function bloquearSiEsExtranjero(parametro,paisArgentina){
	 if($("#cboPais"+parametro).val() != paisArgentina){
		 $("#cboLocalidad"+parametro).attr('disabled', 'disabled');
		 $("#cboPartido"+parametro).attr('disabled', 'disabled');
		 $("#cboProvincia"+parametro).attr('disabled', 'disabled');
	 }else{
		 $("#cboProvincia"+parametro).removeAttr('disabled');
		 var sel =  $("#cboProvincia"+parametro).val();
		 if( sel != "-1" && sel != "-2" && sel != null && sel != ""){
			 $("#cboPartido"+parametro).removeAttr('disabled');
			 var sel =  $("#cboPartido"+parametro).val();
			 if( sel != "-1" && sel != "-2" && sel != null && sel != ""){
				 $("#cboLocalidad"+parametro).removeAttr('disabled');
			 }else{
				 $("#cboLocalidad"+parametro).attr('disabled', 'disabled');
			 }
		 }else{
			 $("#cboLocalidad"+parametro).attr('disabled', 'disabled');
			 $("#cboPartido"+parametro).attr('disabled', 'disabled');
		 }
	 }
}

function generarOpcionesHTMLCombo(data){
	var select = "";
	select+="<option value=\"-1\">Seleccionar</option>";
	select+="<option value=\"-2\">---------------</option>";
	 
	if(data != null){
	for (var i = 0; i < data.length; i++) {
	  select+="<option value=\"" + data[i].codigo + "\">" +data[i].descripcion+ "</option>";
	}
	}
	return select;
}