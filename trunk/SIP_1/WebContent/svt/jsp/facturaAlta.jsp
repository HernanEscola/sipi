<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>

  solapas = new Array('tabFactura','tabDistribucion');
  
  function irTabFinal(){
	if (solapas[solapas.length-1] == 'tabDistribucion'){
		return submitDistribucion();
    }
	document.cFacturaAltaActionForm.tab.value=solapas[solapas.length-1];
    setupPanes("container", document.cFacturaAltaActionForm.tab.value);
  }

  function irTabInicial(){
	document.cFacturaAltaActionForm.tab.value=solapas[0];
    setupPanes("container", document.cFacturaAltaActionForm.tab.value);
    
  }

  function irTabAnterior(){
    var obj = document.cFacturaAltaActionForm.tab.value;
    for(i=1;i<solapas.length;i++){
      if ((solapas[i] == obj)) {
    	  document.cFacturaAltaActionForm.tab.value=solapas[i-1];
        break;
      }  
    }  
    setupPanes("container", document.cFacturaAltaActionForm.tab.value);
  }

  function irTabSiguiente(){
    var obj = document.cFacturaAltaActionForm.tab.value;
    for(i=0;i<(solapas.length-1);i++){
      if ((solapas[i] == obj)) {
    	  document.cFacturaAltaActionForm.tab.value=solapas[i+1];
    	  if (solapas[i+1] == 'tabDistribucion'){
    			  return submitDistribucion();
    	  }
        break;
      }  
    }  
    setupPanes("container", document.cFacturaAltaActionForm.tab.value);
  }

  function irA(obj){
	if(document.cFacturaAltaActionForm.tab.value != 'tabDistribucion' && obj == 'tabDistribucion'){
		return submitDistribucion();
	}
	document.cFacturaAltaActionForm.tab.value=obj;
	setupPanes("container", document.cFacturaAltaActionForm.tab.value);
	
  }

  function mostrarPanel(obj1, obj2){
	if(document.cFacturaAltaActionForm.tab.value != 'tabDistribucion' && obj2.id == 'tabDistribucion'){
		return submitDistribucion();
	}
	document.cFacturaAltaActionForm.tab.value = obj2.id;
	return showPane(obj1, obj2);
	
  }


  function submitDistribucion(){
		document.cFacturaAltaActionForm.action = 'cFacturaAltaAction.do?btnSubmit=distribucion';
		document.cFacturaAltaActionForm.submit();
  }


  
  
</script>




<br>
<h1 align="center" class="titulo">Registro de Factura</h1>

<html:form action="cFacturaAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="tab"/>
<html:hidden property="prestadorSeleccionado"	styleId="prestadorSeleccionado" />
<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
<html:hidden property="contratanteSeleccionado"	styleId="contratanteSeleccionado" />
<html:hidden property="contratanteDescripcion"	styleId="contratanteDescripcion" />


<logic:equal property="accion" value="alta" name="cFacturaAltaActionForm">
  <script>
  
  window.onload=function() {
	    setupPanes("container", document.cFacturaAltaActionForm.tab.value);

	  //deshabilita el enter, y quita el foco al presionarlo
		 $("input[type=text]").keypress(function(e){
		  	if(e.which == 13){ 
			  	this.blur();
			  	return false; 
			} 
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


   <div class="tab-container" id="container">

      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td>
            <ul class="tabs">
              <li><a href="#" onClick="return mostrarPanel('factura', this)" id="tabFactura">Factura</a></li>
              <li><a href="#" onClick="return mostrarPanel('distribucion', this)" id="tabDistribucion">Distribución</a></li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <jsp:include page="/jsp/entidades/factura.jsp">
         <jsp:param name="pageName" value="facturaAlta" />
          <jsp:param name="tipoPantalla" value="input" />
          <jsp:param name="formulario" value="cFacturaAltaActionForm" />
          <jsp:param name="actionName" value="cFacturaAltaAction.do"/>
          <jsp:param name="displayLinks" value="si" />
          
        </jsp:include>
      </div>

    </div>
</logic:equal> 

  <logic:equal property="accion" value="confirmar" name="cFacturaAltaActionForm">
    <jsp:include page="/jsp/entidades/factura.jsp">
      <jsp:param name="pageName" value="facturaAlta" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cFacturaAltaActionForm"/>
 	  <jsp:param name="actionName" value="cFacturaAltaAction.do"/>
      <jsp:param name="displayLinks" value="no" />
         
    </jsp:include>
    
  </logic:equal>
</html:form>



