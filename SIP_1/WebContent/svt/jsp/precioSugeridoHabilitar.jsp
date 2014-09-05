<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<logic:equal property="estado" value="N" name="cPrecioSugeridoHabilitarActionForm">
  <h1 align="center" class="titulo">
    Deshabilitación de Precio Sugerido
  </h1>
</logic:equal>

<logic:equal property="estado" value="I" name="cPrecioSugeridoHabilitarActionForm">
  <h1 align="center" class="titulo">
    Habilitación de Precio Sugerido
  </h1>
</logic:equal>



<html:form action="cPrecioSugeridoHabilitarAction.do" method="POST">
   <html:hidden property="saldoADistribuir"/>
	
	  <html:hidden property="precioCosto"/>
	  <html:hidden property="comisionesCosto"/>
	  <html:hidden property="totalComisionesCostoSeleccionado"/>
	  <html:hidden property="sumaCostosCostoSeleccionado"/>
	  <html:hidden property="precioCostoSeleccionado"/>
	  <html:hidden property="manoObraCostoSeleccionado"/>
	  <html:hidden property="importeRiesgoCostoSeleccionado"/>
	  <html:hidden property="porcentajeRiesgoCostoSeleccionado"/>

  <script>
  window.onload=function() {
	
      comisiones=document.cPrecioSugeridoHabilitarActionForm.totalComisionesCostoSeleccionado.value;
      sumaCostos=document.cPrecioSugeridoHabilitarActionForm.sumaCostosCostoSeleccionado.value;
      precio=document.cPrecioSugeridoHabilitarActionForm.precioCostoSeleccionado.value;
      manoDeObra=document.cPrecioSugeridoHabilitarActionForm.manoObraCostoSeleccionado.value;
      importeRiesgo=document.cPrecioSugeridoHabilitarActionForm.importeRiesgoCostoSeleccionado.value;
      porcentajeRiesgo=document.cPrecioSugeridoHabilitarActionForm.porcentajeRiesgoCostoSeleccionado.value;
  }
  </script>


    <jsp:include page="/jsp/entidades/precioSugeridoStan.jsp">
      <jsp:param name="formulario" value="cPrecioSugeridoHabilitarActionForm"/>
      <jsp:param name="pageName" value="precioSugeridoHabilitar" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cPrecioSugeridoHabilitarAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>
