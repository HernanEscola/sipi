<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<br>
<h1 align="center" class="titulo">Modificar Informe</h1>

<html:form action="cInformeModificarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="generarPDF" />  
<html:hidden property="fechaPresentacion"/>
<logic:equal property="accion" value="modificar" name="cInformeModificarActionForm">
 <script>
	window.onload=function(){
		
		if(document.cInformeModificarActionForm.generarPDF.value=="S"){
					document.cInformeModificarActionForm.generarPDF.value="N";
					go();
		}
	}

	function go(){
		var id = <bean:write name="cInformeModificarActionForm" property="informe" />;
		var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
		window.open('/'+urlAppName+'/cInformePDFAction.do?id='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
	}


</script>


 
   <div class="tab-container" id="container">
   
      <div>
        <jsp:include page="/jsp/entidades/informe.jsp">
         <jsp:param name="pageName" value="informeModificar" />
          <jsp:param name="tipoPantalla" value="input" />
          <jsp:param name="formulario" value="cInformeModificarActionForm" />
          <jsp:param name="actionName" value="cInformeModificarAction.do"/>
          <jsp:param name="displayLinks" value="si" />
        </jsp:include>
      </div>

    </div>
</logic:equal> 

  <logic:equal property="accion" value="confirmar" name="cInformeModificarActionForm">
    <jsp:include page="/jsp/entidades/informe.jsp">
      <jsp:param name="pageName" value="informeModificar" />
      <jsp:param name="tipoPantalla" value="view" />
 	  <jsp:param name="formulario" value="cInformeModificarActionForm"/>
 	  <jsp:param name="actionName" value="cInformeModificarAction.do"/>
      <jsp:param name="displayLinks" value="no" />
    </jsp:include>
  </logic:equal>
</html:form>

