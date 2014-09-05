<script type="text/javascript" src="./js/JSCookMenu/JSCookMenu.js"></script>
<script type="text/javascript" src="./js/JSCookMenu/ThemeSVT/theme.js"></script>

<%@ taglib uri="/WEB-INF/conicet-application-tags.tld" prefix="capplication" %>
<%@ taglib uri="/WEB-INF/conicet-applicationNew-tags.tld" prefix="capplicationNew" %>
<%@ taglib uri="/WEB-INF/conicet-rol-tags.tld" prefix="crol" %>
<%@ page import= "conicet.framework.util.*
		, java.util.*
		, java.sql.*
   		, java.math.*
		, conicet.objetos.*
		, conicet.framework.web.*
		, conicet.apps.svt.util.web.*"
%>
<%
	HttpSession sesion = request.getSession(true);
	CMenuGenerador generator = new CMenuGenerador();
	generator.generarMenu(request, response, pageContext);        
	String menuSVT = (String) sesion.getAttribute("menuSVT");
%>

<%@page import="conicet.apps.svt.object.entidad.CEntidad"%>
<%@page import="conicet.apps.svt.object.gestor.CGestor"%>
<%@page import="conicet.apps.svt.web.menu.CMenuGenerador"%>
 

<!--SVT tiene letra mas chica porque en solapa oferta tecnologica tiene muchas opciones -->


<style type="text/css">


		.menu{
		 text-align: center;
		 align: center;
		 valign: center;
		}
		
		.menu a{
		 text-decoration: none;
		 <capplicationNew:isApplication application="SVT">	
			font-family:verdana,arial,lucida console,sans-serif,monospace;
		 	font-size:7pt;
		 </capplicationNew:isApplication>
		
		 <capplicationNew:isApplication application="SVTP">	
		   font-family:Arial,Helvetica,sans-serif,Courier;
		   font-size:8pt;
		 </capplicationNew:isApplication>		 
		 
		}
		.menu a:hover{
		 color:#000000;
		}
		.menu a:visited{
		 color:#000000;
		}
		.menu a:link{
		 color:#000000;
		}
		.menu_tab{
		 text-decoration: none;
		}
		.menu_tab td{
		 text-align: left;
		 vertical-align: middle;
		}
		span.textoRojo{ color: red; }
		
	</style>
	
		<div id="coni_header_sup">
			<span id="logo"><a><span>Conicet - UVTs</span></a></span>
			
			<div id="panel-derecha">
				<p id="nombre-sistema"><%=sesion.getAttribute("nombreSistema")%></p>
				<p id="datos-usuario"><%=sesion.getAttribute("usuarioDescripcion")%></a>   
				</p>
				<p id="cerrar-sesion">[<a href="./salir.jsp" class="style2" >SALIR</a>]</p>
			</div>
		</div>
		<div id="menuSvt" class="tablaMenuDesplegable"></div>
	

<script type="text/javascript">   
    $(document).ready(function() {
    	var menu = <%=menuSVT%>;
    	cmDraw ('menuSvt', menu, 'hbr', cmThemeSVT, 'ThemeSVT');
    });  
</script>

		   
