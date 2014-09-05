<%@include file="layout/include.jsp"%>
<script>
  function ComboTipo(obj) {
	for ( m=document.cMovimientoBancarioActionForm.descripcion.options.length-1;m>0;m--){
		document.cMovimientoBancarioActionForm.descripcion.options[m]=null;
	}
	document.cMovimientoBancarioActionForm.descripcion.length = 0;

	option = new Option("Seleccionar","-1");
        document.cMovimientoBancarioActionForm.descripcion.options[0] = option ;
	document.cMovimientoBancarioActionForm.descripcion.options[0].selected = true ;
	option = new Option("----------","-2");
        document.cMovimientoBancarioActionForm.descripcion.options[1] = option ;
        document.cMovimientoBancarioActionForm.descripcion.options[1].selected = false ;
        var j = 2 ;
	var foundAny = false ;
	<logic:iterate name="cMovimientoBancarioActionForm" property="tiposMovimientoBancario" id="tipo">
                option = new Option("Seleccionar","-1");
                document.cMovimientoBancarioActionForm.descripcion.options[0].selected = true ;
                document.cMovimientoBancarioActionForm.descripcion.options[0] = option ;
                option = new Option("----------","-2");
                document.cMovimientoBancarioActionForm.descripcion.options[1] = option ;
                document.cMovimientoBancarioActionForm.descripcion.options[1].selected = false ;
                if (document.cMovimientoBancarioActionForm.concepto.value == "<bean:write name="tipo" property="tipo"/>"){
			var option = null;
			option = new Option("<bean:write name="tipo" property="descripcion"/>","<bean:write name="tipo" property="id"/>");
			document.cMovimientoBancarioActionForm.descripcion.options[j] = option ;
			//Marca el subrubro como seleccionado si efectivamente lo esta
			if ( "<bean:write name="tipo" property="id"/>" == "<bean:write name="cMovimientoBancarioActionForm" property="descripcion"/>" ){
				document.cMovimientoBancarioActionForm.descripcion.options[j].selected = true;
			}
			j++;
			foundAny = true;
		}
	</logic:iterate>
        return true;
  }
</script>
<br>

<html:form action="cMovimientoBancarioAltaAction.do" method="POST">
  <html:hidden property="accion" />
  <!--   ******************************** -->
  <!--   CUANDO SE ESTAN INGRESANDO DATOS -->
  <!--   ******************************** -->
  <logic:equal property="accion" value="alta"
    name="cMovimientoBancarioActionForm">
    <h1 align="center" class="titulo">
      Registro de Movimiento Bancario
    </h1>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr height="25">
        <td class="CformRowHeader" colspan="11">&nbsp;Movimiento Bancario</td>
      </tr>
      <tr>
        <td colspan="2">
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td height="10" colspan="10"></td>
            </tr>
            <tr>
              <td width="40" rowspan="100"></td>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="100">Cuenta:<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato" colspan="4">
                      <html:select disabled="false" property="cuenta">
                        <html:options collection="comboCuenta" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">Concepto:<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato" colspan="4">
                      <html:select disabled="false" property="concepto" onchange="ComboTipo(this)">
                        <html:options collection="comboConcepto" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">Descripción:<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato" colspan="4">
                      <html:select disabled="false" property="descripcion">
                        <html:options collection="comboTipoMovimientoBancario" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">Fecha:<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato" colspan="0">
                      <html:text property="dia" maxlength="2" size="2" />
                      -
                      <html:text property="mes" maxlength="2" size="2" />
                      -
                      <html:text property="anio" maxlength="4" size="4" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">Importe:<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato">
                      <html:text property="importe" maxlength="12" size="12" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Observaciones:</td>
                    <td class="CformDato" colspan="4">
                      <html:text property="observaciones" maxlength="60" size="50"/>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="5" height="10">
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
        <td class="CformAreaBotones" height="35"><span class="dato_obligatorio">  * Datos obligatorios</span></td>
          <td class="CformAreaBotones" height="35">
            <div align ="right">
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir" />
            </div>
         </td>
      </tr>
    </table>
    <script>
	ComboTipo(document.cMovimientoBancarioActionForm.concepto);
</script>
  </logic:equal>

  <logic:equal property="accion" value="confirmar"
    name="cMovimientoBancarioActionForm">
    <h1 align="center" class="titulo">
      Registro de Movimiento Bancario
    </h1>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr height="25">
        <td class="CformRowHeader" colspan="10">
          &nbsp; Movimiento Bancario
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td height="10" colspan="10"></td>
            </tr>
            <tr>
              <td width="40" rowspan="100"></td>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="100">
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
                        <html:options collection="comboTipoMovimientoBancario" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="descripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Fecha:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cMovimientoBancarioActionForm" property="dia" />
                      /
                      <bean:write name="cMovimientoBancarioActionForm" property="mes" />
                      /
                      <bean:write name="cMovimientoBancarioActionForm" property="anio" />
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
                      <bean:write name="cMovimientoBancarioActionForm" property="importe" />
                      <html:hidden property="importe" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Observaciones:
                    </td>
                    <td class="CformDato" colspan="4">
                      <bean:write name="cMovimientoBancarioActionForm" property="observaciones" />
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>
</html:form>
