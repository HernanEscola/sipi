<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/scriptaculous/jquery-1.7.2.min.js"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script>

window.onload=function(){
	
				if(document.cPresupuestoActionForm.generarPDF.value=="S"){
					document.cPresupuestoActionForm.generarPDF.value="N";
					go();
				}
				if(document.cPresupuestoActionForm.generarPDF_OC.value=="S"){
					document.cPresupuestoActionForm.generarPDF_OC.value="N";
	
					go_OC();
				}

}

	function go(){
		var id = <bean:write name="cPresupuestoActionForm" property="presupuestoId" />;
		var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
		window.open('/'+urlAppName+'/cPresupuestoPDFAction.do?id='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
	}

	function go_OC(){
		var id = <bean:write name="cPresupuestoActionForm" property="presupuestoId" />;
		var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
		window.open('/'+urlAppName+'/cOrdenFacturacionPDFAction.do?id='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
	}




</script>
<br>
<h1 align="center" class="titulo">
  Detalle de Presupuesto
</h1>
<html:form action="cPresupuestoDetalleAction.do" method="POST">
	<html:hidden property="generarPDF"/>
	<html:hidden property="generarPDF_OC"/>
	<html:hidden property="presupuestoId"/>
	
	
	<logic:equal value="si" property="presupuestoVencido" name="cPresupuestoActionForm">
		<tr>
	      <td align="center">
	        <h2 class="mensajeSuperior">
	          La validez del presupuesto se ha vencido 
	        </h2>
	      </td>
	    </tr>
	</logic:equal>
	
	
  <jsp:include page="/jsp/entidades/presupuesto.jsp">
    <jsp:param name="tipoPantalla" value="view" />
    <jsp:param name="showBtnLimpiar" value="no" />
    <jsp:param name="isAlta" value="no" />
    <jsp:param name="displayLinks" value="si" />
    <jsp:param name="actionName" value="cPresupuestoDetalleAction" />    
  </jsp:include>
</html:form>
