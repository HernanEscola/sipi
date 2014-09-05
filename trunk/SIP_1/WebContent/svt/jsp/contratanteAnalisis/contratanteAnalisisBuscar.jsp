<%@include file="/jsp/layout/include.jsp"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>



<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<!-- GUARDAR EL FORMULARIO Y LA ENTIDAD -->
<bean:define id="formulario" name="cContratanteAnalisisBuscarActionForm" toScope="request"/>

<!--  CARGAR LOS PATHS DEL CRITERIO Y DISPLAY Y EL TITULO -->
<br>
<html:form action="cContratanteAnalisisBuscarAction.do" method="POST">
	    <tiles:insert page="/jsp/layout/templateListado.jsp?entidad=contratanteAnalisis">
			<tiles:put name="tituloFormulario" value="Búsqueda Avanzada de Contratantes" type="string" ></tiles:put>
			<tiles:put name="contenidoCriterioBusqueda" value="/jsp/contratanteAnalisis/contratanteAnalisisCriterio.jsp" ></tiles:put>
			<tiles:put name="contenidoListado" value="/jsp/contratanteAnalisis/contratanteAnalisisDisplay.jsp" ></tiles:put>
			
		</tiles:insert>
</html:form>
