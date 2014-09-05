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
<h1 align=" center" class="titulo">Selección de Organismo de Registro </h1>

<html:form action="cOrganismoRegistroSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cOrganismoRegistroSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
				 País:&nbsp;
                 <html:select disabled="false" property="pais">
                     <html:options collection="comboPais" property="value" labelProperty="label" />
                </html:select>
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Organismos de Registro Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table name="sessionScope.cOrganismoRegistroSeleccionarActionForm.asignados" requestURI="cOrganismoRegistroSeleccionarAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
                <display:column property="sigla" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 100px;"/>
                <display:column property="pais" title="País" maxLength="30" headerClass="tableCellHeader" style="width: 100px;"/>
                <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
    <td>
      <table align="center" width="100%">
        <tr>
          <td colspan="10" align="center" class="headTabla">Listado de organismos de Registro:</td>
        </tr>
        <tr>
          <td colspan="10" width="100%">
            <display:table name="sessionScope.cOrganismoRegistroSeleccionarActionForm.noAsignados" requestURI="cOrganismoRegistroSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
              <display:column property="descripcion" sortable="true" title="Descripción" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
              <display:column property="sigla" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 100px;"/>
              <display:column property="pais" title="País" maxLength="30" headerClass="tableCellHeader" style="width: 100px;"/>
              <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
            </display:table>
          </td>
        </tr>
        <tr>
          <td colspan="10" bgcolor="efefef" height="30"><div align="right">
            <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton"/>
          </div></td>
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
