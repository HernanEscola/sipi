<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Selecci&oacute;n de  Contratantes</h1>

<html:form action="cContratanteSeleccionAction.do" method="POST">
<html:hidden property="accion"/>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="800" >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
                Contratante:&nbsp;<html:text name="cContratanteSeleccionActionForm" property="contratanteDesc" />&nbsp;
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Contratantes Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table name="sessionScope.cContratanteSeleccionActionForm.asignados" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteSeleccionarDisplayWrapper" style="width: 100%">
                <display:column property="nombreRazon" title="Nombre / Razón Social"  headerClass="tableCellHeader" style="width: 200px"/>
                <display:column property="cuit" title="CUIT / DNI" headerClass="tableCellHeader" style="width: 100px"/>
                <display:column property="pais" title="País"  style="width: 200px" headerClass="tableCellHeader"/>
                <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" style="width: 25px"/>
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
            <td colspan="10" align="center" class="headTabla">Contratantes No Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table name="sessionScope.cContratanteSeleccionActionForm.noAsignados" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteSeleccionarDisplayWrapper" style="width: 100%">
                <display:column property="nombreRazon" title="Nombre / Razón Social"  headerClass="tableCellHeader" style="width: 200px"/>
                <display:column property="cuit" title="CUIT / DNI" headerClass="tableCellHeader" style="width: 100px"/>
                <display:column property="pais" title="País" style="width: 200px" headerClass="tableCellHeader"/>
                <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" style="width: 25px"/>
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
            <td colspan="10" class="CformAreaBotones" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
            </div></td>
          </tr>
</table>

</html:form>
