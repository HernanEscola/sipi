<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<h1 align="center" class="titulo">Detalle de Precio Sugerido</h1>
    <logic:equal value="I" property="estado" name="cPrecioSugeridoDetaActionForm">
      <h2 class="mensajeSuperior">Este precio se encuentra Deshabilitado</h2>
    </logic:equal>
    <logic:notEqual value="I" property="estado" name="cPrecioSugeridoDetaActionForm">
	    <logic:notEqual value="N" property="oferta.estado" name="cPrecioSugeridoDetaActionForm">
	      <h2 class="mensajeSuperior">La Oferta Tecnológica se encuentra Deshabilitada</h2>
		</logic:notEqual>

	</logic:notEqual>
	

<html:form action="cPrecioSugeridoDetaAction.do" method="POST">
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
	
      comisiones=document.cPrecioSugeridoDetaActionForm.totalComisionesCostoSeleccionado.value;
      sumaCostos=document.cPrecioSugeridoDetaActionForm.sumaCostosCostoSeleccionado.value;
      precio=document.cPrecioSugeridoDetaActionForm.precioCostoSeleccionado.value;
      manoDeObra=document.cPrecioSugeridoDetaActionForm.manoObraCostoSeleccionado.value;
      importeRiesgo=document.cPrecioSugeridoDetaActionForm.importeRiesgoCostoSeleccionado.value;
      porcentajeRiesgo=document.cPrecioSugeridoDetaActionForm.porcentajeRiesgoCostoSeleccionado.value;
  }
  </script>


    <jsp:include page="/jsp/entidades/precioSugeridoStan.jsp">
      <jsp:param name="formulario" value="cPrecioSugeridoDetaActionForm"/>
      <jsp:param name="pageName" value="precioSugeridoDetalle" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cPrecioSugeridoDetaAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>
