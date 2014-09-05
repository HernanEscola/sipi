<%@include file="layout/include.jsp"%>
<script>
function setFoco(){
  x=event.keyCode
  if((x==13)){ // enter
    window.event.returnValue = false
  }

}
</script>
<br>
<h1 align=" center" class="titulo">
  Selecci&oacute;n de Integrantes
</h1>

<html:form action="cPersonaSeleccionarAction.do" method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="seleccionar" name="cPersonaSeleccionarActionForm">

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table width="100%">
            <thead>
              <tr>
                <td colspan="10" bgcolor="efefef" height="30">
                  <div align="center">
                    Apellido:&nbsp;
                    <html:text name="cPersonaSeleccionarActionForm" property="apellido" onkeydown="setFoco()" />
                    &nbsp;
                    <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" />
                    <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton" />
                  </div>
                </td>
              </tr>
            </thead>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Personas Asignadas:
              </td>
            </tr>
            <tr>
              <td colspan="10" >
                <display:table name="sessionScope.cPersonaSeleccionarActionForm.asignados" style="width: 100%" decorator="conicet.apps.svt.web.entidad.decorator.CPersonaSeleccionarDisplayWrapper">
                  <display:column property="indiceAsignados" title="#" headerClass="tableCellHeader" />
                  <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="120" style="width: 300px;" />
                  <display:column property="documento" title="Documento" headerClass="tableCellHeader" style="width: 200px;" />
                  <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 220px;" />
                  <display:column property="escalafon" title="Escalafón" maxLength="15" headerClass="tableCellHeader" style="width: 200px;" />
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
          <table width="100%">
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Listado de Personas:
              </td>
            </tr>
            <tr>
              <td colspan="10" >
                <display:table name="sessionScope.cPersonaSeleccionarActionForm.noAsignados" style="width: 100%" decorator="conicet.apps.svt.web.entidad.decorator.CPersonaSeleccionarDisplayWrapper">
                  <display:column property="indiceNoAsignados" title="#" headerClass="tableCellHeader" />
                  <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="120" style="width: 300px;" />
                  <display:column property="documento" title="Documento" headerClass="tableCellHeader" style="width: 200px;" />
                  <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 200px;" />
                  <display:column property="escalafon" title="Escalafón" maxLength="15" headerClass="tableCellHeader" style="width: 200px;" />
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
      <tr>
    </table>
  </logic:equal>
</html:form>
