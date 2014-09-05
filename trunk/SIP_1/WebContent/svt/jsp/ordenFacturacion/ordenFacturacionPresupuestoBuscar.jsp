<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="/jsp/layout/include.jsp"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>
<script>

$(document).ready(function() {
	
	  var opciones = {"desde":"id_fechaDesdeOCS","hasta":"id_fechaHastaOCS"};
	  var x = new CPeriodoPicker(opciones);
	 
	  
		$("#selectUvts").multiselect({
			   selectedText: "# de # UVTs seleccionadas",
			   noneSelectedText: "Seleccionar",
			   checkAllText: "Selecc. Todos",
			   uncheckAllText: "Deselecc. Todos",
			});
	  
});

function imprimirPDF(id){
	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cOrdenFacturacionPDFAction.do?idOrdenFacturacion='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}

</script> 
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>


<!-- GUARDAR EL FORMULARIO Y LA ENTIDAD -->
<bean:define id="formulario" name="cOFPresupuestoBuscarActionForm" toScope="request"/>

<!--  CARGAR LOS PATHS DEL CRITERIO Y DISPLAY Y EL TITULO -->
<br>
<html:form action="cOFPresupuestoBuscarAction.do" method="POST">
  	<logic:equal property="accion" value="formulario" name="cOFPresupuestoBuscarActionForm">
	    <tiles:insert page="/jsp/layout/templateListado.jsp?entidad=ordenFacturacion">
			<tiles:put name="tituloFormulario" value="Búsqueda de Orden de Facturación" type="string" ></tiles:put>
			<tiles:put name="contenidoCriterioBusqueda" value="/jsp/ordenFacturacion/ordenFacturacionPresupuestoCriterio.jsp" ></tiles:put>
			<tiles:put name="contenidoListado" value="/jsp/ordenFacturacion/ordenFacturacionPresupuestoDisplay.jsp" ></tiles:put>
		</tiles:insert>
	</logic:equal>	
</html:form>
