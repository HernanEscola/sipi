<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script>
  var costoSeleccionado=-1;
  precio=0;
  subtotalPrecio=0;
  costoTotal=0;
  comisiones=0;
  sumaCostos=0;
  importeRiesgo=0;
  manoDeObra=0;
  porcentajeRiesgo=0;
  solapas = new Array('tabPrecio','tabDistribucion');
  
  function irTabFinal(){
	document.cPrecioSugeridoAltaActionForm.tab.value=solapas[solapas.length-1];
    setupPanes("container", document.cPrecioSugeridoAltaActionForm.tab.value);
  }

  function irTabInicial(){
	  document.cPrecioSugeridoAltaActionForm.tab.value=solapas[0];
    setupPanes("container", document.cPrecioSugeridoAltaActionForm.tab.value);
    
  }

  function irTabAnterior(){
    var obj = document.cPrecioSugeridoAltaActionForm.tab.value;
    for(i=1;i<solapas.length;i++){
      if ((solapas[i] == obj)) {
    	  document.cPrecioSugeridoAltaActionForm.tab.value=solapas[i-1];
        break;
      }  
    }  
    setupPanes("container", document.cPrecioSugeridoAltaActionForm.tab.value);
  }

  function irTabSiguiente(){
    var obj = document.cPrecioSugeridoAltaActionForm.tab.value;
    for(i=0;i<(solapas.length-1);i++){
      if ((solapas[i] == obj)) {
    	  document.cPrecioSugeridoAltaActionForm.tab.value=solapas[i+1];
        break;
      }  
    }  
    setupPanes("container", document.cPrecioSugeridoAltaActionForm.tab.value);
  }

  function irA(obj){
	
    document.cPrecioSugeridoAltaActionForm.tab.value=obj;
    setupPanes("container", document.cPrecioSugeridoAltaActionForm.tab.value);
  }

  function mostrarPanel(obj1, obj2){
    document.cPrecioSugeridoAltaActionForm.tab.value = obj2.id;
    return showPane(obj1, obj2);
  }
  

</script>
<br>
<h1 align="center" class="titulo">Registro del Precio Sugerido</h1>
<html:form action="cPrecioSugeridoAltaAction.do" method="POST">
  <html:hidden property="accion" />
  <html:hidden property="tab"/>
  <html:hidden property="costoSeleccionado"/>
  <html:hidden property="precioCosto"/>

  <html:hidden property="comisionesCosto"/>
  <html:hidden property="totalComisionesCostoSeleccionado"/>
  <html:hidden property="sumaCostosCostoSeleccionado"/>
  <html:hidden property="precioCostoSeleccionado"/>
  <html:hidden property="manoObraCostoSeleccionado"/>
  <html:hidden property="importeRiesgoCostoSeleccionado"/>
  <html:hidden property="porcentajeRiesgoCostoSeleccionado"/>
  <logic:equal value="alta" name="cPrecioSugeridoAltaActionForm" property="accion">
  <script>
  
  window.onload=function() {
	    setupPanes("container", document.cPrecioSugeridoAltaActionForm.tab.value);
      prepare();
	    if (document.cPrecioSugeridoAltaActionForm.costoSeleccionado.value != -1){
		        costoSeleccionado=document.cPrecioSugeridoAltaActionForm.costoSeleccionado.value;
	          comisiones=document.cPrecioSugeridoAltaActionForm.totalComisionesCostoSeleccionado.value;
	          sumaCostos=document.cPrecioSugeridoAltaActionForm.sumaCostosCostoSeleccionado.value;
		      precio=document.cPrecioSugeridoAltaActionForm.precioCostoSeleccionado.value;
		      subtotalPrecio=document.cPrecioSugeridoAltaActionForm.precioCostoSeleccionado.value;
		      costoTotal=document.cPrecioSugeridoAltaActionForm.precioCostoSeleccionado.value;
		        
	          manoDeObra=document.cPrecioSugeridoAltaActionForm.manoObraCostoSeleccionado.value;
	          importeRiesgo=document.cPrecioSugeridoAltaActionForm.importeRiesgoCostoSeleccionado.value;
	          porcentajeRiesgo=document.cPrecioSugeridoAltaActionForm.porcentajeRiesgoCostoSeleccionado.value;
	          
	          porcentajeAdicionalTemp1 = $('#porcentajeComisionAdicional_0').val();
	          porcentajeAdicionalTemp2 = $('#porcentajeComisionAdicional_1').val();
      	}
	   calcularRecuperoDeFondos();
	  //deshabilita el enter, y quita el foco al presionarlo
		 $("input[type=text]").keypress(function(e){
		  	if(e.which == 13){ 
			  	this.blur();
			  	return false; 
			} 
		});
	}
  </script>
  <div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <ul class="tabs">
           <li><a href="#" onClick="return mostrarPanel('precio', this)" id="tabPrecio">Precio</a></li>
           <li><a href="#" onClick="return mostrarPanel('distribucion', this)" id="tabDistribucion">Distribucion</a></li>
          </ul>
        </td>
      </tr>
    </table>
    <div>
      <jsp:include page="/jsp/entidades/precioSugeridoInputStan.jsp">
        <jsp:param name="formulario" value="cPrecioSugeridoAltaActionForm"/>
        <jsp:param name="pageName" value="precioAlta" />
        <jsp:param name="tipoPantalla" value="input" />
        <jsp:param name="actionName" value="cPrecioSugeridoAltaAction.do"/>
        <jsp:param name="displayLinks" value="si" />
      </jsp:include>
    </div>
  </div>
  </logic:equal>
  <logic:equal value="altaCfm" name="cPrecioSugeridoAltaActionForm" property="accion">
    <jsp:include page="/jsp/entidades/precioSugeridoInputStan.jsp">
      <jsp:param name="formulario" value="cPrecioSugeridoAltaActionForm"/>
      <jsp:param name="pageName" value="precioAlta" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cPrecioSugeridoAltaAction.do"/>
      <jsp:param name="displayLinks" value="no" />
    </jsp:include>
  </logic:equal>
</html:form>
