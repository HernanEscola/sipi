<%@include file="layout/include.jsp"%>
<bean:define id="actionPage" name="cUsuarioIntranetSeleccionarActionForm" property="actionName" />

<script>
function setFoco(){
x=event.keyCode
  if((x==13)){ // enter
    window.event.returnValue = false
  }
}
</script>

<br>
<h1 align="center" class="titulo">
  Selección de Usuarios
</h1>

<html:form action='<%=actionPage + ".do"%>' method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="formulario" name="cUsuarioIntranetSeleccionarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <table align="center" width="100%">
            <thead>
              <tr>
                <td colspan="10" bgcolor="efefef" height="30">
                  <div align="center">
                    Apellido:&nbsp;
                    <html:text name="cUsuarioIntranetSeleccionarActionForm" property="usuarioDescripcionS" onkeydown="setFoco()" />
                    &nbsp;
                    <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" />
                  </div>
                </td>
              </tr>
            </thead>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Usuarios Asignados:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cUsuarioIntranetSeleccionarActionForm.asignados"  style="width: 100%"  requestURI='<%=actionPage + ".do"%>' defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.usuario.decorator.CUsuarioIntranetSeleccionarDisplayWrapper">
                  <display:column property="descripcion" title="Apellido, Nombre" headerClass="tableCellHeader" style="width: 300px;" />
                  <display:column property="cuit" title="Cuit/Cuil" headerClass="tableCellHeader" />
                  <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Listado de Usuarios:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cUsuarioIntranetSeleccionarActionForm.noAsignados"  style="width: 100%"  requestURI='<%=actionPage + ".do"%>' defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.usuario.decorator.CUsuarioIntranetSeleccionarDisplayWrapper">
                  <display:column property="descripcion" sortable="true" title="Apellido, Nombre" headerClass="tableCellHeader" maxLength="150" style="width: 300px;" />
                  <display:column property="cuit" title="Cuit/Cuil" headerClass="tableCellHeader" />
                  <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="10" bgcolor="efefef" height="30">
          <div align="right">
            <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton" />
            <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
          </div>
        </td>
      </tr>
    </table>
    <table align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <logic:notEmpty property="tipoEntidadSeleccionable" name="cUsuarioIntranetSeleccionarActionForm">
          <td class="CformDato">
            <bean:write name="cUsuarioIntranetSeleccionarActionForm" property="tipoEntidadSeleccionable" />
          </td>
        </logic:notEmpty>
      </tr>
    </table>
  </logic:equal>
</html:form>
