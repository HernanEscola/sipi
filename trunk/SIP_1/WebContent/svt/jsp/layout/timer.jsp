<%@ page import= "java.util.*
        ,java.math.*
        ,conicet.framework.util.*
        ,conicet.framework.web.*" %>

<%  
     HttpSession sesion = request.getSession(true);
     BigDecimal jsTimeout = (new BigDecimal(sesion.getMaxInactiveInterval()));
%>


<script type="text/javascript">

 var time;
  var minutos;
  var segundos;
  time = <%= jsTimeout %>;

	function pad2(number) {
	  return (number < 10) ? '0' + number : number;
	}

	function resetTimeOut() {
		time = <%= jsTimeout %>;
    var usuarioExists = <%= sesion.getAttribute("iUsuario") != null %>;
    if (!usuarioExists){
    	location.href = "salir.jsp";
     } 
    var randomnumber=Math.floor(Math.random()*100);
    jQuery.get("jsp/layout/emptyResponse.jsp", { rnd: randomnumber } );
  }	
        
	function doRewrite() {
      time--;
      if (time >= 0) {
        minutos = Math.floor(time/60);
        segundos = time%60;
        segundos = pad2(segundos);
        document.getElementById('timer').innerHTML='Tiempo Restante: <b>' + minutos + ':' + segundos + '</b>';
        setTimeout("doRewrite()", 1000);
      } else {
        document.getElementById('timer').innerHTML='<span class="textoRojo"><b>Sesion finalizada</b></span>';
      }
	}  
</script>