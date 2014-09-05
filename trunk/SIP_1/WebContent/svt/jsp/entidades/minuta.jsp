<%@include file="/jsp/layout/include.jsp"%>

<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="actionPage" name="formulario" property="actionName" />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<bean:define id="botones" name="formulario" property="botones" />
<bean:define id="minutaFecha" name="formulario" property="minutaFecha" />
<bean:define id="minutaAsesoria" name="formulario" property="minutaAsesoria" />


<script>


	
  
  $(document).ready(function() {

  });
 
  function quitar(tipo ,index)
	{
	  submitAction("?method=remove "+tipo+"&removeIndex="+index);
	}
  
	
</script>
 
<logic:equal value="input" name="tipoPantalla">
<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_minuta" />

<div id="minuta">
<table class="tablaMin" align="center" cellpadding="0" cellspacing="0" width="720">
  <tr>
    <td class="CformAreaBotones">
      <div align="center">
        <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" onclick="irTabInicial()" />
        <input type="button" class="CformBotonTranspBorde" value="&lt;" onclick="irTabAnterior()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;"  onclick="irTabSiguiente()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|"  onclick="irTabFinal()" />
      </div>
    </td>
  </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	    <tr>
	      <td>
	        <table align="center" cellpadding="0" cellspacing="0" width="100%">
	        	<tr>
                 <td>
						
						
		                 <table width="100%">
						     <tr>
		                      <td class="CformNombre" width="20%">Fechas:</td>
		                      <td class="CformDato" width="80%">
									<table width="100%">
						    			<tr>
											<td >
											<display:table class="CFormDisplayTable" style="width: 80%" name='<%= minutaFecha %>' id='<%= pageName %>'
												decorator="conicet.apps.svt.web.minuta.decorator.CMinutaDisplayWrapper" >
												<display:column property="fechaMinuta" title="Fecha" headerClass="tableCellHeader" style="width: 100px;" />
												<display:column property="removeFecha" title="  " headerClass="tableCellHeader" style="width: 100px;" />
													<display:footer>
														<tr style="background-color: #FAFAFA;">
												
															<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 400px;">
															 <html:text name="formulario" styleId="id_fecha_minuta" property="fecha" size="10" maxlength="10" onkeypress="validarNumero()"/>
															</td>
		
															<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;">
															<html:submit style="width:100px;" property="btnSubmit"	value="Agregar Fecha" styleClass="CformBoton" />
															</td>
														</tr>
													</display:footer>
												</display:table>
											</td>
										</tr>
									</table>
			                          
		                      </td>
		                      </tr>     
						     
						     
						     
						     <tr>
		                      <td class="CformNombre" width="20%">Observaciones:</td>
		                      <td class="CformDato" width="80%">
		                          <html:textarea  property="observaciones" rows="3"/>
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
      <div align="left">
     <span class="dato_obligatorio">* Datos obligatorios</span>
     </div>
      <div align="right">
      	<logic:equal value="minutaAlta" name="pageName">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
        </logic:equal>
        <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
      </div>
    </td>
  </tr>

</table>	



</div>


<div id="distribucion">
  <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td class="CformAreaBotones">
        <div align="center">
          <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irTabInicial()" />
          <input type="button" class="CformBotonTranspBorde" value="<" onclick="irTabAnterior()" />
          <input type="button" class="CformBotonTranspBorde" value=">" onclick="irTabSiguiente()" />
          <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabFinal()" />
        </div>
      </td>
    </tr>
  </table>
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
	  <tr>
	   <td>
	   		<table width="100%">
				<tr bgcolor="#BFDFFF">
				         <td>
						          <strong>Asesorías &nbsp;</strong>
				        </td>
				</tr>
			</table>
						
			<table width="100%">
				     <tr>
					    <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= minutaAsesoria %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.minuta.decorator.CMinutaDisplayWrapper">
					            <display:column property="indice_Asesoria" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
										<display:column property="nrosOrden_Asesoria"  title="Nro.Orden"  headerClass="tableCellHeader"   style="width: 120px;" />
						 				<display:column property="nroAsesoriayAnioPresentacion_Asesoria" title="Nro.Asesoria"  headerClass="tableCellHeader"  style="width: 120px;" />
						 				<display:column property="descripcionAsesores_Asesoria" title="Asesor"  headerClass="tableCellHeader" style="width: 120px;" />
						 				<display:column property="descripcionContratante_Asesoria" title="Contratante"  headerClass="tableCellHeader" maxLength="40"  style="width: 120px;" />
						 				<display:column property="resolucionNroTipoAnio_Asesoria" title="Resolución"  headerClass="tableCellHeader"  style="width: 120px;" />
						 				<display:column property="montoTotal_Asesoria" title="Monto Total"  headerClass="tableCellHeader"    style="width: 120px;"  />
						 				<display:column property="removeAsesoria" title="  " headerClass="tableCellHeader" style="width: 10px;" />
						 				
					          </display:table>
					    </td>
				     </tr>
				     
				     
				       <tr>
						   <td  colspan="10" >
					             <div align="right" >
				  	                <html:submit property="btnSubmit" styleClass="CformBoton" value="Agregar Asesoria" />
					             </div>
					 	   </td>
						</tr>
			</table>
		</td>
	 </tr>
    <tr>
         <td class="CformAreaBotones">
           <div align="left"><span class="dato_obligatorio">* Datos obligatorios</span>
			</div>		          
           <div align="right">
		             <jsp:include page="/jsp/layout/botones.jsp">
		                <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
		                <jsp:param name="entidad" value="factura" />
		             </jsp:include> 
           </div>
	   </td>
	</tr>
		 
    </table>

	  </div>
	</div>

</logic:equal>









		  	


    
<logic:equal value="view" name="tipoPantalla"> 

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	<tr>
	 <td>
	 <table align="center" cellpadding="0" cellspacing="0" width="100%">

				<tr>
                   <td>
						
						 <table width="100%">
						      <tr>
		                      <td class="CformNombre" width="20%">Fechas:</td>
		                      <td class="CformDato" width="80%">
									<table >
							    		<tr>
											<td colspan="10"><display:table class="CFormDisplayTable" name='<%= minutaFecha %>' id='<%= pageName %>'
												decorator="conicet.apps.svt.web.minuta.decorator.CMinutaDisplayWrapper">
												<display:column property="fechaMinuta" title="Fecha" headerClass="tableCellHeader" style="width: 100px;" />
											</display:table>
											</td>
											<td>
											</td>
										</tr>
									 </table>
		                      </td>
		                    </tr>     
						    
						    
						    <tr>
		                      <td class="CformNombre" width="20%">Observaciones:</td>
		                      <td class="CformDato" width="80%">
		                          <html:textarea property="observaciones" rows="3" disabled="true"/>
		                      </td>
		                    </tr>     
		                 </table>	
						
						
						<table width="100%">
							<tr bgcolor="#BFDFFF">
				        		 <td>
						          <strong>Asesorías &nbsp;</strong>
				        		</td>
							</tr>
						</table>
						
						<table width="100%">
				     		<tr>
					    		<td colspan="10" >
					         		<display:table sort="list" class="displayTable"   style="width: 100%" name='<%= minutaAsesoria %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.minuta.decorator.CMinutaDisplayWrapper">
							            <display:column property="indice_Asesoria" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
										<display:column property="nrosOrden_Asesoria"  title="Nro.Orden"  headerClass="tableCellHeader"   style="width: 120px;" />
						 				<display:column property="nroAsesoriayAnioPresentacion_Asesoria" title="Nro.Asesoria"  headerClass="tableCellHeader"  style="width: 120px;" />
						 				<display:column property="descripcionAsesores_Asesoria" title="Asesor"  headerClass="tableCellHeader" style="width: 120px;" />
						 				<display:column property="descripcionContratante_Asesoria" title="Contratante"  headerClass="tableCellHeader" maxLength="40"  style="width: 120px;" />
						 				<display:column property="resolucionNroTipoAnio_Asesoria" title="Resolución"  headerClass="tableCellHeader"  style="width: 120px;" />
						 				
				         				<display:column property="montoTotal_Asesoria" title="Monto Total"  headerClass="tableCellHeader"    style="width: 120px;"  />
							          </display:table>
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
            <jsp:param name="entidad" value="minuta" />
          </jsp:include>
        </div>
      </td>
    </tr>
      
</table> 


</logic:equal> 


