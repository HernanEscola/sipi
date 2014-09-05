<%@include file="layout/include.jsp"%>

<br>
<logic:equal property="estado" value="Habilitado" name="cTipoEgresoHabilitarActionForm">
<h1 align=" center" class="titulo">Deshabilitaci�n de Tipo de Imputaci�n</h1>
</logic:equal>

<logic:equal property="estado" value="Deshabilitado" name="cTipoEgresoHabilitarActionForm">
<h1 align=" center" class="titulo">Habilitaci�n de Tipo de Imputaci�n</h1>
</logic:equal>

<html:form action="cTipoEgresoHabilitarAction.do" method="POST">
<html:hidden property="estado"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr>
    <td>

      <table width="100%">
        <tr bgcolor="#DDEEFF">
          <td><strong>Tipo de Imputaci�n</strong></td>
        </tr>
      </table>

      <table width="100%">
        <tr><td height="10" colspan="0"></td></tr>
        <tr>
          <td class="CformNombre" width="150">Descripci�n:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoHabilitarActionForm" property="descripcion"/>
            <html:hidden property="descripcion"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="150">Descripci�n Corta:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoHabilitarActionForm" property="descripcionCorta"/>
            <html:hidden property="descripcionCorta"/>
          </td>
        </tr>
        <tr>
	        <td class="CformNombre" width="150">Grupo de Imputaci�n:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoHabilitarActionForm" property="grupoEgreso"/>
            <html:hidden property="grupoEgreso"/>
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
        
       <tr><td height="10" colspan="0"></td></tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
      </div>
    </td>
  </tr>
</table>
</html:form>


