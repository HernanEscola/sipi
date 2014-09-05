<%@include file="layout/include.jsp"%>

<script>
</script>
<br>

<html:form action="cCostoAceptarModificacionesAction.do" method="POST">
  <h1 align="center" class="titulo">
    <bean:write name="cCostoAceptarModificacionesActionForm" property="tituloPantalla"/>
  </h1>
  <html:hidden property="accion" />
    
    
    
 
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%" >
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#BFDFFF">
              <td>
                <strong>Costo&nbsp;</strong>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      
	<logic:notEqual value="M" property="tipoPantalla" name="cCostoAceptarModificacionesActionForm">
      	  <tr>
	        <td>
	          <table width="100%">
	            <tr>
	              <td class="CformNombre" width="20%">Descripción:</td>
	              <td class="CformDato">
	                <bean:write name="cCostoAceptarModificacionesActionForm" property="descripcionNew" />
	              </td>
	            </tr>
	            <logic:notEqual value="" property="costoOtraMonedaNew" name="cCostoAceptarModificacionesActionForm">
	              <tr>
	                <td class="CformNombre" width="20%">En Otra Moneda:</td>
	                <td class="CformDato">
	                  <bean:write name="cCostoAceptarModificacionesActionForm" property="costoOtraMonedaNew" />
	                </td>
	            </tr>
	          </logic:notEqual>
	        </table>
	        </td>
	      </tr>
	      <tr>
	        <td>
	       <logic:empty property="composicionNew" name="cCostoAceptarModificacionesActionForm">
	        <table width="100%">
	              <tr bgcolor="#DDEEFF">
	                <td>
	                  Componentes del Costo&nbsp;: No se informaron costos
	                </td>
	              </tr>
	         </table>
	       </logic:empty>
	       <logic:notEmpty property="composicionNew" name="cCostoAceptarModificacionesActionForm">
	        <table width="100%">
	                <tr bgcolor="#DDEEFF">
	           			<td>Componentes del Costo:</td>
	        		</tr>
	            
	              <tr>
	                <td colspan="10">
	                  <display:table style="width:100%"  name="sessionScope.cCostoAceptarModificacionesActionForm.composicionNew" id="costoDetalle" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CCostoAceptarModificacionesDisplayWrapper">
	                    <display:column property="tipoEgreso" title="Descripción" headerClass="tableCellHeader" style="width: 60%;" />
	                    <display:column property="importePesos" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;width:40%;" />
	                  </display:table>
	                </td>
	              </tr>
	       </table>
	       </logic:notEmpty>
	      <table width="100%">
	      <tr class="tableRowFooter">
	        <td align="left" width="60%">&nbsp;Subtotal</td>
	        <td class="CformDato" width="40%" align="right" style="text-align:right;">
	          <bean:write property="sumaCostosNew" name="cCostoAceptarModificacionesActionForm"/>
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
	        <td align="left" width="30%">&nbsp;% Factor de Riesgo</td>
	        <td class="CformDato" width="30%" align="left" style="text-align:right;">
	          <bean:write property="porcentajeImprevistoNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	        <td class="CformDato" width="40%" align="left" style="text-align:right;">
	          <bean:write property="imprevistoNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	      </tr>
	     </table>
	     <table width="100%">
	      <tr class="tableRowFooter">
	        <td align="left" width="60%">&nbsp;Subtotal</td>
	        <td class="CformDato" width="40%" align="left" style="text-align:right;">
	          <bean:write property="subtotalNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	      </tr>
	     </table>
	     <table align="center" width="100%">
	        <tr bgcolor="#DDEEFF">
	           <td>Comisiones:</td>
	        </tr>
	        <tr>
	          <td colspan="10">
	            <display:table style="width:100%"  name="sessionScope.cCostoAceptarModificacionesActionForm.distribucionNew" id="costoAlta" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
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
	        <td align="left" width="60%">&nbsp;Total Comisiones</td>
	        <td class="CformDato" width="40%" align="left" style="text-align:right;">
	          <bean:write property="totalComisionesNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	      </tr>
	      <tr class="tableRowFooter">
	        <td align="left" width="60%">&nbsp;Costo Mínimo</td>
	        <td class="CformDato" width="40%" align="left" style="text-align:right;">
	          <bean:write property="importeTotalNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	      </tr>
	     </table>
	     
	     <table width="100%">
	       <tr>
	           <td class="CformNombre" width="20%">
	                 Observaciones:&nbsp;
	           </td>
	           <td class="CformDato">
	                 <bean:write name="cCostoAceptarModificacionesActionForm" property="observacionesNew" />
	           </td>
	       </tr>
	     </table>
	     
	     
	        </td>
	      </tr>
	      <tr>
	        <td height="10" colspan="10"></td>
	      </tr>
	</logic:notEqual>      
      
      
      
	<logic:equal value="M" property="tipoPantalla" name="cCostoAceptarModificacionesActionForm">
      
	      <tr>
	        <td>
	          <table width="100%">
	            <tr>
	              <td class="CformNombre" width="20%">Descripción:</td>
	              <td class="CformDato">
	                <bean:write name="cCostoAceptarModificacionesActionForm" property="descripcionOriginal" />
	              </td>
	            </tr>
	          </table>
	        </td>
	      </tr>
	      <tr>
	        <td>
	          <logic:empty property="composicionOriginal" name="cCostoAceptarModificacionesActionForm">
	            <table width="100%">
	              <tr bgcolor="#DDEEFF">
	                <td>
	                  Componentes del Costo&nbsp;: No se informaron costos
	                </td>
	              </tr>
	            </table>
	          </logic:empty>
	          <logic:notEmpty property="composicionOriginal" name="cCostoAceptarModificacionesActionForm">
	            <table width="100%">
	             <tr bgcolor="#DDEEFF">
	           		<td>Componentes del Costo:</td>
	        	</tr>
	              <tr>
	                <td colspan="10">
	                  <display:table  style="width:100%"   name="sessionScope.cCostoAceptarModificacionesActionForm.composicionOriginal" id="costoDetalle" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CCostoAceptarModificacionesDisplayWrapper">
	                    <display:column property="tipoEgreso" title="Descripción" headerClass="tableCellHeader" style="width: 60%;" />
	                    <display:column property="importePesos" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;width:40%;" />
	                  </display:table>
	                </td>
	              </tr>
	            </table>
	          </logic:notEmpty>
	          <table width="100%">
	            <tr class="tableRowFooter">
				        <td align="left" width="60%">&nbsp;Subtotal</td>
				        <td class="CformDato" width="40%" align="right" style="text-align:right;">
	                <bean:write property="sumaCostosOriginal" name="cCostoAceptarModificacionesActionForm"/>
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
				        <td align="left" width="30%">&nbsp;% Factor de Riesgo</td>
				        <td class="CformDato" width="30%" align="left" style="text-align:right;">
				          <bean:write property="porcentajeImprevistoOriginal" name="cCostoAceptarModificacionesActionForm"/>
				        </td>
				        <td class="CformDato" width="40%" align="left" style="text-align:right;">
				          <bean:write property="imprevistoOriginal" name="cCostoAceptarModificacionesActionForm"/>
				        </td>
				      </tr>
	          </table>
	          <table width="100%">
				      <tr class="tableRowFooter">
				        <td align="left" width="60%">&nbsp;Subtotal</td>
				        <td class="CformDato" width="40%" align="left" style="text-align:right;">
				          <bean:write property="subtotalOriginal" name="cCostoAceptarModificacionesActionForm"/>
				        </td>
				      </tr>
				    </table>
	          <table align="center" width="100%">
			        <tr bgcolor="#DDEEFF">
			           <td>Comisiones:</td>
			        </tr>
			        <tr>
			          <td colspan="10">
			            <display:table style="width:100%"   name="sessionScope.cCostoAceptarModificacionesActionForm.distribucionOriginal" id="costoAlta" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
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
				        <td align="left" width="60%">&nbsp;Total Comisiones</td>
				        <td class="CformDato" width="40%" align="left" style="text-align:right;">
				          <bean:write property="totalComisionesOriginal" name="cCostoAceptarModificacionesActionForm"/>
				        </td>
				      </tr>
				      <tr class="tableRowFooter">
				        <td align="left" width="60%">&nbsp;Costo Mínimo</td>
				        <td class="CformDato" width="40%" align="left" style="text-align:right;">
				          <bean:write property="importeTotalOriginal" name="cCostoAceptarModificacionesActionForm"/>
				        </td>
				      </tr>
	          </table>
	          <table width="100%">
			       <tr>
			           <td class="CformNombre" width="20%">
			                 Observaciones:&nbsp;
			           </td>
	                 <td class="CformDato"><bean:write name="cCostoAceptarModificacionesActionForm" property="observacionesOriginal" /></td>
			       </tr>
		     </table>
	        </td>
	      </tr>
	      <tr>
	        <td height="10" colspan="10"></td>
	      </tr>
	      <logic:notEmpty name="cCostoAceptarModificacionesActionForm" property="costoNuevo">
	      <tr>
	        <td>
	          <table width="100%">
	            <tr bgcolor="#BFDFFF">
	              <td>
	                <strong>Costo Modificado</strong>
	              </td>
	            </tr>
	          </table>
	        </td>
	      </tr>
	      <tr>
	        <td>
	          <table width="100%">
	            <tr>
	              <td class="CformNombre" width="20%">Descripción:</td>
	              <td class="CformDato">
	                <bean:write name="cCostoAceptarModificacionesActionForm" property="descripcionNew" />
	              </td>
	            </tr>
	            <logic:notEqual value="" property="costoOtraMonedaNew" name="cCostoAceptarModificacionesActionForm">
	              <tr>
	                <td class="CformNombre" width="20%">En Otra Moneda:</td>
	                <td class="CformDato">
	                  <bean:write name="cCostoAceptarModificacionesActionForm" property="costoOtraMonedaNew" />
	                </td>
	            </tr>
	          </logic:notEqual>
	        </table>
	        </td>
	      </tr>
	      <tr>
	        <td>
	          <logic:empty property="composicionNew" name="cCostoAceptarModificacionesActionForm">
	            <table width="100%">
	              <tr bgcolor="#DDEEFF">
	                <td>
	                  Componentes del Costo&nbsp;: No se informaron costos
	                </td>
	              </tr>
	            </table>
	          </logic:empty>
	          <logic:notEmpty property="composicionNew" name="cCostoAceptarModificacionesActionForm">
	            <table align="center" width="100%">
	                <tr bgcolor="#DDEEFF">
	           			<td>Componentes del Costo:</td>
	        		</tr>
	            
	              <tr>
	                <td colspan="10">
	                  <display:table style="width:100%"  name="sessionScope.cCostoAceptarModificacionesActionForm.composicionNew" id="costoDetalle" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CCostoAceptarModificacionesDisplayWrapper">
	                    <display:column property="tipoEgreso" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
	                    <display:column property="importePesos" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;width:150px;" />
	                  </display:table>
	                </td>
	              </tr>
	            </table>
	          </logic:notEmpty>
	          <table width="100%">
	      <tr class="tableRowFooter">
	        <td align="left" width="60%">&nbsp;Subtotal</td>
	        <td class="CformDato" width="40%" align="right" style="text-align:right;">
	          <bean:write property="sumaCostosNew" name="cCostoAceptarModificacionesActionForm"/>
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
	        <td align="left" width="30%">&nbsp;% Factor de Riesgo</td>
	        <td class="CformDato" width="30%" align="left" style="text-align:right;">
	          <bean:write property="porcentajeImprevistoNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	        <td class="CformDato" width="40%" align="left" style="text-align:right;">
	          <bean:write property="imprevistoNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	      </tr>
	     </table>
	     <table width="100%">
	      <tr class="tableRowFooter">
	        <td align="left" width="60%">&nbsp;Subtotal</td>
	        <td class="CformDato" width="40%" align="left" style="text-align:right;">
	          <bean:write property="subtotalNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	      </tr>
	     </table>
	     <table align="center" width="100%">
	        <tr bgcolor="#DDEEFF">
	           <td>Comisiones:</td>
	        </tr>
	        <tr>
	          <td colspan="10">
	            <display:table style="width:100%"  name="sessionScope.cCostoAceptarModificacionesActionForm.distribucionNew" id="costoAlta" decorator="conicet.apps.svt.web.costo.decorator.CCostoDistribucionDisplayWrapper">
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
	        <td align="left" width="60%">&nbsp;Total Comisiones</td>
	        <td class="CformDato" width="40%" align="left" style="text-align:right;">
	          <bean:write property="totalComisionesNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	      </tr>
	      <tr class="tableRowFooter">
	        <td align="left" width="60%">&nbsp;Costo Mínimo</td>
	        <td class="CformDato" width="40%" align="left" style="text-align:right;">
	          <bean:write property="importeTotalNew" name="cCostoAceptarModificacionesActionForm"/>
	        </td>
	      </tr>
	     </table>
	     
	     <table width="100%">
	       <tr>
	           <td class="CformNombre" width="20%">
	                 Observaciones:&nbsp;
	           </td>
	           <td class="CformDato">
	                 <bean:write name="cCostoAceptarModificacionesActionForm" property="observacionesNew" />
	           </td>
	       </tr>
	     </table>
	     
	     
	        </td>
	      </tr>
	      <tr>
	        <td height="10" colspan="10"></td>
	      </tr>
	      </logic:notEmpty>
     
     </logic:equal>
     
     
     
     
      <tr>
        <td class="CformAreaBotones" height="35">
          <div align="right">
            <logic:notEqual value="aceptado" property="estado" name="cCostoAceptarModificacionesActionForm">
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Aceptar" />
            </logic:notEqual>
            <logic:notEqual value="rechazado" property="estado" name="cCostoAceptarModificacionesActionForm">
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Rechazar" />
            </logic:notEqual>
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
          </div>
        </td>
      </tr>
    </table>
</html:form>

