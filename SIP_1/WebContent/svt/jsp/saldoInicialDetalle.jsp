<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<h1 align=" center" class="titulo">Detalle  de  Saldo Inicial</h1>

<html:form action="cSaldoInicialDetalleAction.do" method="POST">
	<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/saldoInicial.jsp">
      <jsp:param name="formulario" value="cFacturaDetalleActionForm"/>
      <jsp:param name="pageName" value="saldoInicialDetalle" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cSaldoInicialDetalleAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>



