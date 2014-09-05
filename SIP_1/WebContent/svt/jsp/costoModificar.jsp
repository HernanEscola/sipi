<%@include file="layout/include.jsp"%>

<script>
function controlAcumulado() {
  var totalAsignadoMap = 0.00;
  for(i=0;i<document.cCostoModificarActionForm.elements.length;i++) {
      if (cCostoModificarActionForm.elements[i].name.match(/importeAMapped/)){
        if (cCostoModificarActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cCostoModificarActionForm.elements[i].value);
         a = Math.round(Number(a) * 100) / 100;
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) /100;
         a = a.toFixed(2);
         cCostoModificarActionForm.elements[i].value = a;
      	}
      }
  }
  totalAsignadoMap = totalAsignadoMap.toFixed(2);
  cCostoModificarActionForm.sumaCostos.value = totalAsignadoMap;
  return 1;
}

// le formatea dos decimales a un importe y calcula el total usando la funcion controlAcumulado
function formatImporteCalcularTotal(obj) {
  formatImporte(obj);
  controlAcumulado();
  calculoImprevisto();
}


	function calcularComisiones() {
		var porcentajes = $(".porcentajeComision");
		var importes = $(".importeComision");
		var totalComisiones = Number("0.00");
		var importeComisiones = Number("0.00");
		var consolidado = Number("0.00");
		$.each(porcentajes, function(intIndex, obj) {
			formatPorcentajeNoCero(obj);
			if (obj.value.length > 0) {
				totalComisiones = totalComisiones + Number(obj.value);
			}
		});
		var subtotal = $('#subtotal').val();
		if (subtotal.length > 0) {
			consolidado = Number(subtotal) / (1 - totalComisiones / 100);
			$.each(porcentajes,
					function(intIndex, obj) {
						if (obj.value.length > 0) {
							importes[intIndex].value = (consolidado*Number(obj.value)/100).toFixed(2);
							importeComisiones = importeComisiones	+ Number(importes[intIndex].value);
						} else {
							importes[intIndex].value = "";
						}
					});
		}
		//$('#costoTotal').val(consolidado.toFixed(2));
		var costoTotal = Number(subtotal) + importeComisiones;
		$('#totalComisiones').val(importeComisiones.toFixed(2));
		$('#costoTotal').val(costoTotal.toFixed(2));
	}

	function calculoImprevisto() {
		obj = document.getElementById('porcentajeImprevisto');
		var a = Number("0.00");
		formatPorcentajeNoCero(obj);
		if (obj.value.length != 0) {
			var sumaCostos = $('#sumaCostos');
			if (sumaCostos.val().length > 0) {
				a = (Number(obj.value)/100)*Number(sumaCostos.val());
				a = a.toFixed(2);
				$('#imprevisto').val(a);
				var b = Number(a) + Number(sumaCostos.val());
				$('#subtotal').val(b.toFixed(2));
			} else {
				$('#imprevisto').val("");
				$('#subtotal').val("");
			}
		} else {
			$('#imprevisto').val("");
			if ($('#sumaCostos').val().length != 0)
				$('#subtotal').val($('#sumaCostos').val());
			else
				$('#subtotal').val("");
		}
		calcularComisiones();
	}
	
	$(document).ready(function() {
		initDialogManoObra();	 
		  
	});
</script>




<br>
<h1 align=" center" class="titulo">Modificación de Costo </h1>

<html:form action="cCostoModificarAction.do" method="POST">
<logic:equal property="accion" value="modificar" name="cCostoModificarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
    <tr>
    <td>
       <table width="100%">
          <tr bgcolor="#BFDFFF">
                <td><strong>Costo&nbsp;</strong></td>
        </tr>
      </table>
    
       <table >
          <tr>
              <td class="CformNombre" width="110">Descripción:<span class="dato_obligatorio">*</span></td>
              <td class="CformDato"><html:text property="descripcion"  maxlength="80" size="70" name="cCostoModificarActionForm"/></td>
           </tr>
           <!-- 
           <tr>
              <td class="CformNombre" width="110">En Otra Moneda:</td>
              <td class="CformDato">
                <html:select disabled="false" property="tipoMoneda"  >
                  <html:options collection="comboTipoMoneda" property="value" labelProperty="label"/>
                </html:select>
              </td>
              
              <td class="CformDato">
                <html:text property="costoOtraMoneda" style="text-align:right;" maxlength="12" size="12" onkeypress="validarImporteConDecimales(this)" onblur="formatImporteCalcularTotal(this)"/> 
              </td>
           </tr>
            -->
        </table>
    
    </td>
    </tr>
    
    <tr>
      <td>

  <logic:empty  property="composicionCostoStruct" name="cCostoModificarActionForm">
      <table width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Componentes del Costo&nbsp;: No se informaron costos</td>
        </tr>
      </table>
     </logic:empty>

     <logic:notEmpty property="composicionCostoStruct" name="cCostoModificarActionForm">
      <table align="center" class="tablaMin">
        <tr bgcolor="#DDEEFF">
           <td>
           <table>
	        	<tr>
		        	 <td width="500">Componentes del Costo:<span class="dato_obligatorio">*</span> </td>
		        	  <td align="right" width="26%"><a id="verManoDeObra" href="#" style=" font-weight: bold;">Valor Mano de Obra <img width="16" height="16" src="./imagenes/lupa.png" align="top"/></a></td>
	        	</tr>
          	</table>
			</td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cCostoModificarActionForm.composicionCostoStruct" style="width:100%" id="costoModificar" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
              <display:column property="tipoEgresoDescripcion" title="Descripción" headerClass="tableCellHeader"  />
              <display:column property="importeA" title="Importe ($)" headerClass="tableCellHeader" style="width:20%" />
            </display:table>
          </td>
        </tr>
       </table>
      </logic:notEmpty >
      
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="80%">&nbsp;Subtotal</td>
        <td class="CformDato" width="20%" align="left" >
          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" maxlength="12" property="sumaCostos" styleId="sumaCostos" name="cCostoModificarActionForm" size="16" />
        </td>
      </tr>
     </table>
     <table width="100%">
      <tr bgcolor="#DDEEFF">
        <td>Previsión de Fondos&nbsp;</td>
      </tr>
     </table>
     <table width="100%">
      <tr>
        <td align="left" width="60%">&nbsp;% Factor de Riesgo</td>
        <td class="CformDato" width="20%" align="left" >
          <html:text style="text-align:right" maxlength="12" property="porcentajeImprevisto" styleId="porcentajeImprevisto" name="cCostoModificarActionForm" size="12" onblur="calculoImprevisto()"/>
        </td>
        <td class="CformDato" width="20%" align="left" >
          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" maxlength="12" property="imprevisto" styleId="imprevisto" name="cCostoModificarActionForm" size="16" />
        </td>
      </tr>
     </table>
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="80%">&nbsp;Subtotal</td>
        <td class="CformDato" width="20%" align="left" >
          <html:text styleClass="textDisabled" style="text-align:right" maxlength="12" readonly="true" property="subtotal" name="cCostoModificarActionForm" size="16" styleId="subtotal"/>
        </td>
      </tr>
     </table>
     <table align="center" class="tablaMin">
        <tr bgcolor="#DDEEFF">
           <td>Comisiones:<span class="dato_obligatorio">*</span></td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cCostoModificarActionForm.distribucionStruct" style="width:100%" id="costoModificar" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
              <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader"  />
              <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
              <display:column property="porcentajeComision" title="%" headerClass="tableCellHeader" style="width: 20%;" />
              <display:column property="importeComision" title="Importe ($)" headerClass="tableCellHeader" style="width:20%" />
            </display:table>
          </td>
        </tr>
     </table>
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="80%">&nbsp;Total Comisiones</td>
        <td class="CformDato" width="20%" align="left">
          <html:text styleClass="textDisabled" style="text-align:right"  maxlength="12" readonly="true" property="totalComisiones" name="cCostoModificarActionForm" size="16" styleId="totalComisiones" />
        </td>
      </tr>
      <tr class="tableRowFooter">
        <td align="left" width="80%">&nbsp;Costo Mínimo</td>
        <td class="CformDato" width="20%" align="left" >
          <html:text styleClass="textDisabled" style="text-align:right" maxlength="12" readonly="true" property="importeConsolidado" name="cCostoModificarActionForm" size="16" styleId="costoTotal"/>
        </td>
      </tr>
     </table>
     
     <table  width="100%" cellpadding="0" cellspacing="0" >
          <tr>
                 <td class="CformNombre" width="110">Observaciones:&nbsp;</td>
                 <td class="CformDato"><html:textarea property="observaciones" rows="3" /></td>
         </tr>
     </table>
  
     
     
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

<logic:equal property="accion" value="modificarCfm" name="cCostoModificarActionForm">

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  
  <tr>
    <td>
       <table width="100%">
          <tr bgcolor="#BFDFFF">
                <td><strong>Costo&nbsp;</strong></td>
        </tr>
      </table>
   </td>
   </tr>
   <tr>
   <td> 
      <table>
        <tr>
           <td class="CformNombre" width="110">Descripción:</td>
           <td class="CformDato"><bean:write name="cCostoModificarActionForm" property="descripcion"/></td>
        </tr>
      </table>
    </td>
  </tr>
   
  <tr>
    <td>
      <logic:empty  property="composicionCostoStruct" name="cCostoModificarActionForm">
        <table width="100%">
          <tr bgcolor="#DDEEFF">
            <td>Componentes del Costo&nbsp;: No se informaron costos</td>
          </tr>
        </table>
     </logic:empty>
     <logic:notEmpty property="composicionCostoStruct" name="cCostoModificarActionForm">
      <table align="center" class="tablaMin">
        <tr bgcolor="#DDEEFF">
           <td>Componentes del Costo:</td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cCostoModificarActionForm.composicionCostoStruct" style="width:100%" id="costoModificar" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
              <display:column property="tipoEgresoDescripcion" title="Descripción" headerClass="tableCellHeader"  />
              <display:column property="importeACfm" title="Importe ($)" headerClass="tableCellHeader" style="width:20%" />
            </display:table>
          </td>
        </tr>
       </table>
      </logic:notEmpty >
      
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="80%">&nbsp;Subtotal</td>
        <td class="CformDato" width="20%" align="left" >
          <html:text disabled="true" style="text-align:right" readonly="true" maxlength="12" property="sumaCostos" styleId="sumaCostos" name="cCostoModificarActionForm" size="16" />
        </td>
      </tr>
     </table>
     <table width="100%">
      <tr bgcolor="#DDEEFF">
        <td>Previsión de Fondos&nbsp;</td>
      </tr>
     </table>
     <table width="100%" >
      <tr>
        <td align="left" width="60%">&nbsp;% Factor de Riesgo</td>
        <td class="CformDato" width="20%" align="left" >
          <html:text disabled="true" style="text-align:right" maxlength="12" property="porcentajeImprevisto" styleId="porcentajeImprevisto" name="cCostoModificarActionForm" size="12"/>
        </td>
        <td class="CformDato" width="20%" align="left" >
          <html:text disabled="true" style="text-align:right" maxlength="12" property="imprevisto" styleId="imprevisto" name="cCostoModificarActionForm" size="16" />
        </td>
      </tr>
     </table>
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="80%">&nbsp;Subtotal</td>
        <td class="CformDato" width="20%" align="left" >
          <html:text disabled="true" style="text-align:right" maxlength="12" property="subtotal" name="cCostoModificarActionForm" size="16" styleId="subtotal"/>
        </td>
      </tr>
     </table>
     <table align="center" class="tablaMin">
        <tr bgcolor="#DDEEFF">
           <td>Comisiones:</td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cCostoModificarActionForm.distribucionStruct" style="width:100%" id="costoModificar" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
              <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader"  />
              <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
              <display:column property="porcentajeComisionCfm" title="%" headerClass="tableCellHeader" style="width: 20%" />
              <display:column property="importeComisionCfm" title="Importe ($)" headerClass="tableCellHeader" style="width:20%;" />
            </display:table>
          </td>
        </tr>
     </table>
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="80%">&nbsp;Total Comisiones</td>
        <td class="CformDato" width="20%" align="left">
          <html:text disabled="true" style="text-align:right"  maxlength="12" property="totalComisiones" name="cCostoModificarActionForm" size="16" styleId="totalComisiones" />
        </td>
      </tr>
      <tr class="tableRowFooter">
        <td align="left" width="80%">&nbsp;Costo Mínimo</td>
        <td class="CformDato" width="20%" align="left" >
          <html:text disabled="true" style="text-align:right" maxlength="12" property="importeConsolidado" name="cCostoModificarActionForm" size="16" styleId="costoTotal"/>
        </td>
      </tr>
     </table>
     
     
     <table width="100%">
       <tr>
           <td class="CformNombre" width="110">
                 Observaciones:&nbsp;
           </td>
           <td class="CformDato">
                 <bean:write name="cCostoModificarActionForm" property="observaciones" />
           </td>
       </tr>
     </table>
     
     
     </td>
     </tr>
     <tr>
        <td class="CformAreaBotones" height="35"><span class="dato_obligatorio"></span>
          <div align="right">
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
          </div>
        </td>
     </tr>
  </table>

</logic:equal>

<jsp:include page="/jsp/dialog/manoDeObra.jsp">
		<jsp:param name="form" value="cCostoModificarActionForm" />
		<jsp:param name="actionName" value="cCostoModificarAction" />
	</jsp:include>

<script>
$(".importeDecimales").bind('keydown',function(e){ 
  var key = e.which;
  var value = $(this).val();
  var cantDec = value.length - value.indexOf(".") - 1;
  //tab y flechas
  if (key == 9 || (36 < key && key < 41))
    return true;
  else if ((key == 110 || key == 190)) {
    if (value.indexOf(".") < 0)
        return true;
    else
        return false;
  }
   else if( (47 < key && key < 60) || key == 8 || key == 46 || (95 < key && key < 106))
    return true;
  return false;
});
</script>
</html:form>