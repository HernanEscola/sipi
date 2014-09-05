<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script>


window.onload=function(){
	if(document.cMinutaDetalleActionForm.generarPDF.value=="S"){
		document.cMinutaDetalleActionForm.generarPDF.value="N";
		go();
	}
}

function go(){
var id = <bean:write name="cMinutaDetalleActionForm" property="id" />;
var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
window.open('/'+urlAppName+'/cMinutaPDFAction.do?id='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}

</script>

<br>
<h1 align="center" class="titulo">Detalle de Minuta</h1>

<html:form action="cMinutaDetalleAction.do" method="POST">
<html:hidden property="generarPDF"/>

<html:hidden property="accion"/>
    <jsp:include page="/jsp/entidades/minuta.jsp">
      <jsp:param name="pageName" value="minutaDetalle" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cMinutaDetalleActionForm"/>
 	  <jsp:param name="actionName" value="cMinutaDetalleAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
    

</html:form>
