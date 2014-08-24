<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Hoteles-Backoffice</title>
	<link rel="stylesheet" type="text/css" media="screen" href="css/common.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/Genericclear.css" />
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
					      href="">Respuesta</a>
					    </li>
					  </ul>
					</div>
				
					<div id="editcontent" class="editcontent">
						<!-- content -->
		                <div id="welcomeMessage">
							<br/>
							${txtRespuesta}
							<br/><br/>
						</div>
		                <!-- /content -->			
					</div>
					
					<div class="buttons">
					  <a href="crud_page.html"><button type="button" id="btnCancel" class="button">
					  Volver</button></a>
					</div>
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
