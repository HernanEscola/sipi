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
<h1 align=" center" class="titulo">Selección de UVT </h1>

<html:form action="cGestorSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cGestorSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
                UVT:&nbsp;<html:text name="cGestorSeleccionarActionForm" property="descripcionBusqueda" onkeydown="setFoco()"/>&nbsp;
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table style="width:100%"  name="sessionScope.cGestorSeleccionarActionForm.asignados" requestURI="cGestorSeleccionarAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
                <display:column property="siglaSeleccion" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 100px;"/>
                <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 100px"/>
                <display:column property="habilitado" title="Habilitación" headerClass="tableCellHeader" style="width: 200px;"/>
                <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="right">
                <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton"/>
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
          <td colspan="10" align="center" class="headTabla">Listado de UVTs:</td>
        </tr>
        <tr>
          <td colspan="10" width="100%">
            <display:table style="width:100%"  name="sessionScope.cGestorSeleccionarActionForm.noAsignados" requestURI="cGestorSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
              <display:column property="descripcionSeleccion" sortable="true" title="Descripción" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
              <display:column property="siglaSeleccion" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 100px;"/>
              <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 100px;"/>
              <display:column property="habilitado" title="Habilitación" headerClass="tableCellHeader" style="width: 200px;"/>
              <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
            </display:table>
          </td>
        </tr>
        <tr>
          <td colspan="10" bgcolor="efefef" height="30">
            <div align="right">
              <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton"/>
            </div>
          </td>
        </tr>
       </table>
      </td>
    </tr>
    <tr>
      <td colspan="10" bgcolor="efefef" height="30">
        <div align="right">
          <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
          <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
        </div>
     </td>
   </tr>
</table>

</logic:equal>
</html:form>
