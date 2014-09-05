<%@include file="/jsp/layout/include.jsp"%>

<bean:define id="form" name='<%= request.getParameter("formulario") %>' />

<bean:define id="costosNoRecuperados" name="form" property="costosNoRecuperados" />
<bean:define id="prestador" name="form" property="listaPrestador" />
<bean:define id="cantidad" name="form" property="cantidad" />
<bean:define id="costos" name="form" property="costos" />
<bean:define id="costosAdicionales" name="form" property="costosAdicionales" />
<bean:define id="distribucion" name="form" property="distribucionStructConsulta" />
<bean:define id="distribucionAdicional" name="form" property="distribucionAdicionalConsulta" />
<bean:define id="botones" name="form" property="botones" />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />

<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<style>
#debug {
    align: center;
}
</style>


<logic:equal value="view" name="tipoPantalla">
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
    <tr>
      <td colspan="2" width="100%">
        <table align="center" cellpadding="0" cellspacing="0" width="100%" >
          <tr>
            <td>
              <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td>
                                       
                 
                    <table width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                        <td>
                           

                         
                         
                          <table width="100%">
                            <tr>
                              <td class="labelSeparador">
                                Precio Sugerido
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                             <tr>
		                      <td  width="10" class="CformNombre">
		                        Descripción:&nbsp;
		                      </td>
		                      <td class="CformDato">
		                        
		                        <bean:write property="descripcionPrecioSugerido" name="form" />
		                      </td>
		                    </tr>
		                  </table>


                          <table width="100%">
                            <tr>
                              <td class="labelSeparador">
                                Costo Mínimo&nbsp;
                              </td>
                            </tr>
                          </table>
                           
                           
	                          <table width="100%">
	                            <tr>
	                              <td colspan="20">
	                                <display:table class="displayTable" name='<%= costos %>' id='<%= pageName %>' defaultsort="1" defaultorder="descending" style="width: 100%"  decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
	                                  <logic:equal value="si" name="displayLinks">
	                                    <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
	                                  </logic:equal>
	                                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 400px;" />
	                                  <display:column property="costoPesos" title="Importe ($)" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 150px;" />
	                                </display:table>
	                              </td>
	                            </tr>
	                          </table>

                          <table width="100%">
                            <tr>
                              <td class="labelSeparador">
                                Precio Oferta
                              </td>
                            </tr>
                          </table>
		                    
		                    
		                  <table width="100%">
                            
                            
                            <tr>
                              <td width="128" class="CformNombre">
                                Margen de Ganancia:&nbsp;
                              </td>
                              <td class="CformDato" width="8">
                                <html:radio disabled="true" property="tipoMargenGanacia" value="porcentual" name="form"/>
                              </td>
                              <td width="15" class="CformNombre">
                                %
                              </td>
                              <td class="CformDato" width="106">
                                <html:text styleClass="textDisabled" readonly="true" property="porcentajeGanancia" style="text-align:right" size="6" maxlength="4" styleId="porcentajeGanancia"/>
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="margenGananciaPorcentual" size="16" maxlength="12" styleId="margenGananciaPorcentual"/>
                              </td>
                            </tr>
                            <tr>
                              <td/>
                              <td class="CformDato" width="8">
                                <html:radio disabled="true" property="tipoMargenGanacia" value="neto" name="form"/>
                              </td>
                              <td width="15" class="CformNombre">
                                $
                              </td>
                              <td/>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" readonly="true" property="margenGananciaNeto" style="text-align:right" size="16" maxlength="12" styleId="margenGananciaNeto"/>
                              </td>
                            </tr>
                          </table>
                          <table width="100%">
                            <tr>
                              <td width="285" class="CformNombre">
                                Ajuste comisiones sobre margen de ganancia:&nbsp;
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="ajusteComisionesGanancia" size="16" maxlength="12" styleId="ajusteComisionesGanancia"/>
                              </td>
                            </tr>
                            <tr>
                              <td class="CformNombre">
                                Precio Oferta:&nbsp;
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="ofertaPrecio" size="16" maxlength="12" styleId="ofertaPrecio"/>
                              </td>
                            </tr>
                          
                            
                            <tr>
                              <td  class="CformNombre" >
                                Precio Final                             
                                  <span class="dato_obligatorio">(1)</span>
                                
                              </td>
                              <td class="CformDato">
                                <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="precioFinal" size="16" maxlength="12" styleId="precioFinal"/>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    
                    <table align="center" width="100%">
                      <tr class="labelSeparador">
                         <td>Comisiones:</td>
                      </tr>
                      <tr>
                        <td colspan="10">
                       
                          <display:table name='<%= distribucion %>' id='<%= pageName %>'  style="width: 100%" decorator="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoComisionesDisplayWrapper">
                            <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                            <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                            <display:column property="porcentajeComisionCfm" title="%" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="importeComisionCfm" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                   <table width="100%">
                      <tr>
                        <td width="370" class="CformNombre" style="text-align: left;" colspan="3">
                          Total Comisiones:&nbsp;
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="totalComisiones" size="16" maxlength="12" styleId="totalComisiones"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="370" class="CformNombre" style="text-align: left;" colspan="3">
                          Costos:&nbsp;
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="recuperoDeFondos" size="16" maxlength="12" styleId="recuperoDeFondos"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="370" class="CformNombre" style="text-align: left;" colspan="3">
                          Saldo a Distribuir (Beneficio):&nbsp;
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="saldoADistribuir" size="16" maxlength="12" styleId="saldoADistribuir"/>
                        </td>
                      </tr>
                    </table>
                    <table align="center" width="100%">
                      <tr>
                        <td colspan="10">
                    
                          <display:table name='<%= distribucionAdicional %>' id='<%= pageName %>'  style="width: 100%" decorator="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoComisionesDisplayWrapper">
                            <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:180px;" />
                            <display:column property="sugeridoComision" title="% Institucionales" headerClass="tableCellHeader" style="width:170px;" />
                            <display:column property="porcentajeComisionAdicionalCfm" title="%" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="importeComisionAdicionalCfm" title="Importe ($)" headerClass="tableCellHeader" style="width:150px;" />
                          </display:table> 
                   
                          
                        </td>
                      </tr>
                    </table>
                    <logic:notEqual name="costosNoRecuperados" value="0.00">
                      <table width="100%">
                        <tr>
                        <td width="370" class="CformNombre" style="text-align: left;" colspan="3">
                          Costos no recuperados:&nbsp;
                        </td>
                        <td class="CformDato">
                          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="costosNoRecuperados" size="16" maxlength="12" styleId="costosNoRecuperados"/>
                        </td>
                      </tr>
                      </table>
                    </logic:notEqual>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
            <jsp:param name="entidad" value="precio_sugerido" />
          </jsp:include>
        </div>
      </td>
    </tr>
  </table>
  <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>  
        <td ><span class="dato_obligatorio">(1)</span>
          El precio final ha sido redondeado al valor entero superior.
        </td>
      </tr>
  </table>

</logic:equal>