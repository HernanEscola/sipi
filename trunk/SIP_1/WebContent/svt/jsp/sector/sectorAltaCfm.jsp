<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script>
window.onload=function(){
	setupPanes("container", document.cSectorAltaActionForm.cambiaPanel.value);
}

function setFoco(){
	x=event.keyCode
	//alert(x)
	if((x==13)){ // enter
		window.event.returnValue = false
	}
}
function irA(obj){
	document.cSectorAltaActionForm.cambiaPanel.value=obj;
	setupPanes("container", document.cSectorAltaActionForm.cambiaPanel.value);
}

function pedirConfirmacion(){
  input_box=confirm("Se perderán los datos no grabados, ¿desea continuar?");
  if (input_box==false){
	window.event.returnValue = false
  }
}
</script>


<br>
<h1 align="center" class="titulo">Registro de UVT </h1>
<html:form action="cSectorAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="cambiaPanel"/>

  <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="CformRowHeader" colspan="10">&nbsp;Sector</td>
    </tr>
    <tr>
      <td>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
          <tr><td height="10" colspan="10"></td></tr>
          <tr>
             <td>
            	<table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="120">Descripci&oacute;n:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cSectorAltaActionForm" property="descripcion"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="120">Habilitado:</td>
                    <td class="CformDato">
                      <html:select disabled="true" property="habilitado" >
                        <html:options collection="comboHabilitado" property="value" labelProperty="label"/>
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="120">Sigla:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cSectorAltaActionForm" property="sigla"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="120">E-Mail Principal:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cSectorAltaActionForm" property="email"/></td>
                  </tr>
            	</table>
            </td>
          </tr>
          <tr>
            <td class="CformAreaBotones" height="30">
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
      
</html:form>
