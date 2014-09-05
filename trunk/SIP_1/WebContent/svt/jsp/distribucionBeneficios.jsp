<%@include file="layout/include.jsp"%>

<script>
function controlAcumulado() {
/*  var totalAsignadoMap = 0.00;

  for(i=0;i<document.cDistribucionBeneficiosActionForm.elements.length;i++) {
      if (cDistribucionBeneficiosActionForm.elements[i].name.match(/importeAMapped/)){
        if (cDistribucionBeneficiosActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cDistribucionBeneficiosActionForm.elements[i].value);
         a = Math.round((a) * 100) / 100;
         totalAsignadoMap = Math.round((totalAMap + a) * 100) /100;
         a = a.toFixed(2);
         cDistribucionBeneficiosActionForm.elements[i].value = a;
      	}
      }
  }
  totalAsignadoMap = totalAsignadoMap.toFixed(2);
  cDistribucionBeneficiosActionForm.importe.value = totalAsignadoMap;
  return 1;*/
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
<h1 align="center" class="titulo">
  Distribución de Beneficios por Inventor
</h1>

<html:form action="cDistribucionBeneficiosAction.do" method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="formulario"
    name="cDistribucionBeneficiosActionForm">
    <table class="CformTable" align="center" cellpadding="0"
      cellspacing="0" >
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>
                Beneficios por Inventor:&nbsp;
              </td>
            </tr>
          </table>


          <table align="center" width="100%">
            <tr>
              <td colspan="10">
                <display:table
                  name="sessionScope.cDistribucionBeneficiosActionForm.asignados"  style="width:100%"  id="distribucionBeneficios" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CDistribucionBeneficiosDisplayWrapper">
                  <display:column property="tipoEgresoDescripcion" title="Descripcióne" headerClass="tableCellHeader" style="width: 400px;" />
                  <display:column property="importeA" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width:300px;" />
                  <display:column property="sugerido" title="% Sugerido Conv. Marco *" headerClass="tableCellHeader" style="width:300px;" />
                </display:table>
              </td>
            </tr>
          </table>
        </td>
      </tr>

    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >

      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>
                Distribución:&nbsp;
              </td>
            </tr>
          </table>
                <table width="95%" align="center">
           <tr>
             <td>
               <div class="content">
           <div class="row">
             <span class="header" style="width:20%;text-align:left;">Comisiones %</span>
	      <logic:iterate id="entidad" indexId="indexEntidad" property="entidades" name="cDistribucionBeneficiosActionForm">
                <bean:define id="entidadId" name="entidad" property="id"/>
                <span class="header" style="width:17%;text-align:right;">&nbsp;<bean:write name="entidad" property="descripcion"/></span>
   	      </logic:iterate>
              <span class="header" style="width:17%;text-align:left;">&nbsp;Total</span>
           </div>

           <logic:iterate id="tipoEgreso" indexId="indexTipoEgreso" property="tipoEgresosPosibles" name="cDistribucionBeneficiosActionForm">
             <bean:define id="tipoEgredoId" name="tipoEgreso" property="id"/>
             <div class="row">
               <span class='<%= indexTipoEgreso.intValue()%2 == 0 ? "even" : "odd" %>' style="width:20%;"><bean:write name="tipoEgreso" property="descripcionCorta"/></span>
  	       <logic:iterate id="entidad" indexId="indexEntidad" property="inventores" name="cDistribucionBeneficiosActionForm">
                  <span class='<%= indexEntidad.intValue()%2 == 0 ? "even" : "odd" %>' style="width:17%;text-align:right;"><bean:write property='<%= "porcentajeCalculoComision("+indexTipoEgreso+"-"+indexEntidad+")" %>' name="cDistribucionBeneficiosActionForm"/>&nbsp;%</span>
               </logic:iterate>
	       <span class='<%= indexTipoEgreso.intValue()%2 == 0 ? "even" : "odd" %>' style="width:17%;text-align:right;"><bean:write property='<%= "porcentajeCalculoComision("+indexTipoEgreso+"-Total"+")" %>' name="cDistribucionBeneficiosActionForm"/>&nbsp;%</span>
             </div>
           </logic:iterate>
           <div class="row">
               <span class="header" style="width:20%;text-align:left;">% Autoría</span>
  	       <logic:iterate id="entidad" indexId="indexEntidad" property="inventores" name="cDistribucionBeneficiosActionForm">
                   <span class="header" style="width:17%;text-align:right;"><bean:write property='<%= "porcentajeCalculoComision(Total-"+indexEntidad+")" %>' name="cDistribucionBeneficiosActionForm"/>&nbsp;%</span>
               </logic:iterate>
	       <span  class="header" style="width:17%;text-align:right;"><bean:write property='<%= "porcentajeCalculoComision(Total-Total)" %>' name="cDistribucionBeneficiosActionForm"/>&nbsp;%</span>
             </div>





         </div>
             </td>
           </tr>
         </table>


        </td>
      </tr>


      <!--tr>
	<td>
	    <table>
		 <tr class="tableRowFooter">
		    <td align="left" width="305"> Total &nbsp;</td>
		    <td class="CformNombre" width="150" ><html:text  style="text-align:right" readonly="true" maxlength="12"  property="importe" name="cDistribucionBeneficiosActionForm" size="16" /></td>
		 </tr>
	  </table>
	</td>
    </tr-->


      <tr>
        <td height="10" colspan="10"></td>
      </tr>
      <tr>
        <td height="10" colspan="10"></td>
      </tr>

      <tr>
        <td class="CformAreaBotones" height="35">
          <span class="dato_obligatorio"></span>
          <div align="right">
            <html:submit property="btnSubmit" styleClass="CformBoton"
              value="Calcular Distribución" />
            <html:submit property="btnSubmit" styleClass="CformBoton"
              value="Registrar" />
            <html:submit property="btnSubmit" styleClass="CformBoton"
              value="Volver" />
          </div>
        </td>
      </tr>

    </table>
  </logic:equal>
</html:form>

