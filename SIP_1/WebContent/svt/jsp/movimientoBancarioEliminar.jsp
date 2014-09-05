<%@include file="layout/include.jsp"%>
<br>
<h1 align=" center" class="titulo">
  Eliminación de Movimiento Bancario
</h1>
<html:form action="cMovimientoBancarioEliminarAction.do" method="POST">
  <h2 class="mensajeSuperior">
    Está a punto de eliminar, presione 'Grabar' para confirmar
  </h2>
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
    <tr height="25">
      <td class="CformRowHeader" colspan="10">
        &nbsp;Movimiento Bancario
      </td>
    </tr>
    <tr height="20">
      <td align="center">
      </td>
    </tr>
    <tr>  
      <td>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
         <tr>
            <td width="10" rowspan="100"></td>
            <td>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr>
                  <td class="CformNombre" width="150">
                    Cuenta:
                  </td>
                  <td class="CformDato" colspan="4">
                    <html:select disabled="true" property="cuenta">
                      <html:options collection="comboCuenta" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Concepto:
                  </td>
                  <td class="CformDato" colspan="4">
                    <html:select disabled="true" property="concepto">
                      <html:options collection="comboConcepto" property="value" labelProperty="label" />
                    </html:select>
                    <html:hidden property="concepto" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Descripción:
                  </td>
                  <td class="CformDato" colspan="4">
                    <html:select disabled="true" property="descripcion">
                      <html:options
                        collection="comboTipoMovimientoBancario" property="value" labelProperty="label" />
                    </html:select>
                    <html:hidden property="descripcion" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Fecha:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cMovimientoBancarioEliminarActionForm" property="dia" />
                    /
                    <bean:write name="cMovimientoBancarioEliminarActionForm" property="mes" />
                    /
                    <bean:write
                      name="cMovimientoBancarioEliminarActionForm" property="anio" />
                    <html:hidden property="dia" />
                    <html:hidden property="mes" />
                    <html:hidden property="anio" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Importe:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cMovimientoBancarioEliminarActionForm" property="importe" />
                    <html:hidden property="importe" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Observaciones:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cMovimientoBancarioEliminarActionForm" property="observaciones" />
                    <html:hidden property="observaciones" />
                  </td>
                </tr>
                <tr>
                  <td colspan="10" height="10">
                  </td>
                </tr>
              </table>
            </td>
            <td width="40" rowspan="100"></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir" />
        </div>
      </td>
    </tr>
  </table>
</html:form>
