<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script>

</script>

<br>
<h1 align="center" class="titulo">Modificación de Cobro</h1>

<html:form action="cCobroModificarAction.do" method="POST">
<html:hidden property="accion"/>


<logic:equal property="accion" value="modificar" name="cCobroModificarActionForm">
  <script>
  window.onload=function() {
	   

	  //deshabilita el enter, y quita el foco al presionarlo
		 $("input[type=text]").keypress(function(e){
		  	if(e.which == 13){ 
			  	this.blur();
			  	return false; 
			} 
		});
	}
  

	function validarImporteConDecimales(obj){
	   var tecla=window.event.keyCode;
	   if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
	 	 window.event.keyCode=0;
	   if (obj.value.length==9 && (tecla!=46) && (obj.value.indexOf(".",0)==-1) )
	        window.event.keyCode=0;
	}
	
  
  </script>


        <jsp:include page="/jsp/entidades/cobro.jsp">
         <jsp:param name="pageName" value="cobroModificar" />
          <jsp:param name="tipoPantalla" value="input" />
          <jsp:param name="formulario" value="cCobroModificarActionForm" />
          <jsp:param name="actionName" value="cCobroModificarAction.do"/>
          <jsp:param name="displayLinks" value="si" />
        </jsp:include>
</logic:equal> 

  <logic:equal property="accion" value="confirmar" name="cCobroModificarActionForm">
    <jsp:include page="/jsp/entidades/cobro.jsp">
      <jsp:param name="pageName" value="cobroModificar" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cCobroModificarActionForm"/>
 	  <jsp:param name="actionName" value="cCobroModificarAction.do"/>
      <jsp:param name="displayLinks" value="no" />
    </jsp:include>
    
  </logic:equal>
</html:form>



