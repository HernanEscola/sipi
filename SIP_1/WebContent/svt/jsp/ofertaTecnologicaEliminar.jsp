<%@include file="layout/include.jsp"%>

<script language="JavaScript1.2" src="./js/prototype.js"></script>
<script language="JavaScript1.2" src="./js/ricoCommon.js"></script>
<script language="JavaScript1.2" src="./js/ricoEffects.js"></script>
<script language="JavaScript1.2" src="./js/ricoAccordion.js"></script>

<script>
     function iniciarAccordion(){
    var auto_normal_accordion_options={
        panelWidth:"auto",
        panelHeight:"auto",
        tabLocation:'inline',
        onLoadShowTab:2,
        expandedBg:"#f6f6f6",
        collapsedBg:"#f6f6f6",
        hoverBg:"#f0f0f0",
        hoverTextColor:"#222",
        collapsedTextColor:"#666",
        borderColor:"#ccc",
        expandedTextColor:"#666",
        fixborders:true,      //look at this whe you apply padding
                duration:200

      };
      var auto_retract_normal_accordion_options={
        panelWidth:"auto",
        panelHeight:"auto",
        tabLocation:'inline',
        onLoadShowTab:-2,
        expandedBg:"#C3DFFF",
        collapsedBg:"#E2EBF3",
        hoverBg:"#AEC7DD",
        hoverTextColor:"#222",
        collapsedTextColor:"#000000",
        borderColor:"#ccc",
        expandedTextColor:"#666",
                transitionColor: "gray",
                roundCorners: true,
        fixborders:true,    //look at this whe you apply padding
                duration:200

      };
    //Ajax modificado
    new Rico.Accordion($('auto_normal_accordion'), auto_normal_accordion_options);
    new Rico.Accordion($('auto_retract_normal_accordion'),auto_retract_normal_accordion_options);
     }
           window.onload=function(){
    iniciarAccordion();
     }

    function submitComboCostos(){
      document.cOfertaTecnologicaEliminarActionForm.action = 'cOfertaTecnologicaEliminarAction.do?accion=populateCosto';
      document.cOfertaTecnologicaEliminarActionForm.submit();
    }
    
</script>


<br>
<h1 align="center" class="titulo">Eliminar Oferta Tecnol&oacute;gica </h1>
<html:form action="cOfertaTecnologicaEliminarAction.do" method="POST">
<!--html:hidden property="accion"/-->


<bean:define id="responsablesTecnicos" property="responsablesTecnicos" name="cOfertaTecnologicaEliminarActionForm" />
<bean:define id="titularLote" property="titularLote" name="cOfertaTecnologicaEliminarActionForm" />


<logic:equal property="accion" value="eliminar" name="cOfertaTecnologicaEliminarActionForm">
<h2 class="mensajeSuperior">Está a punto de eliminar, presione 'Grabar' para confirmar.</h2>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>

      <table align="center" width="100%" >
        <tr>
          <td>
            <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong><bean:write name="cOfertaTecnologicaEliminarActionForm" property="tipoOfertaDescripcion"/>&nbsp;</strong></td>
             </tr>
            </table>

<!-- CONOCIMIENTO-->
       <logic:equal property="tipoOferta" value="1" name="cOfertaTecnologicaEliminarActionForm">
            <table width="100%" cellpadding="0" cellspacing="0"  >
              <logic:notEmpty property="codigoId" name="cOfertaTecnologicaEliminarActionForm">
                <tr>
                    <td class="CformNombre" width="114">Código:&nbsp;</td>
                    <td class="CformDato">
                     <bean:write name="cOfertaTecnologicaEliminarActionForm" property="codigoId" />
                    </td>
                  </tr>
               </logic:notEmpty> 
                <tr>
                  <td class="CformNombre" width="114">Título:&nbsp;</td>
                  <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="descripcion" /></td>
                </tr>
                <tr>
                    <td class="CformNombre" width="114">
                      Detalle:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cOfertaTecnologicaEliminarActionForm" property="detalle" />
                    </td>
                </tr>
                <tr>
                    <td class="CformNombre" width="150">
                      Responsable Técnico:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cOfertaTecnologicaEliminarActionForm" property="responsable" />
                    </td>
                </tr>
            </table>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Prestador &nbsp;</strong></td>
              </tr>
            </table>
            <table width="100%" >
              <tr>
                <td colspan="10">
                  <display:table name='<%= titularLote %>' style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
                    <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader"/>
                    <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                  </display:table>
                </td>
              </tr>
            </table>

            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td>
                  <strong>Equipamientos&nbsp;</strong>
                </td>
              </tr>
            </table>
            <logic:notEmpty property="equiposLote" name="cOfertaTecnologicaEliminarActionForm">
              <table width="100%" >
                <tr>
                  <td colspan="10">
                    <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.equiposLote" style="width:100%"  decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                      <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
                      <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                      <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
                      <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                       <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
   
                    </display:table>
                  </td>
                </tr>
              </table>
            </logic:notEmpty>
            <logic:empty property="equiposLote" name="cOfertaTecnologicaEliminarActionForm">
              <table width="100%" >
               <tr>
                 <td>No se seleccionaron equipamientos&nbsp;</td>
               </tr>
              </table>
           </logic:empty>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Información Tecnológica&nbsp;</strong></td>
              </tr>
            </table>

            <table width="100%">
              <tr bgcolor="#DDEEFF">
                <td>Disciplina Primaria&nbsp;</td>
              </tr>
            </table>

            <table width="100%">
              <tr>
                <td class="CformNombre" width="100">Principal:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalDPDescripcion"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Otras:&nbsp;</td>
                <logic:notEmpty property="loteDP" name="cOfertaTecnologicaEliminarActionForm">
                  <td class="CformDato">
                    <html:select disabled="false" property="loteDP" multiple="true" size="3" >
                       <html:options collection ="comboOtDP" property="value" labelProperty="label"/>
                    </html:select>
                  </td>
                </logic:notEmpty>
              </tr>
            </table>

            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Disciplina Desagregada&nbsp;</td>
             </tr>
            </table>

            <table width="100%">
              <tr>
                <td class="CformNombre" width="100">Principal:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalDDDescripcion"/></td>
              </tr>

              <tr>
                <td class="CformNombre" width="100">Otras:&nbsp;</td>
                 <logic:notEmpty property="loteDD" name="cOfertaTecnologicaEliminarActionForm">
                   <td class="CformDato" >
                    <html:select disabled="false" property="loteDD" multiple="true" size="3" >
                      <html:options collection="comboOtDD" property="value" labelProperty="label" />
                    </html:select>
                   </td>
                 </logic:notEmpty>
              </tr>
            </table>

            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Campo de Aplicación&nbsp;</td>
             </tr>
            </table>

            <table width="100%">
             <tr>
                <td class="CformNombre" width="100">Principal:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalCADescripcion"/></td>
              </tr>

              <tr>
                <td class="CformNombre" width="100">Otros:&nbsp;</td>
                <logic:notEmpty property="loteCA" name="cOfertaTecnologicaEliminarActionForm">
                  <td class="CformDato" >
                    <html:select disabled="false" property="loteCA" multiple="true" size="3" >
                    <html:options collection="comboOtCA" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </logic:notEmpty>
              </tr>

            </table>

            <table width="100%">
              <tr bgcolor="#DDEEFF">
                <td>Actividades Industriales&nbsp;</td>
              </tr>
            </table>

            <table width="100%">
              <tr>
                <td class="CformNombre" width="100">Principal:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalCODescripcion"/></td>
              </tr>

              <tr>
                <td class="CformNombre" width="100">Otros:&nbsp;</td>
                <logic:notEmpty property="loteCO" name="cOfertaTecnologicaEliminarActionForm">
                <td class="CformDato" >
                  <html:select disabled="false" property="loteCO" multiple="true" size="3" >
                    <html:options collection="comboOtCO" property="value" labelProperty="label" />
                  </html:select>
                </td>
                 </logic:notEmpty>
              </tr>
            </table>

            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Palabras Claves&nbsp;</strong></td>
              </tr>
            </table>

              <table width="100%">
                <tr>
                  <td class="CformNombre" width="100">1ª:&nbsp;</td>
                  <td class="CformDato">
                    <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave1" /></td>
                </tr>
                <tr>
                  <td class="CformNombre" width="100">2ª:&nbsp;</td>
                  <td class="CformDato">
                     <bean:write  name="cOfertaTecnologicaEliminarActionForm" property="palabraClave2" /></td>
                </tr>
                <tr>
                  <td class="CformNombre" width="100">3ª:&nbsp;</td>
                  <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave3" /></td>
                </tr>
                <tr>
                  <td class="CformNombre" width="100">4ª:&nbsp;</td>
                  <td class="CformDato">
                    <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave4" /></td>
                </tr>
                <tr>
                  <td class="CformNombre" width="100">5ª:&nbsp;</td>
                  <td class="CformDato">
                    <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave5" /></td>
                </tr>
              </table>
              <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td>
                  <strong>Seguimiento&nbsp;</strong>
                </td>
              </tr>
            </table>
            <table width="100%" >
              <tr>
                <td class="CformNombre" width="114">Estado:&nbsp;</td>
                <td class="CformDato">
                  <html:select disabled="true" property="tipoEstado" >
                    <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
              <capplication:isApplication application="SVT">
                <tr>
                  <td class="CformNombre" width="110">Publicar:</td>
                  <td class="CformDato">
                    Sí <html:radio property="publica" value="S"  disabled="true" />
                    No <html:radio property="publica" value="N" disabled="true" />
                  </td>
                </tr>
              </capplication:isApplication>
            </table>
          </logic:equal>
          
          <!-- STAN -->

           <logic:equal property="tipoOferta" value="3" name="cOfertaTecnologicaEliminarActionForm">
             
             <table width="100%" cellpadding="0" cellspacing="0"  >
               <tr>
                 <td class="CformNombre" width="130">Código:&nbsp;</td>
                 <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="codigoId" />
                 </td>
               </tr>
               <tr>
			         <td class="CformNombre" width="130">
			           Es Servicio:&nbsp;&nbsp;
			         </td>
			         <td class="CformDato" width="50">
			           <html:radio property="tipoStan" value="ST" disabled="true" />
			         </td>
			         <td class="CformNombre" width="200">
			           Es Asesoramiento:&nbsp;&nbsp;
			         </td>
			         <td class="CformDato">
			           <html:radio property="tipoStan" value="AINS" disabled="true" />
			         </td>
		       </tr>
               <tr>
                 <td class="CformNombre" width="130">Título:&nbsp;</td>
                 <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="descripcion"/>
                 </td>
               </tr>
               <tr>
                 <td class="CformNombre" width="130">Prestación:&nbsp;</td>
                 <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="prestacionDescripcion"/></td>
               </tr>
             </table>
			       <table width="100%">
			         <tr bgcolor="#BFDFFF">
			           <td><strong>Prestador &nbsp;</strong></td>
			         </tr>
			       </table>
             <table width="100%" >
               <tr>
                 <td colspan="10">
                   <display:table name='<%= titularLote %>' style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
                     <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader"/>
	                   <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
	                   <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
	                   <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
	                 </display:table>
                 </td>
               </tr>
            </table>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Especificación&nbsp;</strong></td>
              </tr>
            </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="130">Detalle STAN:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="detalle"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Detalle Prestación:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="prestacionDetalle"/></td>
              </tr>
               <tr>
                <td class="CformNombre" width="130">Metodología:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="especificacionMetodologia"/></td>
               </tr>

               <tr>
                 <td class="CformNombre" width="130">Unidad de Prestación:&nbsp;</td>
                 <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="unidadPrestacion"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Capacidad Operativa:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="capacidadOperativa"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Cantidad Mínima:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="cantidadMinima"/></td>
              </tr>
               <logic:empty property="responsablesTecnicos" name="cOfertaTecnologicaEliminarActionForm">
	              <logic:notEmpty property="responsable" name="cOfertaTecnologicaEliminarActionForm">
		              <tr>
		                 <td class="CformNombre" width="130">Responsable Técnico:&nbsp;</td>
		                 <td class="CformDato">
		                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="responsable"/></td>
		              </tr>
		          </logic:notEmpty>    
              </logic:empty>
              
              
            </table>
            
            
            
             <logic:notEmpty property="responsablesTecnicos" name="cOfertaTecnologicaEliminarActionForm">
		  		<table width="100%">
				      <tr bgcolor="#BFDFFF">
				        <td><strong>Responsables Técnicos&nbsp;</strong></td>
				      </tr>
			    </table>
		      	<table width="100%">
				        <tr>
				          <td colspan="10">
				            <display:table name='<%= responsablesTecnicos %>' style="width: 100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
				            
				              	<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
								<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
								<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
								<display:column property="documentacion" title="Documentación" headerClass="tableCellHeader" />		
				
				            </display:table>
				          </td>
				        </tr>
		        </table>
			  </logic:notEmpty>
              <logic:empty property="responsablesTecnicos" name="cOfertaTecnologicaEliminarActionForm">
					<logic:empty property="responsable" name="cOfertaTecnologicaEliminarActionForm">
							        <table width="100%">
									      <tr bgcolor="#BFDFFF">
									        <td><strong>Responsables Técnicos&nbsp;</strong></td>
									      </tr>
								    </table>
									<table width="100%">
											<tr>
												<td>No se seleccionaron responsables técnicos&nbsp;</td>
											</tr>
									</table>
					</logic:empty>
			  </logic:empty>									
            
            
            <table width="100%">
              <tr bgcolor="#BFDFFF">
               <td><strong>Equipamientos&nbsp;</strong></td>
              </tr>
            </table>
		        <logic:notEmpty property="equiposLote" name="cOfertaTecnologicaEliminarActionForm">
              <table width="100%" >
                <tr>
                  <td colspan="10">
                    <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.equiposLote" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                      <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
                      <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                      <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
                      <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                     <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
 
                    </display:table>
                  </td>
                </tr>
              </table>
		        </logic:notEmpty>
            <logic:empty property="equiposLote" name="cOfertaTecnologicaEliminarActionForm">
	            <table width="100%" >
	             <tr>
	               <td>No se seleccionaron equipamientos&nbsp;</td>
	             </tr>
	            </table>
            </logic:empty>
              
             <!-- 
              <capplication:isApplication application="SVT">
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>UVT:&nbsp;</strong></td>
                 </tr>
                </table>
                <logic:notEmpty property="colGestor" name="cOfertaTecnologicaEliminarActionForm">
                  <table width="100%" >
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                          <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader"/>
                          <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colGestor" name="cOfertaTecnologicaEliminarActionForm">
                  <table width="100%" >
                    <tr>
                     <td>No se seleccionó UVT.&nbsp;</td>
                    </tr>
                  </table>
                </logic:empty>
              </capplication:isApplication>
          -->
          
		          <table width="100%">
		             <tr bgcolor="#BFDFFF">
		               <td><strong>Información Tecnológica&nbsp;</strong></td>
		             </tr>
		          </table>

		          <table width="100%">
		             <tr bgcolor="#DDEEFF">
		               <td>Disciplina Primaria&nbsp;</td>
		             </tr>
              </table>

	            <table width="100%">
	              <tr>
                  <td class="CformNombre" width="100">Principal:&nbsp;</td>
                  <td class="CformDato">
                    <bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalDPDescripcion"/></td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="100">Otras:&nbsp;</td>
	                <logic:notEmpty property="loteDP" name="cOfertaTecnologicaEliminarActionForm">
	                  <td class="CformDato">
	                    <html:select disabled="false" property="loteDP" multiple="true" size="3" >
	                      <html:options collection ="comboOtDP" property="value" labelProperty="label"/>
	                    </html:select>
	                   </td>
	                </logic:notEmpty>
	              </tr>
	            </table>

	           <table width="100%">
               <tr bgcolor="#DDEEFF">
	                <td>Disciplina Desagregada&nbsp;</td>
		           </tr>
		         </table>

	           <table width="100%">
	             <tr>
	               <td class="CformNombre" width="100">Principal:&nbsp;</td>
	               <td class="CformDato">
	                 <bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalDDDescripcion"/></td>
	             </tr>
	             <tr>
	               <td class="CformNombre" width="100">Otras:&nbsp;</td>
	                 <logic:notEmpty property="loteDD" name="cOfertaTecnologicaEliminarActionForm">
	                   <td class="CformDato" >
	                     <html:select disabled="false" property="loteDD" multiple="true" size="3" >
	                       <html:options collection="comboOtDD" property="value" labelProperty="label" />
	                     </html:select>
	                   </td>
	                 </logic:notEmpty>
	             </tr>
	          </table>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Campo de Aplicación&nbsp;</td>
             </tr>
           </table>
           <table width="100%">
             <tr>
               <td class="CformNombre" width="100">Principal:&nbsp;</td>
               <td class="CformDato"><bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalCADescripcion"/></td>
             </tr>
             <tr>
              <td class="CformNombre" width="100">Otros:&nbsp;</td>
              <logic:notEmpty property="loteCA" name="cOfertaTecnologicaEliminarActionForm">
                <td class="CformDato" >
                  <html:select disabled="false" property="loteCA" multiple="true" size="3" >
                    <html:options collection="comboOtCA" property="value" labelProperty="label" />
                  </html:select>
                </td>
              </logic:notEmpty>
            </tr>
           </table>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Actividades Industriales&nbsp;</td>
             </tr>
           </table>
           <table width="100%">
             <tr>
               <td class="CformNombre" width="100">Principal:&nbsp;</td>
               <td class="CformDato"><bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalCODescripcion"/></td>
             </tr>
              <tr>
                <td class="CformNombre" width="100">Otros:&nbsp;</td>
                <logic:notEmpty property="loteCO" name="cOfertaTecnologicaEliminarActionForm">
                  <td class="CformDato" >
                    <html:select disabled="false" property="loteCO" multiple="true" size="3" >
                      <html:options collection="comboOtCO" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </logic:notEmpty>
              </tr>
           </table>
           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Palabras Claves&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%"  >
             <tr>
               <td class="CformNombre" width="100">1ª:&nbsp;</td>
               <td class="CformDato"> 
                 <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave1"/></td>
             </tr>
             <tr>
               <td class="CformNombre" width="100">2ª:&nbsp;</td>
               <td class="CformDato"> 
                 <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave2"/></td>
             </tr>
             <tr>
               <td class="CformNombre" width="100">3ª:&nbsp;</td>
               <td class="CformDato"> 
                 <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave3"/></td>
             </tr>
             <tr>
               <td class="CformNombre" width="100">4ª:&nbsp;</td>
               <td class="CformDato"> 
                 <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave4"/></td>
             </tr>
             <tr>
               <td class="CformNombre" width="100">5ª:&nbsp;</td>
               <td class="CformDato"> 
                 <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave5"/></td>
             </tr>
           </table>
           <table width="100%">
             <tr bgcolor="#BFDFFF">
                <td><strong>Costos&nbsp;</strong></td>
             </tr>
           </table>
            <logic:notEmpty property="stanCostos" name="cOfertaTecnologicaEliminarActionForm">
              <table width="100%" >
                <tr>
                  <td colspan="10">
                    <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.stanCostosCfm" style="width:100%" id="eliminarOferta" requestURI="cOfertaTecnologicaEliminarAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
                      <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader"/>
                      <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
                      <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 80px;"/>
                      <display:column property="fechaDesde" title="Vigencia Desde" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
                      <display:column property="fechaHasta" title="Vigencia Hasta" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
                      <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
                    </display:table>
                  </td>
                </tr>
              </table>
            </logic:notEmpty>
            <logic:empty property="stanCostos" name="cOfertaTecnologicaEliminarActionForm">
              <table width="100%" >
               <tr >
                 <td>No se informaron costos&nbsp;</td>
               </tr>
              </table>
            </logic:empty>
			      <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Seguimiento&nbsp;</strong></td>
              </tr>
            </table>
			      <capplication:isApplication application="SVT">
			        <table width="100%">
			          <tr>
			            <td class="CformNombre" width="130" align="left">Expediente Nro:&nbsp;</td>
			            <td class="CformDato">
			              <logic:notEmpty property="nroExpediente" name="cOfertaTecnologicaEliminarActionForm">
			                <bean:write name="cOfertaTecnologicaEliminarActionForm" property="nroExpediente" /> /
			                <bean:write name="cOfertaTecnologicaEliminarActionForm" property="anioExpediente" />
			              </logic:notEmpty>
			            </td>
			          </tr>
			          <tr>
			            <td class="CformNombre" width="130">Fecha Autorización:&nbsp;</td>
			            <td class="CformDato">
			              <bean:write name="cOfertaTecnologicaEliminarActionForm" property="fechaAutorizacion" />
			            </td>
			          </tr>
			          <tr>
			            <td class="CformNombre" width="130">Resolución:&nbsp;</td>
			            <td class="CformDato">
			              <logic:notEmpty property="nroResolucion" name="cOfertaTecnologicaEliminarActionForm">
			                Tipo:&nbsp;
			                <html:select disabled="true" property="tipoResolucion">
			                  <html:options collection="comboTipoResolucion"  property="value" labelProperty="label" />
			                </html:select>
			                Nro: <bean:write name="cOfertaTecnologicaEliminarActionForm" property="nroResolucion" />
			                &nbsp;&nbsp;
			                Fecha:&nbsp; <bean:write name="cOfertaTecnologicaEliminarActionForm" property="fechaResolucion" />
			              </logic:notEmpty>
			              <logic:greaterThan value="-1" property="estadoResolucion" name="cOfertaTecnologicaEliminarActionForm">
			                <html:select disabled="true" property="estadoResolucion">
			                  <html:options collection="comboEstadoResolucion" property="value" labelProperty="label" />
			                </html:select>
			              </logic:greaterThan>
			            </td>
			          </tr>
			         </table>
			       </capplication:isApplication>
		        <table width="100%" cellpadding="0" cellspacing="0">
		          <tr>
		            <td class="CformNombre" width="130">Estado:&nbsp;</td>
		            <td class="CformDato">
		              <html:select disabled="true" property="tipoEstado">
		                <html:options collection="comboTipoEstado" property="value" labelProperty="label" />
		              </html:select>
		            </td>
		          </tr>
		        </table>  
		        <table width="100%" cellpadding="0" cellspacing="0">
		          <capplication:isApplication application="SVT">
		            <tr>
		              <td class="CformNombre" width="130">Publicar:&nbsp;</td>
		              <td class="CformDato">Sí <html:radio property="publica"
		                value="S" disabled="true" /> No <html:radio
		                property="publica" value="N" disabled="true" />
		              </td>
		            </tr>
		          </capplication:isApplication>
		        </table>
          </logic:equal>
          
          <!-- PROPIEDAD INTELECTUAL-->
          <logic:equal property="tipoOferta" value="2" name="cOfertaTecnologicaEliminarActionForm">
            <table width="100%" cellpadding="0" cellspacing="0"  >
              <logic:notEmpty property="codigoId" name="cOfertaTecnologicaEliminarActionForm">
                <tr>
                  <td class="CformNombre" width="114">Código:&nbsp;</td>
                  <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="codigoId" />
                  </td>
                </tr>
              </logic:notEmpty>             
              <tr>
                <td class="CformNombre" width="114">Número:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="numeroPropiedad" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="114">Título:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="descripcion"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="114">Detalle:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="detalle" />
                </td>
              </tr>
            </table>
            <table width="100%" cellpadding="0" cellspacing="0"  >
            <!--Si es propiedad intelectual, mostrar tipo-->
              <tr>
                <td class="CformNombre" width="114">Tipo Propiedad:&nbsp;</td>
                <td class="CformDato">
                  <html:select disabled="true" property="tipoPropiedad"  >
                    <html:options collection="comboTipoPropiedad" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
           </table>
           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Prestador / Titular &nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%" >
             <tr>
               <td colspan="10">
                 <display:table name='<%= titularLote %>' style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
                   <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader"/>
                   <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                   <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                   <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                   <display:column property="comboDetalleEsTitularCfm" title="Rol" headerClass="tableCellHeader" style="width: 100px;" media="html" />
                 </display:table>
               </td>
             </tr>
           </table>
           
	         <table width="100%">
	           <tr bgcolor="#BFDFFF">
	             <td><strong>Equipamientos&nbsp;</strong></td>
	           </tr>
	         </table>
	         <logic:notEmpty property="equiposLote" name="cOfertaTecnologicaEliminarActionForm">
             <table width="100%" >
               <tr>
                 <td colspan="10">
                   <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.equiposLote" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                     <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
                     <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                     <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
                     <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                     <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
 
                   </display:table>
                 </td>
               </tr>
             </table>
           </logic:notEmpty>
           <logic:empty property="equiposLote" name="cOfertaTecnologicaEliminarActionForm">
             <table width="100%" >
               <tr>
                 <td>No se seleccionaron equipamientos&nbsp;</td>
               </tr>
             </table>
           </logic:empty>
           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Información Tecnológica&nbsp;</strong></td>
             </tr>
            </table>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Disciplina Primaria&nbsp;</td>
             </tr>
            </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="100">Principal:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalDPDescripcion"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Otras:&nbsp;</td>
                  <logic:notEmpty property="loteDP" name="cOfertaTecnologicaEliminarActionForm">
                    <td class="CformDato">
                      <html:select disabled="false" property="loteDP" multiple="true" size="3" >
                        <html:options collection ="comboOtDP" property="value" labelProperty="label"/>
                      </html:select>
                    </td>
                  </logic:notEmpty>
              </tr>
            </table>
            <table width="100%">
              <tr bgcolor="#DDEEFF">
                <td>Disciplina Desagregada&nbsp;</td>
              </tr>
            </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="100">Principal:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalDDDescripcion"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Otras:&nbsp;</td>
                  <logic:notEmpty property="loteDD" name="cOfertaTecnologicaEliminarActionForm">
                    <td class="CformDato" >
                      <html:select disabled="false" property="loteDD" multiple="true" size="3" >
                        <html:options collection="comboOtDD" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </logic:notEmpty>
              </tr>
            </table>
            <table width="100%">
              <tr bgcolor="#DDEEFF">
                <td>Campo de Aplicación&nbsp;</td>
              </tr>
            </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="100">Principal:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalCADescripcion"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Otros:&nbsp;</td>
                <logic:notEmpty property="loteCA" name="cOfertaTecnologicaEliminarActionForm">
                  <td class="CformDato" >
                    <html:select disabled="false" property="loteCA" multiple="true" size="3" >
                      <html:options collection="comboOtCA" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </logic:notEmpty>
              </tr>
            </table>
            <table width="100%">
              <tr bgcolor="#DDEEFF">
                <td>Actividades Industriales&nbsp;</td>
              </tr>
            </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="100">Principal:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="principalCODescripcion"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Otros:&nbsp;</td>
                <logic:notEmpty property="loteCO" name="cOfertaTecnologicaEliminarActionForm">
                  <td class="CformDato" >
                    <html:select disabled="false" property="loteCO" multiple="true" size="3" >
                      <html:options collection="comboOtCO" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </logic:notEmpty>
              </tr>
            </table>
            <table width="100%">
              <tr bgcolor="#DDEEFF">
                <td>Clasificación Internacional Alfanumérica OMPI&nbsp;</td>
              </tr>
            </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="100">Código CIP:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="cip" /></td>
              </tr>
           </table>
           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Palabras Claves&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%"  >
             <tr>
               <td class="CformNombre" width="100">1ª:&nbsp;</td>
               <td class="CformDato"> 
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave1"/></td>
             </tr>
              <tr>
                <td class="CformNombre" width="100">2ª:&nbsp;</td>
                <td class="CformDato"> 
                   <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave2"/></td>
             </tr>
             <tr>
               <td class="CformNombre" width="100">3ª:&nbsp;</td>
               <td class="CformDato"> 
                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave3"/></td>
             </tr>
             <tr>
               <td class="CformNombre" width="100">4ª:&nbsp;</td>
               <td class="CformDato"> 
                 <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave4"/></td>
             </tr>
             <tr>
               <td class="CformNombre" width="100">5ª:&nbsp;</td>
               <td class="CformDato"> 
                 <bean:write name="cOfertaTecnologicaEliminarActionForm" property="palabraClave5"/></td>
             </tr>
            </table>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td><strong>Inventores&nbsp;</strong></td>
              </tr>
             </table>
             <logic:notEmpty property="inventores" name="cOfertaTecnologicaEliminarActionForm">
               <table width="100%" >
                 <tr>
		               <td colspan="10">
		                 <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.inventores" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDisplayWrapper">
		                   <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 120px;" />
		                   <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                   <display:column property="autoria" title="% de autoría" headerClass="tableCellHeader" style="text-align:right;width:100px;" />
                     </display:table>
                   </td>
                  </tr>
                </table>
              </logic:notEmpty>
              <logic:empty property="inventores" name="cOfertaTecnologicaEliminarActionForm">
	              <table width="100%" >
	               <tr >
	                 <td>No se seleccionaron inventores&nbsp;</td>
	               </tr>
	             </table>
	            </logic:empty>

              <!-- Historial distribucion de beneficios por inventor -->
              <table align="center" class="tablaMin">
		            <tr>
		              <td>
		               <div id="auto_retract_normal_accordion" class="accContainer">
		                  <logic:iterate id="distribucion" name="cOfertaTecnologicaEliminarActionForm" property="colDistribucionHistorial">
		                 
		                  <div id="overviewPane2" class="accordion-pane">
		                    <div id="overviewHeader" class="menuTitle">
		                      Desde: <bean:write name="distribucion" property="fechaDesde" format="dd/MM/yyyy"/> - 
		                      Hasta: <bean:write name="distribucion" property="fechaHasta" format="dd/MM/yyyy"/>
		                    </div>
		                      <bean:define id="distribucionId" name="distribucion" property="id" />
		                      <div id="panel1Content" class="accordion-cont">
		                        <div class="content">
		                            <table align="center" class="CformTable">
		                              <tr>
		                                <td>
		                                  <table width="100%" >
		                                    <tr>
		                                      <td colspan="10">
		                                        <display:table name='<%="sessionScope.cOfertaTecnologicaEliminarActionForm.armarDistribucionPorId("+ distribucionId + ")"%>' id="distribucionDetalleEnOferta" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
		                                           <display:column property="tipoEgresoDescripcion" title="Tipo Imputación" headerClass="tableCellHeader" style="width: 300px;" />
		                                           <display:column property="importePorcentual" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width: 100px;" />
		                                           <display:column property="sugerido" title="% Sugerido" headerClass="tableCellHeader" style="width: 200px;" />
		                                         </display:table>
		                                      </td>
		                                    </tr>
		                                  </table>
		                                </td>
		                             </tr>
		                           </table>
		             
		                       </div>
		                     </div>
		                   </div>
		                 </logic:iterate>
		                    
		               </div>
		              </td>
		            </tr>
		          </table>  
		          <logic:empty property="colDistribucionHistorial" name="cOfertaTecnologicaEliminarActionForm">
                <table width="100%" >
		               <tr>
		                 <td>El Historial de la Distribución de Beneficios está vacio.&nbsp;</td>
		               </tr>
		             </table>
              </logic:empty>
            
              <!-- distribucion de beneficios por inventor -->
              <table width="100%">
                <tr bgcolor="#BFDFFF">
                  <td><strong>Distribución de Beneficios&nbsp;</strong></td>
                </tr>
              </table>
	            <logic:notEmpty property="distribucionLote" name="cOfertaTecnologicaEliminarActionForm">
	              <table width="100%" >
	                <tr>
	                  <td colspan="10">
	                    <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.distribucionLote" style="width:100%" id="distribucionDetalleEnOferta" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
	                      <display:column property="tipoEgresoDescripcion" title="Tipo Imputación" headerClass="tableCellHeader" style="width: 40%;" />
	                      <display:column property="importePorcentual" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width: 30%;" />
	                      <display:column property="sugerido" title="% Sugerido" headerClass="tableCellHeader" style="width: 30%;" />
	                    </display:table>
	                  </td>
	                </tr>
	              </table>
	            </logic:notEmpty>
	            <logic:empty property="distribucionLote" name="cOfertaTecnologicaEliminarActionForm">
	              <table width="100%" >
	                <tr>
	                  <td>No se seleccionó distribución&nbsp;</td>
	                </tr>
	              </table>
	            </logic:empty>
	            <table width="100%">
                <tr bgcolor="#BFDFFF">
                    <td><strong>Instancias&nbsp;</strong></td>
                </tr>
             </table>
             <table width="100%" align="center">
               <tr>
                 <td>
                   <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.instancias" style="width:100%" decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
                     <display:column property="descripcionCfm" title="Instancia" headerClass="tableCellHeader" style="width: 60%;" />
                     <display:column property="fechaCfm" title="Fecha" headerClass="tableCellHeader" style="width: 40%;" />
                   </display:table>
                 </td>
               </tr>
             </table>
	           <table width="100%">
	             <tr bgcolor="#BFDFFF">
	               <td><strong>Registro&nbsp;</strong></td>
	             </tr>
	            </table>
	            <table width="100%" >
	              <tr>
	                <td class="CformNombre"  width="100" >Fecha:&nbsp; </td>
	                <td class="CformDato">
	                  <bean:write name="cOfertaTecnologicaEliminarActionForm" property="fechaRegistrada" />
	                </td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="100">Denominación:&nbsp;</td>
	                <td ><bean:write name="cOfertaTecnologicaEliminarActionForm" property="denominacion"  /></td>
	              </tr>
	             </table>
	             <table width="100%" >
	               <tr>
	                <td>
	                  <table width="100%">
	                    <tr bgcolor="#DDEEFF">
	                      <td>Organismo de Registro&nbsp;</td>
	                    </tr>
	                  </table>
	                  <logic:notEmpty property="organismoRegistroLote" name="cOfertaTecnologicaEliminarActionForm">
	                    <table width="100%" >
	                      <tr>
		                      <td colspan="10">
		                        <display:table name="sessionScope.cOfertaTecnologicaEliminarActionForm.organismoRegistroLote" style="width:100%" decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
		                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader"  />
		                          <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 200px;" />
		                          <display:column property="pais" title="País" headerClass="tableCellHeader" style="width:350px;" />
		                        </display:table>
		                      </td>
	                      </tr>
	                    </table>
	                  </logic:notEmpty>
	                  <logic:empty property="organismoRegistroLote" name="cOfertaTecnologicaEliminarActionForm">
	                    <table width="100%" >
	                      <tr >
	                        <td>No se selecciono organismo de Registro&nbsp;</td>
	                      </tr>
	                    </table>
	                  </logic:empty>
	                </td>
	               </tr>
	             </table>
               <table width="100%">
                 <tr bgcolor="#BFDFFF">
                   <td>
                     <strong>Seguimiento&nbsp;</strong>
                   </td>
                </tr>
               </table>
		           <table width="100%" >
		             <tr>
		               <td class="CformNombre" width="114">Estado:&nbsp;</td>
		               <td class="CformDato">
		                 <html:select disabled="true" property="tipoEstado" >
		                   <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
		                 </html:select>
		               </td>
		             </tr>
		             <capplication:isApplication application="SVT">
		               <tr>
		                 <td class="CformNombre" width="110">Publicar:</td>
		                 <td class="CformDato">
		                   Sí <html:radio property="publica" value="S"  disabled="true" />
		                   No <html:radio property="publica" value="N" disabled="true" />
		                 </td>
		               </tr>
		             </capplication:isApplication>
		           </table>
          </logic:equal>
         </td>
        </tr>
      </table>
     </td>
   </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <logic:equal property="tipoOferta" value="3" name="cOfertaTecnologicaEliminarActionForm">
          <!-- html:submit property="btnSubmit" styleClass="CformBoton" value="Ver Distribucion"/-->
        </logic:equal>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
      </div>
    </td>
  </tr>

</table>
</logic:equal>

</html:form>
