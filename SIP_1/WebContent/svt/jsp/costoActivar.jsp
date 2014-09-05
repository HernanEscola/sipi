<%@include file="layout/include.jsp"%>

<script>


</script>




<br>
<logic:equal property="estado" value="N" name="cCostoActivarActionForm">
<h1 align="center" class="titulo">Deshabilitación de Costo</h1>
</logic:equal>

<logic:equal property="estado" value="I" name="cCostoActivarActionForm">
<h1 align="center" class="titulo">Habilitación de Costo</h1>
</logic:equal>

<html:form action="cCostoActivarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="estado"/>

<logic:equal property="accion" value="activar" name="cCostoActivarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
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
        	    <td class="CformDato"><bean:write name="cCostoActivarActionForm" property="descripcion"/></td>
           </tr>
        </table>
    
    </td>
    </tr>
    
    <tr>
      <td>

	<logic:empty  property="composicionCostoStruct" name="cCostoActivarActionForm">
      <table width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Componentes del Costo&nbsp;: No se informaron costos</td>
        </tr>
      </table>
     </logic:empty>

     <logic:notEmpty property="composicionCostoStruct" name="cCostoActivarActionForm">
      <table align="center" width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Componentes del Costo:</td>
        </tr>
          <tr>
            <td colspan="10">
              <display:table name="sessionScope.cCostoActivarActionForm.composicionCostoStruct" style="width:100%" id="CostoActivar" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
                <display:column property="tipoEgresoDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                <display:column property="importePorcentual" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;text-align:right;" />
              </display:table>
            </td>
          </tr>
       </table>
      </logic:notEmpty >
      <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="350">&nbsp;Subtotal</td>
        <td class="CformDato" width="150" align="right" style="text-align:right;">
          <bean:write property="sumaCostos" name="cCostoDetalleActionForm"/>
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
          <bean:write property="porcentajeImprevisto" name="cCostoActivarActionForm"/>
        </td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="imprevisto" name="cCostoActivarActionForm"/>
        </td>
      </tr>
     </table>
     <table	width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Subtotal</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="subtotal" name="cCostoActivarActionForm"/>
        </td>
      </tr>
     </table>
     <table align="center" width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Comisiones:</td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cCostoActivarActionForm.distribucion" style="width:100%" id="costoAlta" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
              <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
              <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
              <display:column property="porcentajeComisionDetalle" title="%" headerClass="tableCellHeader" style="text-align:right;width: 100px;" />
              <display:column property="importeComisionDetalle" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;width:150px;" />
            </display:table>
          </td>
        </tr>
     </table>
     <table width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Total Comisiones</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="totalComisiones" name="cCostoActivarActionForm"/>
        </td>
      </tr>
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Costo Mínimo</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="importe" name="cCostoActivarActionForm"/>
        </td>
      </tr>
     </table>
     <table width="100%">
       <tr>
           <td class="CformNombre" width="110">
                 Observaciones:&nbsp;
           </td>
           <td class="CformDato">
                 <bean:write name="cCostoActivarActionForm" property="observaciones" />
           </td>
       </tr>
     </table>
     
     
      </td>
    </tr>
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

