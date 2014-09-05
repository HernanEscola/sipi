<%@include file="layout/include.jsp"%>
<%@ page import= "conicet.framework.util.*
		, java.util.*
		, java.sql.*
    , java.math.*
		, conicet.objetos.*
		, conicet.framework.web.*"
%>


<jsp:include page="/jsp/layout/timer.jsp" />

	<%
	
	//Obtiene la fecha actual del servidor
	 GregorianCalendar calen =  new GregorianCalendar();
  String hoy= String.valueOf(calen.get(Calendar.DATE)) + "/" +
               String.valueOf(calen.get(Calendar.MONTH)+1) + "/" +
               String.valueOf(calen.get(Calendar.YEAR)) + " " +
               String.valueOf(calen.get(Calendar.HOUR_OF_DAY)) + ":" +
		    String.valueOf(calen.get(Calendar.MINUTE)+100).substring(1);
 //Busca la entidad relacionada con el usuarioSvt
	
	
	%>
	



<script>

$("#contenido").ready(function() {
	   setTimeout('doRewrite()', 1000);
	   resetTimeOut();
});
</script>


<br>
<h1 align=" center" class="titulo">Elegir Gestor</h1>
<html:form action="cGestorElegirAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
    <tr><td>
	<table align="center" width="100%">
  		<thead>
        <tr>
  		  <td  align="center" class="headTabla">Gestores Habilitados</td>
  		</tr>
        <tr>
            <td  width="100%" align="center">
                <display:table  id="gestorBuscarTabla" style="width: 100%" sort="external" export="false" requestURI="cGestorElegirAction.do" name="sessionScope.cGestorElegirActionForm.resultados" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
				<display:column media="html" sortName="srt_indice" property="indice" title="#" headerClass="tableCellHeader" style="width:50;" />
				<display:column media="html" sortName="srt_tipoGestorBusqueda" property="tipoGestorBusqueda" title="Tipo" headerClass="tableCellHeader" style="width:100;" sortable="true" />
				<display:column media="html" sortName="srt_descripcionBusqueda" property="descripcionBusqueda" title=" Descripción" headerClass="tableCellHeader" style="width:250;" sortable="true"  />
				<display:column media="html" sortName="srt_siglaBusqueda" property="siglaBusqueda" title="Sigla" headerClass="tableCellHeader" style="width: 100;" sortable="true" />
				<display:column media="html" property="habilitado" title="Estado" headerClass="tableCellHeader" style="width: 100;"  />
			</display:table>
    		</td>
  		</tr>
               	</thead>
       </table>
    </td></tr>
    
</table>
</html:form>
