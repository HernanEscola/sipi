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
	  document.cPrecioOfertaAltaActionForm.tab.value=solapas[solapas.length-1];
	  if (solapas[solapas.length-1] == 'tabDistribucion')
        return submitCostos();
    setupPanes("container", document.cPrecioOfertaAltaActionForm.tab.value);
  }

  function irTabInicial(){
	  document.cPrecioOfertaAltaActionForm.tab.value=solapas[0];
    setupPanes("container", document.cPrecioOfertaAltaActionForm.tab.value);
    return submitCostos();
  }

  function irTabAnterior(){
    var obj = document.cPrecioOfertaAltaActionForm.tab.value;
    for(i=1;i<solapas.length;i++){
      if ((solapas[i] == obj)) {
    	  document.cPrecioOfertaAltaActionForm.tab.value=solapas[i-1];
        break;
      }  
    }  
    setupPanes("container", document.cPrecioOfertaAltaActionForm.tab.value);
  }

  function irTabSiguiente(){
    var obj = document.cPrecioOfertaAltaActionForm.tab.value;
    for(i=0;i<(solapas.length-1);i++){
      if ((solapas[i] == obj)) {
    	  document.cPrecioOfertaAltaActionForm.tab.value=solapas[i+1];
    	  if (solapas[i+1] == 'tabDistribucion')
          return submitCostos();
        break;
      }  
    }  
    setupPanes("container", document.cPrecioOfertaAltaActionForm.tab.value);
  }

  function irA(obj){
	  if(document.cPrecioOfertaAltaActionForm.tab.value != 'tabDistribucion' && obj == 'tabDistribucion'){
	     return submitCostos();
    }
    document.cPrecioOfertaAltaActionForm.tab.value=obj;
    setupPanes("container", document.cPrecioOfertaAltaActionForm.tab.value);
  }

  function mostrarPanel(obj1, obj2){
	  if(document.cPrecioOfertaAltaActionForm.tab.value != 'tabDistribucion' && obj2.id == 'tabDistribucion'){
		    return submitCostos();
	  }
    document.cPrecioOfertaAltaActionForm.tab.value = obj2.id;
    return showPane(obj1, obj2);
  }
  
  function submitCostos() {
    var url = 'cPrecioOfertaAltaAction.do?btnSubmit=seleccionarCosto&costoSeleccionado='+costoSeleccionado; 
    if (costoSeleccionado != document.cPrecioOfertaAltaActionForm.costoSeleccionado.value) {
        url += '&cambioCostoSeleccionado='+true;
    } else {
    	url += '&cambioCostoSeleccionado='+false;
    }
	  document.cPrecioOfertaAltaActionForm.action = url;
	  document.cPrecioOfertaAltaActionForm.submit();
	}

</script>
<br>
<h1 align="center" class="titulo">Registro del Precio de la Oferta</h1>
<html:form action="cPrecioOfertaAltaAction.do" method="POST">
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
  <logic:equal value="alta" name="cPrecioOfertaAltaActionForm" property="accion">
  <script>
  window.onload=function() {
	    setupPanes("container", document.cPrecioOfertaAltaActionForm.tab.value);
      prepare();
	    if (document.cPrecioOfertaAltaActionForm.costoSeleccionado.value != -1){
	        costoSeleccionado=document.cPrecioOfertaAltaActionForm.costoSeleccionado.value;
          comisiones=document.cPrecioOfertaAltaActionForm.totalComisionesCostoSeleccionado.value;
          sumaCostos=document.cPrecioOfertaAltaActionForm.sumaCostosCostoSeleccionado.value;
	        precio=document.cPrecioOfertaAltaActionForm.precioCostoSeleccionado.value;
          manoDeObra=document.cPrecioOfertaAltaActionForm.manoObraCostoSeleccionado.value;
          importeRiesgo=document.cPrecioOfertaAltaActionForm.importeRiesgoCostoSeleccionado.value;
          porcentajeRiesgo=document.cPrecioOfertaAltaActionForm.porcentajeRiesgoCostoSeleccionado.value;
      }
	    if (document.cPrecioOfertaAltaActionForm.tab.value == 'tabPrecio') {
	        limpiarTabPrecio(costoSeleccionado, precio, comisiones, sumaCostos, importeRiesgo, manoDeObra, porcentajeRiesgo);
	    } else if (document.cPrecioOfertaAltaActionForm.tab.value == 'tabDistribucion') {
	        limpiarTabDistribucion();
	    }else if (document.cPrecioOfertaAltaActionForm.tab.value == 'tabBeneficiario'){
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
        <jsp:param name="formulario" value="cPrecioOfertaAltaActionForm"/>
        <jsp:param name="pageName" value="precioAlta" />
        <jsp:param name="tipoPantalla" value="input" />
        <jsp:param name="actionName" value="cPrecioOfertaAltaAction.do"/>
        <jsp:param name="displayLinks" value="si" />
      </jsp:include>
    </div>
  </div>
  </logic:equal>
  <logic:equal value="altaCfm" name="cPrecioOfertaAltaActionForm" property="accion">
    <jsp:include page="/jsp/entidades/precioStan.jsp">
      <jsp:param name="formulario" value="cPrecioOfertaAltaActionForm"/>
      <jsp:param name="pageName" value="precioAlta" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cPrecioOfertaAltaAction.do"/>
      <jsp:param name="displayLinks" value="no" />
    </jsp:include>
  </logic:equal>
</html:form>
