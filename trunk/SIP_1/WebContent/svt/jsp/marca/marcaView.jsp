<bean:define id="equipoForm" name='<%= request.getParameter("equipoForm") %>' />
<bean:define id="accion" value='<%= request.getParameter("accion") %>' />

<script type="text/javascript">

$(document).ready(function() {
	$("#nombre").attr('disabled', true);
});

</script>

<jsp:include page="/jsp/marca/marcaInput.jsp">
	<jsp:param name="marcaForm" value='<%= request.getParameter("marcaForm") %>' />
	<jsp:param name="currentActionName" value='<%= request.getParameter("currentActionName") %>' />
	<jsp:param name="accion" value='<%= request.getParameter("accion") %>' />
</jsp:include>