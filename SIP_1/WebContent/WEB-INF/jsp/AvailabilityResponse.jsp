<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="bean.dto.HabitacionDTO" import="bean.dto.HotelDTO"%>
<html>
<head>
    <title>Hoteles-Backoffice</title>
	<link rel="stylesheet" type="text/css" media="screen" href="css/common.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/availabilityResultclear.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/ui-lightness/jquery-ui-1.7.2.custom.css" />
    <link href="css/autoCompleteFaceted.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/jquery.searchFilter.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/grid.css" />
    <link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />

    <script src="js/jquery1.3.2.min.js" type="text/javascript"></script>
    <script src="js/jquery.alerts.js" type="text/javascript"></script>
    
	<script type="text/javascript">
		$(document).ready(function(){
		});
	</script>
</head>
<body>
    <div id="wrap">
        <div id="container">
            <div id="topheader">
                <div class="login">
                    <img height="18" width="18" border="0" alt="ImagenUsuario" src="img/usericon.png" />
                    <label>
                        Usuario:</label>
                    <span id="username">SIPI</span> <a href="index.html" id="logout">Salir</a> 
                </div>
            </div>
            <div id="navigation">
                <ul id="menus">
                    <li id="new"><a href="crud_promo.html" title="Promociones">Crear Promociones</a></li>
					<li id="edit"><a href="availability.html" title="Disponibilidad">Disponibilidad</a></li>
                    <li id="edit"><a href="availability.html" title="Reservas">Crear Reserva</a></li>
                    <li id="edit"><a href="cancelarreserva.html" title="Cancelaciones">Cancelar Reserva</a></li>
                    <li id="edit"><a href="reportereserva.html" title="Reporte Reservas">Reportes por Reserva</a></li>
                    <li id="edit"><a href="reportehabitacion.html" title="Reporte Habitaciones">Reportes por Habitaci&oacute;n</a></li>
                </ul>
                <div class="fixed">
                </div>
            </div>
            <div id="content">
                <!-- content --><!--
                
                /*---------------------------------------------------------------------*/
                
                -->
				<div id="note">
				<div class="grid">
								<div class="datagrid">
				             
					<div class="content">
				
					<div class="content">		
						<table width="90%" border="1" cellspacing="2" cellpadding="2" align="center" >
								<col width="18.75%">
								<col width="5%">
								<col width="18.45%">
								<col width="20%">
								<col width="8%">
								<col width="7.6%">
								<col width="8%">
								<col width="5.3%">
								<col width="8.9%">
								<col width="0%">
							<thead class="title">
								<tr>
									<td colspan="9">B&uacute;squeda de Hoteles</td>
								</tr>
							</thead>
							<tbody>
								<tr id="headcolumns">
									<th id="name" width="166">
										<div class="titleh">
											<span>Nombre Hotel</span>
										</div>
									</th>
									<th id="category" width="45">
										<div class="titleh">
											<span>Cat.</span>
										</div>
									</th>
									
									<th id="address">
										<div class="titleh">
											<span>Habitaci&oacute;n</span>
										</div>
									</th>
				                    <th id="city">
										<div class="titleh">
											<span>Regimen</span>
										</div>
									</th>
									<th id="id">Capacidad</th>
									<th id="upDate">Moneda</th>
									<th id="completiness">Monto</th>
									<th id="state">Id</th>
									<th id="idType">Reservar</th>
								</tr><!-- tableRecords -->
								
								<% 
								if (request.getAttribute("availabilityResponse") != null && request.getAttribute("hotelInfo") != null) {

									HabitacionDTO[] rooms = (HabitacionDTO[]) request.getAttribute("availabilityResponse");
									HotelDTO hotel = (HotelDTO) request.getAttribute("hotelInfo");
									
									for (HabitacionDTO h : rooms) {
										%>
										<tr onclick="javascript:void(0);">
										
											<td><%= hotel.descripcion %>&nbsp;</td>
											<td><%= hotel.categoria %>&nbsp;</td>
											<td><%= h.descripcion %>&nbsp;</td>
											<td><%= h.regimen %>&nbsp;</td>	   
											<td><%= h.capacidad %>&nbsp;</td>
											<td><%= h.tarifa.currency %>&nbsp;</td>
											<td><%= h.tarifa.amount %>&nbsp;</td>
											<td><%= h.numeroHabitacion %>&nbsp;</td>
											<td>
												<form method="Post" action="ReservationRequest">
		 										    <input type="text" class="hide" id="hotelId" value="<%= request.getParameter("hotelId") %>" name="hotelId"/>
												    <input type="text" class="hide" id="hotelGuests" value="<%= request.getParameter("hotelGuests") %>" name="hotelGuests"/>
												    <input type="text" class="hide" id="checkInTimeDD" value="<%= request.getParameter("checkInTimeDD") %>" name="checkInTimeDD"/>
									                <input type="text" class="hide" id="checkInTimeMM" value="<%= request.getParameter("checkInTimeMM") %>" name="checkInTimeMM"/>
									                <input type="text" class="hide" id="checkInTimeYYYY" value="<%= request.getParameter("checkInTimeYYYY") %>" name="checkInTimeYYYY"/>
									                <input type="text" class="hide" id="checkOutTimeDD" value="<%= request.getParameter("checkOutTimeDD") %>" name="checkOutTimeDD"/>
									                <input type="text" class="hide" id="checkOutTimeMM" value="<%= request.getParameter("checkOutTimeMM") %>" name="checkOutTimeMM"/>
									                <input type="text" class="hide" id="checkOutTimeYYYY" value="<%= request.getParameter("checkOutTimeYYYY") %>" name="checkOutTimeYYYY"/>
									                <input type="text" class="hide" id="roomID" value="<%= h.numeroHabitacion %>" name="roomID"/>
													<input id="btnGuardar" class="button" type="submit" value="Reservar" />
												</form>
											</td>
										</tr>
										<!-- endTableRecords -->
								<%}
								}
								else {
									%>
							        <div id="welcomeMessage">
										No se encontraron habitaciones disponibles para su b&uacute;squeda.
										<br/><br/><br/>
									</div>
								<%}%>
								
							</tbody>
						</table>

					</div>
					</div>                 
					</div></div><div id="noResult" style="display:none; text-align:center">&nbsp;No se encontraron resultados</div></div>
				</div>				
				<!--
				                
               /*---------------------------------------------------------------------*/
               
                --><!-- /content -->
            </div>
            <div id="footer">
            </div>
        </div>
    </div>
	<div id="overlay" class="overlay"></div>
</body>
</html>
