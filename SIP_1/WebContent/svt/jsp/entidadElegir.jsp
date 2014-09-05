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
<h1 align=" center" class="titulo">Elegir Entidad</h1>
<html:form action="cEntidadElegirAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="700">
    <tr><td>
	<table align="center" width="100%">
  		<thead>
	        <tr>
 	  		   <td  align="center" class="headTabla">Entidades Habilitadas</td>
	  		</tr>
	        <tr>
	            <td width="100%" align="center">
	                <display:table id="entidadBuscarTabla" sort="external" export="false" style="width:100%;" requestURI="cEntidadElegirAction.do" name="sessionScope.cEntidadElegirActionForm.resultados" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
						<display:column media="html" property="indiceByEntidadElegir" title="#" headerClass="tableCellHeader" style="width: 80" />
						<display:column media="html" sortName="srt_descripcion" property="descripcion" title=" Descripción" headerClass="tableCellHeader" sortable="true"  />
						<display:column media="html" sortName="srt_tipo" property="tipo" title="Tipo" headerClass="tableCellHeader" style="width:200;" sortable="true" />
						<display:column media="html" property="estado" title="Estado" headerClass="tableCellHeader" style="width:100"  />
					</display:table>
	    		</td>
	  		</tr>
       	</thead>
       </table>
    </td></tr>
</table>
</html:form>
