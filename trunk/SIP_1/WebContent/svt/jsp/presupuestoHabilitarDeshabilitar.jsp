<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/scriptaculous/jquery-1.7.2.min.js"></script>

<br>
<html:form action="cPresupuestoHabilitarDeshabilitarAction.do" method="POST">
  <h1 align="center" class="titulo">
    <logic:equal value="5" property="tipoEstadoPresupuesto" name="cPresupuestoActionForm">
      Deshabilitación de Presupuesto
    </logic:equal>
    <logic:equal value="6" property="tipoEstadoPresupuesto" name="cPresupuestoActionForm">
      Habilitación de Presupuesto
    </logic:equal>
  </h1>
  <jsp:include page="/jsp/entidades/presupuesto.jsp">
    <jsp:param name="tipoPantalla" value="view" />
    <jsp:param name="showBtnLimpiar" value="no" />
    <jsp:param name="isAlta" value="no" />
    <jsp:param name="displayLinks" value="no" />
    <jsp:param name="actionName" value="cPresupuestoHabilitarDeshabilitarAction" />
  </jsp:include>
</html:form>
