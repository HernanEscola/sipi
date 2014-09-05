<%@include file="layout/include.jsp"%>
<%@ page
	import="conicet.framework.util.*
    , java.util.*
    , java.sql.*
    , java.math.*
    , conicet.objetos.*
    , conicet.framework.web.*"%>


<jsp:include page="/jsp/layout/timer.jsp" />

<%
	//Obtiene la fecha actual del servidor
	GregorianCalendar calen = new GregorianCalendar();
	String hoy = String.valueOf(calen.get(Calendar.DATE))
			+ "/"
			+ String.valueOf(calen.get(Calendar.MONTH) + 1)
			+ "/"
			+ String.valueOf(calen.get(Calendar.YEAR))
			+ " "
			+ String.valueOf(calen.get(Calendar.HOUR_OF_DAY))
			+ ":"
			+ String.valueOf(calen.get(Calendar.MINUTE) + 100)
					.substring(1);
	//Busca la entidad relacionada con el usuarioSvt
%>




<script>
	$("#contenido").ready(function() {
		setTimeout('doRewrite()', 1000);
		resetTimeOut();
	});
</script>

<br>
<h1 align=" center" class="titulo">Elegir Usuario</h1>
<html:form action="cUsuarioElegirAction.do" method="POST">
	<html:hidden property="accion" />
	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0" width="100%">
		<tr>
			<td>
				<table align="center" width="100%">
					<thead>
						<tr>
							<td align="center" class="headTabla" width="100%">Usuarios Habilitados</td>
						</tr>
					</thead>
					<tr>
						<td width="100%" align="center"><display:table style="width:100%;"
								id="usuarioBuscarTabla" sort="external" export="false"
								requestURI="cUsuarioElegirAction.do?accion=ordenarListado"
								excludedParams="*" 
								name="sessionScope.cUsuarioElegirActionForm.resultados"
								decorator="conicet.apps.svt.web.usuario.decorator.CUsuarioDisplayWrapper">
								<display:column media="html" sortName="srt_usr_indice" property="usrIndice" title="#" headerClass="tableCellHeader"
									style="width:10%;" />
								<display:column media="html" sortName="srt_usr_svt_descripcion" property="usrDescripcion" title=" Descripción" headerClass="tableCellHeader" 
									style="width:60%;" sortable="true" />
								<display:column media="html" sortName="srt_usr_svt_rol" property="usrRol" title="Rol" headerClass="tableCellHeader"
									style="width: 30%;" sortable="true" />
							</display:table></td>
					</tr>
				</table>
			</td>
		</tr>

	</table>
</html:form>