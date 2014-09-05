<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script>

</script>

<br>

	<logic:equal property="estado" value="D" name="cAsesoriaDetalleActionForm">
		<h1 align="center" class="titulo">Habilitación de Asesoría</h1>
	</logic:equal>
	
	<logic:notEqual property="estado" value="D" name="cAsesoriaDetalleActionForm">
		<h1 align="center" class="titulo">Deshabilitación de Asesoría</h1>
	</logic:notEqual>
	
	<html:form action="cAsesoriaHabilitarAction.do" method="POST">
	<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/asesoria.jsp">
    	<jsp:param name="pageName" value="asesoriaDetalle" />
    	<jsp:param name="tipoPantalla" value="view" />
 		<jsp:param name="formulario" value="cAsesoriaDetalleActionForm"/>
 		<jsp:param name="actionName" value="cAsesoriaHabilitarAction.do"/>
   		<jsp:param name="displayLinks" value="no" />
    </jsp:include>
    

</html:form>
	
	