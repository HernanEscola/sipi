<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />


<script>

window.onload=function(){
setupPanes("container", document.cConvenioMarcoActionForm.cambiaPanel.value);
controlAcumulado();
}

function setFoco(){
x=event.keyCode
//alert(x)
if((x==13)){ // enter
window.event.returnValue = false
}
}

function mostrarPanel(obj1, obj2){
  document.cConvenioMarcoActionForm.cambiaPanel.value = obj2.id;
  return showPane(obj1, obj2);
}

function irA(obj){
document.cConvenioMarcoActionForm.cambiaPanel.value=obj;
setupPanes("container", document.cConvenioMarcoActionForm.cambiaPanel.value);
}

$(function(){
	$(".porcentaje").numeric(".");
});

function controlAcumulado() {
  var totalAsignadoMap = 0.00;

  for(i=0;i<document.cConvenioMarcoActionForm.elements.length;i++) {
      if (cConvenioMarcoActionForm.elements[i].name.match(/PorcentajeMapped/)){
        if (cConvenioMarcoActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cConvenioMarcoActionForm.elements[i].value);
         a = Math.round((a) * 100) / 100;
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) /100;
         a = a.toFixed(2);
         cConvenioMarcoActionForm.elements[i].value = a;
      	}
      }
  }
  totalAsignadoMap = totalAsignadoMap.toFixed(2);
  cConvenioMarcoActionForm.porcentajeTotal.value = totalAsignadoMap;
  return 1;
}

function formatPorcentajeCalcularTotal(obj){
	validarUltimoPuntoPorcentaje(obj);
	controlAcumulado();
}




function controlAcumuladoAI() {
	  var totalAsignadoMap = 0.00;

	  for(i=0;i<document.cConvenioMarcoActionForm.elements.length;i++) {
	      if (cConvenioMarcoActionForm.elements[i].name.match(/PorcentajeAIMapped/)){
	        if (cConvenioMarcoActionForm.elements[i].value == "" ){
	      	}
	      	else {
	         var a = 0;
	         a = eval(cConvenioMarcoActionForm.elements[i].value);
	         a = Math.round((a) * 100) / 100;
	         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) /100;
	         a = a.toFixed(2);
	         cConvenioMarcoActionForm.elements[i].value = a;
	      	}
	      }
	  }
	  totalAsignadoMap = totalAsignadoMap.toFixed(2);
	  cConvenioMarcoActionForm.porcentajeAITotal.value = totalAsignadoMap;
	  return 1;
	}

	function formatPorcentajeAICalcularTotal(obj){
		validarUltimoPuntoPorcentaje(obj);
		controlAcumuladoAI();
	}


	function validarPorcentajeConDecimalesEnCM(obj,evt){
		var tecla = ( evt.which ) ? evt.which : evt.keyCode;
		if (((tecla>=48)&&(tecla<=57))||(tecla==46)) {
			if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
		 	 return false;
			if (obj.value.length==2 && (tecla!=46) && (obj.value.indexOf(".",0)==-1) )
		     return false;
		}
		return (((tecla >= 48) && (tecla <= 57)) || (tecla == 46) || tecla == 8);
	}





</script>

<br>
<h1 align=" center" class="titulo">Registro de Convenio Marco</h1>
<html:form action="cConvenioMarcoAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="cambiaPanel"/>

<logic:equal property="accion" value="alta" name="cConvenioMarcoActionForm">
<div class="tab-container"  id="container">
    <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <ul class="tabs">
           <li><a href="#" onClick="return mostrarPanel('convenio', this)" id="tabConvenio">Convenio</a></li>
           <li><a href="#" onClick="return mostrarPanel('distribucion', this)" id="tabDistribucion">Distribución Serv.</a></li>
           <li><a href="#" onClick="return mostrarPanel('distribucionAI', this)" id="tabDistribucionAI">Distribución Ases.</a></li>

          </ul>
        </td>
      </tr>
    </table>
 <div>
   <!--tab1 Convenio-->
    <div id="convenio">
        <table class="tablaMin"  align="center" cellpadding="0" cellspacing="0" >
		<tr>
 		  <td class="CformAreaBotones">
		        <div align="center" >
			          <input type="button" class="CformBotonTranspBorde" value="|<<" name="cConvenioMarcoActionForm"   onclick="irA('tabConvenio')" />
			          <input type="button" class="CformBotonTranspBorde" value="<" name="cConvenioMarcoActionForm"   onclick="irA('tabConvenio')" />
			          <input type="button" class="CformBotonTranspBorde" value=">" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucion')" />
			          <input type="button" class="CformBotonTranspBorde" value=">>|" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucionAI')" />
		        </div>
	 	  </td>
		</tr>
	  </table>

      <table class="CformTable" align="center" cellpadding="0" cellspacing="0">

        <tr>
 	    <td>
	      <table width="100%">
               <tr bgcolor="#DDEEFF">
                 <td>Convenio:&nbsp;</td>
               </tr>
              </table>

              <table width="100%" cellpadding="0" cellspacing="0"  >
                <tr>
                  <td class="CformNombre" width="150">Denominación:&nbsp;<span class="dato_obligatorio">*</span></td>
                  <td class="CformDato"><html:text property="denominacion" maxlength="50" size="55" onkeydown="setFoco()"  /></td>
                </tr>
                 <tr>
                  <td class="CformNombre" width="150">Tipo Servicio:&nbsp;<span class="dato_obligatorio">*</span></td>
                  <td class="CformDato">
                    <html:select disabled="false" property="tipoServicio">
                      <html:options collection="comboTipoServicio"  property="value" labelProperty="label"/>
                    </html:select>
                 </td>
                 </tr>
                 <tr>
                  <td class="CformNombre" width="150">Tipo Convenio:&nbsp;<span class="dato_obligatorio">*</span></td>
                  <td class="CformDato">
                    <html:select disabled="false" property="tipoConvenioSelected">
                      <html:options collection="comboTipoConvenio"  property="value" labelProperty="label"/>
                    </html:select>
                 </td>
                 </tr>
               </table>
           </td>
        </tr>

        <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Intervinientes:&nbsp;<span class="dato_obligatorio">*</span></td>
             </tr>
            </table>

           <logic:notEmpty property="organismoLote" name="cConvenioMarcoActionForm">
            <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cConvenioMarcoActionForm.organismoLote" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                        <!-- COMENTADO POR PETICION SVT 794 -->
                        <!-- display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" -->
		                <display:column property="descripcionOSigla" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="comboInstitutoUnidadUniversidad" title="Rol" headerClass="tableCellHeader" style="width: 80px;" media="html" />
        		      </display:table>
		            </td>
        		  </tr>
	    	</table>
          	</logic:notEmpty>
           <logic:empty property="organismoLote" name="cConvenioMarcoActionForm">
            <table width="100%" >
       	     <tr >
               <td>No se seleccionó organismos&nbsp;</td>
       	     </tr>
	    	</table>
          </logic:empty>
	   	</td>
       </tr>
       <tr>
	  	<td>
	    
	    <table  width="100%">
		<tr>
		  <td class="CformAreaBotones"  >
	            <div align="right" >
  	              <html:submit property="btnSeleccionarEntidad" styleClass="CformBoton" value="Seleccionar" />
	           </div>
	 	 </td>
		</tr>
	    </table>
         </td>
       </tr>




        <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>UVT:&nbsp;<span class="dato_obligatorio">*</span></td>
             </tr>
            </table>

           <logic:notEmpty property="uvtLote" name="cConvenioMarcoActionForm">
            <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
		       	      <display:table name="sessionScope.cConvenioMarcoActionForm.uvtLote" style="width: 100%" decorator="conicet.apps.svt.web.gestor.decorator.CUvtDisplayWrapper">
		                <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
		                <display:column property="codigo" title="Código" headerClass="tableCellHeader" style="width: 200px;"/>
		                <display:column property="sigla" title="Sigla"  headerClass="tableCellHeader" style="width: 200px;"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 300px;"/>
		                <display:column property="central" title="Central"  headerClass="tableCellHeader" style="width: 3100px"/>
		              </display:table>
		            </td>
        		  </tr>
	    	</table>
          	</logic:notEmpty>
           <logic:empty property="uvtLote" name="cConvenioMarcoActionForm">
            <table width="100%" >
       	     <tr >
               <td>No se seleccionó UVTs&nbsp;</td>
       	     </tr>
	    	</table>
          </logic:empty>
	   	</td>
       </tr>
       <tr>
	  	<td>
	    
	    <table  width="100%">
		<tr>
		  <td class="CformAreaBotones" >
	            <div align="right" >
  	              <html:submit property="btnSeleccionarUvt" styleClass="CformBoton" value="Seleccionar" />
	           </div>
	 	 </td>
		</tr>
	    </table>
         </td>
       </tr>





     <tr>
	  <td>
	    <table  width="100%">
	  	  <tr>
        		<td width="60%" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">* Datos obligatorios </div>
		        </td>
			<td width="40%" class="CformAreaBotones">
		          <div align="right" >
		          <input type="button" class="CformBoton" value="Siguiente" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucion')" />
		          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
		          <logic:equal property="isCopiaConvenio" value="true" name="cConvenioMarcoActionForm">
		            <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
		          </logic:equal>
		        </div>
			</td>
		  </tr>
	    </table>
         </td>
       </tr>
     </table>
  </div>
  <div id="distribucion">
    <table class="tablaMin"  align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cConvenioMarcoActionForm"   onclick="irA('tabConvenio')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cConvenioMarcoActionForm"   onclick="irA('tabConvenio')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucion')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucion')" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Distribución Servicio:&nbsp;</td>
            </tr>
          </table>
          <table width="100%" >
            <tr>
              <td colspan="10">
                      <display:table length="2" name="sessionScope.cConvenioMarcoActionForm.colDistribucion" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                        <display:column property="descripcionPartes" title="Partes" style="width:350px" headerClass="tableCellHeader"/>
		        		<display:column property="comboComparadores" title="Comparador" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="porcentaje" title="%" headerClass="tableCellHeader" style="width: 350px;" />
                      </display:table>
              </td>
            </tr>
          </table>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Comisiones Servicio:&nbsp;</td>
            </tr>
          </table>
          <table width="100%" >
            <tr>
              <td colspan="10">
                      <display:table offset="3" length="6" name="sessionScope.cConvenioMarcoActionForm.colDistribucion" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                        <display:column property="descripcionPartes" title="Partes" style="width:350px" headerClass="tableCellHeader"/>
		        		<display:column property="comboComparadores" title="Comparador" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="porcentaje" title="%" headerClass="tableCellHeader" style="width: 350px;" />
                      </display:table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- tr>
	   <td>
	    <table>
		 <tr class="tableRowFooter">
		    <td colspan="2" align="right" width="263"> Total&nbsp;</td>
		    <td class="CformNombre" align="left" width="150" ><html:text  style="text-align:right" readonly="true" maxlength="6"  property="porcentajeTotal" name="cConvenioMarcoActionForm" size="6" /></td>
		 </tr>
	    </table>
	   </td>
      </tr -->


    <tr>
	  <td>
	    <table  width="100%">
	  	  <tr>
        		<td width="60%" class="CformAreaBotones" ><div align="left" class="dato_obligatorio"> </div>
		        </td>
			<td width="40%" class="CformAreaBotones">
		          <div align="right" >
		          <input type="button" class="CformBoton" value="Siguiente" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucionAI')" />
		          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
		         
		        </div>
			</td>
		  </tr>
	    </table>
         </td>
       </tr>
       
    </table>
  </div>
 
 
 
   <div id="distribucionAI">
    <table class="tablaMin"  align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cConvenioMarcoActionForm"   onclick="irA('tabConvenio')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucion')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucionAI')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cConvenioMarcoActionForm"   onclick="irA('tabDistribucionAI')" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Distribución Asesoramiento:&nbsp;</td>
            </tr>
          </table>
          <table width="100%" >
            <tr>
              <td colspan="10">
                      <display:table length="2" name="sessionScope.cConvenioMarcoActionForm.colDistribucionAI" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                        <display:column property="descripcionPartes" title="Partes" style="width:350px" headerClass="tableCellHeader"/>
		        		<display:column property="comboComparadoresAI" title="Comparador" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="porcentajeAI" title="%" headerClass="tableCellHeader" style="width: 350px;" />
                      </display:table>
              </td>
            </tr>
          </table>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Comisiones Asesoramiento:&nbsp;</td>
            </tr>
          </table>
          <table width="100%" >
            <tr>
              <td colspan="10">
                      <display:table offset="3" length="6" name="sessionScope.cConvenioMarcoActionForm.colDistribucionAI" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                        <display:column property="descripcionPartes" title="Partes" style="width:350px" headerClass="tableCellHeader"/>
		        		<display:column property="comboComparadoresAI" title="Comparador" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="porcentajeAI" title="%" headerClass="tableCellHeader" style="width: 350px;" />
                      </display:table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- tr>
	   <td>
	    <table>
		 <tr class="tableRowFooter">
		    <td colspan="2" align="right" width="263"> Total&nbsp;</td>
		    <td class="CformNombre" align="left" width="150" ><html:text  style="text-align:right" readonly="true" maxlength="6"  property="porcentajeTotal" name="cConvenioMarcoActionForm" size="6" /></td>
		 </tr>
	    </table>
	   </td>
      </tr -->


      <tr>
        <td>
          <table  width="100%">
            <tr>
              <td width="40%" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">&nbsp;</div></td>
              <td width="60%" class="CformAreaBotones">
                <div align="right" >
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
 
 
 
 
 
 
 </div>
</div><!--del contenedor!-->
</logic:equal>

<!--ACA EMPIEZA la jsp para el caso que sea la CONFIRMACIóN-->

<logic:equal property="accion" value="confirmar" name="cConvenioMarcoActionForm">
<div id="convenio">
 <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table width="100%">
       <tr bgcolor="#DDEEFF">
         <td>Convenio:&nbsp;</td>
       </tr>
      </table>

      <table width="100%" cellpadding="0" cellspacing="0"  >
        <tr>
          <td class="CformNombre" width="150">Denominación:&nbsp;</td>
          <td class="CformDato"><html:text property="denominacion" size="55" onkeydown="setFoco()" disabled="true" /></td>
        </tr>
         <tr>
          <td class="CformNombre" width="150">Tipo Servicio:&nbsp;</td>
          <td class="CformDato">
            <html:select disabled="true" property="tipoServicio">
              <html:options collection="comboTipoServicio" property="value" labelProperty="label"/>
            </html:select>
         </td>
         </tr>
         <tr>
          <td class="CformNombre" width="150">Tipo Convenio:&nbsp;</td>
          <td class="CformDato">
            <html:select disabled="true" property="tipoConvenioSelected">
              <html:options collection="comboTipoConvenio" property="value" labelProperty="label"/>
            </html:select>
         </td>
         </tr>
       </table>
    </td>
  </tr>

  <tr>
    <td>
      <table width="100%">
       <tr bgcolor="#DDEEFF">
         <td>Intervinientes:&nbsp;</td>
       </tr>
      </table>

      <logic:notEmpty property="organismoLote" name="cConvenioMarcoActionForm">
       <table width="100%" >
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cConvenioMarcoActionForm.organismoLote" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                          <!-- COMENTADO POR PETICION SVT 794 -->
                          <!-- display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" -->
                          <display:column property="descripcionOSigla" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="comboInstitutoUnidadUniversidadCfm" title="Rol" headerClass="tableCellHeader" style="width: 80px;" media="html" />
                        </display:table>
                      </td>
                    </tr>
       </table>
      </logic:notEmpty>
    </td>
  </tr>
  
  <tr>
    <td>
         <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>UVT:&nbsp;</td>
             </tr>
         </table>

         <logic:notEmpty property="uvtLote" name="cConvenioMarcoActionForm">
         <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
		       	      <display:table name="sessionScope.cConvenioMarcoActionForm.uvtLote" style="width: 100%"  decorator="conicet.apps.svt.web.gestor.decorator.CUvtDisplayWrapper">
		                <display:column property="codigo" title="Código" headerClass="tableCellHeader" style="width: 200px;"/>
		                <display:column property="sigla" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 200px;"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 300px;"/>
		                <display:column property="central" title="Central" maxLength="16" headerClass="tableCellHeader" style="width: 300px"/>
		              </display:table>
		            </td>
        		  </tr>
	   	  </table>
          </logic:notEmpty>
          <logic:empty property="uvtLote" name="cConvenioMarcoActionForm">
            <table width="100%" >
       	     <tr >
               <td>No se seleccionó UVTs&nbsp;</td>
       	     </tr>
	    	</table>
          </logic:empty>
	</td>
  </tr>
  
  
 </table>
</div>

<div id="distribucion">
 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#DDEEFF">
          <td>Distribución Servicio:&nbsp;</td>
        </tr>
      </table>
      <table width="100%" >
        <tr>
          <td colspan="10">
                  <display:table name="sessionScope.cConvenioMarcoActionForm.colDistribucion" style="width: 100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                    <display:column property="descripcionPartes" title="Partes" style="width:350px" headerClass="tableCellHeader"/>
                    <display:column property="comboComparadoresCfm" title="Comparador" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="porcentajeCfm" title="%" headerClass="tableCellHeader" style="width: 350px;" />
                  </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>


  <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#DDEEFF">
          <td>Distribución Asesoramiento:&nbsp;</td>
        </tr>
      </table>
      <table width="100%" >
        <tr>
          <td colspan="10">
                  <display:table name="sessionScope.cConvenioMarcoActionForm.colDistribucionAI" style="width: 100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                    <display:column property="descripcionPartes" title="Partes" style="width:350px" headerClass="tableCellHeader"/>
                    <display:column property="comboComparadoresAICfm" title="Comparador" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="porcentajeAICfm" title="%" headerClass="tableCellHeader" style="width: 350px;" />
                  </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>







  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
       </div>
    </td>
  </tr>

 </table>
</div>

</logic:equal>
</html:form>
