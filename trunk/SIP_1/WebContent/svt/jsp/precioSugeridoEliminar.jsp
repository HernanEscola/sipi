<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<h1 align="center" class="titulo">Eliminación de Precio Sugerido</h1>

		<tr>
			<td align="center">
				<h2 class="mensajeSuperior">
					Está a punto de eliminar, presione 'Grabar' para confirmar
				</h2>
			</td>
		</tr>
		
<html:form action="cPrecioSugeridoEliminarAction.do" method="POST">
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
	
      comisiones=document.cPrecioSugeridoEliminarActionForm.totalComisionesCostoSeleccionado.value;
      sumaCostos=document.cPrecioSugeridoEliminarActionForm.sumaCostosCostoSeleccionado.value;
      precio=document.cPrecioSugeridoEliminarActionForm.precioCostoSeleccionado.value;
      manoDeObra=document.cPrecioSugeridoEliminarActionForm.manoObraCostoSeleccionado.value;
      importeRiesgo=document.cPrecioSugeridoEliminarActionForm.importeRiesgoCostoSeleccionado.value;
      porcentajeRiesgo=document.cPrecioSugeridoEliminarActionForm.porcentajeRiesgoCostoSeleccionado.value;
  }
  </script>


    <jsp:include page="/jsp/entidades/precioSugeridoStan.jsp">
      <jsp:param name="formulario" value="cPrecioSugeridoEliminarActionForm"/>
      <jsp:param name="pageName" value="precioSugeridoEliminar" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cPrecioSugeridoEliminarAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>
