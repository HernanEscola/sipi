<%@include file="layout/include.jsp"%>

<script>


</script>




<br>
<h1 align=" center" class="titulo">Detalle de Costo </h1>

<logic:notEqual value="S" property="soloConsulta" name="cCostoDetalleActionForm" >
	<logic:notEqual value="S" property="modificable" name="cCostoDetalleActionForm">
	 	   <table  align="center" cellpadding="0" cellspacing="0">
		     <tr>
		        <td ><span align="center" class="CformDetalleRojo">
		     			El costo no puede ser modificado por contener en su composición costos deshabilitados.</span>
		        </td>
		      </tr>
		   </table>
   </logic:notEqual>
</logic:notEqual>   

<html:form action="cCostoDetalleAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="estado"/>
<html:hidden property="eliminable"/>
<html:hidden property="soloConsulta"/>


<logic:equal property="accion" value="formulario" name="cCostoDetalleActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
    <tr>
    <td>
   
       <table width="100%">
          <tr bgcolor="#BFDFFF">
                <td><strong>Costo&nbsp;</strong></td>
	      </tr>
	    </table>
   </td>
   </tr>
   
     <logic:equal value="E" property="estado" name="cCostoDetalleActionForm">
    <tr>
      <td align="center">
        <b class="CformDetalleOro">&nbsp;&nbsp;Este Costo se encuentra Eliminado</b>
      </td>
    </tr>
  </logic:equal>
 
    <tr>
    <td>
    
       <table  width="100%">
          <tr>
              <td class="CformNombre" width="110">Descripción:</td>
        	    <td class="CformDato"><bean:write name="cCostoDetalleActionForm" property="descripcion"/></td>
           </tr>
        </table>
    
    </td>
    </tr>
    
    <tr>
      <td>

	<logic:empty  property="composicionCostoStruct" name="cCostoDetalleActionForm">
      <table width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Componentes del Costo&nbsp;: No se informaron costos</td>
        </tr>
      </table>
     </logic:empty>

     <logic:notEmpty property="composicionCostoStruct" name="cCostoDetalleActionForm">
      <table align="left"  width="100%">
        <tr bgcolor="#DDEEFF">
           <td>Componentes del Costo:</td>
        </tr>
          <tr>
            <td colspan="10">
              <display:table name="sessionScope.cCostoDetalleActionForm.composicionCostoStruct" id="costoDetalle" style="width: 100%" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
                <display:column property="tipoEgresoDescripcion" title="Descripción" headerClass="tableCellHeader" />
                <display:column property="importePorcentual" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;width:20%"  />
              </display:table>
            </td>
          </tr>
       </table>
      </logic:notEmpty >
      <table  width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Subtotal</td>
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
     <table  width="100%">
      <tr>
        <td align="left" width="320">&nbsp;% Factor de Riesgo</td>
        <td class="CformDato" width="130" align="left" style="text-align:right;">
          <bean:write property="porcentajeImprevisto" name="cCostoDetalleActionForm"/>
        </td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="imprevisto" name="cCostoDetalleActionForm"/>
        </td>
      </tr>
     </table>
     <table  width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Subtotal</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="subtotal" name="cCostoDetalleActionForm"/>
        </td>
      </tr>
     </table>
     <table align="center"  width="100%" >
        <tr bgcolor="#DDEEFF">
           <td>Comisiones:</td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cCostoDetalleActionForm.distribucionCosto" id="costoAlta" style="width:100%" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
              <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader"  />
              <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:400px;" />
              <display:column property="porcentajeComisionDetalle" title="%" headerClass="tableCellHeader" style="text-align:right;width: 20%" />
              <display:column property="importeComisionDetalle" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;width:20%" />
            </display:table>
          </td>
        </tr>
     </table>
     <table  width="100%">
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Total Comisiones</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="totalComisiones" name="cCostoDetalleActionForm"/>
        </td>
      </tr>
      <tr class="tableRowFooter">
        <td align="left" width="450">&nbsp;Costo Mínimo</td>
        <td class="CformDato" width="150" align="left" style="text-align:right;">
          <bean:write property="importe" name="cCostoDetalleActionForm"/>
        </td>
      </tr>
     </table>
     <table  width="100%">
       <tr>
           <td class="CformNombre" width="110">
                 Observaciones:&nbsp;
           </td>
           <td class="CformDato">
                 <bean:write name="cCostoDetalleActionForm" property="observaciones" />
           </td>
       </tr>
     </table>
      
      
       
      
      </td>
    </tr>

  <tr>
    <td class="CformAreaBotones" height="35"><span class="dato_obligatorio"></span>
      <div align="right">
      	<logic:notEqual value="S" property="soloConsulta" name="cCostoDetalleActionForm" >
		      	<logic:notEqual value="E" property="estado" name="cCostoDetalleActionForm">
							<!-- SI EL COSTO TIENE TIPOS DE EGRESO DESHABILITADOS NO SE PUEDE MODIFICAR -->
							<logic:equal value="S" property="modificable" name="cCostoDetalleActionForm">
					        	<html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
					        	<html:submit property="btnSubmit" styleClass="CformBoton" value="Copiar"/>
							</logic:equal>
							<!-- logic:equal value="S" property="eliminable" name="cCostoDetalleActionForm"-->
				    	    	<html:submit property="btnSubmit" styleClass="CformBoton" value="Eliminar"/>
							<!-- /logic:equal-->
							<!-- logic:equal value="N" property="eliminable" name="cCostoDetalleActionForm"-->
								
								<logic:equal value="I" property="estado" name="cCostoDetalleActionForm">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Habilitar"/>
								</logic:equal>
								<logic:equal value="N" property="estado" name="cCostoDetalleActionForm">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Deshabilitar"/>
								</logic:equal>
							<!-- /logic:equal-->
		        </logic:notEqual>
		</logic:notEqual>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
      </div>
    </td>
  </tr>

</table>

</logic:equal>
</html:form>

