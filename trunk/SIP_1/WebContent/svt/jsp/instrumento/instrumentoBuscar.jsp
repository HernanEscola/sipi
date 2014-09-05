<%@include file="/jsp/layout/include.jsp"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>



<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<!-- GUARDAR EL FORMULARIO Y LA ENTIDAD -->
<bean:define id="formulario" name="cInstrumentoBuscarActionForm" toScope="request"/>

<!--  CARGAR LOS PATHS DEL CRITERIO Y DISPLAY Y EL TITULO -->
<br>
<html:form action="cInstrumentoBuscarAction.do" method="POST">
	    <tiles:insert page="/jsp/layout/templateListado.jsp?entidad=instrumento">
		    <logic:equal value="seguimiento" property="tipoBusqueda" name="cInstrumentoBuscarActionForm" >
	    		<tiles:put name="tituloFormulario" value="Búsqueda de Convenios" type="string" ></tiles:put>
		    </logic:equal>
	    	<logic:notEqual value="seguimiento" property="tipoBusqueda" name="cInstrumentoBuscarActionForm" >
		    	<tiles:put name="tituloFormulario" value="Búsqueda de Convenios" type="string" ></tiles:put>
	    	</logic:notEqual>
			<tiles:put name="contenidoCriterioBusqueda" value="/jsp/instrumento/instrumentoCriterio.jsp" ></tiles:put>
			<tiles:put name="contenidoListado" value="/jsp/instrumento/instrumentoDisplay.jsp" ></tiles:put>
			
		</tiles:insert>
</html:form>
