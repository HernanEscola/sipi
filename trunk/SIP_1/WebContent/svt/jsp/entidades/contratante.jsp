<%@include file="/jsp/layout/include.jsp"%>

<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="showBtnLimpiar" value='<%= request.getParameter("showBtnLimpiar") %>' />
<bean:define id="showBtnVolver" value='<%= request.getParameter("showBtnVolver") %>' />
<bean:define id="isAlta" value='<%= request.getParameter("isAlta") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<bean:define id="contratanteForm" name='<%= request.getParameter("contratanteForm") %>' />
<bean:define id="loteDocumentos" name="contratanteForm" property="documentos(ContratanteDoc)" />




<logic:equal value="input" name="tipoPantalla">

	<jsp:include page="/jsp/entidades/contratanteInput.jsp">
		<jsp:param name="contratanteForm" value='<%= request.getParameter("contratanteForm") %>' />
		<jsp:param name="showBtnLimpiar" value='<%= request.getParameter("showBtnLimpiar") %>' />
		<jsp:param name="showBtnVolver" value='<%= request.getParameter("showBtnVolver") %>' />
		<jsp:param name="isAlta" value='<%= request.getParameter("isAlta") %>' />
	</jsp:include>

</logic:equal>


<logic:equal value="view" name="tipoPantalla">

	<jsp:include page="/jsp/entidades/contratanteView.jsp">
		<jsp:param name="contratanteForm" value='<%= request.getParameter("contratanteForm") %>' />
		<jsp:param name="pageName" value="contratante" />

	</jsp:include>

</logic:equal>

<span></span>

