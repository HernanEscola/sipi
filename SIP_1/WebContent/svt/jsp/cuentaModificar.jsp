<%@include file="layout/include.jsp"%>
<script language="Javascript1.2">

function controlComboTipoCuenta(obj) {

  if (obj.value=="1") {
    document.cCuentaModificarActionForm.banco.value="";
    document.cCuentaModificarActionForm.banco.disabled=true;
    document.cCuentaModificarActionForm.banco.className = 'CformTextDisabled';
    document.cCuentaModificarActionForm.sucursal.value="";
    document.cCuentaModificarActionForm.sucursal.disabled=true;
    document.cCuentaModificarActionForm.sucursal.className = 'CformTextDisabled';
  }
  else {
    document.cCuentaModificarActionForm.banco.disabled=false;
    document.cCuentaModificarActionForm.banco.className = 'CformTextEnabled';
    document.cCuentaModificarActionForm.sucursal.disabled=false;
    document.cCuentaModificarActionForm.sucursal.className = 'CformTextEnabled';
  }
}

</script>

<br>
<h1 align="center" class="titulo">Modificaci&oacute;n de Cuenta </h1>
<html:form action="cCuentaModificarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="modificar" name="cCuentaModificarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">

  <tr height="25">
    <td class="CformRowHeader" colspan="11"> &nbsp;  Cuenta </td>
  </tr>

  <tr>
    <td >
      <table width="100%">
        <tr>
          <td class="CformNombre">Tipo:&nbsp;<span class="dato_obligatorio">*</span></td>
          <td class="CformDato">
            <html:select disabled="false" property="tipoCuenta" onchange="controlComboTipoCuenta(this)" >
              <html:options collection="comboTipoCuenta" property="value" labelProperty="label"/>
            </html:select>
          </td>
        </tr>
        <tr>
          <td class="CformNombre" >Número:&nbsp;<span class="dato_obligatorio">*</span></td>
          <td class="CformDato">
            <html:text property="cuentaNro" maxlength="60" size="30"/>
          </td>
       </tr>
       <tr>
         <td class="CformNombre">Banco:&nbsp;<span class="dato_obligatorio">**</span></td>
         <td class="CformDato">
           <html:text property="banco" maxlength="60" size="30"/>
         </td>
       </tr>
       <tr>
         <td class="CformNombre">Sucursal:&nbsp;</td>
         <td class="CformDato">
           <html:text property="sucursal" maxlength="60" size="30"/>
         </td>
       </tr>
       <tr>
         <td class="CformNombre">F.Inicio:&nbsp;<span class="dato_obligatorio">*</span></td>
         <td class="CformDato" colspan="4">
           <bean:write name="cCuentaModificarActionForm" property="diaFI"/>-<bean:write name="cCuentaModificarActionForm" property="mesFI"/>-
           <bean:write name="cCuentaModificarActionForm" property="anioFI"/>
         </td>
       </tr>
       <tr>
         <td class="CformNombre">F.Cierre:&nbsp;<span class="dato_obligatorio">*</span></td>
         <td class="CformDato" >
           <html:text property="diaFC" maxlength="2" size="2"/> -
           <html:text property="mesFC" maxlength="2" size="2"/> -
           <html:text property="anioFC" maxlength="4" size="4"/>
         </td>
       </tr>
       <tr>
         <td class="CformNombre" width="80">UVT:&nbsp;<span class="dato_obligatorio">*</span></td>
         <td class="CformDato">
           <html:select disabled="false" property="gestor" >
             <html:options collection="comboGestor" property="value" labelProperty="label"/>
           </html:select>
         </td>
      </tr>
      <tr>
        <td class="CformNombre"  width="80">Desc.Corta:&nbsp;<span class="dato_obligatorio">*</span></td>
        <td class="CformDato" >
          <html:text property="descCorta" maxlength="30"size="30"/>
        </td>
      </tr>
      <tr>
        <td class="CformNombre"  width="80">Denominación:&nbsp;</td>
        <td class="CformDato" >
          <html:text property="denominacion" maxlength="60" size="80"/>
        </td>
      </tr>
      <tr>
        <td class="CformNombre"  width="80" >Desc. Larga:&nbsp;</td>
        <td class="CformDato" >
          <html:text property="descLarga" maxlength="100"size="80" />
        </td>
      </tr>
   </table>
 </td>
</tr>

<tr>
  <td>
    <table width="100%">
      <tr>
        <td width="350" class="CformAreaBotones">
          <div align="left" class="dato_obligatorio">
            <span>
              * Datos obligatorios  ** Para efectivo no es obligatorio
            </span>
          </div>
          <div align="right">
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
          </div>
        </td>
      </tr>
    </table>
  </td>
</tr>
</table>
</logic:equal>

<logic:equal property="accion" value="confirmar" name="cCuentaModificarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="11"> &nbsp;  Cuenta </td>
  </tr>

  <tr>
    <td >
      <table width="100%">
        <tr>
          <td class="CformNombre">Tipo:&nbsp;</td>
          <td class="CformDato">
            <html:select disabled="true" property="tipoCuenta" >
              <html:options collection="comboTipoCuenta" property="value" labelProperty="label"/>
            </html:select><html:hidden property="tipoCuenta"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre" >Número:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="cCuentaModificarActionForm" property="cuentaNro"/>
              <html:hidden property="cuentaNro"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre">Banco:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="cCuentaModificarActionForm" property="banco"/>
              <html:hidden property="banco"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre">Sucursal:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="cCuentaModificarActionForm" property="sucursal"/>
              <html:hidden property="sucursal"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre">F.Inicio:&nbsp;</td>
          <td class="CformDato" colspan="4">
            <bean:write name="cCuentaModificarActionForm" property="diaFI"/>-
            <bean:write name="cCuentaModificarActionForm" property="mesFI"/>-
            <bean:write name="cCuentaModificarActionForm" property="anioFI"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre">F.Cierre:&nbsp;</td>
          <td class="CformDato" colspan="4">
            <bean:write name="cCuentaModificarActionForm" property="diaFC"/>-
            <bean:write name="cCuentaModificarActionForm" property="mesFC"/>-
            <bean:write name="cCuentaModificarActionForm" property="anioFC"/>
          </td>
        </tr>
         <tr>
           <td class="CformNombre" width="80">UVT:&nbsp;</td>
           <td class="CformDato">
             <html:select disabled="true" property="gestor" >
               <html:options collection="comboGestor" property="value" labelProperty="label"/>
             </html:select>
          </td>
        </tr>
        <tr>
          <td class="CformNombre"  width="80">Desc.Corta:&nbsp;</td>
          <td class="CformDato" >
            <bean:write name="cCuentaModificarActionForm" property="descCorta" />
          </td>
        </tr>
        <tr>
          <td class="CformNombre"  width="80">Denominación:&nbsp;</td>
          <td class="CformDato" >
            <bean:write name="cCuentaModificarActionForm" property="denominacion"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre"  width="80" >Desc. Larga:&nbsp;</td>
          <td class="CformDato" >
            <bean:write name="cCuentaModificarActionForm" property="descLarga"/>
          </td>
        </tr>
      </table>
   </td>
</tr>

<tr>
  <td >
    <table width="100%">
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
  </td>
</tr>
</table>
</logic:equal>
</html:form>
