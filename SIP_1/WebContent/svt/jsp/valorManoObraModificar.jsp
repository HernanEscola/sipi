<%@include file="layout/include.jsp"%>

<script>
//Funciones de la Seccion de Costos Adicionales

function formatActualizacion(obj) {

	validarImporteConDecimales(event, obj);
  
}
</script>

<br>

<html:form action="cValorManoObraModificarAction.do" method="POST">
<html:hidden property="accion"/>
    <h1 align="center" class="titulo">
      Modificación de Mano de Obra
    </h1>
    
    <logic:equal property="accion" value="modificar" name="cValorManoObraModificarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table width="100%" align="center" >
            <tr bgcolor="#DDEEFF">
              <td>
                Investigadores
              </td>
            </tr>
            <tr>            
              <display:table sort="external" export="false" requestURI="cValorManoObraModificarAction.do" name="sessionScope.cValorManoObraModificarActionForm.valoresInvestigadores" style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
                <display:column property="categoria" title="Categoría" headerClass="sortable" sortable="true" style="width: 300px;" />
                <display:column property="modificacionInvestigador" title="Valor Hora ($) *"  headerClass="sortable" sortable="true" style="width: 400px;" />
                <display:column property="actualizacion" title="Actualizado el:"  headerClass="sortable" sortable="true" style="width: 400px;" />
              </display:table>
            </tr>
          </table>
        </td>
     </tr>
   </table>
   <table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
      <tr>
        <td>
          <table width="100%" align="center">
            <tr bgcolor="#DDEEFF">
              <td>
                Técnicos
              </td>
            </tr>
            <tr>            
             <display:table sort="external" export="false" requestURI="cValorManoObraModificarAction.do" name="sessionScope.cValorManoObraModificarActionForm.valoresTecnicos" style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
                <display:column property="categoria" title="Categoría" headerClass="sortable" sortable="true" style="width: 300px;" />
                <display:column property="modificacionTecnico" title="Valor Hora ($) *" headerClass="sortable" sortable="true" style="width: 400px;" />
                <display:column property="actualizacion" title="Actualizado el:"  headerClass="sortable" sortable="true" style="width: 400px;" />
              </display:table>
            </tr>          
            <tr bgcolor="#DDEEFF">
              <td>
                * Valor Hora: Hora hombre promedio por categoría.
              </td>
            </tr>
            <tr>
              <td colspan="10" class="headTabla" height="30">
                <div align="right">
                 <capplication:isApplication application="SVT">
                  <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton" />
                  </capplication:isApplication>
                  <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
     </tr>
   </table>
   </logic:equal>
   
   <logic:equal property="accion" value="modificarCfm" name="cValorManoObraModificarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table width="100%" align="center" >
            <tr bgcolor="#DDEEFF">
              <td>
                Investigadores
              </td>
            </tr>
            <tr>            
              <display:table sort="external" export="false" requestURI="cValorManoObraModificarAction.do" name="sessionScope.cValorManoObraModificarActionForm.valoresInvestigadores" style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
                <display:column property="categoria" title="Categoría" headerClass="sortable" sortable="true" style="width: 300px;" />
                <display:column property="modificacionInvestigadorCfm" title="Valor Hora ($) *"  headerClass="sortable" sortable="true" style="width: 400px;" />
                <display:column property="actualizacion" title="Actualizado el:"  headerClass="sortable" sortable="true" style="width: 400px;" />
              </display:table>
            </tr>
          </table>
        </td>
     </tr>
   </table>
   <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table width="100%" align="center">
            <tr bgcolor="#DDEEFF">
              <td>
                Técnicos
              </td>
            </tr>
            <tr>            
             <display:table sort="external" export="false" requestURI="cValorManoObraModificarAction.do" name="sessionScope.cValorManoObraModificarActionForm.valoresTecnicos" style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
                <display:column property="categoria" title="Categoría" headerClass="sortable" sortable="true" style="width: 300px;" />
                <display:column property="modificacionTecnicoCfm" title="Valor Hora ($) *" headerClass="sortable" sortable="true" style="width: 400px;" />
                <display:column property="actualizacion" title="Actualizado el:"  headerClass="sortable" sortable="true" style="width: 400px;" />
              </display:table>
            </tr>          
            <tr bgcolor="#DDEEFF">
              <td>
                * Valor Hora: Hora hombre promedio por categoría.
              </td>
            </tr>
            <tr>
              <td colspan="10" class="headTabla" height="30">
                <div align="right">
                 <capplication:isApplication application="SVT">
                  <html:submit property="btnSubmit" value="Grabar" styleClass="CformBoton" />
                  </capplication:isApplication>
                  <html:submit property="btnSubmit" value="Modificar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
     </tr>
   </table>
    
  </logic:equal>
   
   
</html:form>
  