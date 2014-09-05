<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">
  Registro de Transferencia Bancaria
</h1>
<html:form action="cTransferenciaBancariaAltaAction.do" method="POST">
  <html:hidden property="accion" />
  <!--   ******************************** -->
  <!--   CUANDO SE ESTAN INGRESANDO DATOS -->
  <!--   ******************************** -->
  <logic:equal property="accion" value="alta" name="cTransferenciaBancariaActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr height="25">
        <td class="CformRowHeader" colspan="11">
          &nbsp; Transferencia Bancaria
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td height="10" colspan="10"></td>
            </tr>
            <tr>
              <td width="10" rowspan="100"></td>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre">
                      Cuenta Origen:
                      <span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato" colspan="4">
                      <html:select disabled="false" property="cuentaOrigen">
                        <html:options collection="comboCuenta" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Cuenta Destino:
                      <span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato" colspan="4">
                      <html:select disabled="false" property="cuentaDestino">
                        <html:options collection="comboCuenta" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Fecha:
                      <span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato">
                      <html:text property="dia" maxlength="2" size="2" />
                      -
                      <html:text property="mes" maxlength="2" size="2" />
                      -
                      <html:text property="anio" maxlength="4" size="4" />
                    </td>
                    <td class="CformNombre">
                      Importe:
                      <span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato">
                      <html:text property="importe" maxlength="10" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Descripción:
                    </td>
                    <td class="CformDato">
                      <html:text property="descripcion" maxlength="60" />
                    </td>
                    <td class="CformNombre">
                      Cheque N°:
                    </td>
                    <td class="CformDato">
                      <html:text property="chequeNumero" maxlength="8" />
                    </td>
                  </tr>
                  <tr>
                    <td colspan="5" height="10">
                    </td>
                  </tr>
                </table>
              </td>
              <td width="20" rowspan="100"></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class="CformAreaBotones" height="35"><span class="dato_obligatorio">  * Datos obligatorios</span>        </td>
        <td class="CformAreaBotones" height="35">
          <div align="right">
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>

  <logic:equal property="accion" value="confirmar" name="cTransferenciaBancariaActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr height="25">
        <td class="CformRowHeader" colspan="10">
          &nbsp; Transferencia Bancaria
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
                    <td width="10" rowspan="100"></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="150">
                      Cuenta Origen:
                    </td>
                    <td class="CformDato" colspan="4">
                      <html:select disabled="true" property="cuentaOrigen">
                        <html:options collection="comboCuenta" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
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
                      <bean:write name="cTransferenciaBancariaActionForm" property="dia" />
                      /
                      <bean:write name="cTransferenciaBancariaActionForm" property="mes" />
                      /
                      <bean:write name="cTransferenciaBancariaActionForm" property="anio" />
                      <html:hidden property="dia" />
                      <html:hidden property="mes" />
                      <html:hidden property="anio" />
                    </td>
                    <td class="CformNombre">
                      Importe:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTransferenciaBancariaActionForm" property="importe" />
                      <html:hidden property="importe" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Descripción:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTransferenciaBancariaActionForm" property="descripcion" />
                      <html:hidden property="descripcion" />
                    </td>
                    <td class="CformNombre">
                      Cheque N°:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTransferenciaBancariaActionForm" property="chequeNumero" />
                      <html:hidden property="chequeNumero" />
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>
</html:form>
