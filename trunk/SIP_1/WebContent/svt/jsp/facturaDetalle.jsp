<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<h1 align=" center" class="titulo">Detalle  de  Factura</h1>
    <logic:equal value="A" property="estado" name="cFacturaDetalleActionForm">
      <h2 class="mensajeSuperior">Esta factura se encuentra anulada</h2>
    </logic:equal>
  <logic:equal value="PE" property="estado" name="cFacturaDetalleActionForm">
      <h2 class="mensajeSuperiorNegro">Factura en Estado Pendiente </h2>
    </logic:equal>
    

<html:form action="cFacturaDetalleAction.do" method="POST">
	<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/factura.jsp">
      <jsp:param name="formulario" value="cFacturaDetalleActionForm"/>
      <jsp:param name="pageName" value="facturaDetalle" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cFacturaDetalleAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>





