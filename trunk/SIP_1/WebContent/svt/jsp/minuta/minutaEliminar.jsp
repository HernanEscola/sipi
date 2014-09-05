<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script>



</script>

<br>
<h1 align="center" class="titulo">Eliminar Minuta</h1>

<html:form action="cMinutaEliminarAction.do" method="POST">
<table align="center" width="600">
  <tr >
    <td align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar la minuta, presione 'Grabar' para confirmar</b>
    </td>
  </tr>
</table>

<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/minuta.jsp">
      <jsp:param name="pageName" value="minutaEliminar" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cMinutaDetalleActionForm"/>
 	  <jsp:param name="actionName" value="cMinutaEliminarAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
    

</html:form>
