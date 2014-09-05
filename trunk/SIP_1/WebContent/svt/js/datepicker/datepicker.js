
//Este script obliga a que el input de la fecha tenga id="id_fecha".<br>
//Puede que se necesite más de una fecha o utilizar otro id, para ello se agrega
//la posibilidad de agregar un hidden con id="id_nombres_fecha", en donde se colocan
//los nombres de fechas separadas por coma id1,id2,id3.
//Por ejemplo: 
/* Inicialización en español para la extensión 'UI date picker' para jQuery. */
/* Traducido por Vester (xvester@gmail.com). */

(function($) {
$.datepicker.regional['es'] = {		clearText : 'Limpiar',
		clearStatus : '',
		// minDate : 0,  si pongo el minDate=0 ofrecerá los calendarios con los dias deshabilitados hasta la fecha de hoy.
		
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
		dayNames : [ 'Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves',
				'Viernes', 'Sábado' ],
		dayNamesShort : [ 'Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb' ],
		dayNamesMin : [ 'Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá' ],
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
	 * opciones: desde: id del elemento del período desde es obligatorio hasta:
	 * id del elemento del período hasta olbigatorio
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
 * que no cumplen la condición fechaDesde<=fechahasta
 * 
 * El otro periodoPicker lo que hace es pisar las fechas incorrectas con una válida, y no dejará los campos de fechas vacíos.
 * 
 * Por ello, se debe tener en cuenta que luego de cargar las fechas hay que validar que se hayan informado las fechas, porque
 * este constructor no modificará automáticamente las fechas para que sean válidas, sino que las blanqueará. 
 */
var CPeriodoPickerParaRegistrarFechas = Class.extend( {
	/*
	 * opciones: desde: id del elemento del período desde es obligatorio hasta:
	 * id del elemento del período hasta olbigatorio
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
						
						// si está cargando la fecha desde inicializa fechas desde y hasta
						if (this.id == opciones.desde){
							var fdesde = $.datepicker.parseDate(instance.settings.dateFormat
											|| $.datepicker._defaults.dateFormat,selectedDate, instance.settings);
	
							var fhasta = $.datepicker.parseDate(instance.settings.dateFormat
											|| $.datepicker._defaults.dateFormat,datePick.val(), instance.settings);
							//Si esta informando la fecha desde y la fecha hasta es mayor a esta, deshabilitará en el calendario
							//de la fecha hasta los días anteriores a la fecha desde. 
							if (fhasta>=fdesde || fhasta ==null){
								datePick.datepicker("option", "minDate", fdesde);
							}else{
								// sino, blanqueará la f.desde y actualizará su calendario para no elegir fechas mayores a la f.hasta
								$('#'+this.id).val("");
								$('#'+this.id).datepicker("option", "maxDate", fhasta);
							}
						
						// si esta cargando la fecha hasta inicializa para este caso
						}else if (this.id == opciones.hasta){
							var fhasta = $.datepicker.parseDate(instance.settings.dateFormat
											|| $.datepicker._defaults.dateFormat,selectedDate, instance.settings);
							var fdesde = $.datepicker.parseDate(instance.settings.dateFormat
											|| $.datepicker._defaults.dateFormat,datePick.val(), instance.settings);
							// si la fecha hasta que está informando es mayor a la fecha desde deshabilitara en el calendario de
							// la fecha desde los dias posteriores a la fecha hasta
							if (fhasta>=fdesde || fdesde ==null){
								datePick.datepicker("option", "maxDate", fhasta);
							}else{
							// si la f.hasta es mayor a la f.desde entonces la blanqueará para que la cargue nuevamente
							// y actualizará el calendario de la f.hasta para que no permita cargar fechas menores a la f.desde	
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

										// si la f.hasta es menor a la f.desde deshabilitará del calendario 
										//de selección de f.hasta los días anteriores a la f.desde
										if (fhasta>=fdesde || fhasta ==null){
											datePick.datepicker("option", "minDate", fdesde);
										}else{
											//si f.hasta es menor a f.desde,blanquea la última para que la ingrese nuevamente
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
							  // si se informó vacío entonces habilitará completamente el calendario de la otra fecha
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
