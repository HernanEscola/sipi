<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script>

</script>

<br>
<h1 align="center" class="titulo">Eliminación de Cobro</h1>

 <logic:equal value="true" property="transferido" name="cCobroEliminarActionForm">
<table align="center" width="300">
  <tr height="12" >
	<td align="center">
    	<b>Cobro con Transferencias, no podrá eliminar</b>
 	</td>
 </tr>	
 </table>
</logic:equal>
<logic:notEqual value="true" property="transferido" name="cCobroEliminarActionForm">
<table align="center" width="600">
  <tr >
    <td align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar el cobro, presione 'Grabar' para confirmar</b>
    </td>
  </tr>
</table>
</logic:notEqual>


<html:form action="cCobroEliminarAction.do" method="POST">
<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/cobro.jsp">
      <jsp:param name="pageName" value="cobroEliminar" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cCobroEliminarActionForm"/>
 	  <jsp:param name="actionName" value="cCobroEliminarAction.do"/>
      <jsp:param name="displayLinks" value="no" />
    </jsp:include>
    

</html:form>


