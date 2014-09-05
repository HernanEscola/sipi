<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script>

</script>

<br>
<h1 align="center" class="titulo">Detalle de Cobro</h1>

<html:form action="cCobroDetalleAction.do" method="POST">
<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/cobro.jsp">
      <jsp:param name="pageName" value="cobroDetalle" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cCobroDetalleActionForm"/>
 	  <jsp:param name="actionName" value="cCobroDetalleAction.do"/>
      <jsp:param name="displayLinks" value="no" />
    </jsp:include>
    

</html:form>




