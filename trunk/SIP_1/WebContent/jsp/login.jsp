<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="bean.dto.HabitacionDTO" import="bean.dto.HotelDTO"%>
<html>
<head>
    <title>Login</title>
	<link rel="stylesheet" type="text/css" media="screen" href="css/common.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/Reservationclear.css" />
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
				  <div class="edit">
				  
				  	<div id="editheader" class="editheader">
					</div>
					
					<div id="editmenu" class="editmenu">
					  <ul>
					    <li id="provider" class="selected">
					      <a title="Proveedores" id="proovedoresTabs"
					      href="">Reserva</a>
					    </li>
					  </ul>
					</div>
					
					<form method="Post" action="MakeReservation">
					<input type="text" class="hide" id="hotelId" value="<%= request.getParameter("hotelId") %>" name="hotelId"/>
				    <input type="text" class="hide" id="hotelGuests" value="<%= request.getParameter("hotelGuests") %>" name="hotelGuests"/>
				    <input type="text" class="hide" id="checkInTimeDD" value="<%= request.getParameter("checkInTimeDD") %>" name="checkInTimeDD"/>
	                <input type="text" class="hide" id="checkInTimeMM" value="<%= request.getParameter("checkInTimeMM") %>" name="checkInTimeMM"/>
	                <input type="text" class="hide" id="checkInTimeYYYY" value="<%= request.getParameter("checkInTimeYYYY") %>" name="checkInTimeYYYY"/>
	                <input type="text" class="hide" id="checkOutTimeDD" value="<%= request.getParameter("checkOutTimeDD") %>" name="checkOutTimeDD"/>
	                <input type="text" class="hide" id="checkOutTimeMM" value="<%= request.getParameter("checkOutTimeMM") %>" name="checkOutTimeMM"/>
	                <input type="text" class="hide" id="checkOutTimeYYYY" value="<%= request.getParameter("checkOutTimeYYYY") %>" name="checkOutTimeYYYY"/>
	                <input type="text" class="hide" id="roomID" value="<%= request.getParameter("roomID") %>" name="roomID"/>
					
					<div id="editcontent" class="editcontent">
					<div id="editcontentheader" class="editcontentheader" style="display: block;">
					  <div class="headerBox">
					  <div class="hotelHeaderDetails">
						  <h5>Datos Cliente</h5>
						  <p>
						    <label>Nombre :</label>
						    <input type="text" class="name" id="name" value="" name="name"/>
						    <span class="iconComplete"></span>
						   </p>
						   <p>
						     <label>Apellido :</label>
						     <input type="text" class="surname" id="surname" value="" name="surname"/>
						     <span class="iconComplete"></span>
				          </p>
				          <p>
						     <label>Documento :</label>
						     <input type="text" class="document" id="document" value="" name="document"/>
						     <span class="iconComplete"></span>
				          </p>
				          <p>
						     <label>Tel&eacute;fono :</label>
						     <input type="text" class="telephone" id="telephone" value="" name="telephone"/>
						     <span class="iconComplete"></span>
				          </p>
				          <p>
						     <label>E-mail :</label>
						     <input type="text" class="email" id="email" value="" name="email"/>
						     <span class="iconComplete"></span>
				          </p>
						</div>
						
						<div class="hotelHeaderDetails">
						  <h5>Datos Pago</h5>
						 <p>
						     <label>Titular :</label>
						     <input type="text" class="titular" id="titular" value="" name="titular"/>
						     <span class="iconComplete"></span>
				         </p>
	  					 <p>
	                        <label>Tarjeta :</label>
	                        <select class="tcType" name="tcType" id="tcType">
	                          <option selected="selected" value="VI">VISA</option>
	                          <option value="CA">MasterCard</option>
	                          <option value="DI">Diners</option>
	                          <option value="AX">American Express</option>
	                        </select>
	                        <span class="iconComplete"></span>
	                      </p>
						  <p>
						    <label>N&uacute;mero :</label>
						    <input type="text" class="tcNumber" id="tcNumber" value="" name="tcNumber"/>
						    <span class="iconComplete"></span>
						   </p>
						   <p>
						    <label>Cod. Seg. :</label>
						    <input type="text" class="inputYY" id="securityCode" value="" name="securityCode"/>
						    <span class="iconComplete"></span>
						   </p>
						   <p>
						     <label>Vencimiento :</label>
			                  <input type="text" class="inputDM" id="vencimientoMM" value="" name="vencimientoMM"/>
			                  <span id="checkInIcon" class="iconComplete">/</span>
			                  <input type="text" class="inputYY" id="vencimientoYYYY" value="" name="vencimientoYYYY"/>
			                  <span id="checkInIcon" class="iconComplete"></span>
				          </p>
				          <p>
						     <label>Direcci&oacute;n :</label>
						     <input type="text" class="direccion" id="direccion" value="" name="direccion"/>
						     <span class="iconComplete"></span>
				          </p>
						</div>
						
					  <div style="clear: both;"></div>
					  
					  </div>
					</div>
					</div>
					
					<div class="buttons">
					  <input id="btnGuardar" class="button" type="submit" value="Reservar" />
					  <a href="crud_page.html"><button type="button" id="btnCancel" class="button">
					  Salir</button></a>
					</div>
				  </form>
				  </div>
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
