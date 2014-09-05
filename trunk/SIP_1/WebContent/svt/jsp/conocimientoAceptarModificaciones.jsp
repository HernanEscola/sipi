<%@include file="layout/include.jsp"%>
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
            $(elementos[i].id+'_label').update('Mostrar Actualizaciones');
          } else {
            new Effect.Highlight($(elementos[i].id+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#5998d9' });
            $(elementos[i].id+'_label').update('Ocultar Actualizaciones');
          }
        } 
      }
    }
  }
  
  function toggleLayer(whichLayer){
    Effect.toggle(whichLayer, 'slide', { delay: 0.2 });
    if($(whichLayer).visible()){
      new Effect.Highlight($(whichLayer+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#E2EBF3' });
      $(whichLayer+'_label').update('Mostrar Actualizaciones');
    } else {
      new Effect.Highlight($(whichLayer+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#5998d9' });
      $(whichLayer+'_label').update('Ocultar Actualizaciones');
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
  <html:hidden property="accion" />
  <logic:equal property="accion" value="aceptar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
  
    <bean:define id="history" property="modificaciones" name="cOfertaTecnologicaAceptarModificacionesActionForm"/>
    <bean:define id="historyMap" property="attributes" name="history"/>
    <bean:define id="original" property="oferta" name="history"/>
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
      <tr>
         <td>
           <div>
             <table width="100%">
               <tr bgcolor="#BFDFFF">
                 <td>Desarrollos y Conocimientos&nbsp;</td>
               </tr>
             </table>
             <table width="100%">
               <tr>
                 <td class="CformNombre" width="20%">Título:&nbsp;</td>
                 <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcionOriginal" /></td>
               </tr>
               <tr>
                 <td class="CformNombre" width="20%">Detalle:&nbsp;</td>
                 <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="detalleOriginal" /></td>
               </tr>
               <tr>
			        <td class="CformNombre" width="130">Responsable Técnico:&nbsp;</td>
			        <td class="CformDato">
			          <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsableOriginal" />
			        </td>
			    </tr>
              </table>
              
              <table width="100%">
                <tr bgcolor="#DFEFFF">
                  <td>Prestador&nbsp;</td>
                </tr>
              </table>
              <table width="100%">
                <tr>
                  <td colspan="2">
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
            <logic:equal value="S" property="hasNewsConocimiento" name="cOfertaTecnologicaAceptarModificacionesActionForm">
             <div id="conocimiento_label" onclick="javascript:toggleLayer('conocimiento');" class="label">Mostrar Actualizaciones</div>
             <div class="collapsable" id="conocimiento" style="display: none;" >
               <div class="content">
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <logic:equal value="S" property="hasNews(descripcion)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                     <tr>
                       <td class="CformNombre" width="20%">Título:&nbsp;</td>
                       <td class="CformDato">
                         <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcionNew"/></td>
                     </tr>
                     <tr>
                       <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcion"/>
                     </tr>
                   </logic:equal>
                   <logic:equal value="S" property="hasNews(detalle)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                     <tr>
                       <td class="CformNombre" width="20%">Detalle:&nbsp;</td>
                       <td class="CformDato">
                         <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="detalleNew"/></td>
                     </tr>
                     <tr>
                       <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="detalle"/>
                     </tr>
                     </logic:equal>
                      <logic:equal value="S" property="hasNews(responsable)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                     <tr>
				        <td class="CformNombre" width="130">Responsable Técnico:&nbsp;</td>
				        <td class="CformDato">
				          <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsableNew" />
				        </td>
			    	</tr>
			    	<tr>
			    		<capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsable"/>
                    </tr>
                   </logic:equal>
                 </table>
               </div>
             </div>
           </logic:equal>
         </td>
      </tr>
    </table>
    

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >  
      <tr>
        <td>
           <table width="100%">     
            <tr>
              <td width="100%">

	             <table width="100%">
	                   <tr bgcolor="#BFDFFF">
	                     <td><strong>Equipamientos Asignados&nbsp;</strong></td>
	                   </tr>
	             </table>
	                     
	            <logic:notEmpty  name="cOfertaTecnologicaAceptarModificacionesActionForm" property="equiposAsignados">
	                 <table width="100%">     
	                  <tr>
	                    <td colspan="10">
	                      <display:table excludedParams="*" uid="asignados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposAsignados" requestURI="cOfertaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CEquipoModificacionesAceptarDisplayWrapper">
	                        <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
	                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader"  style="width: 350px;"/>
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
	                      <display:table  excludedParams="*" uid="aprocesar" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposAProcesar" requestURI="cOfertaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CEquipoModificacionesAceptarDisplayWrapper">
	                        <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
	                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader"  style="width: 350px;"/>
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
	                      <display:table excludedParams="*" uid="desasignados" name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposDesasignados" requestURI="cOfertaAceptarModificacionesAction.do" defaultsort="1" defaultorder="descending" style="width: 100%" decorator="conicet.apps.svt.web.moduloPrestador.decorator.CEquipoModificacionesAceptarDisplayWrapper">
	                        <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;"/>                  
	                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;"/>
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
              <div>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>Información Tecnológica&nbsp;</td>
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
                        <td class="CformDato">
                          <logic:greaterThan value="-1" property="disciplinaPrimariaPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="true" property="disciplinaPrimariaPpalOriginal">
                              <html:options collection="comboDispPrimariaOrig" property="value" labelProperty="label" />
                            </html:select>
                          </logic:greaterThan>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                        <td class="CformDato">
                          <logic:notEmpty property="disciplinaPrimariaOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="false" property="disciplinaPrimariaOriginal" multiple="true" size="3">
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
                        <td class="CformDato">
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
                        <td class="CformDato">
                          <logic:notEmpty property="disciplinaDesagregadaOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="false" property="disciplinaDesagregadaOriginal" multiple="true" size="3">
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
                        <td class="CformDato">
                          <logic:greaterThan value="-1" property="campoAplicacionPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="true" property="campoAplicacionPpalOriginal">
                              <html:options collection="comboCampoAplicOrig" property="value" labelProperty="label" />
                            </html:select>
                          </logic:greaterThan>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                        <td class="CformDato">
                          <logic:notEmpty property="campoAplicacionOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="false" property="campoAplicacionOriginal" multiple="true" size="3">
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
                        <td class="CformDato">
                          <logic:greaterThan value="-1" property="clasificacionONUPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="true" property="clasificacionONUPpalOriginal">
                              <html:options collection="comboActivIndustrialesOrig" property="value" labelProperty="label" />
                            </html:select>
                          </logic:greaterThan>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                        <td class="CformDato">
                          <logic:notEmpty property="clasificacionONUOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="false" property="clasificacionONUOriginal" multiple="true" size="3">
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
            <%/*Comeinzo de las actualizaciones de Información Tecnológica*/ %>
            <logic:equal value="S" property="hasNewsInformacionTecnologica" name="cOfertaTecnologicaAceptarModificacionesActionForm">
              <div id="infoTecno_label" onclick="javascript:toggleLayer('infoTecno');" class="label">Mostrar Actualizaciones</div>
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
                        <td class="CformDato">
                          <logic:greaterThan value="-1" property="disciplinaPrimariaPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="true" property="disciplinaPrimariaPpalNew">
                              <html:options collection="comboDispPrimariaNew" property="value" labelProperty="label" />
                            </html:select>
                          </logic:greaterThan>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                        <td class="CformDato">
                          <logic:notEmpty property="disciplinaPrimariaNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="false" property="disciplinaPrimariaNew" multiple="true" size="3">
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
                        <td class="CformDato">
                          <logic:greaterThan value="-1" property="disciplinaDesagregadaPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="true" property="disciplinaDesagregadaPpalNew">
                              <html:options collection="comboDispDesagregadaNew" property="value" labelProperty="label" />
                            </html:select>
                          </logic:greaterThan>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                        <td class="CformDato">
                          <logic:notEmpty property="disciplinaDesagregadaNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="false" property="disciplinaDesagregadaNew" multiple="true" size="3">
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
                        <td class="CformDato">
                          <logic:greaterThan value="-1" property="campoAplicacionPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="true" property="campoAplicacionPpalNew">
                              <html:options collection="comboCampoAplicNew" property="value" labelProperty="label" />
                            </html:select>
                          </logic:greaterThan>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                        <td class="CformDato">
                          <logic:notEmpty property="campoAplicacionNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="false" property="campoAplicacionNew" multiple="true" size="3">
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
                        <td class="CformDato">
                          <logic:greaterThan value="-1" property="clasificacionONUPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="true" property="clasificacionONUPpalNew">
                              <html:options collection="comboActivIndustrialesNew" property="value" labelProperty="label" />
                            </html:select>
                          </logic:greaterThan>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="15%">Otras:&nbsp;</td>
                        <td class="CformDato">
                          <logic:notEmpty property="clasificacionONUNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                            <html:select disabled="false" property="clasificacionONUNew" multiple="true" size="3">
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
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <div>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td>Palabras Clave&nbsp;</td>
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
            <div id="palabrasClave_label" onclick="javascript:toggleLayer('palabrasClave');" class="label">Mostrar Actualizaciones</div>
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
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave2New" /></td>
                    </tr>
                    <tr>
                      <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave2"/>
                    </tr>
                  </logic:equal>
                  <logic:equal value="S" property="hasNews(palabraClave3)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                    <tr>
                      <td class="CformNombre" width="10%">3ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave3New" /></td>
                    </tr>
                    <tr>
                      <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave3"/>
                    </tr>
                  </logic:equal>
                 <logic:equal value="S" property="hasNews(palabraClave4)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                    <tr>
                      <td class="CformNombre" width="10%">4ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave4New" /></td>
                    </tr>
                    <tr>
                      <capplication:checkProperty form="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave4"/>
                    </tr>
                  </logic:equal>
                  <logic:equal value="S" property="hasNews(palabraClave5)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                    <tr>
                      <td class="CformNombre" width="10%">5ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave5New" /></td>
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

		<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
			<tr>
				<td>
				<table width="100%">
					<tr bgcolor="#BFDFFF">
						<td>Seguimiento&nbsp;</td>
					</tr>
				</table>
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td class="CformNombre" width="130">Estado:&nbsp;</td>
           							<td class="CformDato">
                      							<html:select disabled="false" property="tipoEstado" >
                        								<html:options collection="comboEstadosByTipoOferta" property="value" labelProperty="label" />
                      							</html:select>	
           							</td>
								</tr>
							</table>
				<table width="100%">
					<capplication:isApplication application="SVT">
						<tr>
							<td class="CformNombre" width="110">Publicación Web:</td>
							<td class="CformDato">
							  Sí <html:radio	property="publicarOriginal" value="S" disabled="true" /> 
							  No <html:radio	property="publicarOriginal" value="N" disabled="true" />
							</td>
						</tr>
					</capplication:isApplication>
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
				                 <td class="CformNombre" width="114">Motivo:&nbsp;<span class="dato_obligatorio">(1)</span></td>
				                 <td class="CformDato"><html:textarea property="motivo" rows="3" /></td>
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
	             <td class="CformAreaBotones">
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
		  <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td ><span class="dato_obligatorio">(1)</span>
            Si se desea "Rechazar" el motivo es necesario.
          </td>
        </tr>
      </table> 
		
		
		
  </logic:equal>
  
  
  <logic:equal property="accion" value="aceptarCfm" name="cOfertaTecnologicaAceptarModificacionesActionForm">
    <bean:define id="form" name="cOfertaTecnologicaAceptarModificacionesActionForm"/>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <div>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td>Desarrollos y Conocimientos&nbsp;</td>
              </tr>
            </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="114">Prestador:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="prestadorOriginal" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="114">Título:&nbsp;</td>
                <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcionConfirmar" /></td>
              </tr>
              <tr>
                 <td class="CformNombre" width="114">Detalle:&nbsp;</td>
                 <td class="CformDato">
                   <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="detalleConfirmar" /></td>
              </tr>
              <tr>
		        <td class="CformNombre" width="130">Responsable Técnico:&nbsp;</td>
		        <td class="CformDato">
		        <bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="responsableConfirmar" /></td>
		        </td>
	    	</tr>
            </table>
          </div>
        </td>
     </tr>
   </table>
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td width="100%">
          <div>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td>Equipamientos&nbsp;</td>
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
    
     <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <td>
             <div>
               <table width="100%">
                 <tr bgcolor="#BFDFFF">
                   <td>Información Tecnológica&nbsp;</td>
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
                           <html:select disabled="false" property="disciplinaPrimariaConfirmar" multiple="true" size="3">
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
                           <html:select disabled="false" property="disciplinaDesagregadaConfirmar" multiple="true" size="3">
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
                           <html:select disabled="false" property="campoAplicacionConfirmar" multiple="true" size="3">
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
                           <html:select disabled="false" property="clasificacionONUConfirmar" multiple="true" size="3">
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
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <div>
            <table width="100%">
              <tr bgcolor="#BFDFFF">
                <td>Palabras Clave&nbsp;</td>
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

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
       <td>
         <div>
           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td>Seguimiento&nbsp;</td>
             </tr>
           </table>
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td class="CformNombre" width="130">Estado:&nbsp;</td>
           							<td class="CformDato">
                      							<html:select disabled="true" property="tipoEstado" >
                        								<html:options collection="comboEstadosByTipoOferta" property="value" labelProperty="label" />
                      							</html:select>	
           							</td>
								</tr>
							</table>
            <table width="100%">
              <capplication:isApplication application="SVT">
                <tr>
                  <td class="CformNombre" width="110">Publicación Web:</td>
                  <td class="CformDato">
                    Sí <html:radio property="publicarConfirmar" value="S"  disabled="true" />
                    No <html:radio property="publicarConfirmar" value="N" disabled="true" />
                  </td>
                </tr>
              </capplication:isApplication>
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
									<td><strong>Aceptación/Rechazo</strong></td>
								</tr>
							</table>

							<table width="100%">
				              <tr>
				                 <td class="CformNombre" width="114">Motivo:</td>
				                 <td class="CformDato"><html:textarea property="motivo" rows="3" disabled="true" /></td>
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
