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
<h1 align="center" class="titulo">
  Selección de Entidad
</h1>

<html:form action="cEntidadSeleccionarAction.do" method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="formulario" name="cEntidadSeleccionarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <table align="center" width="100%">
            <thead>
              <tr>
                <td colspan="10" bgcolor="efefef" height="30">
                  <div align="center">
                    Entidad:&nbsp;
                    <html:text name="cEntidadSeleccionarActionForm" property="entidadDescripcionS" onkeydown="setFoco()" />
                    &nbsp;
                    <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" />
                    
                    <capplication:isNotApplication application="SVTP">
                    	<html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton" />
                    </capplication:isNotApplication>
                  </div>
                </td>
              </tr>
            </thead>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Entidades Asignadas
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cEntidadSeleccionarActionForm.asignados" style="width: 100%" requestURI="cEntidadSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 300px;" />
                  <display:column property="tipo" title="Tipo" maxLength="16" headerClass="tableCellHeader" />
                  <display:column property="provincia" title="Provincia" maxLength="20" headerClass="tableCellHeader" style="width: 180px;" />
                  <display:column property="localidad" title="Localidad" maxLength="20" headerClass="tableCellHeader" style="width: 180px;" />
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
                Listado de entidades:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cEntidadSeleccionarActionForm.noAsignados" style="width: 100%" requestURI="cEntidadSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                  <display:column property="descripcion" sortable="true" title="Descripción" headerClass="tableCellHeader" maxLength="150" style="width: 300px;" />
                  <display:column property="tipo" title="Tipo" maxLength="16" headerClass="tableCellHeader" />
                  <display:column property="provincia" title="Provincia" maxLength="20" headerClass="tableCellHeader" style="width: 180px;" />
                  <display:column property="localidad" title="Localidad" maxLength="20" headerClass="tableCellHeader" style="width: 180px;" />
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
        <logic:notEmpty property="tipoEntidadSeleccionable" name="cEntidadSeleccionarActionForm">
          <td class="CformDato">
            <bean:write name="cEntidadSeleccionarActionForm" property="tipoEntidadSeleccionable" />
          </td>
        </logic:notEmpty>
      </tr>
    </table>
  </logic:equal>
</html:form>
