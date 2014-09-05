<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script>


window.onload=function(){
	if(document.cAsesoriaDetalleActionForm.generarPDF.value=="S"){
		document.cAsesoriaDetalleActionForm.generarPDF.value="N";
		go();
	}
	
	if(document.cAsesoriaDetalleActionForm.generarPDFResolucion.value=="S"){
		document.cAsesoriaDetalleActionForm.generarPDFResolucion.value="N";
		goResolucion();
	}
}

function goResolucion() {
	var id = <bean:write name="cAsesoriaDetalleActionForm" property="id" />;
	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cAsesoriaResolucionPDFAction.do?id='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}

function go(){
	var id = <bean:write name="cAsesoriaDetalleActionForm" property="id" />;
	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cAsesoriaPDFAction.do?id='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}


</script>

<br>
<h1 align="center" class="titulo">Detalle de Asesoría</h1>

<html:form action="cAsesoriaDetalleAction.do" method="POST">
<html:hidden property="estado"/>

<html:hidden property="generarPDF"/>
<html:hidden property="generarPDFResolucion"/>

<html:hidden property="accion"/>
 <logic:equal value="D" property="estado" name="cAsesoriaDetalleActionForm">
     <h2 class="mensajeSuperior">Esta Asesoría se encuentra Deshabilitada.</h2>
  </logic:equal>

    <jsp:include page="/jsp/entidades/asesoria.jsp">
      <jsp:param name="pageName" value="asesoriaDetalle" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cAsesoriaDetalleActionForm"/>
 	  <jsp:param name="actionName" value="cAsesoriaDetalleAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
    

</html:form>
