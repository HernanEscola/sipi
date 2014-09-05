<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
  
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>

<br>
    <capplication:isApplication application="SVT">
    <h1 align="center" class="titulo">Eliminar Contratante</h1>
    </capplication:isApplication>
    <capplication:isApplication application="SVTP,SIUVT">
		<h1 align="center" class="titulo">Eliminar Contacto</h1>    
    </capplication:isApplication>
    


<html:form action="cContratanteEliminarAction.do" method="POST" enctype="multipart/form-data">
  
    <jsp:include page="/jsp/entidades/contratanteView.jsp">
      <jsp:param name="contratanteForm" value="cContratanteActionForm" />
      <jsp:param name="pageName" value="contratanteCfm" />
    </jsp:include>

</html:form>
