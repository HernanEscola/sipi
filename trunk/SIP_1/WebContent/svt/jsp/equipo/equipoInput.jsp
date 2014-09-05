<%@include file="/jsp/layout/include.jsp"%>

<script type='text/javascript' src="./js/comboPaisAjax.js"></script>
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<script type='text/javascript' src="./js/fullcalendar/fullcalendar.min.js"></script>
<link rel="stylesheet" href="./js/fullcalendar/fullcalendar.css" type="text/css" media="screen, print" />


<bean:define id="equipoForm" name='<%= request.getParameter("equipoForm") %>' />
<bean:define id="responsablesTecnicos" name="equipoForm" property="responsablesTecnicos" />
<style type="text/css">
    .ui-widget, .ui-widget button {
        font-family: Verdana,Arial,Helvetica,sans-serif;
        font-size: 1em;
    }
    </style>

<script>
	//var calendar;
	var actionName = '<%= request.getParameter("currentActionName") %>';

	$(document).ready(function() {
		initCalendar();
		agregarObligatorioSN();
		generarCombos("",null,"<%=CConstantes.paisArgentina%>");
		setupPanes("container", document.<%=request.getParameter("equipoForm")%>.tab.value);
	});
	
	function initCalendar(){
		$( "#dialog-confirm-delete" ).hide();
		
		var calendar = $('#calendar').fullCalendar({
			allDaySlot: false,
			header: {
				left: '',
				center: '',
				right: ''
			},
			
			defaultView: 'agendaWeek',
			height: 500,
			axisFormat: 'H:mm',
			timeFormat: {
                agenda: '',
                timeFormat: ''
                
            },
			firstHour: 8, //desde que hora se para para mostrar el calendario
			editable: false, //En FALSE no permite modificar el horario seleccionado
			firstDay : 1,
			minTime: '0:00',
            maxTime: '24:00',
            
            ignoreTimezone: true,
			//currentTimezone: 'America/Buenos_Aires',
			columnFormat:{
			    month: 'ddd',    // Mon
			    week: 'ddd', // Mon 9/7
			    day: 'dddd'  // Monday 9/7
			},
			
			dayNames:
				['Domingo', 'Lunes', 'Martes', 'Miércoles',
			 	'Jueves', 'Viernes', 'Sábado'],
			dayNamesShort:
				['Do', 'Lu', 'Ma', 'Mi',
				 'Ju', 'Vi', 'Sa'],
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				//var title = prompt('Detalle:');
				//if (title) {
				var event = new Object();
				event.start = start;
				event.end = end;
				
				if(!isOverlapping(event,calendar)){	
					calendar.fullCalendar('renderEvent',
						{
							start: start,
							end: end,
							title: pad2(start.getHours())+":"+pad2(start.getMinutes())+" - "+pad2(end.getHours())+":"+pad2(end.getMinutes()),
							allDay: allDay
						},
						true // make the event "stick"
					);
					actualizarHorario(event,"Alta");
				}
				calendar.fullCalendar('unselect');
				
			},
			eventClick: function(calEvent, jsEvent, view) {
				
				
				$( "#dialog-confirm-delete" ).dialog({
			    	resizable: false,
			    	height:140,
			      	modal: true,
			      	buttons: {
			        	"Eliminar": function() {
			        	actualizarHorario(calEvent,"Eliminar"); 
						calendar.fullCalendar('removeEvents',calEvent._id);
			          	$( this ).dialog( "close" );
			        },
			        Cancelar: function() {
			          	$( this ).dialog( "close" );
			        }
			      }
			    });
				/*var eliminar = window.confirm(' Desea eliminar este horario? ');
						 //' + calEvent.start+ " end "+calEvent.end+" tittle "+calEvent.title+" allDay "+calEvent.allDay
				if (eliminar){
					actualizarHorario(calEvent,"Eliminar"); 
					calendar.fullCalendar('removeEvents',calEvent._id);
				}*/	
				
				
		        //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
			    //alert('View: ' + view.name);

		        // change the border color just for fun
		       // $(this).css('border-color', 'red');

		    },
	
		   
		    
		    events: {
		    	
		    	url : actionName + ".do?method=cargarCalendarioEquipo", //centralSeleccionada	    			
				type : 'POST',
				dataType : "json",

		    	success : function(data){
		    		//me cambio al tab de horarios para que esté activo (sino, no puede cargar el horario en el caso de una modificación)
		    		setupPanes("container", "tabHorario");
							
				},
		        error: function() {
		            alert('Hubo un error al mostrar los eventos del calendario!');
		        },
		        complete: function(jqXHR, textStatus ){
		        	setupPanes("container", "tabEquipo");
		        },
		        //color: 'yellow',   // a non-ajax option
		        //textColor: 'black' // a non-ajax option
		    }
	    });
	}

	/*function agregarCero(number) {
		if (number.length<10){
	     return '0'+ number;
		}
		return number;
	}*/	
	function isOverlapping(event,calendar){
	    // "calendar" on line below should ref the element on which fc has been called 
	    var array = calendar.fullCalendar('clientEvents');
	    for (var i = 0; i < array.length; i++) {
	        if (event.end >= array[i].start && event.start <= array[i].end){
	           return true;
	        }
	    }
	    return false;
	}
	

	function actualizarHorario(evento,queHacer){
	 
	
	evento.start.setUTCHours(evento.start.getUTCHours() - 3);
	evento.end.setUTCHours(evento.end.getUTCHours() - 3);
		
	var horarioString = JSON.stringify(evento,["start","end","title","allDay"])

	evento.start.setUTCHours(evento.start.getUTCHours() + 3);
	evento.end.setUTCHours(evento.end.getUTCHours() + 3);
	
	
	$.ajax({
        type: "POST",
        url: actionName + ".do?method=actualizarHorarioEquipo",
        data: {
        	horarioEquipo : horarioString,
        	accion : queHacer
		},
        dataType: "json",
	        success: function(data) {
		     	//alert("Horarios actualizados. Grabe los cambios en el equipo para que los horarios se hagan efectivos.")
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	        	alert("Error al mostrar los horarios.");
	        }
	    });
	

	}
	
	
	
	function actualizarHorarios(calendar){
		var horariosJSON =  calendar.fullCalendar('clientEvents');
		
		
		for (var i = 0; i < horariosJSON.length; i++) {
		  element = horariosJSON[i];
		  element.start.setUTCHours(element.start.getUTCHours() - 3);
		  element.end.setUTCHours(element.end.getUTCHours() - 3);
		}
		
		var horariosString = JSON.stringify(horariosJSON,["start","end","title","allDay"])
		
		for (var i = 0; i < horariosJSON.length; i++) {
		  element = horariosJSON[i];
		  element.start.setUTCHours(element.start.getUTCHours() + 3);
		  element.end.setUTCHours(element.end.getUTCHours() + 3);
		}
		
		$.ajax({
	        type: "POST",
	        url: actionName + ".do?method=actualizarHorariosEquipo",
	        data: {
	        	horariosEquipos : horariosString
			},
	        dataType: "json",
	        success: function(data) {
		     	//alert("Horarios actualizados. Grabe los cambios en el equipo para que los horarios se hagan efectivos.")
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	        	alert("Error al mostrar los horarios.");
	        }
	    });
	}
	
	function agregarObligatorioSN() {
		var id = $("input[@name=tipoAdhesion]:checked").val();
		
		if (id == $("#tipoAdhesionSistemaNacionalId").val()) {
			$("[id^=obligatorioSN]").show();
			$("#codigoId").removeAttr("disabled");
			$("#laboratorioId").removeAttr("disabled");
		} else {
			if(id == "NA"){
				$("#laboratorioId").attr("disabled", "disabled");
				$("#laboratorioId").val("");
			}else{
				$("#laboratorioId").removeAttr("disabled");
				$("#laboratorioId").val("");
			}
			$("[id^=obligatorioSN]").hide();
			$("#codigoId").attr("disabled", "disabled");
			$("#codigoId").val("");
		}
	}
	

	
	function mostrarPanel(obj1, obj2) {
		document.forms[0].tab.value = obj2.id;
	return showPane(obj1, obj2);

	}

	solapas = new Array('tabEquipo','tabHorario');
	  
	function irTabSiguiente(){
	    var obj =document.forms[0].tab.value;
	    for(i=0;i<(solapas.length-1);i++){
	      if ((solapas[i] == obj)) {
	    	  document.forms[0].tab.value=solapas[i+1];
	        break;
	      }  
	    }  
	    setupPanes("container", document.forms[0].tab.value);
 	}

function irTabAnterior(){
    var obj =document.forms[0].tab.value;
    for(i=1;i<(solapas.length);i++){
      if ((solapas[i] == obj)) {
    	  document.forms[0].tab.value=solapas[i-1];
        break;
      }  
    }  
    setupPanes("container", document.forms[0].tab.value);
}

function irTabFinal(){
    document.forms[0].tab.value=solapas[solapas.length-1];
    setupPanes("container", document.forms[0].tab.value);
}

function irTabInicial(){
    document.forms[0].tab.value=solapas[0];
    setupPanes("container", document.forms[0].tab.value);
}
	
	
	
	
	
	
</script>

<html:hidden property="accion" styleId="accion" name="equipoForm" />
<html:hidden property="tab"/>
<html:hidden property="sistemaNacionalId" styleId="tipoAdhesionSistemaNacionalId" name="equipoForm" />
<html:hidden property="equipoId" styleId="equipoId" name="equipoForm" />

<div id="equipo">
			<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
				<tr>
					<td class="CformAreaBotones">
						<div align="center">
							<input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" onclick="irTabInicial()" /> <input type="button" class="CformBotonTranspBorde" value="&lt;" onclick="irTabAnterior()" /> <input
							type="button" class="CformBotonTranspBorde" value="&gt;" onclick="irTabSiguiente()" /> <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" onclick="irTabFinal()" />
						</div>
					</td>
				</tr>
			</table>
			<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2">
						<table width="100%">
							<tr bgcolor="#DDEEFF">
								<td>Equipamiento:&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>		
				<tr>
					<td height="10" colspan="10"></td>
				</tr>
				<tr>
					<td>
						<table width="100%" cellpadding="2" cellspacing="2">
							<tr>
								<td class="CformNombre" width="250">Nombre:<span class="dato_obligatorio">*</span></td>
								<td class="CformDato" colspan="3"><html:select property="nombreId">
										<html:options name="equipoForm" collection="comboNombres" property="value" labelProperty="label" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td class="CformNombre">Descripción:<span class="dato_obligatorio">*</span></td>
								<td colspan="10" class="CformDato"><html:text styleId="descripcionInput" size="80" property="descripcion" maxlength="80" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Tipo:<span class="dato_obligatorio">*</span></td>
								<td class="CformDato"><html:text property="tipo" maxlength="100" size="50" /></td>
								<td class="CformNombre">Subtipo:</td>
								<td class="CformDato"><html:text property="subtipo" maxlength="100" size="50" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Marca: <span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato"><capplication:autoComplete tipoAutocomplete="Marca" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Número de serie:<span id="obligatorioNumeroSerie" class="dato_obligatorio">*</span></td>
								<td class="CformDato"><html:text property="nroSerie" maxlength="60" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Modelo:</td>
								<td class="CformDato"><html:text property="modelo" styleId="modeloInput" maxlength="50" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Año de Adquisición:<span class="dato_obligatorio">*</span></td>
								<td class="CformDato"><html:select property="anio">
										<html:options name="equipoForm" collection="comboAños" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Año de Fabricación:</td>
								<td class="CformDato"><html:select property="anioFabricacion">
										<html:options name="equipoForm" collection="comboAños" property="value" labelProperty="label" />
									</html:select></td>
									<td class="CformNombre">Año de Puesta en funcionamiento:</td>
								<td class="CformDato"><html:select property="anioPuestaEnFuncionamiento">
										<html:options name="equipoForm" collection="comboAños" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr bgcolor="#DDEEFF">
								<td colspan="10"><strong>Datos de Inventario:</strong></td>
							</tr>
							<tr>
								<td class="CformNombre">Propietario:<span class="dato_obligatorio">*</span></td>
								<td class="CformDato"><capplication:autoComplete tipoAutocomplete="Propietario" /></td>
								<logic:notEmpty property="propietarioDescripcion" name="equipoForm">
									<td class="CformDato" width="35%"><html:text size="30" styleId="descripcionPropietarioInput" disabled="true" property="propietarioDescripcion" maxlength="50" /></td>
								</logic:notEmpty>
							</tr>
							<tr>
								<td class="CformNombre">Patrimonio Nro:</td>
								<td class="CformDato"><html:text property="nroPatrimonio" styleId="nroPatrimonioInput" maxlength="20" onkeypress="validarNumero()" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Responsable Patrimonial:</td>
								<td class="CformDato" colspan="3"><capplication:autoComplete tipoAutocomplete="ResponsablePatrimonial" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Subresponsable Patrimonial:</td>
								<td class="CformDato" colspan="3"><capplication:autoComplete tipoAutocomplete="SubresponsablePatrimonial" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Adherido a:</td>
								<td class="CformDato"><bean:define id="tipoAdhesionSNId" name="equipoForm" property="sistemaNacionalId" type="String" /> <bean:define id="tipoAdhesionSGId" name="equipoForm"
										property="grandesInstrumentosId" type="String" /> <bean:define id="tipoAdhesionNAId" name="equipoForm" property="ningunoId" type="String" /> <html:radio styleId="radio_sn1"
										property="tipoAdhesion" value='<%= tipoAdhesionSNId %>' name="equipoForm" onchange="agregarObligatorioSN()" />Sistemas Nacionales <html:radio styleId="radio_sn2" property="tipoAdhesion"
										value='<%= tipoAdhesionSGId %>' name="equipoForm" onchange="agregarObligatorioSN()" />SECEGRIN <html:radio styleId="radio_sn3" property="tipoAdhesion" value='<%= tipoAdhesionNAId %>'
										name="equipoForm" onchange="agregarObligatorioSN()" />Ninguno <html:hidden styleId="tipoAdhesionRadio" property="tipoAdhesion" /></td>
							</tr>

							<tr>
								<td class="CformNombre">Código:<span id="obligatorioSN1" class="dato_obligatorio">*</span></td>
								<td class="CformDato"><html:text property="codigo" styleId="codigoId" maxlength="60" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Laboratorio asociado:<span id="obligatorioSN1" class="dato_obligatorio">*</span></td>
								<td class="CformDato"><html:text property="laboratorio" styleId="laboratorioId" maxlength="60" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Institución financiadora:</td>
								<td class="CformDato" colspan="3"><capplication:autoComplete tipoAutocomplete="InstitucionFinanciadora" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Dependencia donde se encuentra:<span class="dato_obligatorio">*</span></td>
								<td class="CformDato" colspan="3"><capplication:autoComplete tipoAutocomplete="DependenciaUbicado" /></td>
							</tr>
							<tr>
								<td colspan="10">
									<table width="100%">
										<tr bgcolor="#DDEEFF">
											<td><strong>Responsables Técnicos:<span class="dato_obligatorio">*</span></strong></td>
										</tr>
										<tr>
											<td colspan="10"><display:table class="CFormDisplayTable" name='<%= responsablesTecnicos %>' decorator="conicet.apps.svt.web.equipo.decorator.CEquipoResponsableTecnicoDisplayWrapper">
													<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
													<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
													<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
													<display:column property="documento" title="Documento" headerClass="tableCellHeader" />
													<display:column property="remove" title="  " headerClass="tableCellHeader" style="width: 10px;" />
													<display:footer>
														<tr style="background-color: #FAFAFA;">
															<td style="text-align: right; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;" colspan="2">Ingresar Nuevo:</td>
															<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 300px;" colspan="1"><capplication:autoComplete
																	tipoAutocomplete="responsableTecnico" /></td>
															<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 200px;" colspan="2"><html:submit style="width:170px;" property="btnSubmit"
																	value="Agregar Responsable Tecnico" styleClass="CformBoton" /></td>
														</tr>
													</display:footer>
												</display:table></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr bgcolor="#DDEEFF">
								<td colspan="10" width="100%">Datos de Localización</td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td class="CformNombre">Domicilio:&nbsp;<span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato" colspan="3"><html:text property="domicilio" maxlength="60" size="65" /></td>
							</tr>
							<tr>
								<td class="CformNombre">Pa&iacute;s:&nbsp;<span class="dato_obligatorio">*</span>
								</td>
								<td class="CformDato"><html:select styleId="cboPais" property="pais">
										<html:options collection="comboPais" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Provincia:&nbsp;<span class="dato_obligatorio">(1)</span>
								</td>
								<td class="CformDato"><html:select styleId="cboProvincia" property="provincia">
										<html:options collection="comboProvincia" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Partido:&nbsp;<span class="dato_obligatorio">(1)</span>
								</td>
								<td class="CformDato"><html:select styleId="cboPartido" property="partido">
										<html:options collection="comboPartido" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td class="CformNombre">Localidad:&nbsp;<span class="dato_obligatorio">(1)</span>
								</td>
								<td class="CformDato"><html:select styleId="cboLocalidad" property="localidad">
										<html:options collection="comboLocalidad" property="value" labelProperty="label" />
									</html:select></td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
						</table>
					</td>
				</tr>
				 <tr>
					<td>
						<table width="100%">
							<tr>
								<td class="CformAreaBotones">
								<div align="left">
									<span class="dato_obligatorio">* Datos obligatorios</span>
								</div>
								<div align="right">
										  <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
								       <logic:equal property="accion" value="modificar" name="equipoForm">
								          <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
								        </logic:equal>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
			</table>
			<table>			
			<tr>
			<td>
				
				<div id="formEmpresaLeyenda">
					<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
						<tr>
							<td><span class="dato_obligatorio">(1)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.</td>
						</tr>
					</table>

				</div>
				</td>
				</tr>
			</table>
			
			
		</div>
		
		
		
		<div id="horario">
	
		
			<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
				<tr>
					<td class="CformAreaBotones">
						<div align="center">
							<input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" onclick="irTabInicial()" /> <input type="button" class="CformBotonTranspBorde" value="&lt;" onclick="irTabAnterior()" /> <input
							type="button" class="CformBotonTranspBorde" value="&gt;" onclick="irTabSiguiente()" /> <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" onclick="irTabFinal()" />
						</div>
					</td>
				</tr>
			</table>
			<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
				<!-- CODIGO VIEJO DE HORARIOS -->
				<!-- tr>
					<td colspan="2">
						<table width="100%">
							<tr bgcolor="#DDEEFF">
								<td>Horarios de disponibilidad del equipo:&nbsp;</td>
							</tr>
						</table>
						<table width="100%">
				    			<tr>
									<td colspan="10">
									
									
										<table class="CFormDisplayTable">
												<thead>
													<tr>
														<th class="tableCellHeader">Lunes</th>
														<th class="tableCellHeader">Martes</th>
														<th class="tableCellHeader">Miércoles</th>
														<th class="tableCellHeader">Jueves</th>
														<th class="tableCellHeader">Viernes</th>
														<th class="tableCellHeader">Sábado</th>
														<th class="tableCellHeader">Domingo</th>
													</tr>
												</thead>
												<tfoot>
													<tr style="background-color: #FAFAFA;">
														<td colspan="2" style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;">Ingresar Nuevo: Dia
															<html:select name="equipoForm" property="diaSemana">
																<html:options name="equipoForm" collection="comboDiaSemana" property="value" labelProperty="label" />
															</html:select> &nbsp;
														</td>
														
														<td colspan="2" style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;">Desde:
															 <html:select name="equipoForm" property="horaDesde">
																<html:options name="equipoForm" collection="comboHora" property="value" labelProperty="label" />
															</html:select> &nbsp;
														</td>
	
														<td colspan="2" style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;">Hasta:
															 <html:select name="equipoForm" property="horaHasta">
																<html:options name="equipoForm" collection="comboHora" property="value" labelProperty="label" />
															</html:select> &nbsp;
														</td>
														<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
															<html:submit style="width:100px;" property="btnSubmit" value="Agregar Horario" styleClass="CformBoton" />
														</td>
													
													</tr>
														
												</tfoot>
												<tbody>
													<tr class="odd">
														<td><bean:write filter="false" name="equipoForm" property="diaHorario(L)" /></td>
														<td><bean:write filter="false" name="equipoForm" property="diaHorario(Ma)" /></td>
														<td><bean:write filter="false" name="equipoForm" property="diaHorario(Mi)" /></td>
														<td><bean:write filter="false" name="equipoForm" property="diaHorario(J)" /></td>
														<td><bean:write filter="false" name="equipoForm" property="diaHorario(V)" /></td>
														<td><bean:write filter="false" name="equipoForm" property="diaHorario(S)" /></td>
														<td><bean:write filter="false" name="equipoForm" property="diaHorario(D)" /></td>
													</tr>
												</tbody>
										</table>
									</td>
								</tr>
						</table>
						
					</td>
				</tr -->
				
				
				
				<tr>
					<td colspan="2">
						<table width="100%">
							<tr bgcolor="#DDEEFF">
								<td>Horarios de disponibilidad del equipo:&nbsp;</td>
							</tr>
						</table>
						<table width="100%">
							<tr>
								<td colspan="10">
									<div id="calendar"></div>
									<div id="dialog-confirm-delete" title="Eliminación de horario">
										<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>¿Desea eliminar este horario?</p>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				
				
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td class="CformAreaBotones">
									<div align="right">
										<jsp:include page="/jsp/layout/botones.jsp">
											<jsp:param name="formulario" value='<%= request.getParameter("equipoForm") %>' />
											<jsp:param name="entidad" value='equipo' />
										</jsp:include>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
				
								
		</div>
	
