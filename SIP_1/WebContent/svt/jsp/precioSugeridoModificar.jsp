<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script>
 
  precio=0;
  comisiones=0;
  sumaCostos=0;
  importeRiesgo=0;
  manoDeObra=0;
  porcentajeRiesgo=0;
  solapas = new Array('tabPrecio','tabDistribucion');
  
  function irTabFinal(){
    document.cPrecioSugeridoModificarActionForm.tab.value=solapas[solapas.length-1];
    
    setupPanes("container", document.cPrecioSugeridoModificarActionForm.tab.value);
  }

  function irTabInicial(){
    document.cPrecioSugeridoModificarActionForm.tab.value=solapas[0];
    setupPanes("container", document.cPrecioSugeridoModificarActionForm.tab.value);
  }

  function irTabAnterior(){
    var obj = document.cPrecioSugeridoModificarActionForm.tab.value;
    for(i=1;i<solapas.length;i++){
      if ((solapas[i] == obj)) {
        document.cPrecioSugeridoModificarActionForm.tab.value=solapas[i-1];
        break;
      }  
    }  
    setupPanes("container", document.cPrecioSugeridoModificarActionForm.tab.value);
  }

  function irTabSiguiente(){
    var obj = document.cPrecioSugeridoModificarActionForm.tab.value;
    for(i=0;i<(solapas.length-1);i++){
      if ((solapas[i] == obj)) {
        document.cPrecioSugeridoModificarActionForm.tab.value=solapas[i+1];
        break;
      }  
    }  
    setupPanes("container", document.cPrecioSugeridoModificarActionForm.tab.value);
  }

  function irA(obj){
	
    document.cPrecioSugeridoModificarActionForm.tab.value=obj;
    setupPanes("container", document.cPrecioSugeridoModificarActionForm.tab.value);
  }

  function mostrarPanel(obj1, obj2){
	 
    document.cPrecioSugeridoModificarActionForm.tab.value = obj2.id;
    return showPane(obj1, obj2);
  }

  
</script>
<br>
<h1 align="center" class="titulo">Modificación de Precio</h1>
<html:form action="cPrecioSugeridoModificarAction.do" method="POST">
  <html:hidden property="accion" />
  <html:hidden property="tab"/>

  <html:hidden property="precioCosto"/>
  <html:hidden property="comisionesCosto"/>
  <html:hidden property="totalComisionesCostoSeleccionado"/>
  <html:hidden property="sumaCostosCostoSeleccionado"/>
  <html:hidden property="precioCostoSeleccionado"/>
  <html:hidden property="manoObraCostoSeleccionado"/>
  <html:hidden property="importeRiesgoCostoSeleccionado"/>
  <html:hidden property="porcentajeRiesgoCostoSeleccionado"/>
  

  
  <logic:equal value="modificar" name="cPrecioSugeridoModificarActionForm" property="accion">
  
  
  
  
  
  <script>
  window.onload=function() {
      setupPanes("container", document.cPrecioSugeridoModificarActionForm.tab.value);
      deshabilitarCampos();
      prepare();
     
    //deshabilita el enter, y quita el foco al presionarlo
      $("input[type=text]").keypress(function(e){
		  	if(e.which == 13){ 
			  	this.blur();
			  	return false; 
			} 
		});
    
      comisiones=document.cPrecioSugeridoModificarActionForm.totalComisionesCostoSeleccionado.value;
      sumaCostos=document.cPrecioSugeridoModificarActionForm.sumaCostosCostoSeleccionado.value;
      precio=document.cPrecioSugeridoModificarActionForm.precioCostoSeleccionado.value;
      manoDeObra=document.cPrecioSugeridoModificarActionForm.manoObraCostoSeleccionado.value;
      importeRiesgo=document.cPrecioSugeridoModificarActionForm.importeRiesgoCostoSeleccionado.value;
      porcentajeRiesgo=document.cPrecioSugeridoModificarActionForm.porcentajeRiesgoCostoSeleccionado.value;
      
      porcentajeAdicionalTemp1 = $('#porcentajeComisionAdicional_0').val();
      porcentajeAdicionalTemp2 = $('#porcentajeComisionAdicional_1').val();
      
      if (document.cPrecioSugeridoModificarActionForm.tab.value == 'tabPrecio') {
        //  limpiarTabPrecio(precio, comisiones, sumaCostos, importeRiesgo, manoDeObra, porcentajeRiesgo);
      } else if (document.cPrecioSugeridoModificarActionForm.tab.value == 'tabDistribucion') {
         // limpiarTabDistribucion();
      }
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
        <jsp:param name="formulario" value="cPrecioSugeridoModificarActionForm"/>
        <jsp:param name="pageName" value="precioModificar" />
        <jsp:param name="tipoPantalla" value="input" />
        <jsp:param name="actionName" value="cPrecioSugeridoModificarAction.do"/>
        <jsp:param name="displayLinks" value="si" />
      </jsp:include>
    </div>
  </div>
  </logic:equal>
  <logic:equal value="confirmar" name="cPrecioSugeridoModificarActionForm" property="accion">
    <jsp:include page="/jsp/entidades/precioSugeridoInputStan.jsp">
      <jsp:param name="formulario" value="cPrecioSugeridoModificarActionForm"/>
      <jsp:param name="pageName" value="precioModificar" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cPrecioSugeridoModificarAction.do"/>
      <jsp:param name="displayLinks" value="no" />
    </jsp:include>
  </logic:equal>
</html:form>
