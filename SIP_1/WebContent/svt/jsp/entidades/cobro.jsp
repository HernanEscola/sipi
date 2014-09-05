<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>


<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />

<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<bean:define id="loteFacturas" name="formulario" property="loteFacturas" />
<bean:define id="transferencias" name="formulario" property="cobroTransferencias" />
<bean:define id="cobroFecha" name="formulario" property="cobroFecha" />
<bean:define id="importe" name="formulario" property="importe" />
<bean:define id="botones" name="formulario" property="botones" />
<bean:define id="transferido" name="formulario" property="transferido" />
<bean:define id="pathDelDecorator">
             					<bean:write name="formulario" property="pathDelDisplayWrapper"/>
</bean:define>






<script>


$(document).ready(function() {
	   
	   var input = new CInputNumero(true);
	   input.bind("input[id='retenciones']");//selector de jquery

	   var input2 = new CInputNumero(false);
	   input2.bind("input[id='cobroSufijo']");//selector de jquery
	   input2.bind("input[id='cobroPrefijo']");//selector de jquery
	   

});
   
function habilitarProvincia(){
	if ( $('#tipoRetencion').val() == "IIBB"){
		$('#provincia').attr('disabled',false);
		
	} else{
		$('#provincia').attr('value',"-1");
		$('#provincia').attr('disabled',true);
	}
}


function calcularTotalImporte(obj,pos){
	 formatImporte($(obj)[0]);
	if (Number($('#importeFacturasAnterior_'+pos).attr('value')) !=Number($('#importeFacturas_'+pos).attr('value')) ){ 
		document.<%= request.getParameter("formulario") %>.submit();
 	}
  	
	
	  var i = Number(0);
	  var importe=0;
	  var totalFacturas=0;
	  var retenciones=Number($('#retenciones').attr('value'));
	 
	  
	  
	  $("[id^='importeFacturas_']").each(function() {
		  if ($(this).attr('value') == "" ) {
			  $(this).attr('value', "0");
		  	}
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
   	  			  totalFacturas=Number(totalFacturas)+Number((importe).toFixed(2));
			  }
	    	i= Number(i)+Number(1); 
		  });
     $('#importe').attr('value', totalFacturas.toFixed(2));
     totalFacturas=Number(totalFacturas)-Number((retenciones).toFixed(2));
     $('#subtotal').attr('value', totalFacturas.toFixed(2));
     



     
}




</script>
 
<logic:equal value="input" name="tipoPantalla">
<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_cobro_fecha"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	    <tr>
	      <td>
	        <table align="center" cellpadding="0" cellspacing="0" width="100%">
	        	<tr>
                 <td>
		        	 <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Cobro &nbsp;</strong>
						        </td>
						      </tr>
						</table>
					</td>
				 </tr>	

	        	<tr>
                 <td>
		        	 <table width="100%">
			    			 <tr>
			                    <td class="CformNombre">Fecha:<span class="dato_obligatorio">*</span></td>
			                    <td class="CformDato" >
			                          <html:text styleId="id_cobro_fecha" property="cobroFecha" maxlength="10" size="10" onkeypress="validarNumero()"/>
			                    </td>
			                 
			                    <td class="CformNombre">Nro.Recibo:</td>
			                    <td class="CformDato">
			                      <html:text styleId="cobroPrefijo" property="cobroPrefijo" maxlength="4" size="4" onchange="completarCerosSiInforma(this,4)" />-
			                      <html:text styleId="cobroSufijo" property="cobroSufijo" maxlength="8" size="10" onchange="completarCerosSiInforma(this,8)" />
			                    </td>
			                 </tr>
			                
				   
				    </table>   
		    	</td>
			  </tr>	                    
            
              <tr>
                <td>
		    
				    <table width="100%">
					      <tr bgcolor="#BFDFFF">
					        <td>
					          <strong>Facturas &nbsp;<span class="dato_obligatorio">*</span></strong>
					        </td>
					      </tr>
					</table>
					<table width="100%">
					      <tr width="600">
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= loteFacturas %>' id='<%= pageName %>' decorator="conicet.apps.siuvt.web.ingreso.decorator.CCobroFacturasDisplayWrapper">
					            <display:column property="indice" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
					            <display:column property="facturaFecha" title="Fecha" headerClass="tableCellHeader" style="width: 350px;" />
					            <display:column property="facturaNro" title="Nro." headerClass="tableCellHeader" style="width: 350px;" />

					            <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
	    	        			<display:column property="contratante" title="Contratante" headerClass="tableCellHeader" style="width: 350px;" />

					            <display:column property="facImporte" title="Imp.Total($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
					            <display:column property="saldo" title="Imp.Pendiente($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
					            <display:column property="importeSinRetencionDeEsteCobro"  title="Cobro s/Ret($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
					            <display:column property="retencionDeEsteCobro" title="Retención($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
				             	<logic:notEqual value="true" name="transferido">
				             		<display:column property="importe" title="Imp.Cobrado($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
					          	</logic:notEqual>
				             	<logic:equal value="true" name="transferido">
				             		<display:column property="importeCfm" title="Imp.Cobrado($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
					          	</logic:equal>
					          	
					          <display:footer>
	        					<td class="tableCell" colspan=7 style="text-align:right"><b> Totales  $</b></td>
	        					<td  headerClass="tableCellHeader" style="text-align:right;width: 100px;"><b>
	        						<html:text readonly="true" styleId="subtotal" style="text-align:right;" maxlength="12" size="10"  property="subtotal" onblur="formatImporte(this)"  />
				        		</b></td>
	        					<td  headerClass="tableCellHeader" style="text-align:right;width: 100px;"><b>
	        						<html:text readonly="true" styleId="retenciones" style="text-align:right;" maxlength="12" size="10"  property="retenciones" onblur="formatImporte(this)"  />
				        		</b></td>
	        					<td  headerClass="tableCellHeader" style="text-align:right;width: 100px;"><b>
	        						<html:text readonly="true" styleId="importe" style="text-align:right;" maxlength="12" size="10"  property="importe" onblur="formatImporte(this)"  />
				        		</b></td>
					          </display:footer>
					          
					          </display:table>
					          
					        </td>
					      </tr>
						  
						</tr>
 					   <logic:notEqual value="true" name="transferido">
						   <tr  width="600">
						        <td  colspan="10" >
					              <div align="right" >
				  	                <html:submit property="btnSeleccionarFacturas" styleClass="CformBoton" value="Seleccionar"/>
					              </div>
					 	        </td>
					 	     
						      </tr>
				       </logic:notEqual> 		
					
					
					
					</table>
				</td>
			  </tr>	                    

             


			<tr>
                 <td>
		        	 <table width="100%">
			                
			                 <tr>
			                    <td class="CformNombre" >Tipo Retención: </td>
			                    <td class="CformDato">
					             <html:select  property="tipoRetencion" styleId="tipoRetencion" onchange="habilitarProvincia()">
				                 <html:options collection="comboTipoRetencion" property="value" labelProperty="label"  />
				                 </html:select>
					            <logic:equal value="IIBB" property="tipoRetencion" name="formulario">
					             <html:select  property="provincia" styleId="provincia"  >
				                 <html:options collection="comboProvincia" property="value" labelProperty="label"  />
				                 </html:select>
					            </logic:equal>
					            <logic:notEqual value="IIBB" property="tipoRetencion" name="formulario">
					             <html:select  property="provincia" styleId="provincia" disabled="true" >
				                 <html:options collection="comboProvincia" property="value" labelProperty="label"  />
				                 </html:select>
					            </logic:notEqual>
					            
					            </td>
			                 </tr>
				        
							
				   
						<tr>
		                  <td class="CformNombre">
		                      Observaciones:&nbsp;
		                   </td>
		                   <td class="CformDato">
		                      <html:textarea styleId="observaciones" property="observaciones" />
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
            <jsp:param name="entidad" value="cobro" />
          </jsp:include>
        </div>
      </td>
</tr>
</table>


<logic:equal value="true" name="transferido">
        <table align="center" cellpadding="0" cellspacing="0" width="550">
              <tr >
                <td >
                  <b>
                  Atención: Cobro con transferencias. No podrá modificar su importe ni distribución.
					</b>
                </td>
              </tr>
           </table>
</logic:equal>


		 
		 

</logic:equal>
    
<logic:equal value="view" name="tipoPantalla"> 


<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	<tr>
	 <td>
	 <table align="center" cellpadding="0" cellspacing="0" width="100%">

				<tr>
                   <td>
		        	   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Cobro &nbsp;</strong>
						        </td>
						      </tr>
						</table>
					</td>
				 </tr>	

	        	<tr>
                 <td>
		        	 <table width="100%">
		    			 <tr>
		                     <td class="CformNombre" width="150">Fecha:</td>
		                     <td class="CformDato" ><bean:write name="formulario" property="cobroFecha"/></td>
		                
		                     <td class="CformNombre">Nro. Recibo:</td>
		                     <td class="CformDato">
							       <bean:write name="formulario" property="cobroPrefijo"/>
							       - <bean:write name="formulario" property="cobroSufijo"/></td>
		                     
		                 </tr>
		              </table>
		          </td>       
		 		</tr>
		 		

	        <tr>
                 <td>
				    <table width="100%">
					      <tr bgcolor="#BFDFFF">
					        <td>
					          <strong>Facturas &nbsp;</strong>
					        </td>
					      </tr>
					</table>
					<table width="100%">
					      <tr>
					        <td colspan="10" width="100%">
					        
					         <display:table class="displayTable" style="width: 100%" name="<%= loteFacturas %>" id="<%= pageName %>" decorator="<%= pathDelDecorator %>"   >
							            <display:column property="indice" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
							            <display:column property="facturaFecha" title="Fecha" headerClass="tableCellHeader" style="width: 350px;" />
							            <display:column property="facturaNro" title="Nro." headerClass="tableCellHeader" style="width: 350px;" />
		
							            <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
			    	        			<display:column property="contratante" title="Contratante" headerClass="tableCellHeader" style="width: 350px;" />
		
							            <display:column property="facImporte" title="Imp.Total($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
							            
							            <display:column property="saldo" title="Imp.Pendiente($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
							            <display:column property="importeSinRetencionDeEsteCobro" title="Cobro s/Ret($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
							            <display:column property="retencionDeEsteCobro" title="Retención($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
							            
							            <display:column property="importeCfm" title="Imp.Cobrado($)" headerClass="tableCellHeader" style="width: 350px;text-align: right" />
							          <display:footer>
							         	 <tr class="tableRowFooter">
				        					<td class="tableCell" colspan=7 style="text-align:right"><b> Totales  $</b></td>
				        					<td  headerClass="tableCellHeader" style="text-align:right;width: 100px;"><b>
				        						<bean:write name="formulario" property="subtotal"/>
							        		</b></td>
				        					<td  headerClass="tableCellHeader" style="text-align:right;width: 100px;"><b>
				        						<bean:write name="formulario" property="retenciones"/>
							        		</b></td>
				        					<td  headerClass="tableCellHeader" style="text-align:right;width: 100px;"><b>
				        						<bean:write name="formulario" property="importe"/>
							        		</b></td>
										</tr>
							          </display:footer>
							          </display:table>
					          
					        </td>
					      </tr>
					      
					      
					</table>
			   </td>
		   </tr>

	        	<tr>
                 <td>
		        	 <table width="100%">
				     
						<tr>					
				         	<td class="CformNombre" >Tipo Retención: </td>
				         	<td class="CformDato"> 
					             <html:select  property="tipoRetencion" styleId="tipoRetencion" disabled="true">
				                 <html:options collection="comboTipoRetencion" property="value" labelProperty="label"  />
				                 </html:select>
				                 
					             <html:select  property="provincia" disabled="true">
				                 <html:options collection="comboProvincia" property="value" labelProperty="label"  />
				                 </html:select>
 				           </td>
						
		                  
						</tr>
				  
				       
						<tr >
		                  <td class="CformNombre">Observaciones: </td>
		                   <td  class="CformDato" style="width: 500px;" ><bean:write name="formulario" property="observaciones"/></td>
		            	</tr>     
						 
						    
				    </table>
		    	</td>
			</tr>		
			
			<logic:notEqual name="formulario" property="valueEAccion" value="alta"> 
		 	<tr>
			   <td>
			       <table align="center" width="100%">
	                    <tr bgcolor="#BFDFFF">
	                       <td>
	                       <strong>Transferencias:</strong></td>
	                    </tr>
	                    <tr>
	                      <td colspan="10">
	                        <display:table name='<%= transferencias %>' id='<%= pageName %>' decorator="conicet.apps.siuvt.web.ingreso.decorator.CEgresosImporteDisplayWrapper" style="width: 100%;">
	                          	<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 15px;" />
	                          <display:column property="fechaTransferencia" title="Fecha de Transferencia" headerClass="tableCellHeader" style="" />
	                          <display:column property="tipoTransferencia" title="Tipo"  headerClass="tableCellHeader" style="" /> 
	                          <display:column property="parteTransferencia" title="Cont. / Prestador / Bene"  headerClass="tableCellHeader" style="" />                               
	                          <display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="text-align:right;" />          
	                        </display:table>
	                      </td>
	                    </tr>
			       </table>
               </td>
		 	</tr> 
		 	</logic:notEqual>
	        	


			

	</table>
    </td>
  </tr>
	
	
    <tr>
    
    
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
            <jsp:param name="entidad" value="cobro" />
          </jsp:include>
        </div>
      </td>
    </tr>
      
</table> 


</logic:equal> 

