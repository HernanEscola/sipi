<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
  
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>

<br>

<logic:equal value="S" property="habilitado" name="cSectorForm">
  <h1 align="center" class="titulo">Deshabilitación del Sector</h1>
</logic:equal>
<logic:equal value="N" property="habilitado" name="cSectorForm">
  <h1 align="center" class="titulo">Habilitación del Sector</h1>
</logic:equal>

<html:form action="cSectorHabilitarAction.do" method="POST" enctype="multipart/form-data">

    <jsp:include page="/jsp/sector/sectorView.jsp">
      <jsp:param name="sectorForm" value="cSectorForm" />
      <jsp:param name="pageName" value="sectorHabilitar" />
    </jsp:include>


</html:form>