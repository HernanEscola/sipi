<%@include file="layout/include.jsp"%>

<script>

$(document).ready(
		function(){
			$("[id^='importeAsignado_']").each(function() {
				//seteo al campo de porcentaje de titularidad para que lo maneje como numero
				var inputAsignadoPorInventor = new CInputNumero(true);			
				inputAsignadoPorInventor.bind(this);
			});
		}
);
</script>

<br>
<h1 align="center" class="titulo">
  Distribución de Beneficios por Inventor
</h1>

<html:form action="cPropiedadInventorDistribucionAction.do" method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="formulario" name="cPropiedadInventorDistribucionActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
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
                <display:table name="sessionScope.cPropiedadInventorDistribucionActionForm.asignados" id="distribucionBeneficios" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
                  <display:column property="tipoEgresoDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 300px;" />
                  <display:column property="importeA" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width:100px;" />
                  <display:column property="sugerido" title="% Sugerido Conv. Marco *" headerClass="tableCellHeader" style="width:200px;" />
                </display:table>
              </td>
            </tr>
          </table>
          <table>
             <tr class="tableRowFooter">
               <td align="left" width="400">Fuera del SCP:&nbsp;</td>
                 <td class="CformNombre" width="150" >
                   <html:text style="text-align:right" readonly="true" maxlength="12" property="totalNoScp" name="cPropiedadInventorDistribucionActionForm" size="16" />
                 </td>
             </tr>
           </table>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">

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
	                    <span class="header" style="width:17%;text-align:right;">Fuera del SCP</span>
                      <logic:iterate id="entidad" indexId="indexEntidad" property="entidades" name="cPropiedadInventorDistribucionActionForm">
                        <bean:define id="entidadId" name="entidad" property="id"/>
                          <span class="header" style="width:17%;text-align:right;">&nbsp;
                            <bean:write name="entidad" property="descripcion"/>
                          </span>
   	                  </logic:iterate>&nbsp; 
                    <span class="header" style="width:17%;text-align:left;">Total</span>
                  </div>
                <logic:iterate id="tipoEgreso" indexId="indexTipoEgreso" property="tipoEgresosPosibles" name="cPropiedadInventorDistribucionActionForm">
                  <bean:define id="tipoEgredoId" name="tipoEgreso" property="id"/>
                                        
                    <div class="row">
                      <span class='<%= indexTipoEgreso.intValue()%2 == 0 ? "even" : "odd" %>' style="width:20%;">
                        <bean:write name="tipoEgreso" property="descripcionCorta"/>
                      </span>
                      <span class="header" style="width:17%;text-align:right;">
                            <bean:write name="cPropiedadInventorDistribucionActionForm" property="guiones" /> &nbsp;
                          </span>
  	                    <logic:iterate id="entidad" indexId="indexEntidad" property="inventores" name="cPropiedadInventorDistribucionActionForm">
                          <span class='<%= indexEntidad.intValue()%2 == 0 ? "even" : "odd" %>' style="width:17%;text-align:right;">
                            <bean:write property='<%= "porcentajeCalculoComision("+indexTipoEgreso+"-"+indexEntidad+")" %>' name="cPropiedadInventorDistribucionActionForm"/>&nbsp;%
                          </span>
                         </logic:iterate>
	                  <span class='<%= indexTipoEgreso.intValue()%2 == 0 ? "even" : "odd" %>' style="width:17%;text-align:right;">
                      <bean:write property='<%= "porcentajeCalculoComision("+indexTipoEgreso+"-Total"+")" %>' name="cPropiedadInventorDistribucionActionForm"/>&nbsp;%</span>
                    </div>
                </logic:iterate>
                
                <div class="row">
                    <span class="header" style="width:20%;text-align:left;">Fuera del SCP</span>
                      <span class="header" style="width:17%;text-align:right;">
                      <bean:write property="totalNoScp" name="cPropiedadInventorDistribucionActionForm"/>&nbsp;
                    </span>
                    <logic:iterate id="entidad" indexId="indexEntidad" property="inventores" name="cPropiedadInventorDistribucionActionForm">
                         <span class="header" style="width:17%;text-align:right;">
                            <bean:write name="cPropiedadInventorDistribucionActionForm" property="guiones" /> &nbsp;
                         </span>
                     </logic:iterate>
                     <span class="header" style="width:17%;text-align:right;">
                        <bean:write name="cPropiedadInventorDistribucionActionForm" property="totalNoScp" />
                     </span>
                 </div>
                
                  <div class="row">
                    <span class="header" style="width:20%;text-align:left;">% Beneficios</span>
                      <span class="header" style="width:17%;text-align:right;">
                         <bean:write name="cPropiedadInventorDistribucionActionForm" property="beneficiosNoScp" /> &nbsp;%
                      </span>
                      <logic:iterate id="entidad" indexId="indexEntidad" property="inventores" name="cPropiedadInventorDistribucionActionForm">
                         <span class="header" style="width:17%;text-align:right;">
                          <bean:write property='<%= "porcentajeCalculoComision(Total-"+indexEntidad+")" %>' name="cPropiedadInventorDistribucionActionForm"/>&nbsp;%
                         </span>
                      </logic:iterate>
                    <span class="header" style="width:17%;text-align:right;">
                      <bean:write property="beneficiosTotal" name="cPropiedadInventorDistribucionActionForm"/>&nbsp;%
                    </span>
                  </div>
               </div>
             </td>
           </tr>
         </table>
        
        </td>
      </tr>
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Calcular Distribución"/>
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
          </div>
        </td>
      </tr>
   </table>
  </logic:equal>
</html:form>

