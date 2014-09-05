<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script>
  var costoSeleccionado=-1;
  precio=0;
  comisiones=0;
  sumaCostos=0;
  importeRiesgo=0;
  manoDeObra=0;
  porcentajeRiesgo=0;
  solapas = new Array('tabStan','tabPrecio','tabDistribucion','tabBeneficiario');
  
  function irTabFinal(){
    document.cPrecioOfertaModificarActionForm.tab.value=solapas[solapas.length-1];
    
    setupPanes("container", document.cPrecioOfertaModificarActionForm.tab.value);
  }

  function irTabInicial(){
    document.cPrecioOfertaModificarActionForm.tab.value=solapas[0];
    setupPanes("container", document.cPrecioOfertaModificarActionForm.tab.value);
  }

  function irTabAnterior(){
    var obj = document.cPrecioOfertaModificarActionForm.tab.value;
    for(i=1;i<solapas.length;i++){
      if ((solapas[i] == obj)) {
        document.cPrecioOfertaModificarActionForm.tab.value=solapas[i-1];
        break;
      }  
    }  
    setupPanes("container", document.cPrecioOfertaModificarActionForm.tab.value);
  }

  function irTabSiguiente(){
    var obj = document.cPrecioOfertaModificarActionForm.tab.value;
    for(i=0;i<(solapas.length-1);i++){
      if ((solapas[i] == obj)) {
        document.cPrecioOfertaModificarActionForm.tab.value=solapas[i+1];
        if (solapas[i+1] == 'tabDistribucion')
        	submitCostos();
        break;
      }  
    }  
    setupPanes("container", document.cPrecioOfertaModificarActionForm.tab.value);
  }

  function irA(obj){
	  if(document.cPrecioOfertaModificarActionForm.tab.value != 'tabDistribucion' && obj == 'tabDistribucion'){
		  submitCostos();
	  }
    document.cPrecioOfertaModificarActionForm.tab.value=obj;
    setupPanes("container", document.cPrecioOfertaModificarActionForm.tab.value);
  }

  function mostrarPanel(obj1, obj2){
	  if(document.cPrecioOfertaModificarActionForm.tab.value != 'tabDistribucion' && obj2.id == 'tabDistribucion'){
		  submitCostos();
    }
    document.cPrecioOfertaModificarActionForm.tab.value = obj2.id;
    return showPane(obj1, obj2);
  }

  function submitCostos() {
	    var url = 'cPrecioOfertaModificarAction.do?btnSubmit=seleccionarCosto&costoSeleccionado='+costoSeleccionado; 
	    if (costoSeleccionado != document.cPrecioOfertaModificarActionForm.costoSeleccionado.value) {
	        url += '&cambioCostoSeleccionado='+true;
	    } else {
	      url += '&cambioCostoSeleccionado='+false;
	    }
	    document.cPrecioOfertaModificarActionForm.action = url;
	    document.cPrecioOfertaModificarActionForm.submit();
	  }
</script>
<br>
<h1 align="center" class="titulo">Modificación de Precio</h1>
<html:form action="cPrecioOfertaModificarAction.do" method="POST">
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
  <logic:equal value="modificar" name="cPrecioOfertaModificarActionForm" property="accion">
  <script>
  window.onload=function() {
      setupPanes("container", document.cPrecioOfertaModificarActionForm.tab.value);
      deshabilitarCampos();
      prepare();
      
      
      
      if (document.cPrecioOfertaModificarActionForm.costoSeleccionado.value != -1){
          costoSeleccionado=document.cPrecioOfertaModificarActionForm.costoSeleccionado.value;
          comisiones=document.cPrecioOfertaModificarActionForm.totalComisionesCostoSeleccionado.value;
          sumaCostos=document.cPrecioOfertaModificarActionForm.sumaCostosCostoSeleccionado.value;
          precio=document.cPrecioOfertaModificarActionForm.precioCostoSeleccionado.value;
          manoDeObra=document.cPrecioOfertaModificarActionForm.manoObraCostoSeleccionado.value;
          importeRiesgo=document.cPrecioOfertaModificarActionForm.importeRiesgoCostoSeleccionado.value;
          porcentajeRiesgo=document.cPrecioOfertaModificarActionForm.porcentajeRiesgoCostoSeleccionado.value;
      }
      if (document.cPrecioOfertaModificarActionForm.tab.value == 'tabPrecio') {
          limpiarTabPrecio(costoSeleccionado, precio, comisiones, sumaCostos, importeRiesgo, manoDeObra, porcentajeRiesgo);
      } else if (document.cPrecioOfertaModificarActionForm.tab.value == 'tabDistribucion') {
          limpiarTabDistribucion();
      }else if (document.cPrecioOfertaModificarActionForm.tab.value == 'tabBeneficiario'){
	      calcularComisiones();
	  }
      
  }
  </script>
  <div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>
        <td>
          <ul class="tabs">
           <li><a href="#" onClick="return mostrarPanel('stan', this)" id="tabStan">Stan</a></li>
           <li><a href="#" onClick="return mostrarPanel('precio', this)" id="tabPrecio">Precio</a></li>
           <li><a href="#" onClick="return mostrarPanel('distribucion', this)" id="tabDistribucion">Distribucion</a></li>
           <li><a href="#" onClick="return mostrarPanel('beneficiario', this)" id="tabBeneficiario">Beneficiarios</a></li>
          
          </ul>
        </td>
      </tr>
    </table>
    <div>
      <jsp:include page="/jsp/entidades/precioStan.jsp">
        <jsp:param name="formulario" value="cPrecioOfertaModificarActionForm"/>
        <jsp:param name="pageName" value="precioModificar" />
        <jsp:param name="tipoPantalla" value="input" />
        <jsp:param name="actionName" value="cPrecioOfertaModificarAction.do"/>
        <jsp:param name="displayLinks" value="si" />
      </jsp:include>
    </div>
  </div>
  </logic:equal>
  <logic:equal value="modificarCfm" name="cPrecioOfertaModificarActionForm" property="accion">
    <jsp:include page="/jsp/entidades/precioStan.jsp">
      <jsp:param name="formulario" value="cPrecioOfertaModificarActionForm"/>
      <jsp:param name="pageName" value="precioModificar" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cPrecioOfertaModificarAction.do"/>
      <jsp:param name="displayLinks" value="no" />
    </jsp:include>
  </logic:equal>
</html:form>
