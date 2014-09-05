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
<h1 align=" center" class="titulo">Autorización de Administración de Prestadores</h1>

<html:form action="cAdministracionPrestadoresAutorizacionAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cAdministracionPrestadoresAutorizacionActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Autorizados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
        	      <display:table name="sessionScope.cAdministracionPrestadoresAutorizacionActionForm.autorizados" style="width: 100%"  requestURI="cAdministracionPrestadoresAutorizacionAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
	                <display:column property="descripcionAdministradorEntOrgAdm" title="Administrador" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
	                <display:column property="descripcionEntOrgAdm" title="Prestador" headerClass="tableCellHeader" style="width: 200px;"/>
        	        <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
	                <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
	                <display:column property="partidoEntOrgAdm" title="Partido" headerClass="tableCellHeader" style="width: 150px;"/>
	                <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
        	        <display:column property="optionsAutorizadoEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
	              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Deshacer Autorizar" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Rechazados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
        	      <display:table name="sessionScope.cAdministracionPrestadoresAutorizacionActionForm.rechazados" style="width: 100%"   requestURI="cAdministracionPrestadoresAutorizacionAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
	                <display:column property="descripcionAdministradorEntOrgAdm" title="Administrador" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
	                <display:column property="descripcionEntOrgAdm" title="Prestador" headerClass="tableCellHeader" style="width: 200px;"/>
        	        <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
	                <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
	                <display:column property="partidoEntOrgAdm" title="Partido" headerClass="tableCellHeader" style="width: 150px;"/>
	                <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
        	        <display:column property="optionsRechazadoEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
	              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Deshacer Rechazar" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="10" align="center" class="headTabla">Pendientes</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
	              <display:table name="sessionScope.cAdministracionPrestadoresAutorizacionActionForm.noAsignados" style="width: 100%" requestURI="cAdministracionPrestadoresAutorizacionAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
                    <display:column property="descripcionAdministradorEntOrgAdm" sortable="true" title="Administrador" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
                    <display:column property="descripcionEntOrgAdm" sortable="true" title="Prestador" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
                    <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
                    <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
                    <display:column property="partidoEntOrgAdm" title="Partido" headerClass="tableCellHeader" style="width: 150px;"/>
	                <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
                    <display:column property="optionsSinAsignarEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
	              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Autorizar" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Rechazar" styleClass="CformBoton"/>
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
            </div></td>

    </tr>



</table>
</logic:equal>

<!-- PANTALLA DE CONFIRMACION -->


<logic:equal property="accion" value="autorizacionCfm" name="cAdministracionPrestadoresAutorizacionActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Autorizados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
                <display:table name="sessionScope.cAdministracionPrestadoresAutorizacionActionForm.autorizados" style="width: 100%"   requestURI="cAdministracionPrestadoresAutorizacionAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
                  <display:column property="descripcionAdministradorEntOrgAdm" sortable="true" title="Administrador" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
                  <display:column property="descripcionEntOrgAdm" title="Prestador" headerClass="tableCellHeader" style="width: 200px;"/>
                  <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
                  <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="partidoEntOrgAdm" title="Partido" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="optionsAutorizadoEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
            </td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Rechazados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
                <display:table name="sessionScope.cAdministracionPrestadoresAutorizacionActionForm.rechazados" style="width: 100%"  requestURI="cAdministracionPrestadoresAutorizacionAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
                  <display:column property="descripcionAdministradorEntOrgAdm" sortable="true" title="Administrador" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
                  <display:column property="descripcionEntOrgAdm" title="Prestador" headerClass="tableCellHeader" style="width: 200px;"/>
                  <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
                  <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="partidoEntOrgAdm" title="Partido" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="optionsRechazadoEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
            </td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
    <tr>
            <td colspan="10" bgcolor="efefef" height="30">
            <div align="right">
              <html:submit property="btnSubmit" value="Grabar" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Modificar" styleClass="CformBoton"/>
            </div></td>

    </tr>



</table>
</logic:equal>


</html:form>