<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/combobox/combobox.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js"></script>
<script type="text/javascript" src="./js/numeric.js"></script>
<script type="text/javascript" src="./js/generalScript.js"></script>
<link rel="stylesheet" href="./js/combobox/combobox.css" type="text/css" media="screen, print" />
<script type="text/javascript">
$(function() {
	loadDependencias();
	$("#fechaHito").datepicker({dateFormat: 'dd-mm-yy'});
	$("#fechaHito").attr( 'readOnly' , 'true' );
    maxCharactesAutoSize("descripcion");
    
    
	showMonto();
    $("#tipoAccion").change(function() {
		showMonto();
    });
    
	var input = new CInputNumero(true);
	input.bind("input[id='montoInput']");//selector de jquery	    
	
	$( "#partes" ).combobox_select();
	
	$('#montoInput').focusout(function() {		
		var valor =  Number($('#montoInput').attr('value')).toFixed(2);
		$('#montoInput').attr('value', valor);
    });
	
	$("#cantidad_fecha_relativa").numeric({ decimal :false});
	
	$("#dependencias").autocomplete({
	   source: function( request, response ) {
	     $.ajax({
	       url: "cHitoAction.do?method=autocompleteDependencias",
	       dataType: "json",
	       data: {
	         maxRows: 100,
	         key: encodeURIComponent(request.term)
	       },
	       success: function(data) {
	         response($.map(data, function(item) {
	           return {
					label: item.name,
					name: item.id,
	             	value: item.name,
	             	fecha: item.fecha
	           };
	         }));
	       }
	     });
	   },
	   change: function( event, ui ) {
			if ( !ui.item ) {
				valid = false;
				if ( !valid ) {
					$( this ).val( "" );
					return false;
				}
			}
	   },
	   minLength: 2,
	   select: function( event, ui ) {
		    setResultDependencia(ui.item ? ui.item.name : "", ui.item.fecha);
	   }
	});
	
	$(".ui-autocomplete-input").click(function() {
		$(this).attr("value","");
		if($(this).attr("id") == "dependencias") {
			$("#dependencia").attr("value", "");
			showSelectFechaAbsoluta();
		} else if ($(this).attr("id") == "partes")
			$("#parte").attr("value", "");
	});
	
	$("#unidad_fecha_relativa").change(function() {
		calcularFechaRelativa();	
	});
	
	$("#cantidad_fecha_relativa").keyup(function() {
		calcularFechaRelativa();	
	});
	
});

function showMonto(){
	if( $("#tipoAccion").attr("value") == 'E')
		$(".monto").show();
	else{
		$(".monto").hide();
		$("#montoInput").attr("value","0.00");
	}
}

function maxCharactesAutoSize(id){
	$("#"+id)
	.prop('maxlength', '800')
	.trigger('autosize.resize');
}

function setResultParte(value) {
	$("#parte").attr("value",value);
	if (value == "")
		$("#partes").attr("value",value);
}

function setResultDependencia(value, fecha) {
	$("#dependencia").attr("value",value);
	if (value == "") {
		$("#dependencias").attr("value",value);
		showSelectFechaAbsoluta();
		$("#fecha_hito_selected").html("");
	} else {
		$("#fecha_hito_selected").html(fecha);
		showSelectFechaRelativa();
	}	
}

function loadDependencias() {
	if ($("#dependencia").length == 0)
		return;
	if ($("#dependencia").attr("value") == "") {
		showSelectFechaAbsoluta();
	} else {
		$("#fecha_relativa").show();
		$("#fecha_absoluta").hide();
		$.ajax({
		       url: "cHitoAction.do?method=obtenerFechas",
		       dataType: "json",
		       success: function(data) {
		    	   $("#fecha_calculada").html(data.fechaRelativa);
		           $("#fecha_hito_selected").html(data.fechaHitoSeleccionado);
		       }
	    });
	}
}

function showSelectFechaAbsoluta() {
	$("#fecha_hito").attr("value", "");
	$("#fecha_hito_selected").html("");
	$("#fecha_relativa").hide();
	$("#fecha_absoluta").show();
}

function showSelectFechaRelativa () {
	$("#unidad_fecha_relativa").attr("value", "-1");		
	$("#cantidad_fecha_relativa").attr("value", "");
	$("#fecha_calculada").html("");
	$("#fecha_relativa").show();
	$("#fecha_absoluta").hide();
}

function calcularFechaRelativa() {
	var unidad = $("#unidad_fecha_relativa").attr("value");
	var cantidad = $("#cantidad_fecha_relativa").attr("value");
	if (unidad != "-1" && unidad != "-2" && cantidad.length != 0) {
		$.ajax({
	       url: "cHitoAction.do?method=calcularFecha",
	       dataType: "json",
	       data: {
	    	   unidadFechaRelativa: unidad,
	       	   cantidadFechaRelativa: cantidad,
	       	   dependencia: $("#dependencia").attr("value")
	       },
	       success: function(data) {
	         $("#fecha_calculada").html(data.fecha);
	       }
	    });
	}
}
</script>
<style>
	#pantalla_hito td.CFormNombre {
		width:250px;
	}
</style>
<html:form action="cHitoAction.do" method="POST">
<bean:define id="instrumento" name="cHitoForm" property="instrumento" />
<bean:define id="codigo" name="instrumento" property="codigo" />
<logic:equal value="input" property="viewType" name="cHitoForm">
	<logic:equal value="alta" name="cHitoForm" property="action">
		<h1 align="center" class="titulo">Registro de Hito</h1>
	</logic:equal>
	<logic:equal value="modificar" name="cHitoForm" property="action">
		<h1 align="center" class="titulo">Modificación de Hito</h1>
	</logic:equal>
	
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr bgcolor="#DDEEFF">
						<td colspan="6" width="100%">Convenio:&nbsp;<b><bean:write name="codigo" /></b></td>
					</tr>
					<tr>
						<td>
							<table width="100%" cellpadding="2" cellspacing="2" id="pantalla_hito" >
								<tr>
									<td class="CformNombre">Obligación:&nbsp;<span class="dato_obligatorio">*</span></td>
									<td class="CformDato">
										<html:select name="cHitoForm" property="tipoObligacion">
											<html:option value="-1">Seleccionar</html:option>
											<html:option value="-2">-----------</html:option>
											<html:option value="C">Contractual</html:option>
											<html:option value="S">De Seguimiento</html:option>
										</html:select>
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Dependencia:&nbsp;</td>
									<td class="CformDato">
										<html:text property="depenciaDescripcion" name="cHitoForm" styleId="dependencias" />
										<html:hidden property="dependencia" styleId="dependencia"/>
										<span id="fecha_hito_selected"></span>
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Fecha:&nbsp;<span class="dato_obligatorio">*</span></td>
									<td class="CformDato">
										<div id="fecha_absoluta">
											<html:text property="fecha" maxlength="20" size="20" styleId="fechaHito"/>
										</div>
										<div id="fecha_relativa" style="display: none;">
											<html:select name="cHitoForm" property="unidadFechaRelativa" styleId="unidad_fecha_relativa" >
												<html:option value="-1">Seleccionar</html:option>
												<html:option value="-2">-----------</html:option>
												<html:option value="D">Día</html:option>
												<html:option value="S">Semana</html:option>
												<html:option value="M">Mes</html:option>
												<html:option value="A">Año</html:option>
											</html:select>
											<html:text name="cHitoForm" property="cantidadFechaRelativa" styleId="cantidad_fecha_relativa" size="3" maxlength="3" />
											<span id="fecha_calculada"></span>
										</div>	
									</td>
								</tr>
								<tr>
									<td class="CformNombre">Actor:&nbsp;<span class="dato_obligatorio">*</span></td>
									<td class="CformDato">
										<html:select name="cHitoForm" styleId="partes" disabled="false" property="actor">
											<html:optionsCollection name="cHitoForm" property="comboActores" label="label" value="value"/>
										</html:select>
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Tipo Acción:&nbsp;<span class="dato_obligatorio">*</span></td>
									<td class="CformDato">
										<html:select name="cHitoForm" property="tipoAccion" styleId="tipoAccion">
											<html:option value="-1">Seleccionar</html:option>
											<html:option value="-2">-----------</html:option>
											<html:option value="E">Económica</html:option>
											<html:option value="O">Operativa</html:option>
										</html:select>
									</td>	
								</tr>					
									<tr class="monto">	
										<td class="CformNombre">Tipo Moneda:&nbsp;<span class="dato_obligatorio">*</span></td>
										<td class="CformDato">
											<html:select name="cHitoForm" styleId="tipoMoneda" disabled="false" property="tipoMoneda">
												<html:optionsCollection  name="cHitoForm" filter="false" property="comboTipoMoneda" label="label" value="value"/>
											</html:select>
										</td>		
									</tr>	
									<tr class="monto">
										<td class="CformNombre">Monto:&nbsp;</td>
											<td class="CformDato">
												<html:text styleId="montoInput" property="monto" maxlength="10" value="0.00" size="20"/>
											</td>										
									</tr>															
								<tr>
									<td class="CformNombre">Descripción corta:&nbsp;<span class="dato_obligatorio">*</span></td>
									<td class="CformDato">
										<html:text property="descripcionCorta" maxlength="70" size="70"/>
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Descripción:&nbsp;</td>
									<td class="CformDato">
										<html:textarea property="descripcion" styleId="descripcion" style="width:500px; height:100px;resize: none;" />
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Alerta:&nbsp;<span class="dato_obligatorio">*</span></td>
									<td class="CformDato">
										<html:select name="cHitoForm" property="alerta">
											<html:option value="-1">Seleccionar</html:option>
											<html:option value="-2">-----------</html:option>
											<html:option value="S">Via Sistema</html:option>
											<html:option value="E">E-Mail</html:option>
											<html:option value="A">Ambos</html:option>
										</html:select>
									</td>	
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
				<div align="right">
					<html:submit  property="btnSubmit" styleClass="CformBoton" value="Registrar" />
					<html:submit  property="btnSubmit" styleClass="CformBoton" value="Volver" />
				</div>
			</td>
		</tr>
	</table>
			
</logic:equal>

<logic:equal value="view" property="viewType" name="cHitoForm">
	<logic:equal value="detalle" name="cHitoForm" property="action">
		<h1 align="center" class="titulo">Detalle de Hito</h1>
	</logic:equal>
	<logic:equal value="alta" name="cHitoForm" property="action">
		<h1 align="center" class="titulo">Registro de Hito</h1>
	</logic:equal>
	<logic:equal value="modificar" name="cHitoForm" property="action">
		<h1 align="center" class="titulo">Modificación de Hito</h1>
	</logic:equal>
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr bgcolor="#DDEEFF">
						<td colspan="6" width="100%">Convenio:&nbsp;<b><bean:write name="codigo" /></b></td>
					</tr>
					<tr>
						<td>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td class="CformNombre">Obligación:&nbsp;</td>
									<td class="CformDato">
										<html:select name="cHitoForm" property="tipoObligacion" disabled="true">
											<html:option value="-1">Seleccionar</html:option>
											<html:option value="-2">-----------</html:option>
											<html:option value="C">Contractual</html:option>
											<html:option value="S">De Seguimiento</html:option>
										</html:select>
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Dependencia:&nbsp;</td>
									<td class="CformDato">
										<html:select name="cHitoForm" property="dependencia" disabled="true">
											<html:option value="-1">Seleccionar</html:option>
											<html:option value="-2">-----------</html:option>
											<html:optionsCollection name="cHitoForm" property="hitos" label="descripcionCorta" value="id"/>
										</html:select>
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Fecha:&nbsp;</td>
									<td class="CformDato">
										<bean:write name="cHitoForm" property="fecha"/>
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Actor:&nbsp;</td>
									<td class="CformDato">
										<html:select name="cHitoForm" property="actor" disabled="true">
											<html:optionsCollection name="cHitoForm" property="comboActores" label="label" value="value"/>
										</html:select>
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Tipo Acción:&nbsp;</td>
									<td class="CformDato">
										<html:select name="cHitoForm" property="tipoAccion" disabled="true">
											<html:option value="-1">Seleccionar</html:option>
											<html:option value="-2">-----------</html:option>
											<html:option value="E">Económica</html:option>
											<html:option value="O">Operativa</html:option>
										</html:select>
									</td>	
								</tr>
								<logic:equal property="tipoAccion" name="cHitoForm" value="E">
									<tr>	
										<td class="CformNombre">Tipo Moneda:&nbsp;</td>
											<td class="CformDato">
												<html:select name="cHitoForm" styleId="tipoMoneda" disabled="true" property="tipoMoneda">
													<html:optionsCollection name="cHitoForm" property="comboTipoMoneda" label="label" value="value" filter="false"/>
												</html:select>
										</td>		
									</tr>								
									<tr>
										<td class="CformNombre">Monto:&nbsp;</td>
										<td class="CformDato">
											<logic:notEqual property="monto" name="cHitoForm" value="">
												<bean:write name="cHitoForm" property="monto" />
											</logic:notEqual>
											<logic:equal property="monto" name="cHitoForm" value="">
												--		
											</logic:equal>								
										</td>
									</tr>
								</logic:equal>	
								<tr>
									<td class="CformNombre">Descripción corta:&nbsp;</td>
									<td class="CformDato">
										<bean:write name="cHitoForm" property="descripcionCorta" />
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Descripción:&nbsp;</td>
									<td class="CformDato">
										<bean:write name="cHitoForm" property="descripcion" />
									</td>	
								</tr>
								<tr>
									<td class="CformNombre">Alerta:&nbsp;</td>
									<td class="CformDato">
										<html:select name="cHitoForm" property="alerta" disabled="true" >
											<html:option value="-1">Seleccionar</html:option>
											<html:option value="-2">-----------</html:option>
											<html:option value="S">Via Sistema</html:option>
											<html:option value="E">E-Mail</html:option>
											<html:option value="A">Ambos</html:option>
										</html:select>
									</td>	
								</tr>
								<logic:equal value="detalle" name="cHitoForm" property="action">
									<tr>
										<td class="CformNombre">Estado:&nbsp;</td>
										<td class="CformDato">
											<logic:equal value="R" property="hito.estado" name="cHitoForm">
												Realizado
											</logic:equal>
											<logic:equal value="N" property="hito.estado" name="cHitoForm">
												Nuevo
											</logic:equal>
										</td>	
									</tr>
									
								</logic:equal>
								<logic:notEmpty  property="hito.observacionVisto" name="cHitoForm">
									<tr bgcolor="#BFDFFF">
										<td colspan="10"><strong>Datos de visado &nbsp;</strong></td>
									</tr>
									<tr>
										<td class="CformNombre">Observación:&nbsp;</td>
										<td class="CformDato">
											<bean:write name="cHitoForm" property="hito.observacionVisto"/>
										</td>	
									</tr>
								</logic:notEmpty>
								<logic:equal value="R" property="hito.estado" name="cHitoForm">
									<tr bgcolor="#BFDFFF">
										<td colspan="10"><strong>Datos de realización &nbsp;</strong></td>
									</tr>
									<tr>
										<td class="CformNombre">Fecha:&nbsp;</td>
										<td class="CformDato">
											<bean:write name="cHitoForm" property="hito.fechaRealizacion" format="dd-MM-yyyy" />
										</td>	
									</tr>
									<tr>
										<td class="CformNombre">Observación:&nbsp;</td>
										<td class="CformDato">
											<bean:write name="cHitoForm" property="hito.observacionRealizacion"/>
										</td>	
									</tr>
								</logic:equal>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="CformAreaBotones" height="35">
				<div align="right">
					<logic:equal value="detalle" name="cHitoForm" property="action">
						<logic:equal value="N" name="cHitoForm" property="estado">
							<html:submit  property="btnSubmit" styleClass="CformBoton" value="Modificar" />
						</logic:equal>
						<html:submit  property="btnSubmit" styleClass="CformBoton" value="Volver" />
					</logic:equal>
					<logic:equal value="alta" name="cHitoForm" property="action">
						<html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
						<html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
					</logic:equal>
					<logic:equal value="modificar" name="cHitoForm" property="action">
						<html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
						<html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
					</logic:equal>
				</div>
			</td>
		</tr>
	</table>
			
</logic:equal>
	    
</html:form>
