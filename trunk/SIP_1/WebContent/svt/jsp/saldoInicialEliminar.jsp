<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<h1 align=" center" class="titulo">Eliminaci&oacute;n de  Saldo Inicial</h1>


<logic:equal value="T" property="cobrado" name="cFacturaEliminarActionForm">
<table align="center" >
  <tr height="12" >
	<td align="center">
    	<b>Saldo Inicial con transferencias relacionadas, no podrá eliminar</b>
 	</td>
 </tr>	
 </table>
</logic:equal>
<logic:notEqual value="T" property="cobrado" name="cFacturaEliminarActionForm">
<div align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar el Saldo Inicial, presione 'Grabar' para confirmar</b>
</div>
</logic:notEqual>

<html:form action="cSaldoInicialEliminarAction.do" method="POST">
	<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/saldoInicial.jsp">
      <jsp:param name="formulario" value="cFacturaEliminarActionForm"/>
      <jsp:param name="pageName" value="saldoInicialEliminar" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cSaldoInicialEliminarAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>





