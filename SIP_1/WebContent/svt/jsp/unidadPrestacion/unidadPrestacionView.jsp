
<script type="text/javascript">


$(document).ready(function() {
	$("#descripcion").attr('disabled', true);
});

</script>
<jsp:include page="/jsp/unidadPrestacion/unidadPrestacionInput.jsp">
	<jsp:param name="unidadPrestacionForm" value='<%= request.getParameter("unidadPrestacionForm") %>' />
	<jsp:param name="currentActionName" value='<%= request.getParameter("currentActionName") %>' />
	<jsp:param name="accion" value='<%= request.getParameter("accion") %>' />
</jsp:include>