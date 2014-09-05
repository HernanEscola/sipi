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
	document.cFacturaModificarActionForm.tab.value=solapas[solapas.length-1];
    setupPanes("container", document.cFacturaModificarActionForm.tab.value);
  }

  function irTabInicial(){
	  document.cFacturaModificarActionForm.tab.value=solapas[0];
    setupPanes("container", document.cFacturaModificarActionForm.tab.value);
    
  }

  function irTabAnterior(){
    var obj = document.cFacturaModificarActionForm.tab.value;
    for(i=1;i<solapas.length;i++){
      if ((solapas[i] == obj)) {
    	  document.cFacturaModificarActionForm.tab.value=solapas[i-1];
        break;
      }  
    }  
    setupPanes("container", document.cFacturaModificarActionForm.tab.value);
  }

  function irTabSiguiente(){
    var obj = document.cFacturaModificarActionForm.tab.value;
    for(i=0;i<(solapas.length-1);i++){
      if ((solapas[i] == obj)) {
    	  document.cFacturaModificarActionForm.tab.value=solapas[i+1];
    	  if (solapas[i+1] == 'tabDistribucion'){
			  return submitDistribucion();
	  	  }
        break;
      }  
    }  
    setupPanes("container", document.cFacturaModificarActionForm.tab.value);
  }

  function irA(obj){
	if(document.cFacturaModificarActionForm.tab.value != 'tabDistribucion' && obj2.id == 'tabDistribucion'){
		return submitDistribucion();
	}  else if (document.cFacturaModificarActionForm.tab.value != 'tabFactura' && obj2.id == 'tabFactura'){
		return submitFactura();
	}
	
    document.cFacturaModificarActionForm.tab.value=obj;
    setupPanes("container", document.cFacturaModificarActionForm.tab.value);
  }

  function mostrarPanel(obj1, obj2){
	if(document.cFacturaModificarActionForm.tab.value != 'tabDistribucion' && obj2.id == 'tabDistribucion'){
		return submitDistribucion();
	}  else if (document.cFacturaModificarActionForm.tab.value != 'tabFactura' && obj2.id == 'tabFactura'){
		return submitFactura();
	}  
	  
    document.cFacturaModificarActionForm.tab.value = obj2.id;
    return showPane(obj1, obj2);
  }
  
  
  /*
  
  function prepararBusquedaUniversidad()
	{
		prepareAutoComplete("cFacturaModificarAction.do?method=auto Complete Universidad",
				  "autoCompleteUniversidad",
				  {
					onItemSelect: function(data)
			  		{
						$("#universidadSeleccionada").attr("value", data.data.id);
						$("#autoCompleteUnivTexto").text(data.data.nombre);
						document.cFacturaModificarActionForm.universidadDescripcion.value = data.data.nombre;
						intercambiarUniversidad();
			  		}
		  			,
		  			formatItem: function(data)
			  		{
			  			//if(data.nombreFantasia != null && data.nombreFantasia.length > 1)
			  			//{
			  			//	return data.nombre + " - " + data.nombreFantasia;
			  			//}
			  			//else
			  			//{
			  				return data.nombre;
			  			//}
			  		}
		  			,
		  			excludedValue: function(data)
			  		{
			  			//if(data.value == "-1")
		  				//{
		  				//	return true;
		  				//}
			  			//return false;
			  		}
		  			,
		  			minChars: 2,
		  			cacheLength: 100
				  });
	}

	function mostrarUniversidad(i)
	{
		  var val1 = $('#porcentajeDistribucionComision_'+i).val();
		  var val2 = $('#importeDistribucionComision_'+i).val();
		  
		  if ( (val1 == 0 || val1 == "" || val1 == "0.00" || val1 == "0") && (val2 == 0 || val2 == "" || val2 == "0.00" || val2 == "0") ) {
				  removeUniversidad();
				  $("[id^=autoCompleteUniversidad]").hide();
			} 
		  else
			{
				  intercambiarUniversidad();
			}
	}
	
	function removeUniversidad()
	{
		  $("#universidadSeleccionada").attr("value","");
		  $("#universidadDescripcion").attr("value","");
		  $("#autoCompleteUniversidad").attr("value","");
		  intercambiarUniversidad();
	}
	
	function intercambiarUniversidad()
	{
		  var select = $("#universidadSeleccionada").val();	  
		  if(select != "" && select != null)
		  {
			  $('#autoCompleteUniversidad').hide();
			  $('#autoCompleteUniversidadDescripcion').show();	
		  }
		  else{
			  $('#autoCompleteUniversidadDescripcion').hide();
			  $('#autoCompleteUniversidad').show();
		  }
	}
	*/
	$(document).ready(function() {
	/*	prepararBusquedaUniversidad();
		$('#autoCompleteUniversidad').hide();
		
		var select = $("#universidadSeleccionada").val();	
		
		if(select != "" && select != null)
			$('#autoCompleteUniversidadDescripcion').show();
		
		mostrarUniversidad($("#indexContraparte").val());
		*/
			
	});
	
	
	  function submitDistribucion(){
			document.cFacturaModificarActionForm.action = 'cFacturaModificarAction.do?btnSubmit=distribucion';
			document.cFacturaModificarActionForm.submit();
	  }

	  function submitFactura(){
			document.cFacturaModificarActionForm.action = 'cFacturaModificarAction.do?btnSubmit=tabfactura';
			document.cFacturaModificarActionForm.submit();
	  }
	  

	
</script>


<bean:define id="input" property="input" name="cFacturaModificarActionForm"/>

<br><h1 align="center" class="titulo">
<logic:equal value="cOrdenFacturacionBuscarAction" name="input">Registro de Factura</logic:equal>
<logic:notEqual value="cOrdenFacturacionBuscarAction" name="input">Modificación de Factura</logic:notEqual> </h1>

<html:form action="cFacturaModificarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="tab"/>
<html:hidden property="prestadorSeleccionado"	styleId="prestadorSeleccionado" />
<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
<html:hidden property="contratanteSeleccionado"	styleId="contratanteSeleccionado" />
<html:hidden property="contratanteDescripcion"	styleId="contratanteDescripcion" />

<logic:equal property="accion" value="modificar" name="cFacturaModificarActionForm">
  <script>
  
  window.onload=function() {
	    setupPanes("container", document.cFacturaModificarActionForm.tab.value);

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
         <jsp:param name="pageName" value="facturaModificar" />
          <jsp:param name="tipoPantalla" value="input" />
          <jsp:param name="formulario" value="cFacturaModificarActionForm" />
          <jsp:param name="actionName" value="cFacturaModificarAction.do"/>
          <jsp:param name="displayLinks" value="si" />
          
        </jsp:include>
      </div>

    </div>
</logic:equal> 

  <logic:equal property="accion" value="confirmar" name="cFacturaModificarActionForm">
    <jsp:include page="/jsp/entidades/factura.jsp">
      <jsp:param name="pageName" value="facturaModificar" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cFacturaModificarActionForm"/>
 	  <jsp:param name="actionName" value="cFacturaModificarAction.do"/>
      <jsp:param name="displayLinks" value="no" />
         
    </jsp:include>
    
  </logic:equal>
</html:form>



