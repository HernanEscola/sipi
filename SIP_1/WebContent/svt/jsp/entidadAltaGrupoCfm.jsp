<%@include file="layout/include.jsp"%>
<script>
</script>
<br>
<h1 align=" center" class="titulo">
  Registro de Entidad
</h1>

<html:form action="cEntidadAltaAction.do" method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="altaCfm" name="cEntidadActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr height="25">
        <td class="CformRowHeader" colspan="10">
          &nbsp; Entidad
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td height="10" colspan="10"></td>
            </tr>
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="100">
                      Tipo:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="tipo">
                        <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="tipo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Descripción:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActionForm" property="descripcionSigla" />
                      <html:hidden property="descripcionSigla" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActionForm" property="domicilio" />
                      <html:hidden property="domicilio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      País:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="pais">
                        <html:options collection="comboPais" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="pais" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="provincia">
                        <html:options collection="comboProvincia" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="provincia" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="partido">
                        <html:options collection="comboPartido" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="partido" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="localidad">
                        <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="localidad" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActionForm" property="mail" />
                      <html:hidden property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActionForm" property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Observaciones:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActionForm" property="observaciones" />
                    </td>
                  </tr>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Integrantes:&nbsp;
                      </td>
                    </tr>
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadActionForm.asignados" style="width: 100%" decorator="conicet.apps.svt.web.entidad.decorator.CIntegrantesGrupoDisplayWrapper">
                          <display:column property="indice" title="#" headerClass="tableCellHeader" />
                          <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="140" style="width: 250px;" />
                          <display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" />
                          <display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="esJefeCfm" title="Responsable" headerClass="tableCellHeader" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </table>
              </td>
            </tr>
            <tr>
              <td class="CformAreaBotones" height="35">
                <div align="right">
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
                </div>
              </td>
            </tr>
          </table>
    </table>
  </logic:equal>
</html:form>
