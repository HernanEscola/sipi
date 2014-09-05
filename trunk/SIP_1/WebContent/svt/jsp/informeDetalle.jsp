<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<h1 align=" center" class="titulo">Detalle  de  Informe</h1>

  

<script>
	window.onload=function(){
				if(document.cInformeDetalleActionForm.generarPDF.value=="S"){
					document.cInformeDetalleActionForm.generarPDF.value="N";
					go();
				}
	}
	
	function go(){
		var id = <bean:write name="cInformeDetalleActionForm" property="id" />;
		var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
		window.open('/'+urlAppName+'/cInformePDFAction.do?id='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
	}
	 
</script>  

<html:form action="cInformeDetalleAction.do" method="POST">
	<html:hidden property="generarPDF" />  
	<html:hidden property="accion"/>
	<html:hidden property="fechaPresentacion"/>
	<html:hidden property="fechaRecepcion"/>
    <jsp:include page="/jsp/entidades/informe.jsp">
      <jsp:param name="formulario" value="cInformeDetalleActionForm"/>
      <jsp:param name="pageName" value="informeDetalle" />
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="actionName" value="cInformeDetalleAction.do"/>
      <jsp:param name="displayLinks" value="si" />
    </jsp:include>
</html:form>




