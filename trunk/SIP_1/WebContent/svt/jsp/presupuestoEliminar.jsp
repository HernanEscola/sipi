<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/scriptaculous/jquery-1.7.2.min.js"></script>


<script>

</script>
<br>
<h1 align="center" class="titulo">
  Eliminación de Presupuesto
</h1>
<html:form action="cPresupuestoEliminarAction.do" method="POST">
  <html:hidden property="generarPDF"/>
  <html:hidden property="presupuestoId"/>
  <tr>
      <td align="center">
        <h2 class="mensajeSuperior">
          Está a punto de eliminar, presione 'Grabar' para confirmar
        </h2>
      </td>
    </tr>
  <jsp:include page="/jsp/entidades/presupuesto.jsp">
    <jsp:param name="tipoPantalla" value="view" />
    <jsp:param name="showBtnLimpiar" value="no" />
    <jsp:param name="isAlta" value="no" />
    <jsp:param name="displayLinks" value="no" />
    <jsp:param name="actionName" value="cPresupuestoEliminarAction" />
  </jsp:include>
</html:form>
