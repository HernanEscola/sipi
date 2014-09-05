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
  Selección de Ofertas Tecnológicas
</h1>

<html:form action="cOfertaTecnologicaSeleccionarAction.do" method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="formulario" name="cOfertaTecnologicaSeleccionarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table align="center" width="100%" bgcolor="efefef">
              <tr>
                <td class="CformNombreGris" width="130" height="30">
                  Código:&nbsp;
                </td>
                <td>            
                  <html:text name="cOfertaTecnologicaSeleccionarActionForm" property="ofertaCodigo" onkeydown="setFoco()" />
                </td>
              </tr>
              <tr>
                <td class="CformNombreGris" width="130" height="30">
                  Título / Prestación:&nbsp;
                </td>
                <td>            
                  <html:text name="cOfertaTecnologicaSeleccionarActionForm" property="ofertaDescripcion" />
                </td>
              </tr>
              <tr>
                <td class="CformNombreGris" width="130" height="30">
                  Prestador / Titular:&nbsp;
                </td>
                <td>            
                  <html:text name="cOfertaTecnologicaSeleccionarActionForm" property="ofertaPrestador" />
                </td>
              </tr>
              <tr>
                <td colspan="10" height="30">
                  <div align="right">
                    <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" />
                    <capplication:isApplication application="SVT">
                      <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton" />
                    </capplication:isApplication>
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
                Ofertas Tecnológicas Asignadas
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cOfertaTecnologicaSeleccionarActionForm.asignados" requestURI="cOfertaTecnologicaSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper" style="width=100%;">
                  <display:column property="indiceNumero" title="#" headerClass="tableCellHeader" style="width: 10px;" />
                  <display:column property="codigo" title="Código" headerClass="tableCellHeader" style="width: 40px;" />
                  <display:column property="titulo" title="Título" headerClass="tableCellHeader" style="width: 150px;" maxLength="15" />
                  <display:column property="prestacion" title="Prestación" maxLength="10" headerClass="tableCellHeader" style="width: 100px;"/>
                  <display:column property="prestador" title="Prestador" maxLength="15" headerClass="tableCellHeader" style="width: 130px;" />
                  <display:column property="tipoEstado" title="Estado" maxLength="20" headerClass="tableCellHeader" style="width: 80px;" />
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
                Listado de Ofertas Tecnológicas:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cOfertaTecnologicaSeleccionarActionForm.noAsignados" requestURI="cOfertaTecnologicaSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper" style="width=100%;">
                  <display:column property="indiceNumero" title="#" headerClass="tableCellHeader" style="width: 10px;" />
                  <display:column property="codigo" title="Código" headerClass="tableCellHeader" style="width: 40px;" />
                  <display:column property="titulo" title="Título" headerClass="tableCellHeader" style="width: 150px;" maxLength="15" />
                  <display:column property="prestacion" title="Prestación" maxLength="10" headerClass="tableCellHeader" style="width: 100px;"/>
                  <display:column property="prestador" title="Prestador" maxLength="15" headerClass="tableCellHeader" style="width: 130px;" />
                  <display:column property="tipoEstado" title="Estado" maxLength="20" headerClass="tableCellHeader" style="width: 80px;" />
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
  </logic:equal>
</html:form>
