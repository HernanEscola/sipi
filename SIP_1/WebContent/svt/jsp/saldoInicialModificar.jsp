<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>

function removeprestadorsubmit(){
	document.cSaldoInicialModificarActionForm.action = 'cSaldoInicialModificarAction.do?btnSubmit=removeprestadorsubmit';
	document.cSaldoInicialModificarActionForm.submit();
}
 
function recargaUvt(){
	document.cSaldoInicialModificarActionForm.action = 'cSaldoInicialModificarAction.do?btnSubmit=recargauvt';
	document.cSaldoInicialModificarActionForm.submit();
	}
	
</script>




<br>
<h1 align="center" class="titulo">Modificación de Saldo Inicial</h1>

<html:form action="cSaldoInicialModificarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="prestadorSeleccionado"	styleId="prestadorSeleccionado" />
<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />


<logic:equal property="accion" value="modificar" name="cSaldoInicialModificarActionForm">
  <script>
  
  window.onload=function() {
	   
	  //deshabilita el enter, y quita el foco al presionarlo
		 $("input[type=text]").keypress(function(e){
		  	if(e.which == 13){ 
			  	this.blur();
			  	return false; 
			} 
		});
		 $('input[id^="importeDistribucion_"]').each(function() {
			 $(this).blur();
		 });  
	}
  
	function validarPorcentajeConDecimales(obj,evt){
		var tecla = ( evt.which ) ? evt.which : evt.keyCode;
		if (((tecla>=48)&&(tecla<=57))||(tecla==46)) {
			if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
		 	 return false;
			if (obj.value.length==2 && (tecla!=46) && (obj.value.indexOf(".",0)==-1) )
		     return false;
		}
		return (((tecla >= 48) && (tecla <= 57)) || (tecla == 46) || tecla == 8);
	}

	function validarImporteConDecimales(obj){
	   var tecla=window.event.keyCode;
	   if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
	 	 window.event.keyCode=0;
	   if (obj.value.length==9 && (tecla!=46) && (obj.value.indexOf(".",0)==-1) )
	        window.event.keyCode=0;
	}
  </script>

     <jsp:include page="/jsp/entidades/saldoInicial.jsp">
         <jsp:param name="pageName" value="saldoInicialModificar" />
          <jsp:param name="tipoPantalla" value="input" />
          <jsp:param name="formulario" value="cSaldoInicialModificarActionForm" />
          <jsp:param name="actionName" value="cSaldoInicialModificarAction.do"/>
          <jsp:param name="displayLinks" value="si" />
          
        </jsp:include>
 </logic:equal> 

  <logic:equal property="accion" value="confirmar" name="cSaldoInicialModificarActionForm">
    <jsp:include page="/jsp/entidades/saldoInicial.jsp">
      <jsp:param name="pageName" value="saldoInicialModificar" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cSaldoInicialModificarActionForm"/>
 	  <jsp:param name="actionName" value="cSaldoInicialModificarAction.do"/>
      <jsp:param name="displayLinks" value="no" />
         
    </jsp:include>
    
  </logic:equal>
</html:form>


