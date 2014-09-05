<%@include file="/jsp/layout/include.jsp"%>

<script>
function setFoco(){
x=event.keyCode
//alert(x)
if((x==13)){ // enter
window.event.returnValue = false
}

}
</script>


<br>
<h1 align=" center" class="titulo">Selección de Equipamientos</h1>

<html:form action="cEquipoSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cEquipoSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
                Descripción/Marca:&nbsp;<html:text name="cEquipoSeleccionarActionForm" property="equipoDescripcion" onkeydown="setFoco()"/>&nbsp;
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Equipamientos Asignados</td>
          </tr>
          <tr>
            <td colspan="10" >
                <display:table name="sessionScope.cEquipoSeleccionarActionForm.asignados" style="width:100%" requestURI="cEquipoSeleccionarAction.do" sort="list" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                <display:column property="indiceAsignados" sortName="srt_indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
                <display:column property="anio" title="Año" headerClass="tableCellHeader"  maxLength="50" style="width: 50px;" />
                <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
                <display:column property="modelo" title="Modelo" headerClass="tableCellHeader"  maxLength="6" style="width: 80px;" />
                 <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                
                <display:column property="optionsAsignado" title="Selec" headerClass="tableCellHeader" maxLength="40" style="width: 40px" />
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
            <td colspan="10" align="center" class="headTabla">Listado de Equipamientos:</td>

          </tr>
          <tr>
            <td colspan="10">
                <display:table excludedParams="*" name="sessionScope.cEquipoSeleccionarActionForm.noAsignados" style="width:100%" requestURI="cEquipoSeleccionarAction.do?accion=repag" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                <display:column property="indiceNoAsignados" sortName="srt_indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" sortable="true"/>
                <display:column property="anio" title="Año" headerClass="tableCellHeader"  maxLength="50" style="width: 50px;" />
                <display:column property="marca" title="Marca" headerClass="tableCellHeader"  maxLength="15" style="width: 350px;" />
                <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />

                <display:column property="optionsSinAsignar" title="Selec" headerClass="tableCellHeader"  maxLength="40" style="width: 40px" />
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
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
             <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
            </div></td>

    </tr>
</table>
</logic:equal>
</html:form>

