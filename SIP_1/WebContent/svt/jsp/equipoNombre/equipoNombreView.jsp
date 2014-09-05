<bean:define id="equipoNombreForm" name='<%= request.getParameter("equipoNombreForm") %>' />
<bean:define id="accion" value='<%= request.getParameter("accion") %>' />

<script type="text/javascript">

$(document).ready(function() {
	$("#nombre").attr('disabled', true);
});

</script>

<jsp:include page="/jsp/equipoNombre/equipoNombreInput.jsp">
	<jsp:param name="equipoNombreForm" value='<%= request.getParameter("equipoNombreForm") %>' />
	<jsp:param name="currentActionName" value='<%= request.getParameter("currentActionName") %>' />
	<jsp:param name="accion" value='<%= request.getParameter("accion") %>' />
</jsp:include>