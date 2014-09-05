<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script>

</script>

<br>
<h1 align="center" class="titulo">Información del Asesor</h1>

<html:form action="cAsesoriaEntidadAction.do" method="POST">
<html:hidden property="accion"/>
     <logic:equal property="tipoPantalla" value="input" name="cAsesoriaEntidadActionForm">
	    <jsp:include page="/jsp/entidades/asesoriaEntidad.jsp">
	      <jsp:param name="pageName" value="asesoriaEntidad" />
	      <jsp:param name="tipoPantalla" value="input" />
	 	  <jsp:param name="formulario" value="cAsesoriaEntidadActionForm"/>
	 	  <jsp:param name="actionName" value="cAsesoriaEntidadAction.do"/>
	      <jsp:param name="displayLinks" value="si" />
	    </jsp:include>
	 </logic:equal>
     <logic:equal property="tipoPantalla" value="view" name="cAsesoriaEntidadActionForm">
	    <jsp:include page="/jsp/entidades/asesoriaEntidad.jsp">
	      <jsp:param name="pageName" value="asesoriaEntidad" />
	      <jsp:param name="tipoPantalla" value="view" />
	 	  <jsp:param name="formulario" value="cAsesoriaEntidadActionForm"/>
	 	  <jsp:param name="actionName" value="cAsesoriaEntidadAction.do"/>
	      <jsp:param name="displayLinks" value="no" />
	    </jsp:include>
	 </logic:equal>
	    	    
	    
</html:form>
