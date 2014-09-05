<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>


<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />

<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<bean:define id="fechaRecepcion" name="formulario" property="fechaRecepcion" />


<script>
$(document).ready(function() {
	   
	   var input = new CInputNumero(false);
	   input.bind("input[id='anio']");//selector de jquery
	   

});

function isMaxLength(ta,maxlength){
	var mlength = parseInt(maxlength);
	if (ta.getAttribute && ta.value.length>mlength){
		ta.value=ta.value.substring(0,mlength);
	}
}
</script>
<html:hidden property="fechaPresentacion"/>
<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fechaRecepcion"/>
<logic:equal value="input" name="tipoPantalla">

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">
	<tr>
	 <td>
	 <table align="center" cellpadding="0" cellspacing="0" width="100%">
				   <tr>
                 <td>
		        	 <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Informe &nbsp;</strong>
						        </td>
						      </tr>
						</table>
					</td>
				 </tr>	

	        	<tr>
                 <td>
		        	 <table width="100%">
		        	 
						      <!--  si no hay presentacion  puede modificar -->
						     <logic:empty property="fechaPresentacion" name="formulario">   
							      <tr>
							        <td class="CformNombre" >UVT:<span class="dato_obligatorio">*</span> </td>
				                    <td class="CformDato">
						                 <html:select  property="uvtId">
						                 <html:options collection="comboInformarA" property="value" labelProperty="label"  />
						                 </html:select>
						            </td>
						          </tr> 
	   						      <tr>
			                      	<td class="CformNombre" width="220">Año:<span class="dato_obligatorio">*</span>  </td>
			                      	<td class="CformDato" ><html:text styleId="anio" property="anio" size="4" maxlength="4" /></td>
							      </tr>
			                     <tr>
							        <td class="CformNombre">Trimestre:<span class="dato_obligatorio">*</span> </td>
				                    <td class="CformDato">
						                 <html:select  property="trimestre">
						                 <html:options collection="comboTrimestre" property="value" labelProperty="label"  />
						                 </html:select>
						            </td>
						         </tr> 
						         <tr>
						        	<td class="CformNombre">Estado:<span class="dato_obligatorio">*</span> </td>
			                    	<td class="CformDato">
					                 <html:select  property="estado">
					                 <html:options collection="comboTipoEstado" property="value" labelProperty="label"  />
					                 </html:select>
					            	</td>
					         	</tr>
							</logic:empty>
							
							<!-- si hay presentacion solo podrá modificar observaciones y quien recibe el estado y fecha recepcion -->
							<logic:notEmpty property="fechaPresentacion" name="formulario">   
							      <tr>
							        <td class="CformNombre" >UVT: </td>
				                    <td class="CformDato">
						                 <html:select  property="uvtId" disabled="true">
						                 <html:options collection="comboInformarA" property="value" labelProperty="label"  />
						                 </html:select>
						            </td>
						          </tr> 
	   						      <tr>
			                      	<td class="CformNombre" width="220">Año: </td>
			                      	<td class="CformDato" ><bean:write name="formulario" property="anio" /></td>
							      </tr>
			                     <tr>
							        <td class="CformNombre">Trimestre:<span class="dato_obligatorio">*</span> </td>
				                    <td class="CformDato">
						                 <html:select  property="trimestre" disabled="true">
						                 <html:options collection="comboTrimestre" property="value" labelProperty="label"  />
						                 </html:select>
						            </td>
						         </tr> 
							
						    	<!--  si no es quien recibe no podra modificar estado y fecha recepcion -->	         	   
 							 	<logic:empty property="recibe" name="formulario">
								         <tr>
								        	<td class="CformNombre">Estado:<span class="dato_obligatorio">*</span> </td>
					                    	<td class="CformDato">
							                 <html:select  property="estado" disabled="true">
							                 <html:options collection="comboTipoEstado" property="value" labelProperty="label"  />
							                 </html:select>
							            	</td>
							         	</tr>
							         	<tr>
					                      	<td class="CformNombre" width="220">Fecha Presentación: </td>
					                      	<td class="CformDato" ><bean:write name="formulario" property="fechaPresentacion" /></td>
									 	</tr>
									 	<logic:notEmpty property="fechaRecepcion" name="formulario"> 
										 	<tr>			
										 	   	<td class="CformNombre" width="220">Fecha Recepción: </td>
						                      	<td class="CformDato" ><bean:write name="formulario"  property="fechaRecepcion" /></td>
											 </tr>
										</logic:notEmpty>					            
					         	</logic:empty>
					         	
						        <logic:notEmpty property="recibe" name="formulario">
						         <tr>
						        	<td class="CformNombre">Estado:<span class="dato_obligatorio">*</span> </td>
			                    	<td class="CformDato">
					                 <html:select  property="estado" >
					                 <html:options collection="comboTipoEstado" property="value" labelProperty="label"  />
					                 </html:select>
					            	</td>
					         	</tr>
					         	<tr>
			                      	<td class="CformNombre" width="220">Fecha Presentación: </td>
			                      	<td class="CformDato" ><bean:write name="formulario" property="fechaPresentacion" /></td>
							 	</tr>			

 								<tr>
			                      	<td class="CformNombre" width="220">Fecha Recepción:<span class="dato_obligatorio">*</span></td>
			                      	<td class="CformDato">&nbsp;<html:text property="fechaRecepcion" styleId="id_fechaRecepcion"  size="10" maxlength="10" />
									</td>
								</tr>	
								</logic:notEmpty>					         	
              	
							</logic:notEmpty>

					         <tr>
			                      <td width="150" class="CformNombre">Observaciones: </td>
			                      <td class="CformDato" ><html:textarea styleId="observaciones"  property="observaciones"  rows="3" onkeyup="isMaxLength(this,250)"  /></td>
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
            <jsp:param name="entidad" value="informe" />
          </jsp:include>
        </div>
      </td>
    </tr>
      
</table> 
</logic:equal>
    
<logic:equal value="view" name="tipoPantalla"> 

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">
	<tr>
	 <td>
	 <table align="center" cellpadding="0" cellspacing="0" width="100%">
				<tr>
                 <td>
		        	 <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Informe &nbsp;</strong>
						        </td>
						      </tr>
						</table>
					</td>
				 </tr>	

	        	<tr>
                 <td>
		        	 <table width="100%">
						      </tr>
						          <td class="CformNombre" >UVT:</td>
			                    <td class="CformDato">
					                 <html:select  property="uvtId" disabled="true">
					                 <html:options collection="comboInformarA" property="value" labelProperty="label"  />
					                 </html:select>
					            </td>
					         </tr> 
		                     
   						      <tr>
		                      <td class="CformNombre" width="220">Año: </td>
		                      <td class="CformDato" ><bean:write name="formulario" property="anio"/></td>
						      </tr>
		                     <tr>
						       <td class="CformNombre" >Trimestre: </td>
			                    <td class="CformDato">
					                 <html:select  property="trimestre" disabled="true">
					                 <html:options collection="comboTrimestre" property="value" labelProperty="label"  />
					                 </html:select>
					            </td>
					         </tr> 
						     <tr>
						         <td class="CformNombre" >Estado: </td>
			                     <td class="CformDato">
					                 <html:select  property="estado" disabled="true">
					                 <html:options collection="comboTipoEstado" property="value" labelProperty="label"  />
					                 </html:select>
					             </td>
					            </tr>  
							<logic:equal property="estado" value="P" name="formulario">   
     					        <tr>
			                      	<td class="CformNombre" width="220">Fecha Presentación: </td>
			                      	<td class="CformDato" ><bean:write name="formulario" property="fechaPresentacion" /></td>
							    </tr>
							</logic:equal>					            
							<logic:equal property="estado" value="R" name="formulario"> 
     					        <tr>
			                      	<td class="CformNombre" width="220">Fecha Presentación: </td>
			                      	<td class="CformDato" ><bean:write name="formulario" property="fechaPresentacion" /></td>
								</tr>
						        <tr>
			                      	<td class="CformNombre" width="220">Fecha Recepción: </td>
			                      	<td class="CformDato" ><bean:write name="formulario"  property="fechaRecepcion" /></td>
							    </tr>					            
							</logic:equal>
					         
					          <tr>
			                      <td width="150" class="CformNombre">Observaciones:</td>
			                      <td class="CformDato" ><bean:write  name="formulario"  property="observaciones"   /></td>
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
            <jsp:param name="entidad" value="informe" />
          </jsp:include>
        </div>
      </td>
    </tr>
      
</table> 


</logic:equal> 
