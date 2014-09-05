<%@include file="layout/include.jsp"%>

<script>
function controlAcumulado() {
  var totalAsignadoMap = 0.00;

  for(i=0;i<document.cCostoSeleccionarActionForm.elements.length;i++) {
      if (cCostoSeleccionarActionForm.elements[i].name.match(/importeAMapped/)){
        if (cCostoSeleccionarActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cCostoSeleccionarActionForm.elements[i].value);
         a = Math.round((a) * 100) / 100;
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) /100;
         a = a.toFixed(2);
         cCostoSeleccionarActionForm.elements[i].value = a;
      	}
      }
  }
  totalAsignadoMap = totalAsignadoMap.toFixed(2);
  cCostoSeleccionarActionForm.importe.value = totalAsignadoMap;
  return 1;
}

// le formatea dos decimales a un importe y calcula el total usando la funcion controlAcumulado
function formatImporteCalcularTotal(obj) {
  formatImporte(obj);
  controlAcumulado();
}

// Funcion para validar el ingreso de importes, acepta unicamenente numeros y el punto
// permite cargar 11 enteros solamente.
/*function validarImporteConDecimales(obj){
   var tecla=window.event.keyCode;
   if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
 	 window.event.keyCode=0;
   if (obj.value.length==9 && (tecla!=46) && (obj.value.indexOf(".",0)==-1) )
        window.event.keyCode=0;
}
*/

</script>




<br>
<h1 align=" center" class="titulo">Distribución de Costos </h1>

<html:form action="cCostoSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cCostoSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500" >
    <tr>
      <td>

	<logic:empty  property="asignados" name="cCostoSeleccionarActionForm">
      <table width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Distribución de Costos&nbsp;: No se informaron costos</td>
        </tr>
      </table>
        </logic:empty>

     <logic:notEmpty property="asignados" name="cCostoSeleccionarActionForm">

      <table align="center">
          <tr>
            <td colspan="10">
              <display:table name="sessionScope.cCostoSeleccionarActionForm.asignados" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CCostoSeleccionarDisplayWrapper">
                <display:column property="tipoEgresoDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                <display:column property="importeA" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
              </display:table>
            </td>
          </tr>
       </table>
      </logic:notEmpty >
      </td>
    </tr>
    <tr>
	<td>
	    <table>
		 <tr class="tableRowFooter">
		    <td align="left" width="305"> Total en Pesos&nbsp;</td>
		    <td class="CformNombre" width="150" ><html:text  style="text-align:right" readonly="true" maxlength="12"  property="importe" name="cCostoSeleccionarActionForm" size="16" /></td>
		 </tr>
	  </table>
	</td>
    </tr>




<tr><td height="10" colspan="10"></td></tr>
<tr><td height="10" colspan="10"></td></tr>

  <tr>
    <td class="CformAreaBotones" height="35"><span class="dato_obligatorio"></span>
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
      </div>
    </td>
  </tr>

</table>
</logic:equal>
</html:form>

