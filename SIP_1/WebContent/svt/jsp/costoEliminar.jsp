<%@include file="layout/include.jsp"%>

<script>


</script>




<br>
<h1 align=" center" class="titulo">Eliminar Costo </h1>

<html:form action="cCostoEliminarAction.do" method="POST">

<html:hidden property="accion"/>

<logic:equal property="accion" value="eliminar" name="cCostoEliminarActionForm">
<h2 class="mensajeSuperior">Está a punto de eliminar, presione 'Registrar' para continuar</h2>
</logic:equal>

<logic:equal property="accion" value="confirmar" name="cCostoEliminarActionForm">
<h2 class="mensajeSuperior">Está a punto de eliminar, presione 'Grabar' para continuar</h2>
</logic:equal>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
    <tr>
    <td>
       <table width="100%">
          <tr bgcolor="#BFDFFF">
                <td><strong>Costo&nbsp;</strong></td>
	      </tr>
	    </table>
    
       <table>
          <tr>
              <td class="CformNombre" width="110">Descripción:</td>
        	    <td class="CformDato"><bean:write name="cCostoEliminarActionForm" property="descripcion"/></td>
           </tr>
        </table>
    </td>
    </tr>
    <tr>
      <td>

	<logic:empty  property="composicionCostoStruct" name="cCostoEliminarActionForm">
      <table width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Componentes del Costo&nbsp;: No se informaron costos</td>
        </tr>
      </table>
     </logic:empty>

     <logic:notEmpty property="composicionCostoStruct" name="cCostoEliminarActionForm">
      <table align="left" width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Componentes del Costo:</td>
        </tr>
          <tr>
            <td colspan="10">
              <display:table name="sessionScope.cCostoEliminarActionForm.composicionCostoStruct"  style="width: 100%" id="CostoEliminar" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
                <display:column property="tipoEgresoDescripcion" title="Descripción" headerClass="tableCellHeader" />
                <display:column property="importePorcentual" title="Importe ($)" headerClass="tableCellHeader" style="width:20%;text-align:right;" />
              </display:table>
            </td>
          </tr>
       </table>
      </logic:notEmpty >
      <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="350">&nbsp;Subtotal</td>
        <td class="CformDato" width="150" align="right" style="text-align:right;">
          <bean:write property="sumaCostos" name="cCostoEliminarActionForm"/>
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
        <td align="left" width="320">&nbsp;% Factor de Riesgo</td>
        <td class="CformDato" width="130" align="left" style="text-align:right;">
          <bean:write property="porcentajeImprevisto" name="cCostoEliminarActionForm"/>
        </td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="imprevisto" name="cCostoEliminarActionForm"/>
        </td>
      </tr>
     </table>
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Subtotal</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="subtotal" name="cCostoEliminarActionForm"/>
        </td>
      </tr>
     </table>
     <table align="center" width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Comisiones:</td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cCostoEliminarActionForm.distribucion" id="costoAlta" style="width:100%" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
              <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader"  />
              <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
              <display:column property="porcentajeComisionDetalle" title="%" headerClass="tableCellHeader" style="text-align:right;width: 20%" />
              <display:column property="importeComisionDetalle" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;width:20%" />
            </display:table>
          </td>
        </tr>
     </table>
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Total Comisiones</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="totalComisiones" name="cCostoEliminarActionForm"/>
        </td>
      </tr>
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Costo Mínimo</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="importe" name="cCostoEliminarActionForm"/>
        </td>
      </tr>
     </table> 
     <table width="100%">
       <tr>
           <td class="CformNombre" width="110">
                 Observaciones:&nbsp;
           </td>
           <td class="CformDato">
                 <bean:write name="cCostoEliminarActionForm" property="observaciones" />
           </td>
       </tr>
     </table>



      </td>
  <tr>
    <td class="CformAreaBotones" height="35"><span class="dato_obligatorio"></span>
      <div align="right">
        <logic:equal property="accion" value="eliminar" name="cCostoEliminarActionForm">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
        </logic:equal>
        <logic:equal property="accion" value="confirmar" name="cCostoEliminarActionForm">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        </logic:equal>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
      </div>
    </td>
  </tr>

</table>
</html:form>

