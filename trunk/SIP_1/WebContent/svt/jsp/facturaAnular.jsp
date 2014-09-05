<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<h1 align=" center" class="titulo">Anulaci&oacute;n de  Factura</h1>

<html:form action="cFacturaAnularAction.do" method="POST">
	<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/factura.jsp">
      <jsp:param name="formulario" value="cFacturaAnularActionForm"/>
      <jsp:param name="pageName" value="facturaAnular" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cFacturaAnularAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>
