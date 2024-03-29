<%@include file="layout/include.jsp"%>

<script>

function habilitarChkRecuperoCostos(){
  cboGrupoEgreso = document.getElementById('cboGrupoEgreso');
  if (cboGrupoEgreso.options[cboGrupoEgreso.selectedIndex].value == 2)
    document.getElementById('chkBoxRecuperoCostos').disabled = false;
  else
    document.getElementById('chkBoxRecuperoCostos').disabled = true;
}

window.onload=function(){
	habilitarChkRecuperoCostos();
}

</script>

<!--Se cambia el título de la Jsp por Tipo de Imputación-->
<br>
<h1 align=" center" class="titulo">Modificación de Tipo de Imputación</h1>
<html:form action="cTipoEgresoModificarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="modificar" name="cTipoEgresoModificarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#DDEEFF">
          <td><strong>Tipo de Imputación</strong></td>
        </tr>
      </table>

      <table width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td class="CformNombre" width="150">Descripción:<span class="dato_obligatorio">*</span></td>
          <td class="CformDato">
            <html:text property="descripcion" maxlength="80" size="50"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="150">Descripción Corta:<span class="dato_obligatorio">*</span></td>
          <td class="CformDato">
            <html:text property="descripcionCorta" maxlength="20" size="50"/>
          </td>
        </tr>
       <tr>
          <td class="CformNombre" width="150">Grupo de Imputación:<span class="dato_obligatorio">*</span></td>
          <td class="CformDato">
            <html:select styleId="cboGrupoEgreso" disabled="false" property="grupoEgreso" onchange="habilitarChkRecuperoCostos()">
              <html:options collection="comboGrupoEgreso" property="value"  labelProperty="label"/>
            </html:select>
          </td>
        </tr>
        </table>
        <table width="100%">
        
        <tr>
          <td class="CformNombre" width="360">No tener en cuenta este rubro para el Recupero de Costos:</td>
          <td class="CformDato">
            <html:checkbox styleId="chkBoxRecuperoCostos" disabled="true"  property="noCuentaParaRecuperoCostos" ></html:checkbox>
          </td>
        </tr>
       <tr><td height="10" colspan="10"></td></tr>

      <tr>
        <td class="CformAreaBotones" height="35">
          <span class="dato_obligatorio">* Datos obligatorios</span>
        </td>
        <td class="CformAreaBotones" height="35">
          <div align="right">
            <logic:equal property="modificable" value="1" name="cTipoEgresoModificarActionForm">
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
            </logic:equal>
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
          </div>
      </table>
    </td>
  </tr>
</table>
</logic:equal>

<logic:equal property="accion" value="confirmar" name="cTipoEgresoModificarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#DDEEFF">
          <td><strong>Tipo de Imputación</strong></td>
        </tr>
      </table>

      <table width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
           <td class="CformNombre" width="150">Descripción:</td>
           <td class="CformDato">
             <bean:write name="cTipoEgresoModificarActionForm" property="descripcion"/>
               <html:hidden property="descripcion"/>
           </td>
         </tr>
        <tr>
           <td class="CformNombre" width="150">Descripción Corta:</td>
           <td class="CformDato">
             <bean:write name="cTipoEgresoModificarActionForm" property="descripcionCorta"/>
               <html:hidden property="descripcionCorta"/>
             </td>
         </tr>
         <tr>
           <td class="CformNombre" width="150">Grupo de Imputación:</td>
           <td class="CformDato">
             <html:select disabled="true" property="grupoEgreso" >
               <html:options collection="comboGrupoEgreso" property="value"  labelProperty="label"/>
             </html:select>
          </td>
         </tr>
        </table>
        <table width="100%">
         
         <tr>
           <td class="CformNombre" width="360">No tener en cuenta este rubro para el Recupero de Costos:</td>
           <td class="CformDato">
            <html:checkbox disabled="true"  property="noCuentaParaRecuperoCostos" ></html:checkbox>
           </td>
         </tr>
        <tr><td height="10" colspan="10"></td></tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
       </div>
    </td>
  </tr>
</table>
</logic:equal>
</html:form>
