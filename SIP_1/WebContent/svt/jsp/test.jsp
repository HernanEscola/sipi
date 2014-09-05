
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/jquery.eventCalendar.js"></script>

<script>
function seleccionar(){
	window.location = 'http://localhost/svt/test2.do';
	}

var json = [
        	{ "date": "1337594400000", "type": "meeting", "title": "Project A meeting", "description": "Lorem Ipsum dolor set", "url": "http://www.event1.com/" },
        	{ "date": "1337677200000", "type": "demo", "title": "Project B demo", "description": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "url": "http://www.event2.com/" },
        	{ "date": "1337686200000", "type": "meeting", "title": "Test Project Brainstorming", "description": "Lorem Ipsum dolor set", "url": "http://www.event3.com/" },
        	{ "date": "1337696100000", "type": "test", "title": "A very very long name for a f*cking project events", "description": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.", "url": "http://www.event5.com/" },
        	{ "date": "1338890400000", "type": "meeting", "title": "Project B meeting", "description": "Lorem Ipsum dolor set", "url": "http://www.event5.com/" },
        	{ "date": "1339927200000", "type": "demo", "title": "Project A demo", "description": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "url": "http://www.event6.com/" },
        	{ "date": "1334656800000", "type": "meeting", "title": "Test Project C Brainstorming", "description": "Lorem Ipsum dolor set", "url": "http://www.event7.com/" }
        ];
  /*      
$(document).ready(function() {

	$("#calendar").eventCalendar({
			jsonData: json,
		  monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
		    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
		  dayNames: [ 'Domingo','Lunes','Martes','Miércoles',
		    'Jueves','Viernes','Sabado' ],
		  dayNamesShort: [ 'Dom','Lun','Mar','Mie', 'Jue','Vie','Sab' ],
		  txt_noEvents: "El equipo se encuentra disponible este dia.",
		  txt_SpecificEvents_prev: "",
		  txt_SpecificEvents_after: "eventos:",
		  txt_next: "siguiente",
		  txt_prev: "anterior",
		  txt_NextEvents: "Próximos eventos:",
		  txt_GoToEventUrl: "Ir al evento"
		}); 
}); 
*/


</script>
<br>

<style>
.hidden {
	display: none;
}

.eventCalendar-wrap {
	overflow: hidden;
	position: relative;
}

.eventCalendar-wrap .arrow {
	position: absolute;
	top: 3px;
	z-index: 5;
}

.eventCalendar-wrap .prev {
	left: 3px;
}

.eventCalendar-wrap .next {
	right: 3px;
}

.eventsCalendar-currentTitle .monthTitle {
	display: block;
	text-align: center;
}

.eventsCalendar-monthWrap {
	left: 0;
	position: absolute;
	top: 0;
	z-index: 2;
}

.eventsCalendar-monthWrap.currentMonth {
	z-index: 1;
}

.eventsCalendar-daysList {
	display: table;
	width: 100%;
}

.eventsCalendar-daysList.showAsWeek {
	display: block;
}

.eventsCalendar-daysList li {
	display: table-cell;
}

.eventsCalendar-daysList li.dayWithEvents {
	background: none repeat scroll 0 0 rgba(0, 0, 0, 0.15);
}

.eventsCalendar-daysList li.current {
	background: none repeat scroll 0 0 rgba(0, 0, 0, 0.35);
}

.eventsCalendar-daysList.showAsWeek li {
	display: block;
	float: left;
	height: 20px;
	width: 14.28%;
}

.eventsCalendar-daysList li a {
	display: block;
	font-size: 8px;
	min-width: 7px;
	padding: 0;
	text-align: center;
}

.eventsCalendar-loading {
	display: block;
	height: 40px;
	line-height: 40px;
	min-width: 100px;
}

.eventsCalendar-list {
	position: relative;
	z-index: 1;
}

.eventsCalendar-list.oldEventList {
	z-index: 2;
}

.eventsCalendar-subtitle {
	font-size: 120%;
	font-weight: bold;
	padding-left: 5px;
}

html {
	background-color: #EEEEEE;
}

body {
	background-color: #FFFFFF;
	color: #555555;
	font-family: Arial, "Lucida Grande", sans-serif;
	font-size: 13px;
	line-height: 18px;
}

.eventCalendar-wrap {
	background-color: #FFFFFF;
	border: 1px solid #D3D3D3;
	border-radius: 5px 5px 5px 5px;
	box-shadow: 0 0 15px #999999;
	color: #807E7E;
	margin-bottom: 20px;
}

.eventCalendar-wrap .arrow {
	color: #FFFFFF;
	line-height: 28px;
	padding: 8px 10px;
	text-decoration: none;
	top: 9px;
}

.eventCalendar-wrap .arrow.prev {
	
}

.eventCalendar-wrap .arrow:hover {
	opacity: 0.7;
}

.eventCalendar-wrap .arrow span {
	border-bottom: 6px solid transparent;
	border-left: 6px solid #FFFFFF;
	border-top: 6px solid transparent;
	float: left;
	font-size: 0;
	height: 0;
	line-height: 0;
	text-indent: -5000px;
	width: 0;
}

.eventCalendar-wrap .arrow.prev span {
	border-left-width: 0;
	border-right: 6px solid #FFFFFF;
}

.eventsCalendar-slider {
	height: 80px;
}

.eventsCalendar-monthWrap {
	border-radius: 5px 5px 5px 5px;
	left: 0;
	top: 10px;
}

.eventsCalendar-currentTitle {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	background-color: #138DA5;
	border-color: #E3E3E3;
	border-image: none;
	border-style: solid;
	border-width: 1px 0;
	line-height: 25px;
	outline: 1px solid #138DA5;
}

.eventsCalendar-currentTitle .monthTitle {
	color: #FFFFFF;
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

.eventsCalendar-daysList {
	padding: 0;
	width: 100%;
}

.eventsCalendar-daysList.showAsWeek {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	background-color: #CCCCCC;
	background-image: -moz-linear-gradient(center top, #EEEEEE 42%, #CCCCCC 71%);
	border-color: #BCBCBC;
	border-image: none;
	border-radius: 0 0 0 0;
	border-style: solid;
	border-width: 1px 1px 0;
	margin: 10px 5px;
	width: auto;
}

.eventsCalendar-daysList.showDayNames.showAsWeek {
	border-radius: 5px 5px 0 0;
}

.eventsCalendar-daysList:before,.eventsCalendar-daysList:after {
	content: "";
	display: table;
}

.eventsCalendar-daysList:after {
	clear: both;
}

.eventsCalendar-day-header {
	border-bottom: 1px solid #BCBCBC;
	font-size: 10px;
	text-align: center;
	text-transform: lowercase;
}

.eventsCalendar-daysList.showAsWeek li {
	height: auto;
	margin: 0;
}

.eventsCalendar-daysList.showAsWeek li.empty {
	background-color: #CCCCCC;
	min-height: 29px;
}

.eventsCalendar-day a {
	color: #424242;
	font-size: 10px;
	text-decoration: none;
}

.eventsCalendar-day {
	border-left: 1px solid #BCBCBC;
}

.eventsCalendar-day a {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	border-color: #BCBCBC;
	border-image: none;
	border-style: solid;
	border-width: 0 1px 1px 0;
}

.showAsWeek .eventsCalendar-day {
	border-left-width: 0;
}

.showAsWeek .eventsCalendar-day a {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	border-color: #FFFFFF #BCBCBC #BCBCBC #EEEEEE;
	border-image: none;
	border-style: solid;
	border-width: 1px;
	font-size: 11px;
	line-height: 27px;
}

.eventsCalendar-day a:hover {
	background-color: #E4E4E4;
}

.eventsCalendar-daysList li.today a {
	background: none repeat scroll 0 0 #AAAAAA;
	color: #FFFFFF;
}

li.eventsCalendar-day.today a:hover {
	background-color: #CCCCCC;
}

.eventsCalendar-daysList li.dayWithEvents a {
	background: none repeat scroll 0 0 #89B814;
	color: #FFFFFF;
}

li.eventsCalendar-day.dayWithEvents a:hover {
	background-color: #C2D374;
}

.eventsCalendar-daysList li.current a {
	background: none repeat scroll 0 0 #449FB2;
	box-shadow: 5px 5px 10px #216B7A inset;
	color: #FFFFFF;
	text-shadow: 2px 2px 2px #216B7A;
}

li.eventsCalendar-day.current a:hover {
	background-color: #79BDCC;
	box-shadow: 5px 5px 10px #449FB2 inset;
	text-shadow: 2px 2px 2px #449FB2;
}

.eventsCalendar-loading {
	background-color: #CCCCCC;
	border-radius: 4px 4px 4px 4px;
	box-shadow: 0 0 10px #CCCCCC;
	color: #FFFFFF;
	font-weight: bold;
	left: 5px;
	margin: 5px auto;
	padding: 0 10px;
	position: absolute;
	text-align: center;
	text-shadow: 0 0 3px #AAAAAA;
	top: 25px;
	z-index: 4;
}

.eventsCalendar-loading.error {
	background-color: red;
}

.eventsCalendar-subtitle {
	padding-top: 10px;
}

.eventsCalendar-list-wrap {
	min-height: 100px;
	position: relative;
}

.eventsCalendar-list-content.scrollable {
	height: 100px;
	margin: 0 5px 5px 0;
	overflow-y: auto;
}

.eventsCalendar-list {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.eventsCalendar-list li {
	clear: both;
	margin: 0;
	padding: 0 5px 15px;
}

.eventsCalendar-list li time {
	font-size: 10px;
	line-height: 13px;
}

.eventsCalendar-list li time em {
	float: left;
	font-style: normal;
}

.eventsCalendar-list li time small {
	background-color: #807E7E;
	color: #FFFFFF;
	float: left;
	font-size: 10px;
	margin: 0 0 0 3px;
	padding: 0 5px 0 4px;
}

.eventsCalendar-list li .eventTitle {
	clear: both;
	display: block;
	font-weight: bold;
	text-decoration: none;
}

.eventsCalendar-list li a.eventTitle {
	color: #0E8EAB;
}

.eventsCalendar-list li a.eventTitle:hover {
	text-decoration: underline;
}

.eventsCalendar-list li .eventDesc {
	clear: both;
	font-size: 80%;
	line-height: 1.2em;
	margin: 0 0 5px;
}

.eventsCalendar-list .eventsCalendar-noEvents {
	background-color: #CCCCCC;
	border-radius: 4px 4px 4px 4px;
	box-shadow: 0 0 10px #CCCCCC;
	color: #FFFFFF;
	font-size: 120%;
	font-weight: bold;
	margin: 5px;
	padding: 5px;
	text-align: center;
	text-shadow: 0 0 3px #AAAAAA;
}

.bt {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	background-color: #698B10;
	background-image: -moz-linear-gradient(center top, #89B814, #698B10);
	background-repeat: repeat-x;
	border-color: #698B10 #698B10 #465F05;
	border-image: none;
	border-radius: 4px 4px 4px 4px;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.2) inset, 0 1px 2px rgba(0, 0, 0, 0.05);
	clear: both;
	color: #FFFFFF;
	display: block;
	font-size: 12px;
	font-weight: bold;
	line-height: 1;
	margin-top: 10px;
	padding: 9px 34px 11px;
	text-align: center;
	text-decoration: none;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	transition: all 0.1s linear 0s;
}

.bt:hover {
	background-position: 0 -15px;
	text-decoration: none;
}

body {
	
}

a {
	color: #0E8EAB;
}

.features li {
	margin-bottom: 3px;
}

#thanksPanel li {
	margin-bottom: 0;
}

#introPanel {
	padding-top: 20px;
}

.poweredBy img {
	float: left;
	margin-right: 3px;
}

.poweredBy .data {
	float: left;
}

.poweredBy .name {
	color: #555555;
	display: block;
	font-weight: bold;
	margin-top: 28px;
	text-decoration: none;
}

.poweredBy .twitter {
	display: block;
	float: left;
	text-decoration: none;
}

.features {
	float: left;
	padding-left: 20px;
}

#appLogo {
	margin-right: 30px;
}

pre {
	background-color: #FFFFCC;
	border: 1px solid #FED17E;
	clear: both;
	overflow: auto;
	padding: 5px;
}

#license {
	float: right;
	font-size: 10px;
	line-height: 12px;
	text-align: center;
	width: 300px;
}
</style>


<div class="container">
	<div class="row">
		<div class="g6">
			<h2 class="h4">Human Date Format</h2>
			<p class="demoDesc">Most of you don't like timestamp date format, so now you can use another formats</p>
			<div id="eventCalendarHumanDate"></div>
			<script>
					$(document).ready(function() {
						$("#eventCalendarHumanDate").eventCalendar({
							eventsjson: 'json/event.humanDate.json.php',
							jsonDateFormat: 'human'  // 'YYYY-MM-DD HH:MM:SS'
						});
					});
				</script>
			<pre>$(id).eventCalendar({
  eventsjson: 'file.json',
  jsonDateFormat: 'human'
});</pre>
		</div>
	</div>

</div>
<!--


<%@page import="conicet.apps.svt.test.InscripcionMateria"%>
<%@include file="../jsp/layout/include.jsp"%>

<%
List prueba = new LinkedList<InscripcionMateria>();
InscripcionMateria m = new InscripcionMateria();
m.setCapacidad("40");
m.setComision("001");
m.setDescripcion("Matemática 2");
m.setDia("Martes");
m.setTurno("Noche");
m.setVacantes("22");
prueba.add(m);

%>
<script>
	function seleccionar() {
		window.location = 'http://localhost/svt/test2.do';
	}
</script>

<h1 align="center" class="titulo">Inscripción de Materias</h1>

<form action="/inscripcion" method="post">

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table align="center" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td>
										<div id="campos">
											<table width="100%" cellpadding="2" cellspacing="2">
												<tr bgcolor="#DDEEFF">
													<td colspan="2" width="100%">Datos:</td>
												</tr>
												<tr>
													<td colspan="1" width="200"><div class="g4">
															<div id="calendar" /></div>
													</td>
													<td width="200" />
												</tr>
												<tr>
													<td class="CformNombre">Alumno:</td>
													<td class="CformDato" width="500px">Pepe Pepino</td>
												</tr>
												<tr>
													<td class="CformNombre">Cuatrimestre:</td>
													<td class="CformDato">2do. Cuatrimestre 2013</td>
												</tr>
												<tr>
													<td colspan="6">
														<table class="tablaMin">
															<tr>
																<td>
																	<table class="tablaMin">
																		<tr bgcolor="#BFDFFF">
																			<td><strong>Materias &nbsp;<span class="dato_obligatorio">*</span> </strong>
																			</td>
																		</tr>
																	</table>
																	<table class="tablaMin">
																		<tr>
																			<td colspan="10"><display:table style="width: 100%" name='<%=prueba %>' id='asd' decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoAMDisplayWrapper">
																					<display:column property="comision" title="Comisión" headerClass="tableCellHeader" style="width: 100px;" />
																					<display:column property="descripcion" title="Desc." headerClass="tableCellHeader" style="width: 300px;" />
																					<display:column property="turno" title="Turno" headerClass="tableCellHeader" style="width: 100px;" />
																					<display:column property="dia" title="Día" headerClass="tableCellHeader" style="width: 100px;" />
																				</display:table></td>
																		</tr>
																	</table>
																	<table class="tablaMin">
																		<tr>
																			<td class="CformAreaBotonesInterna" width="100%">
																				<div align="right">
																					<button type="button" class="CformBoton" onclick="seleccionar();">Seleccionar Materias</button>
																				</div></td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>

											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
							<div align="right">
								<button id="boton" class="CformBoton" onclick="seleccionar()" type="button">Registrar</button>
							</div>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script type="text/javascript">

$(document).ready(function(){
	var opciones = {"desde":"id_fechaDesde","hasta":"id_fechaHasta"};
	var x = new CPeriodoPicker(opciones);

});

	function seleccionar() {
		window.location = 'http://localhost/svt/test2.do';
	}
</script>

<h1 align="center" class="titulo">Apertura de Cursos</h1>

<form action="/inscripcion" method="post">

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table align="center" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td>
										<div id="campos">
											<table width="100%" cellpadding="2" cellspacing="2">
												<tr bgcolor="#DDEEFF">
													<td colspan="2" width="100%">Datos:</td>
												</tr>
												<tr>
													<td class="CformNombre">Cuatrimestre:</td>												
													<td class="CformDato" width="70%">Segundo</td>
												</tr>
												<tr>
													<td class="CformNombre">Fecha Apertura:<span class="dato_obligatorio">*</span></td>												
													<td class="CformDato"><input type="text" id="id_fechaDesde"/> </td>
												</tr>
												<tr>
													<td class="CformNombre">Fecha Cierre:<span class="dato_obligatorio">*</span></td>												
													<td class="CformDato"><input type="text" id="id_fechaHasta"/> </td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="CformAreaBotones" height="35"><span class="dato_obligatorio">* Datos obligatorios</span>
							<div align="right">
								<button id="boton" class="CformBoton" onclick="seleccionar()" type="button">Registrar</button>
							</div>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
</form>
-->