<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<h1 align="center" class="titulo">Detalle de Precio</h1>
<html:form action="cPrecioOfertaDetalleAction.do" method="POST">
   <html:hidden property="saldoADistribuir"/>
	  <html:hidden property="costoSeleccionado"/>
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
	  costoSeleccionado=document.cPrecioOfertaDetalleActionForm.costoSeleccionado.value;
      comisiones=document.cPrecioOfertaDetalleActionForm.totalComisionesCostoSeleccionado.value;
      sumaCostos=document.cPrecioOfertaDetalleActionForm.sumaCostosCostoSeleccionado.value;
      precio=document.cPrecioOfertaDetalleActionForm.precioCostoSeleccionado.value;
      manoDeObra=document.cPrecioOfertaDetalleActionForm.manoObraCostoSeleccionado.value;
      importeRiesgo=document.cPrecioOfertaDetalleActionForm.importeRiesgoCostoSeleccionado.value;
      porcentajeRiesgo=document.cPrecioOfertaDetalleActionForm.porcentajeRiesgoCostoSeleccionado.value;
  }
  </script>


    <jsp:include page="/jsp/entidades/precioStan.jsp">
      <jsp:param name="formulario" value="cPrecioOfertaDetalleActionForm"/>
      <jsp:param name="pageName" value="precioDetalle" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cPrecioOfertaDetalleAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>
