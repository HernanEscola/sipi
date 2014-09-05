<%@ include file="layout/include.jsp" %>
<script type="text/javascript" src="./js/scriptaculous/prototype.js"></script>
<script type="text/javascript" src="./js/scriptaculous/scriptaculous.js"></script>

<script>

  
  window.onload=function(){
    collapseOthers('none');
  }
  
  function collapseOthers(ignore){
    var elementos = document.getElementsByTagName('div');
    var pattern = new RegExp("(^| )" + 'collapsable' + "( |$)");
    var listado = new Array();
    for(var i=0;i<elementos.length;i++){
      if (pattern.test(elementos[i].className)) {
        if (elementos[i].visible() && elementos[i].id != ignore){
          Effect.toggle(elementos[i], 'slide');
          if($(elementos[i]).visible()){
            new Effect.Highlight($(elementos[i].id+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#E2EBF3' });
            $(elementos[i].id+'_label').update('Mostrar Actualizaciones&nbsp;<span class="dato_obligatorio">*</span>');
          } else {
            new Effect.Highlight($(elementos[i].id+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#5998d9' });
            $(elementos[i].id+'_label').update('Ocultar Actualizaciones&nbsp;<span class="dato_obligatorio">*</span>');
          }
        } 
      }
    }
  }
  
  function toggleLayer(whichLayer){
    Effect.toggle(whichLayer, 'slide', { delay: 0.2 });
    if($(whichLayer).visible()){
        new Effect.Highlight($(whichLayer+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#E2EBF3' });
        $(whichLayer+'_label').update('Mostrar Actualizaciones&nbsp;<span class="dato_obligatorio">*</span>');
    } else {
        new Effect.Highlight($(whichLayer+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#5998d9' });
        $(whichLayer+'_label').update('Ocultar Actualizaciones&nbsp;<span class="dato_obligatorio">*</span>');
    }
    collapseOthers(whichLayer);
    return false;
  }
  
  function aceptarProperty(property){
    if ($(property+'Aceptar').checked)
      if ($(property+'Rechazar').checked)
        $(property+'Rechazar').checked = false;
  }
  
  function rechazarProperty(property){
    if ($(property+'Rechazar').checked)
      if ($(property+'Aceptar').checked)
        $(property+'Aceptar').checked = false;
  }




</script>

<style>
  .label{
    cursor: pointer;
    padding-left: 6px;
    font-weight: bold;
    font-size: 11px;
    margin-bottom: 1px;
    padding-bottom: 3px;
    color: #2f3d31;
    padding-top: 6px;
    border-bottom: #ddd 1px solid;
    height: 10px;
    background-color: #E2EBF3;
  }
  
  .content {
    background-color: #FAFCFF;
  }
   
  .aceptarBar {
     float:left;
     background-color: #EDEDED;
     height: 21px;
     font-family: Arial, Helvetica, sans-serif;
     vertical-align: top;
  }
    
  .aceptarOption {
    color: #000000;
    font-size: 9pt;
  }
  
  .aceptarP {
    padding: 2px 0 0 0;
    margin: 0;
  }
  
  .aceptarLabel {
    text-align: right;
    color: #626262;
    font-size: 8pt;
    font-family: Verdana, Arial, Helvetica, sans-serif; 
  }
</style>

<br>
<h1 align="center" class="titulo">
  Procesamiento de Modificación de Oferta Tecnológica
</h1>
<html:form action="cOfertaTecnologicaAceptarModificacionesAction.do" method="POST">

  <bean:define id="responsablesTecnicosOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsablesTecnicosOriginal" />
  <bean:define id="responsablesTecnicosConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsablesTecnicosConfirmar" />
  <html:hidden property="accion" />
  <logic:equal property="accion" value="aceptar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
  
    <bean:define id="history" property="modificaciones" name="cOfertaTecnologicaAceptarModificacionesActionForm"/>
    <bean:define id="historyMap" property="attributes" name="history"/>
    <bean:define id="original" property="oferta" name="history"/>
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td >
          <table>
            <tr>
              <td>
                <div>
                  <table width="100%">
                    <tr bgcolor="#BFDFFF">
                      <td><strong>STAN&nbsp;</strong></td>
                    </tr>
                  </table>
                  <table width="100%">
                  <logic:notEmpty property="codigoId" name="cOfertaTecnologicaAceptarModificacionesActionForm">
					<tr>
					 <td class="CformNombre" width="114">Código:&nbsp;</td>
					 <td class="CformDato">
					   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="codigoId" />
					 </td>
					 </tr>
				   </logic:notEmpty>
                  
                  
				   <tr>
				       <td class="CformNombre" width="114">Es Servicio:&nbsp;</td>
						<td> 
					       <table width="100%">
					       	 <tr>
						         <td class="CformDato">
						           <html:radio property="tipoStanOriginal" value="ST" disabled="true" />
						         </td>
						         <td class="CformNombre" width="0">
						           Es Asesoramiento:&nbsp;
						         </td>
						         <td class="CformDato">
						           <html:radio property="tipoStanOriginal" value="AINS" disabled="true" />
						         </td>
						         </tr>
						     </table>    
					    </td> 
			       </tr>
					     
                  
	               <tr>
	                 <td class="CformNombre" width="114">Título:&nbsp;</td>
	                 <td class="CformDato">
	                   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcionOriginal" /></td>
	               </tr>
	               	<tr>
						<td class="CformNombre" width="114">Prestación:&nbsp;</td>
						<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="prestacionOriginal" /></td>
					</tr>
	               
	               
                  </table>
                  <table width="100%">
	                <tr bgcolor="#DFEFFF">
	                  <td>Prestador&nbsp;</td>
	                </tr>
	              </table>
	              <table width="100%">
	                <tr>
	                  <td colspan="10">
	                    <display:table name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.colPrestador" id="ofertaTecnologicaDetalle" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
	                      <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" />
	                      <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
	                      <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
	                      <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
	                    </display:table>
	                  </td>
	                </tr>
	              </table>
                
                
                  
                  
                </div>
                
                <logic:equal value="S" property="hasNewsStan" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                  <div id="conocimiento_label" onclick="javascript:toggleLayer('conocimiento');" class="label">Mostrar Actualizaciones&nbsp;<span class="dato_obligatorio">*</span></div>
                  <div class="collapsable" id="conocimiento" style="display: none;" >
                    <div class="content">
                      <table width="100%">
                        <logic:equal value="S" property="hasNews(descripcion)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="15%">Título:&nbsp;</td>
                            <td class="CformDato" width="85%"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcionNew"/></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcion"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(prestacionDescripcion)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="15%">Prestación:&nbsp;</td>
                            <td class="CformDato" width="85%"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="prestacionNew"/></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="prestacionDescripcion"/>
                          </tr>
                        </logic:equal>
						</table>
						
						<table width="100%">
                        <logic:equal value="S" property="hasNews(prestador)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
			                  <table width="100%">
				                <tr bgcolor="#DFEFFF">
				                  <td>Prestador&nbsp;</td>
				                </tr>
				              </table>
				              <table width="100%">
				                <tr>
				                  <td colspan="10">
				                    <display:table name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.colPrestadorNew" id="ofertaTecnologicaDetalle" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
				                      <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" />
				                      <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                      <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
				                      <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
				                    </display:table>
				                  </td>
				                </tr>
				              </table>
                          	  <table >
                          	  <tr>
                          	  <td width="54">
                          	  <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="prestador"/>
                          		</td>
                          		</tr>
                          		</table>
                          </tr>
                        </logic:equal>
                        
                        
                        

                      </table>
                    </div>
                  </div>
                </logic:equal>



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
              <tr>
                <td>
                  <div>
                	<table width="100%">
								     <tr bgcolor="#BFDFFF">
									     <td><strong>Especificación&nbsp;</strong></td>
								     </tr>
								  
					        </table>
					<table width="100%">
					
						        <tr>
	                					 <td class="CformNombre" width="140">Detalle STAN:&nbsp;</td>
	                 					<td class="CformDato">
	                   						<bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="detalleOriginal" /></td>
	               				</tr>
						        <tr>
	                					 <td class="CformNombre" width="140">Detalle Prestación:&nbsp;</td>
	                 					<td class="CformDato">
	                   						<bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="prestacionDetalleOriginal" /></td>
	               				</tr>
								<tr>
									<td class="CformNombre" width="140">Metodología:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="metodologiaOriginal" /></td>
								</tr>
								
								<logic:empty property="responsablesTecnicosOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
									<tr>
										<td class="CformNombre" width="150">Responsable Técnico:&nbsp;</td>
										<td class="CformDato">
											<bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsableOriginal" />
										</td>
									</tr>
								</logic:empty>
								<logic:notEmpty property="responsablesTecnicosOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
		                          <tr>
		                            <td colspan="2">
		                            
		                            	<table width="100%">
											<tr bgcolor="#BFDFFF">
										        <td><strong>Responsables Técnicos&nbsp;</strong></td>
											</tr>
										</table>
									    <table width="100%">
											<tr>
										    	<td colspan="10">
										        	<display:table name='<%= responsablesTecnicosOriginal %>' style="width: 100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
										            
										            	<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
										              	<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
													  	<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
													  	<display:column property="documentacion" title="Documentación" headerClass="tableCellHeader" />	
										            </display:table>
										        </td>
										    </tr>
								        </table>
		                            
		                            </td>
		
		                          </tr>
		                          </logic:notEmpty>
								<tr>
									<td class="CformNombre" width="140">Unidad de
									Prestación:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="unidadPrestacionOriginal" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="140">Capacidad
									Operativa:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="capacidadOperativaOriginal" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="140">Cantidad Mínima:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="cantidadMinimaOriginal" /></td>
								</tr>
					</table>
                  </div>
                  
                  
                  
                 <logic:equal value="S" property="hasNewsEspecificaciones" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                  <div id="especificaciones_label" onclick="javascript:toggleLayer('especificaciones');" class="label">Mostrar Actualizaciones&nbsp;<span class="dato_obligatorio">*</span></div>
                  <div class="collapsable" id="especificaciones" style="display: none;" >
                    <div class="content">

                      <table width="100%">

                        <logic:equal value="S" property="hasNews(detalle)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="140">Detalle STAN:&nbsp;</td>
                            <td class="CformDato" width="460"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="detalleNew"/></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="detalle"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(prestacionDetalle)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="140">Detalle Prestación:&nbsp;</td>
                            <td class="CformDato" width="460"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="prestacionDetalleNew"/></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="prestacionDetalle"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(especificacionMetodologia)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="140">Metodología:&nbsp;</td>
                            <td class="CformDato" width="460"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="metodologiaNew" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="especificacionMetodologia"/>
                          </tr>
                        </logic:equal>
                      
                      
                        <logic:equal value="S" property="hasNews(responsablesTecnicos)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <bean:define id="responsablesTecnicosNew" name="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsablesTecnicosNew" />
                          <tr>
                            <td colspan="2">
                            
                            	<table width="100%">
									<tr bgcolor="#BFDFFF">
								        <td><strong>Responsables Técnicos&nbsp;</strong></td>
									</tr>
								</table>
							    <table width="100%">
									<tr>
								    	<td colspan="10">
								        	<display:table name='<%= responsablesTecnicosNew %>' style="width: 100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
								            
								            	<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
								              	<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
											 	<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
											  	<display:column property="documentacion" title="Documentación" headerClass="tableCellHeader" />	
								            </display:table>
								        </td>
								    </tr>
						        </table>
                            
                            </td>

                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsablesTecnicos"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(unidadPrestacion)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="140">Unidad de Prestación:&nbsp;</td>
                            <td class="CformDato" width="460"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="unidadPrestacionNew" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="unidadPrestacion"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(capacidadOperativa)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="140">Capacidad Operativa:&nbsp;</td>
                            <td class="CformDato" width="460"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="capacidadOperativaNew" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="capacidadOperativa"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(cantidadMinima)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="140">Cantidad Mínima:&nbsp;</td>
                            <td class="CformDato" width="460"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="cantidadMinimaNew" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="cantidadMinima"/>
                          </tr>
                        </logic:equal>
                      </table>
                    </div>
                  </div>
                </logic:equal>
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
            <tr>
              <td >

	             <table width="100%">
	                   <tr bgcolor="#BFDFFF">
	                     <td><strong>Equipamientos Asignados&nbsp;</strong></td>
	                   </tr>
	             </table>
	                     
	            <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="equiposAsignados">
	                 <table width="100%">     
	                  <tr>
	                    <td colspan="10">
	                      <display:table excludedParams="*" uid="asignados"  name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposAsignados" requestURI="cOfertaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CEquipoModificacionesAceptarDisplayWrapper">
	                        <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
	                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="40" style="width: 350px;"/>
	                        <display:column property="anio" title="Año" headerClass="tableCellHeader"  maxLength="10" style="width: 50px;" />
	                        <display:column property="marca" title="Marca" headerClass="tableCellHeader"  maxLength="22" style="width: 200px;" />
	                        <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="22" style="width: 200px;" />
				              <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
	                      
	                      </display:table>
	                    </td>
	                  </tr>
	                </table>
	           </logic:notEmpty>
	           <logic:empty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="equiposAsignados">
	                  <table width="100%">
	                   <tr>
	                     <td>No se seleccionaron equipamientos&nbsp;</td>
	                   </tr>
	                 </table>
	           </logic:empty>
                
                
	       	   <table width="100%">
	  	         <tr bgcolor="#BFDFFF">
	               <td><strong>Equipamientos A Procesar&nbsp;</strong></td>
	             </tr>
	           </table>
	          
	           <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="equiposAProcesar">
	           <table width="100%">     
	            <tr>
	              <td colspan="10">
	                      <display:table excludedParams="*" uid="aprocesar" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposAProcesar" requestURI="cOfertaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CEquipoModificacionesAceptarDisplayWrapper">
	                        <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
	                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="40" style="width: 350px;"/>
	                        <display:column property="anio" title="Año" headerClass="tableCellHeader"  maxLength="10" style="width: 50px;" />
	                        <display:column property="marca" title="Marca" headerClass="tableCellHeader"  maxLength="22" style="width: 200px;" />
	                        <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="22" style="width: 200px;" />
	              <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
	
	                      </display:table>
	              </td>
	            </tr>
	          </table>
	          </logic:notEmpty>
	          <logic:empty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="equiposAProcesar">
	                  <table width="100%">
	                   <tr>
	                     <td>No se seleccionaron equipamientos&nbsp;</td>
	                   </tr>
	                 </table>
	          </logic:empty>
          
          
	          
	          
	          <table width="100%">
	             <tr bgcolor="#BFDFFF">
	               <td><strong>Equipamientos Desasignados&nbsp;</strong></td>
	             </tr>
	           </table>
	          <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="equiposDesasignados">
	
	           <table width="100%">     
	            <tr>
	              <td colspan="10">
	                      <display:table excludedParams="*" uid="desasignados"  name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposDesasignados" requestURI="cOfertaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CEquipoModificacionesAceptarDisplayWrapper">
	                        <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
	                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="40" style="width: 350px;"/>
	                        <display:column property="anio" title="Año" headerClass="tableCellHeader"  maxLength="10" style="width: 50px;" />
	                        <display:column property="marca" title="Marca" headerClass="tableCellHeader"  maxLength="22" style="width: 200px;" />
	                        <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="22" style="width:200px;" />
	              <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
	
	                      </display:table>
	              </td>
	            </tr>
	          </table>
	          </logic:notEmpty>
	          <logic:empty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="equiposDesasignados">
	                  <table width="100%">
	                   <tr>
	                     <td>No se seleccionaron equipamientos&nbsp;</td>
	                   </tr>
	                 </table>
	          </logic:empty>
	
          
            
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>





    
      <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table width="100%">    
              <tr>
                <td>
                  <div>
                    <table width="100%">
                      <tr bgcolor="#BFDFFF">
                        <td><strong>Información Tecnológica&nbsp;</strong></td>
                      </tr>
                    </table>
                    <table width="100%">
                    <tr>
                      <td colspan="10">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Disciplina Primaria&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="15%">Principal:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:greaterThan value="-1" property="disciplinaPrimariaPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="disciplinaPrimariaPpalOriginal">
                                  <html:options collection="comboDispPrimariaOrig" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:notEmpty property="disciplinaPrimariaOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="emptyList" multiple="true" size="3">
                                  <html:options collection="comboDispPrimariaOrigM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>
                        
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>
                              Disciplina Desagregada&nbsp;
                            </td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="15%">
                              Principal:&nbsp;
                            </td>
                            <td class="CformDato" width="85%">
                              <logic:greaterThan value="-1" property="disciplinaDesagregadaPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="disciplinaDesagregadaPpalOriginal">
                                  <html:options collection="comboDispDesagregadaOrig" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="15%">
                              Otras:&nbsp;
                            </td>
                            <td class="CformDato" width="85%">
                              <logic:notEmpty property="disciplinaDesagregadaOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="emptyList" multiple="true" size="3">
                                  <html:options collection="comboDispDesagregadaOrigM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>

                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Campo Aplicación&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="15%">Principal:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:greaterThan value="-1" property="campoAplicacionPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="campoAplicacionPpalOriginal">
                                  <html:options collection="comboCampoAplicOrig" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:notEmpty property="campoAplicacionOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="emptyList" multiple="true" size="3">
                                  <html:options collection="comboCampoAplicOrigM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Actividades Industriales&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="15%">Principal:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:greaterThan value="-1" property="clasificacionONUPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="clasificacionONUPpalOriginal">
                                  <html:options collection="comboActivIndustrialesOrig" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:notEmpty property="clasificacionONUOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="emptyList" multiple="true" size="3">
                                  <html:options collection="comboActivIndustrialesOrigM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>

                      </td>
                    </tr>
                  </table>
                </div>
                <% /*Comienzo de las actualizaciones de Información Tecnológica*/ %>
                <logic:equal value="S" property="hasNewsInformacionTecnologica" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                  <div id="infoTecno_label" onclick="javascript:toggleLayer('infoTecno');" class="label">Mostrar Actualizaciones&nbsp;<span class="dato_obligatorio">*</span></div>
                  <div class="collapsable" id="infoTecno" style="display: none;">
                    <div class="content">
                      
                      <logic:equal value="S" property="hasNews(disciplinaPrimaria)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Disciplina Primaria&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="15%">Principal:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:greaterThan value="-1" property="disciplinaPrimariaPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="disciplinaPrimariaPpalNew">
                                  <html:options collection="comboDispPrimariaNew" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:notEmpty property="disciplinaPrimariaNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="emptyList" multiple="true" size="3">
                                  <html:options collection="comboDispPrimariaNewM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="disciplinaPrimaria"/>
                          </tr>
                        </table>
                      </logic:equal>
                      
                      <logic:equal value="S" property="hasNews(disciplinaDesagregada)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Disciplina Desagregada&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="15%">Principal:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:greaterThan value="-1" property="disciplinaDesagregadaPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="disciplinaDesagregadaPpalNew">
                                  <html:options collection="comboDispDesagregadaNew" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:notEmpty property="disciplinaDesagregadaNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="emptyList" multiple="true" size="3">
                                  <html:options collection="comboDispDesagregadaNewM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="disciplinaDesagregada"/>
                          </tr>
                        </table>
                      </logic:equal>
                      
                      <logic:equal value="S" property="hasNews(campoAplicacion)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Campo Aplicación&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="15%">Principal:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:greaterThan value="-1" property="campoAplicacionPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="campoAplicacionPpalNew">
                                  <html:options collection="comboCampoAplicNew" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:notEmpty property="campoAplicacionNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="emptyList" multiple="true" size="3">
                                  <html:options collection="comboCampoAplicNewM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="campoAplicacion"/>
                          </tr>
                        </table>
                      </logic:equal>
                      
                      <logic:equal value="S" property="hasNews(clasificacionONU)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Actividades Industriales&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="15%">Principal:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:greaterThan value="-1" property="clasificacionONUPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="clasificacionONUPpalNew">
                                  <html:options collection="comboActivIndustrialesNew" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                            <td class="CformDato" width="85%">
                              <logic:notEmpty property="clasificacionONUNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="emptyList" multiple="true" size="3">
                                  <html:options collection="comboActivIndustrialesNewM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                          <tr>
                              <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="clasificacionONU"/>
                          </tr>
                        </table>
                      </logic:equal>
                    </div>
                  </div>
                </logic:equal>
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
            <tr>
              <td>
                <div>
                  <table width="100%">
                    <tr bgcolor="#BFDFFF">
                      <td><strong>Palabras Clave&nbsp;</strong></td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="CformNombre" width="10%">1ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave1Original" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="10%">2ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave2Original" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="10%">3ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave3Original" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="10%">4ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave4Original" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="10%">5ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave5Original" /></td>
                    </tr>
                  </table>
                </div>
                <logic:equal value="S" property="hasNewsPalabrasClaves" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                  <div id="palabrasClave_label" onclick="javascript:toggleLayer('palabrasClave');" class="label">Mostrar Actualizaciones&nbsp;<span class="dato_obligatorio">*</span></div>
                  <div class="collapsable" id="palabrasClave" style="display: none;" >
                    <div class="content">
                      <table width="100%">
                        <logic:equal value="S" property="hasNews(palabraClave1)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="10%">1ª:&nbsp;</td>
                            <td class="CformDato" width="90%"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave1New" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave1"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(palabraClave2)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="10%">2ª:&nbsp;</td>
                            <td class="CformDato" width="90%"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave2New" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave2"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(palabraClave3)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="10%">3ª:&nbsp;</td>
                            <td class="CformDato" width="90%"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave3New" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave3"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(palabraClave4)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="10%">4ª:&nbsp;</td>
                            <td class="CformDato" width="90%"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave4New" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave4"/>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(palabraClave5)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="10%">5ª:&nbsp;</td>
                            <td class="CformDato" width="90%"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave5New" /></td>
                          </tr>
                          <tr>
                            <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave5"/>
                          </tr>
                        </logic:equal>
                      </table>
                    </div>
                  </div>
                </logic:equal>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
    
    
    
    
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
      <tr >
        <td >
           <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="costosSinNovedades">
             <table width="100%">
               <tr bgcolor="#BFDFFF">
                 <td><strong>Costos Sin Novedades&nbsp;</strong></td>
               </tr>
             </table>
             <table width="100%">     
              <tr>
                <td colspan="10">
                  <display:table class="displayTable" uid="sinNovedades" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosSinNovedades" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
                    <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
                    <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                    <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                    <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                    <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                    <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
                  </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>
             
       	   <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="costosNuevos">
       	   <table width="100%">
  	         <tr bgcolor="#BFDFFF">
               <td><strong>Costos Nuevos&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%">     
            <tr>
              <td colspan="10">
                <display:table class="displayTable" uid="nuevos" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosNuevos" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
				          <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>	                
		              <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                  <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
           	  	</display:table>
              </td>
            </tr>
          </table>
          </logic:notEmpty>
          
          
          
          <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="costosModificados">
          <table width="100%">
  	         <tr bgcolor="#BFDFFF">
               <td><strong>Costos Modificados&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%">     
            <tr>
              <td colspan="10">
                <display:table class="displayTable" uid="modificados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosModificados" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" style="width: 100%" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
				          <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>	                
		              <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                  <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
           	  	</display:table>
              </td>
            </tr>
          </table>
          </logic:notEmpty>      
          
          <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="costosEliminados">
          <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Costos Eliminados&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%">     
            <tr>
              <td colspan="10">
                <display:table style="width: 100%" class="displayTable" uid="eliminados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosEliminados" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
                  <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                  <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
                </display:table>
              </td>
            </tr>
          </table>
          </logic:notEmpty>
          
          <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="costosDeshabilitados">
          <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Costos Deshabilitados&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%">     
            <tr>
              <td colspan="10">
                <display:table style="width: 100%" class="displayTable" uid="deshabilitados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosDeshabilitados" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
                  <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                  <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
                </display:table>
              </td>
            </tr>
          </table>
          </logic:notEmpty>

          <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="costosHabilitados">
          <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Costos Habilitados&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%">     
            <tr>
              <td colspan="10">
                <display:table style="width: 100%" class="displayTable" uid="habilitados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosHabilitados" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
                  <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                  <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
                </display:table>
              </td>
            </tr>
          </table>
          </logic:notEmpty>



          <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="costosAceptados">
          <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Costos Aceptados&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%">     
            <tr>
              <td colspan="10">
                <display:table style="width: 100%" class="displayTable" uid="aceptados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosAceptados" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
                  <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                  <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
                </display:table>
              </td>
            </tr>
          </table>
          </logic:notEmpty>
          
          <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="costosRechazados">
          <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Costos Rechazados&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%">     
            <tr>
              <td colspan="10">
                <display:table style="width: 100%" class="displayTable" uid="rechazados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosRechazados" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
                  <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                  <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                  <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                  <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
                </display:table>
              </td>
            </tr>
          </table>
          </logic:notEmpty>
             
        </td>
      </tr>
    </table>
    
    
    <table class="CformTable"  align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
           <table width="100%">   
              <tr>
                <td>
                  <div>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Seguimiento&nbsp;</strong></td>
								</tr>
							</table>

							<table width="100%">
									<tr>
										<td class="CformNombre" width="130" align="left">Expediente
										Nro:&nbsp;</td>
										<td class="CformDato"><logic:notEmpty
											property="nroExpedienteOriginal"
											name="cOfertaTecnologicaAceptarModificacionesActionForm">
											<bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm"
												property="nroExpedienteOriginal" /> /
                      						<bean:write
												name="cOfertaTecnologicaAceptarModificacionesActionForm"
												property="anioExpedienteOriginal" />
										</logic:notEmpty></td>
									</tr>
									<tr>
										<td class="CformNombre" width="130">Fecha
										Autorización:&nbsp;</td>
										<td class="CformDato"><bean:write
											name="cOfertaTecnologicaAceptarModificacionesActionForm"
											property="fechaAutorizacionOriginal" /></td>
									<tr>
									<tr>
										<td class="CformNombre" width="130">Resolución:&nbsp;</td>
										<td class="CformDato"><logic:notEmpty
											property="nroResolucionOriginal"
											name="cOfertaTecnologicaAceptarModificacionesActionForm">
												Tipo:&nbsp;
												<html:select disabled="true" property="tipoResolucionOriginal">
												<html:options collection="comboTipoResolucion"
													property="value" labelProperty="label" />
											</html:select>
				    					    	Nro: <bean:write
												name="cOfertaTecnologicaAceptarModificacionesActionForm"
												property="nroResolucionOriginal" />
											
											&nbsp;&nbsp;Fecha:&nbsp;<bean:write
												name="cOfertaTecnologicaAceptarModificacionesActionForm"
												property="fechaResolucionOriginal" />
										</logic:notEmpty> <logic:greaterThan value="-1" property="estadoResolucionOriginal"
											name="cOfertaTecnologicaAceptarModificacionesActionForm">
											<html:select disabled="true" property="estadoResolucionOriginal">
												<html:options collection="comboEstadoResolucion"
													property="value" labelProperty="label" />
											</html:select>
										</logic:greaterThan></td>
									</tr>
							</table>



							<table width="100%" cellpadding="0" cellspacing="0">
								 
								<tr>
                  <td class="CformNombre" width="130">Estado Anterior:&nbsp;</td>
                
                  <td class="CformDato">
                              <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="estadoAnterior" />
                  </td>
                </tr>
								<tr>
									<td class="CformNombre" width="130">Estado Nuevo:&nbsp;<span class="dato_obligatorio">*</span></td>
								
     							<td class="CformDato">
                							<html:select disabled="false" property="tipoEstado" >
                  								<html:options collection="comboEstadosByTipoOferta" property="value" labelProperty="label" />
                							</html:select>	
     							</td>
               	</tr>
							</table>

							<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td class="CformNombre" width="130">Publicar:&nbsp;</td>
										<td class="CformDato">Sí <html:radio property="publicarOriginal"
											value="S" disabled="true" /> No <html:radio
											property="publicarOriginal" value="N" disabled="true" /></td>
									</tr>
							</table>
            </div>
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
              <tr>
                <td>
                  <div>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Aceptación/Rechazo</strong></td>
								</tr>
							</table>

							<table width="100%">
				              <tr>
				                 <td class="CformNombre" width="114">Motivo:<span class="dato_obligatorio">(1)</span></td>
				                 <td class="CformDato"><html:textarea  property="motivo" rows="3" /></td>
				              </tr>

							</table>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table cellpadding="0" cellspacing="0" style="padding:0;" width="100%">
              <tr>
                <td width="30%" class="CformAreaBotones" >
                  <div align="left" class="dato_obligatorio">* Datos obligatorios </div>
                </td>
                <td width="70%" class="CformAreaBotones">
                  <div align="right">
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
		                <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" /> 
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
      </table>
      <table align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td ><span class="dato_obligatorio">(1)</span>
            Si se desea "Rechazar" el motivo es necesario.
          </td>
        </tr>
      </table>  
  </logic:equal>
  
  
  <logic:equal property="accion" value="aceptarCfm" name="cOfertaTecnologicaAceptarModificacionesActionForm">
    <bean:define id="form" name="cOfertaTecnologicaAceptarModificacionesActionForm"/>
    <table class="CformTable" width="100%" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td width="100%">
          <div>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>STAN&nbsp;</strong></td>
              </tr>
            </table>
            <table>
              <logic:notEmpty property="codigoId" name="cOfertaTecnologicaAceptarModificacionesActionForm">
			 	 <tr>
					 <td class="CformNombre" width="130">Código:&nbsp;</td>
					 <td class="CformDato">
					   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="codigoId" />
					 </td>
				 </tr>
			  </logic:notEmpty>
           	  <tr>
		         <td class="CformNombre" width="114">
		           Es Servicio:&nbsp;
		         </td>

		         <td>	 
		          <table width="100%">
					 <tr>
				         <td class="CformDato">
				           <html:radio property="tipoStanOriginal" value="ST" disabled="true" />
				         </td>
				         <td class="CformNombre" width="0">
				           Es Asesoramiento:&nbsp;
				         </td>
				         <td class="CformDato">
				           <html:radio property="tipoStanOriginal" value="AINS" disabled="true" />
				         </td>
					  </tr>
					</table>
				</td>
			</tr>					   
                
            
              <tr>
                <td class="CformNombre" width="130">Título:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcionConfirmar" /></td>
              </tr>
              
	          <tr>
					<td class="CformNombre" width="130">Prestación:&nbsp;</td>
					<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="prestacionConfirmar" /></td>
			  </tr>
	               
              
              <table width="100%">
	                <tr bgcolor="#DFEFFF">
	                  <td>Prestador&nbsp;</td>
	                </tr>
	              </table>
	              <table width="100%">
	                <tr>
	                  <td colspan="10">
	                    <display:table name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.colPrestadorConfirmar" id="ofertaTecnologicaDetalle" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
	                      <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
	                      <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
	                      <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
	                    </display:table>
	                  </td>
	                </tr>
	           </table>

            </table>
          </div>
        </td>
     </tr>
   </table>
   
   
   
   
       <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
           <table width="100%">   
              <tr>
                <td>
                  <div>
                	<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Especificación&nbsp;</strong></td>
								</tr>
					</table>
					<table width="100%">
				              <tr>
					                <td class="CformNombre" width="130">Detalle:&nbsp;</td>
					                <td class="CformDato">
					                   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="detalleConfirmar" /></td>
					          </tr>
		
				              <tr>
					                <td class="CformNombre" width="130">Detalle de Prestación:&nbsp;</td>
					                <td class="CformDato">
					                   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" 
					                   property="prestacionDetalleConfirmar" /></td>
					          </tr>
								<tr>
									<td class="CformNombre" width="130">Metodología:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="metodologiaConfirmar" /></td>
								</tr>
	                        
	                          	<tr>
		                            <td colspan="2">
		                            
		                            	<table width="100%">
											<tr bgcolor="#BFDFFF">
										        <td><strong>Responsables Técnicos&nbsp;</strong></td>
											</tr>
										</table>
									    <table width="100%">
											<tr>
										    	<td colspan="10">
										        	<display:table name='<%= responsablesTecnicosConfirmar %>' style="width: 100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
										            
										            	<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
									              		<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
												  		<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
												  		<display:column property="documentacion" title="Documentación" headerClass="tableCellHeader" />	
										            </display:table>
										        </td>
										    </tr>
								        </table>
		                            
		                            </td>	
	                          </tr>
	                          <tr>
								<tr>
									<td class="CformNombre" width="130">Unidad de
									Prestación:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="unidadPrestacionConfirmar" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Capacidad
									Operativa:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="capacidadOperativaConfirmar" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="130">Cantidad Mínima:&nbsp;</td>
									<td class="CformDato"><bean:write
										name="cOfertaTecnologicaAceptarModificacionesActionForm"
										property="cantidadMinimaConfirmar" /></td>
								</tr>
					</table>
                  </div>
                  
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
   
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <div>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Equipamientos&nbsp;</strong></td>
              </tr>
            </table>
        
            <logic:notEmpty property="equiposConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
              <table width="100%">
                <tr>
                  <td colspan="10">
                       <display:table excludedParams="*" uid="equiposConfirmar" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposConfirmar" requestURI="cOfertaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CEquipoModificacionesAceptarDisplayWrapper">
                                     
                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="40" style="width: 350px;"/>
                        <display:column property="anio" title="Año" headerClass="tableCellHeader"  maxLength="10" style="width: 50px;" />
                        <display:column property="marca" title="Marca" headerClass="tableCellHeader"  maxLength="22" style="width: 200px;" />
                        <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="22" style="width:200px;" />
                        <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                      
                      </display:table>
                   
                  </td>
                </tr>
              </table>
            </logic:notEmpty>
            <logic:empty property="equiposConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
              <table width="100%">
                <tr>
                  <td>
                    No se seleccionaron equipamientos&nbsp;
                  </td>
                </tr>
              </table>
            </logic:empty>
        
          </div>
        </td>
      </tr>
    </table>
   
   
   
    
      <table class="CformTable" width="100%" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <td>
             <div>
               <table width="100%">
                 <tr bgcolor="#BFDFFF">
                   <td><strong>Información Tecnológica&nbsp;</strong></td>
                 </tr>
               </table>
               <table width="100%">
               <tr>
                 <td colspan="10">
                   <table width="100%">
                    <tr bgcolor="#DFEFFF">
                       <td>Disciplina Primaria&nbsp;</td>
                     </tr>
                   </table>
                   <table width="100%">
                     <tr>
                       <td class="CformNombre" width="80">Principal:&nbsp;</td>
                       <td class="CformDato">
                         <logic:greaterThan value="-1" property="disciplinaPrimariaPpalConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                           <html:select disabled="true" property="disciplinaPrimariaPpalConfirmar">
                             <html:options collection="comboDispPrimariaCfm" property="value" labelProperty="label" />
                          </html:select>
                         </logic:greaterThan>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="80">Otras:&nbsp;</td>
                       <td class="CformDato">
                         <logic:notEmpty property="disciplinaPrimariaConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                           <html:select disabled="false" property="informacionTenologicaOtrosVaciaConfirmar" multiple="true" size="3">
                             <html:options collection="comboDispPrimariaCfmM" property="value" labelProperty="label" />
                           </html:select>
                         </logic:notEmpty>
                       </td>
                     </tr>
                   </table>
                   
                   <table width="100%">
                     <tr bgcolor="#DFEFFF">
                       <td>
                         Disciplina Desagregada&nbsp;
                       </td>
                     </tr>
                   </table>
                   <table width="100%">
                     <tr>
                       <td class="CformNombre" width="80">
                         Principal:&nbsp;
                       </td>
                       <td class="CformDato">
                         <logic:greaterThan value="-1" property="disciplinaDesagregadaPpalConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                           <html:select disabled="true" property="disciplinaDesagregadaPpalConfirmar">
                             <html:options collection="comboDispDesagregadaCfm" property="value" labelProperty="label" />
                           </html:select>
                         </logic:greaterThan>
                       </td>
                     </tr>
                     <tr>
                       <td class="CformNombre" width="80">
                         Otras:&nbsp;
                       </td>
                       <td class="CformDato">
                         <logic:notEmpty property="disciplinaDesagregadaConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                           <html:select disabled="false" property="informacionTenologicaOtrosVaciaConfirmar" multiple="true" size="3">
                             <html:options collection="comboDispDesagregadaCfmM" property="value" labelProperty="label" />
                           </html:select>
                         </logic:notEmpty>
                       </td>
                     </tr>
                   </table>

                   <table width="100%">
                     <tr bgcolor="#DFEFFF">
                       <td>Campo Aplicación&nbsp;</td>
                     </tr>
                   </table>
                   <table width="100%">
                     <tr>
                       <td class="CformNombre" width="80">Principal:&nbsp;</td>
                       <td class="CformDato">
                         <logic:greaterThan value="-1" property="campoAplicacionPpalConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                           <html:select disabled="true" property="campoAplicacionPpalConfirmar">
                             <html:options collection="comboCampoAplicCfm" property="value" labelProperty="label" />
                           </html:select>
                         </logic:greaterThan>
                       </td>
                     </tr>
                     <tr>
                       <td class="CformNombre" width="80">Otras:&nbsp;</td>
                       <td class="CformDato">
                         <logic:notEmpty property="campoAplicacionConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                           <html:select disabled="false" property="informacionTenologicaOtrosVaciaConfirmar" multiple="true" size="3">
                             <html:options collection="comboCampoAplicCfmM" property="value" labelProperty="label" />
                           </html:select>
                         </logic:notEmpty>
                       </td>
                     </tr>
                   </table>
                   <table width="100%">
                     <tr bgcolor="#DFEFFF">
                       <td>Actividades Industriales&nbsp;</td>
                     </tr>
                   </table>
                   <table width="100%">
                     <tr>
                       <td class="CformNombre" width="80">Principal:&nbsp;</td>
                       <td class="CformDato">
                         <logic:greaterThan value="-1" property="clasificacionONUPpalConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                           <html:select disabled="true" property="clasificacionONUPpalConfirmar">
                             <html:options collection="comboActivIndustrialesCfm" property="value" labelProperty="label" />
                           </html:select>
                         </logic:greaterThan>
                       </td>
                     </tr>
                     <tr>
                       <td class="CformNombre" width="80">Otras:&nbsp;</td>
                       <td class="CformDato">
                         <logic:notEmpty property="clasificacionONUConfirmar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                           <html:select disabled="false" property="informacionTenologicaOtrosVaciaConfirmar" multiple="true" size="3">
                             <html:options collection="comboActivIndustrialesCfmM" property="value" labelProperty="label" />
                           </html:select>
                         </logic:notEmpty>
                       </td>
                     </tr>
                   </table>
                 </td>
               </tr>
             </table>
           </div>
         </td>
       </tr>
    </table>
    
    <table class="CformTable" width="100%" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="677">
          <div>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Palabras Clave&nbsp;</strong></td>
              </tr>
            </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="80">1ª:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave1Confirmar" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="80">2ª:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave2Confirmar" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="80">3ª:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave3Confirmar" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="80">4ª:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave4Confirmar" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="80">5ª:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave5Confirmar" /></td>
              </tr>
            </table>
          </div>
        </td>
      </tr>
    </table>
    
        
    
    
    
    
    <table class="CformTable" width="100%" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <div>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Costos&nbsp;</strong></td>
              </tr>
            </table>
            <table width="100%">     
              <tr>
	              <td colspan="10">
	                <display:table style="width: 100%" class="displayTable" uid="confirmados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.costosFinales" requestURI="cOfertaTecnologicaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.moduloPrestador.decorator.CStanCostosModificacionesAceptarDisplayWrapper">
	                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 150px;"/>
                    <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 120px;"/>
                    <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                    <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 115px;"/>
                    <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 80px;"/>
	                </display:table>
	              </td>
              </tr>
            </table>
          </div>
        </td>
      </tr>
          
    </table>



    <table class="CformTable" align="center" width="100%" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
           <table width="100%">   
              <tr>
                <td>
                  <div>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Seguimiento&nbsp;</strong></td>
								</tr>
							</table>

							<table width="100%">
									<tr>
										<td class="CformNombre" width="130" align="left">Expediente
										Nro:&nbsp;</td>
										<td class="CformDato"><logic:notEmpty
											property="nroExpedienteOriginal"
											name="cOfertaTecnologicaAceptarModificacionesActionForm">
											<bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm"
												property="nroExpedienteOriginal" /> /
                      						<bean:write
												name="cOfertaTecnologicaAceptarModificacionesActionForm"
												property="anioExpedienteOriginal" />
										</logic:notEmpty></td>
									</tr>
									<tr>
										<td class="CformNombre" width="130">Fecha
										Autorización:&nbsp;</td>
										<td class="CformDato"><bean:write
											name="cOfertaTecnologicaAceptarModificacionesActionForm"
											property="fechaAutorizacionOriginal" /></td>
									<tr>
									<tr>
										<td class="CformNombre" width="130">Resolución:&nbsp;</td>
										<td class="CformDato"><logic:notEmpty
											property="nroResolucionOriginal"
											name="cOfertaTecnologicaAceptarModificacionesActionForm">
												Tipo:&nbsp;
												<html:select disabled="true" property="tipoResolucionOriginal">
												<html:options collection="comboTipoResolucion"
													property="value" labelProperty="label" />
											</html:select>
				    					    	Nro: <bean:write
												name="cOfertaTecnologicaAceptarModificacionesActionForm"
												property="nroResolucionOriginal" />
											
											&nbsp;&nbsp;Fecha:&nbsp;<bean:write
												name="cOfertaTecnologicaAceptarModificacionesActionForm"
												property="fechaResolucionOriginal" />
										</logic:notEmpty> <logic:greaterThan value="-1" property="estadoResolucionOriginal"
											name="cOfertaTecnologicaAceptarModificacionesActionForm">
											<html:select disabled="true" property="estadoResolucionOriginal">
												<html:options collection="comboEstadoResolucion"
													property="value" labelProperty="label" />
											</html:select>
										</logic:greaterThan></td>
									</tr>
							</table>



							<table width="100%" >
								<tr>
                  					<td class="CformNombre" width="130">Estado Anterior:&nbsp;</td>
				                  	<td class="CformDato">
                		              <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="estadoAnterior" />
                  					</td>
                				</tr>
							
								<tr>
									<td class="CformNombre" width="130">Estado Nuevo:&nbsp;</td>
           							<td class="CformDato">
                      							<html:select disabled="true" property="tipoEstado" >
                        								<html:options collection="comboEstadosByTipoOferta" property="value" labelProperty="label" />
                      							</html:select>	
           							</td>
								</tr>
							</table>

							<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td class="CformNombre" width="130">Publicar:&nbsp;</td>
										<td class="CformDato">Sí <html:radio property="publicarOriginal"
											value="S" disabled="true" /> No <html:radio
											property="publicarOriginal" value="N" disabled="true" /></td>
									</tr>
							</table>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
	</table>

    <table class="CformTable" width="100%" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
           <table width="100%">   
              <tr>
                <td>
                  <div>
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Aceptación/Rechazo</strong></td>
								</tr>
							</table>

							<table width="100%">
	              <tr>
	                 <td class="CformNombre" width="130">Motivo:&nbsp;</td>
	                 <td class="CformDato">
	                   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="motivo" />
	                   
	                   
	                 </td>
	              </tr>
							</table>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      <tr>
       <td>
         <table width="100%">
           <tr>
             <td width="60%" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">&nbsp;</div></td>
             <td width="40%" class="CformAreaBotones">
               <div align="right" >
                 <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
                 <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>  
               </div>
             </td>
           </tr>
         </table>
       </td>
     </tr>
   </table>
    







  </logic:equal>
</html:form>
