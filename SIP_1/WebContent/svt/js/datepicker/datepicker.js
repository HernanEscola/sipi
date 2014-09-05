
//Este script obliga a que el input de la fecha tenga id="id_fecha".<br>
//Puede que se necesite m�s de una fecha o utilizar otro id, para ello se agrega
//la posibilidad de agregar un hidden con id="id_nombres_fecha", en donde se colocan
//los nombres de fechas separadas por coma id1,id2,id3.
//Por ejemplo: 
/* Inicializaci�n en espa�ol para la extensi�n 'UI date picker' para jQuery. */
/* Traducido por Vester (xvester@gmail.com). */

(function($) {
$.datepicker.regional['es'] = {		clearText : 'Limpiar',
		clearStatus : '',
		// minDate : 0,  si pongo el minDate=0 ofrecer� los calendarios con los dias deshabilitados hasta la fecha de hoy.
		
		closeText : 'Cerrar',
		closeStatus : '',
		prevText : '&#x3c;Ant',
		prevStatus : '',
		prevBigText : '&#x3c;&#x3c;',
		prevBigStatus : '',
		nextText : 'Sig&#x3e;',
		nextStatus : '',
		nextBigText : '&#x3e;&#x3e;',
		nextBigStatus : '',
		currentText : 'Hoy',
		currentStatus : '',
		monthNames : [ 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
				'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre',
				'Diciembre' ],
		monthNamesShort : [ 'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul',
				'Ago', 'Sep', 'Oct', 'Nov', 'Dic' ],
		monthStatus : '',
		yearStatus : '',
		weekHeader : 'Sm',
		weekStatus : '',
		dayNames : [ 'Domingo', 'Lunes', 'Martes', 'Mi�rcoles', 'Jueves',
				'Viernes', 'S�bado' ],
		dayNamesShort : [ 'Dom', 'Lun', 'Mar', 'Mi�', 'Juv', 'Vie', 'S�b' ],
		dayNamesMin : [ 'Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'S�' ],
		dayStatus : 'DD',
		dateStatus : 'D, M d',
		dateFormat : 'dd/mm/yy',
		firstDay : 1,
		initStatus : '',
		isRTL : false,
		showMonthAfterYear : false,
		yearSuffix : ''
	};
	$.datepicker.setDefaults($.datepicker.regional['es']);
})(jQuery);

$(function() {
	var id_input = "id_fecha";
	var ids = new Array();
	ids[0] = id_input;
	if (document.getElementById("id_nombres_fecha")) {
		ids = $("#id_nombres_fecha").val().split(",");
	}
	// $.datepicker.setDefaults($.extend({showMonthAfterYear: true},
	// $.datepicker.regional['es']));
	for ( var i = 0; ids.length > i; i++) {
		$("#" + ids[i]).datepicker( {
			dateFormat : 'dd-mm-yy'
		});
	}
});

var CPeriodoPicker = Class.extend( {
	/*
	 * opciones: desde: id del elemento del per�odo desde es obligatorio hasta:
	 * id del elemento del per�odo hasta olbigatorio
	 */
	construct : function(opciones) {
		$('#'+opciones.desde+', #'+opciones.hasta).datepicker(
				{
					//defaultDate : "+1w",

					numberOfMonths : 1,
					dateFormat : 'dd-mm-yy',
					 changeMonth: true,
					 changeYear: true,
					onSelect : function(selectedDate) {
						var option = this.id == opciones.desde ? "minDate" : "maxDate";
						var datePick = this.id == opciones.desde ? $('#'+opciones.hasta) : $('#'+opciones.desde);
						var instance = $(this).data("datepicker");
						var date = $.datepicker.parseDate(
								instance.settings.dateFormat
										|| $.datepicker._defaults.dateFormat,
								selectedDate, instance.settings);

						datePick.datepicker("option", option, date);
					},
					onClose: function(dateText, inst) {
						var option = this.id == opciones.hasta ? "maxDate" : "minDate";
						var datePick = this.id == opciones.hasta ? $('#'+opciones.desde) : $('#'+opciones.hasta);
			            if ($('#'+this.id).val() == ''){
			            	datePick.datepicker("option", option, null);
			              }  
			        }
				});

	}

});



/**
 * 
 * 
 * este periodo picker se diferencia del anterior porque borrara, en el momento, las fechas que se estan informando
 * que no cumplen la condici�n fechaDesde<=fechahasta
 * 
 * El otro periodoPicker lo que hace es pisar las fechas incorrectas con una v�lida, y no dejar� los campos de fechas vac�os.
 * 
 * Por ello, se debe tener en cuenta que luego de cargar las fechas hay que validar que se hayan informado las fechas, porque
 * este constructor no modificar� autom�ticamente las fechas para que sean v�lidas, sino que las blanquear�. 
 */
var CPeriodoPickerParaRegistrarFechas = Class.extend( {
	/*
	 * opciones: desde: id del elemento del per�odo desde es obligatorio hasta:
	 * id del elemento del per�odo hasta olbigatorio
	 */
	construct : function(opciones) {
		$('#'+opciones.desde+', #'+opciones.hasta).datepicker(
				{
					//defaultDate : "+1w",

					numberOfMonths : 1,
					dateFormat : 'dd-mm-yy',
					changeMonth: true,
					changeYear: true,
					// despues de seleccionar
					onSelect : function(selectedDate) {
						
						var datePick = this.id == opciones.desde ? $('#'+opciones.hasta) : $('#'+opciones.desde);
						var instance = $(this).data("datepicker");
						
						// si est� cargando la fecha desde inicializa fechas desde y hasta
						if (this.id == opciones.desde){
							var fdesde = $.datepicker.parseDate(instance.settings.dateFormat
											|| $.datepicker._defaults.dateFormat,selectedDate, instance.settings);
	
							var fhasta = $.datepicker.parseDate(instance.settings.dateFormat
											|| $.datepicker._defaults.dateFormat,datePick.val(), instance.settings);
							//Si esta informando la fecha desde y la fecha hasta es mayor a esta, deshabilitar� en el calendario
							//de la fecha hasta los d�as anteriores a la fecha desde. 
							if (fhasta>=fdesde || fhasta ==null){
								datePick.datepicker("option", "minDate", fdesde);
							}else{
								// sino, blanquear� la f.desde y actualizar� su calendario para no elegir fechas mayores a la f.hasta
								$('#'+this.id).val("");
								$('#'+this.id).datepicker("option", "maxDate", fhasta);
							}
						
						// si esta cargando la fecha hasta inicializa para este caso
						}else if (this.id == opciones.hasta){
							var fhasta = $.datepicker.parseDate(instance.settings.dateFormat
											|| $.datepicker._defaults.dateFormat,selectedDate, instance.settings);
							var fdesde = $.datepicker.parseDate(instance.settings.dateFormat
											|| $.datepicker._defaults.dateFormat,datePick.val(), instance.settings);
							// si la fecha hasta que est� informando es mayor a la fecha desde deshabilitara en el calendario de
							// la fecha desde los dias posteriores a la fecha hasta
							if (fhasta>=fdesde || fdesde ==null){
								datePick.datepicker("option", "maxDate", fhasta);
							}else{
							// si la f.hasta es mayor a la f.desde entonces la blanquear� para que la cargue nuevamente
							// y actualizar� el calendario de la f.hasta para que no permita cargar fechas menores a la f.desde	
								$('#'+this.id).val("");
								$('#'+this.id).datepicker("option", "minDate", fdesde);
							}
						}
					},
					
					// cuando pierde el foco controla lo que ha informado 
					onClose: function(dateText, inst) {
						  if (dateText != ""  ){
									
									var datePick = this.id == opciones.hasta ? $('#'+opciones.desde) : $('#'+opciones.hasta);
									var instance = $(this).data("datepicker");
									
									// si estaba sobre la fecha desde prepara para comparar fechas desde y hasta
									if (this.id == opciones.desde){
										var fdesde = $.datepicker.parseDate(instance.settings.dateFormat
																	|| $.datepicker._defaults.dateFormat,dateText, instance.settings);
						
										var fhasta = $.datepicker.parseDate(instance.settings.dateFormat
																	|| $.datepicker._defaults.dateFormat,datePick.val(), instance.settings);

										// si la f.hasta es menor a la f.desde deshabilitar� del calendario 
										//de selecci�n de f.hasta los d�as anteriores a la f.desde
										if (fhasta>=fdesde || fhasta ==null){
											datePick.datepicker("option", "minDate", fdesde);
										}else{
											//si f.hasta es menor a f.desde,blanquea la �ltima para que la ingrese nuevamente
											//y actualiza su calendario para no cargar fechas mayores a hasta	
											$('#'+this.id).val("");
											$('#'+this.id).datepicker("option", "maxDate", fhasta);
											
										}
									//Si estaba sobre la fecha hasta...
									} else if (this.id == opciones.hasta){
										var fhasta = $.datepicker.parseDate(instance.settings.dateFormat
														|| $.datepicker._defaults.dateFormat,dateText, instance.settings);
			
										var fdesde = $.datepicker.parseDate(instance.settings.dateFormat
														|| $.datepicker._defaults.dateFormat,datePick.val(), instance.settings);
										// verifica que la f.hasta sea mayor a f.desde y deshabilita del calendario de f.desde los dias posteriores a f.hasta
										if (fhasta>=fdesde || fdesde ==null){
											datePick.datepicker("option", "maxDate", fhasta);
										}else{
										// si la f.hasta es mayor a la f.desde, blanquea f.hasta y actualiza su calendario para no cargar fechas mayores a f.desde
											$('#'+this.id).val("");
											$('#'+this.id).datepicker("option", "minDate", fdesde);
											
										}
									}
									
						  } else{
							  // si se inform� vac�o entonces habilitar� completamente el calendario de la otra fecha
							  if (this.id == opciones.desde){
								  $('#'+this.id).datepicker("option", "minDate", null); 
							  }else{
								  $('#'+this.id).datepicker("option", "maxDate", null); 
							  }
							  
						  }
					}
				});

	}

});
