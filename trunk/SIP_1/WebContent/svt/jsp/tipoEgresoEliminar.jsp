<%@include file="layout/include.jsp"%>
<!--Se cambia el título de la Jsp por Tipo de Imputación-->
<br>
<h1 align="center" class="titulo">Eliminar Tipo de Imputación</h1>
<html:form action="cTipoEgresoEliminarAction.do" method="POST">

<h2 class="mensajeSuperior">Está a punto de eliminar, presione 'Grabar' para confirmar.</h2>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#DDEEFF">
         <td><strong>Tipo de Imputación</strong></td>
        </tr>
      </table>

      <table width="100%" align="center">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td class="CformNombre" width="150">Descripción:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoEliminarActionForm" property="descripcion"/>
              <html:hidden property="descripcion"/>
          </td>
        </tr>
	<tr>
          <td class="CformNombre" width="150">Descripción Corta:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoEliminarActionForm" property="descripcionCorta"/>
            <html:hidden property="descripcionCorta"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="150">Grupo de Imputación:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoEliminarActionForm" property="grupoEgreso"/>
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
        
        <tr><td height="10" colspan="10"></td></tr>
       </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <logic:equal property="eliminable" value="1" name="cTipoEgresoEliminarActionForm">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        </logic:equal>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
      </div>
    </td>
  </tr>
</table>
</html:form>

