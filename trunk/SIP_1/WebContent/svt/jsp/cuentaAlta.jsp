<%@include file="layout/include.jsp"%>
<script language="Javascript1.2">

function controlComboTipoCuenta(obj) {

  if (obj.value=="1") {
    document.cCuentaActionForm.banco.value="";
    document.cCuentaActionForm.banco.disabled=true;
    document.cCuentaActionForm.banco.className = 'CformTextDisabled';
    document.cCuentaActionForm.sucursal.value="";
    document.cCuentaActionForm.sucursal.disabled=true;
    document.cCuentaActionForm.sucursal.className = 'CformTextDisabled';
    }
  else{
    document.cCuentaActionForm.banco.disabled=false;
    document.cCuentaActionForm.banco.className = 'CformTextEnabled';
    document.cCuentaActionForm.sucursal.disabled=false;
    document.cCuentaActionForm.sucursal.className = 'CformTextEnabled';
  }
}

</script>

<br>
<h1 align="center" class="titulo">Registro de Cuenta </h1>
<html:form action="cCuentaAltaAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="alta" name="cCuentaActionForm">

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
	  <td class="CformDato"><html:text property="cuentaNro" maxlength="60" size="30"/></td>
        </tr>
	<tr>
          <td class="CformNombre">Banco:&nbsp;<span class="dato_obligatorio">**</span></td>
          <td class="CformDato"><html:text property="banco" maxlength="60" size="30"/></td>
       </tr>
       <tr>
          <td class="CformNombre">Sucursal:&nbsp;</td>
          <td class="CformDato"><html:text property="sucursal" maxlength="60" size="30"/></td>
       	</tr>
      	<tr>
          <td class="CformNombre">F.Inicio:&nbsp;<span class="dato_obligatorio">*</span></td>
          <td class="CformDato" >
            <html:text property="diaFI" maxlength="2" size="2"/> -
            <html:text property="mesFI" maxlength="2" size="2"/> -
            <html:text property="anioFI" maxlength="4" size="4"/>
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
          <td class="CformDato" ><html:text property="descCorta" maxlength="30"size="30"/></td>
      	</tr>
        <tr>
	  <td class="CformNombre"  width="80">Denominación:&nbsp;</td>
	  <td class="CformDato" ><html:text property="denominacion" maxlength="60" size="80"/></td>
	 </tr>
        <tr>
	  <td class="CformNombre"  width="80" >Desc. Larga:&nbsp;</td>
	  <td class="CformDato"  ><html:text property="descLarga" maxlength="100"size="80" /></td>
       	</tr>
     </table>
   </td>
</tr>

<tr>
  <td>
    <table width="100%">
      <tr>
        <td height="35" class="CformAreaBotones">
          <div align="left" class="dato_obligatorio">
            <span>* Datos obligatorios  ** Para efectivo no es obligatorio</span>
          </div>
           <div align="right">
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
          </div>
        </td>
      </tr>
    </table>
  </td>
</tr>
</table>
</logic:equal>

<logic:equal property="accion" value="confirmar" name="cCuentaActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="11"> &nbsp;  Cuenta </td>
  </tr>

  <tr>
    <td >
      <table width="100%" >
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
            <bean:write name="cCuentaActionForm" property="cuentaNro"/><html:hidden property="cuentaNro"/>
          </td>
	 </tr>
        <tr>
	  <td class="CformNombre">Banco:&nbsp;</td>
	  <td class="CformDato">
            <bean:write name="cCuentaActionForm" property="banco"/>
              <html:hidden property="banco"/>
          </td>
       </tr>
       <tr>
         <td class="CformNombre">Sucursal:&nbsp;</td>
         <td class="CformDato">
           <bean:write name="cCuentaActionForm" property="sucursal"/>
             <html:hidden property="sucursal"/>
         </td>
       </tr>
       	<tr>
          <td class="CformNombre">F.Inicio:&nbsp;</td>
            <td class="CformDato" >
              <bean:write name="cCuentaActionForm" property="diaFI"/>-
              <bean:write name="cCuentaActionForm" property="mesFI"/>-
              <bean:write name="cCuentaActionForm" property="anioFI"/>
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
	<td class="CformDato">
          <bean:write name="cCuentaActionForm" property="descCorta" />
        </td>
       </tr>
       <tr>
         <td class="CformNombre"  width="80">Denominación:&nbsp;</td>
         <td class="CformDato">
           <bean:write name="cCuentaActionForm" property="denominacion"/>
         </td>
       </tr>
       	<tr>
          <td class="CformNombre"  width="80" >Desc. Larga:&nbsp;</td>
	  <td class="CformDato">
            <bean:write name="cCuentaActionForm" property="descLarga"/>
          </td>
      	</tr>
     </table>
   </td>
</tr>

<tr>
  <td >
    <table width="100%">
      <tr>
	<td class="CformAreaBotones" height="35" >
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
