<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<h1 align=" center" class="titulo">Eliminaci&oacute;n de  Factura</h1>

 <logic:equal value="C" property="cobrado" name="cFacturaEliminarActionForm">
<table align="center" width="300">
  <tr height="12" >
	<td align="center">
    	<b>Factura con cobros, no podrá eliminar</b>
 	</td>
 </tr>	
 </table>
</logic:equal>

 <logic:notEqual value="C" property="cobrado" name="cFacturaEliminarActionForm">
    <div align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar la Factura, presione 'Grabar' para confirmar</b>
    </div>
</logic:notEqual>
<html:form action="cFacturaEliminarAction.do" method="POST">
	<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/factura.jsp">
      <jsp:param name="formulario" value="cFacturaEliminarActionForm"/>
      <jsp:param name="pageName" value="facturaEliminar" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cFacturaEliminarAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>





