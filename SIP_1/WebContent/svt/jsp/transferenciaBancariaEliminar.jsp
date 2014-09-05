<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">
  Eliminaci&oacute;n de Transferencia Bancaria
</h1>
<html:form action="cTransferenciaBancariaEliminarAction.do"
  method="POST">
  <h2 class="mensajeSuperior">
    Está a punto de eliminar, presione 'Grabar' para confirmar
  </h2>
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
    <tr height="25">
      <td class="CformRowHeader" colspan="10">
        &nbsp;Transferencia Bancaria
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
            <td>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr>
                  <td width="10" rowspan="100"></td>
                  <td class="CformNombre">
                    Cuenta Origen:
                  </td>
                  <td class="CformDato" colspan="4">
                    <html:select disabled="true" property="cuentaOrigen">
                      <html:options collection="comboCuenta" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                <tr>
                  <td class="CformNombre">
                    Cuenta Destino:
                  </td>
                  <td class="CformDato" colspan="4">
                    <html:select disabled="true" property="cuentaDestino">
                      <html:options collection="comboCuenta" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Fecha:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cTransferenciaBancariaEliminarActionForm" property="dia" />
                    /
                    <bean:write name="cTransferenciaBancariaEliminarActionForm" property="mes" />
                    /
                    <bean:write name="cTransferenciaBancariaEliminarActionForm" property="anio" />
                    <html:hidden property="dia" />
                    <html:hidden property="mes" />
                    <html:hidden property="anio" />
                  </td>
                  <td class="CformNombre">
                    Importe:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cTransferenciaBancariaEliminarActionForm" property="importe" />
                    <html:hidden property="importe" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Descripción:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cTransferenciaBancariaEliminarActionForm" property="descripcion" />
                    <html:hidden property="descripcion" />
                  </td>
                  <td class="CformNombre">
                    Cheque N°:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cTransferenciaBancariaEliminarActionForm" property="chequeNumero" />
                    <html:hidden property="chequeNumero" />
                  </td>
                </tr>
                <tr>
                  <td colspan="10" height="10">
                  </td>
                </tr>
              </table>
            </td>
            <td width="10" rowspan="100"></td>
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
