<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
  
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>

<br>

<logic:equal value="N" property="estado" name="cContratanteActionForm">
  <h1 align="center" class="titulo">Deshabilitaci�n de Contratante</h1>
</logic:equal>
<logic:equal value="I" property="estado" name="cContratanteActionForm">
  <h1 align="center" class="titulo">Habilitaci�n de Contratante</h1>
</logic:equal>

<html:form action="cContratanteHabilitarAction.do" method="POST" enctype="multipart/form-data">

    <jsp:include page="/jsp/entidades/contratanteView.jsp">
      <jsp:param name="contratanteForm" value="cContratanteActionForm" />
      <jsp:param name="pageName" value="contratanteHabilitar" />
    </jsp:include>


</html:form>