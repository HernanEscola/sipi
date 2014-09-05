<%@include file="layout/include.jsp"%>
<!--Se cambia el título de la Jsp por Tipo de Imputación-->
<br>
<h1 align="center" class="titulo">Detalle del Tipo de Imputación</h1>
<html:form action="cTipoEgresoDetalleAction.do" method="POST">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr>
    <td>

      <table width="100%">
        <tr bgcolor="#DDEEFF">
          <td><strong>Tipo de Imputación</strong></td>
        </tr>
      </table>

      <table width="100%">
        <tr><td height="10" colspan="0"></td></tr>
        <tr>
          <td class="CformNombre" width="150">Descripción:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoDetalleActionForm" property="descripcion"/>
            <html:hidden property="descripcion"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="150">Descripción Corta:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoDetalleActionForm" property="descripcionCorta"/>
            <html:hidden property="descripcionCorta"/>
          </td>
        </tr>
        <tr>
	        <td class="CformNombre" width="150">Grupo de Imputación:</td>
          <td class="CformDato">
            <bean:write name="cTipoEgresoDetalleActionForm" property="grupoEgreso"/>
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
        <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value="cTipoEgresoDetalleActionForm" />
            <jsp:param name="entidad" value="tipo_imp" />
        </jsp:include>
      </div>
    </td>
  </tr>
</table>
</html:form>


