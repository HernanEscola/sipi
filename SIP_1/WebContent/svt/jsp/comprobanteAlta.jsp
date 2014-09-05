<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script language="JavaScript1.2" src="./js/tripleCombo.js"></script>
<script language="JavaScript1.2" src="./config/selectDependent.js"></script>
<script language="JavaScript1.2" src="./config/javascript.js"></script>

<script>
window.onload=function(){
setupPanes("container", document.cComprobanteActionForm.cambiaPanel.value);
habilitarCamposRegistrar();
}

function irA(obj){
document.cComprobanteActionForm.cambiaPanel.value=obj;
setupPanes("container", document.cComprobanteActionForm.cambiaPanel.value);

}

function mostrarPanel(obj1, obj2){
  document.cComprobanteActionForm.cambiaPanel.value = obj2.id;
  return showPane(obj1, obj2);
}

function confirmaPerdidaComprobante(url){
  url.href = 'cComprobanteAltaAction.do?accion=comprobante';
  msg = 'Se perderán los datos no grabados, ¿desea continuar?';
  if (window.confirm(msg)){
    url.href = url.href;
  }else{
    url.href = '#';
  }
}



function setFocus(){
  document.getElementById('Busqueda').focus()
}

function irAPerdida(obj){
  document.cComprobanteActionForm.cambiaPanel.value=obj;
  setupPanes("container", document.cComprobanteActionForm.cambiaPanel.value);
}

</script>

<br>
<html:form action="cComprobanteAltaAction.do" method="POST">

<html:hidden property="accion"/>
<html:hidden property="cambiaPanel"/>

<logic:equal property="accion" value="alta" name="cComprobanteActionForm">
<h1 align=" center" class="titulo">Registro de  Comprobante</h1>
    <div class="tab-container"  id="container">
      <table align="center" cellpadding="0" cellspacing="0" width="500">
        <tr>
          <td>
            <ul class="tabs">
              <li><a href="#" onClick="return mostrarPanel('comprobante', this)" id="tab1">Tipo</a></li>
            </ul>
          </td>
        </tr>
      </table>
    <div>
    <div id="comprobante">
      <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="2">
            <table align="center" cellpadding="0" cellspacing="0" width="100%">
              <tr><td height="10" colspan="10"></td></tr>
              <tr>
                <td>
                  <table width="100%" cellpadding="2" cellspacing="2">
                    <tr>
                      <td class="CformNombre" width="120">Tipo :<span class="dato_obligatorio">  * </span></td>
                      <td class="CformDato">
                        <html:select disabled="false" property="tipoComprobante">
                          <html:options collection="comboTipoComprobante" property="value" labelProperty="label"/>
                        </html:select>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="40" rowspan="100"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="CformAreaBotones" height="35"><span class="dato_obligatorio">  * Datos obligatorios</span></td>
          <td class="CformAreaBotones" height="35">
            <div align="right">

              <html:submit property="btnSubmit" styleClass="CformBoton" value="Siguiente"/>
              <logic:notEmpty property="input" name="cComprobanteActionForm">
		         <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
              </logic:notEmpty>

            </div>
          </td>
        </tr>
      </table>
    </div>
  </div>
</div>
</logic:equal>


<logic:equal property="accion" value="comprobanteComisionUvt" name="cComprobanteActionForm">
<h1 align=" center" class="titulo">Registro de  Comprobante Comisión UVT</h1>
<div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td>
          <ul class="tabs">
            <li><a href="cComprobanteAltaAction.do?accion=comprobante" onClick ="return confirmaPerdidaComprobante(this)">Tipo</a></li>
            <li><a href="#" onClick="return mostrarPanel('comprobante', this)" id="tab1">Comprobante</a></li>
            <li><a href="#" onClick="return mostrarPanel('contrataciones', this)" id="tabContrataciones">Contrataciones</a></li>
            <li><a href="#" onClick="return mostrarPanel('gestor',this)" id="tabGestor">UVT</a></li>

          </ul>
        </td>
      </tr>
    </table>
    <div>


<div id="contrataciones">
       <table  align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
	 		  <td width="630" class="CformAreaBotones">
			        <div align="center" >
			            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabGestor')" />
			            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabGestor')" />
			        </div>
		 	  </td>
			</tr>
      </table>

      <table class="CformTable"  class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
        <tr>
          <td>
            <table width="100%">
        	     <tr bgcolor="#DDEEFF">
	               <td>Asignadas a este Comprobante:&nbsp;</td>
	       	     </tr>
            </table>

            <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
          	  	<table width="100%" >
        	      <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
                            <display:column property="detalleContratacion" title="#" headerClass="tableCellHeader"  style="width: 10px" />
	        	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
        		        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
                            <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
	        	      </display:table>
		            </td>
        		  </tr>
	         	</table>
			</logic:notEmpty>
			<logic:empty property="loteContrataciones" name="cComprobanteActionForm">
	       	     <tr >
	               <td>No se seleccionaron contrataciones &nbsp;</td>
	       	     </tr>
	        </logic:empty>
          	<tr>
				<td width="630">
                        <div align="right" >
	            	          <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
						</div>
				</td>
	      	</tr>
    		<tr>
				<td>
				  <table width="100%">
			            
			            <tr>
			               <td class="CformAreaBotones">
			                <div align="right" >
			                	<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
								<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabGestor')" />
			                </div>
			              </td>
			            </tr>
		          </table>
		       </td>
		     </tr>
    	</table>
</div>


  <div id="gestor">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabGestor')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabGestor')" />
          </div>
        </td>
      </tr>
    </table>
     <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
       
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>UVT:&nbsp;</td>
             </tr>
            </table>
            <logic:notEmpty property="colGestor" name="cComprobanteActionForm">
            <table width="100%" >
              <tr>
                <td colspan="10">
                  <display:table name="sessionScope.cComprobanteActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                    <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader"/>
                    <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                  </display:table>
                </td>
              </tr>
	    </table>
          </logic:notEmpty>
           <logic:empty property="colGestor" name="cComprobanteActionForm">
            <table width="100%" >
       	     <tr>
               <td>No se seleccionó UVT.&nbsp;</td>
       	     </tr>
	    </table>
          </logic:empty>
	   </td>
      </tr>
     <!-- si tipo es sector permite seleccionar cualquier uvt -->
     <logic:equal value="2" property="gestorEnSessionTipo" name="cComprobanteActionForm">
     <tr>
	   <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
	                </div>
	              </td>
	            </tr>
	       </table>
	    </td>
     </tr>
	</logic:equal>
    
    <tr>
	<td>
	  <table width="100%">
            
            <tr>
               <td class="CformAreaBotones">
                <div align="right" >
				    
				    <logic:equal value="2" property="gestorEnSessionTipo" name="cComprobanteActionForm">
                	<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
					</logic:equal>
					<html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>  				
                </div>
              </td>
            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>


  <div id="comprobante">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabGestor')" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
 
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>

   	<table width="100%"  >
             <tr>
               <td class="CformNombre"  width="100">Fecha:<span class="dato_obligatorio">*</span></td>
			 	<td class="CformDato" >
				<html:text property="diaF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
				<html:text property="mesF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
				<html:text property="anioF" maxlength="4" size="4" onkeypress="validarNumero()"/>
              	</td>
              </tr>
              <tr>
       	        <td class="CformNombre" width="100">Detalle:&nbsp;&nbsp;</td>
                <td class="CformDato"><html:text property="detalle"  size="70"/></td>
       	      </tr>
              
  		</table>
       </td>
      </tr>
    
    <tr>
	  <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
						<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabContrataciones')" />
	                </div>
	              </td>
	            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>


  </div>
</div>
</logic:equal>



<logic:equal property="accion" value="comprobanteComisionConicet" name="cComprobanteActionForm">
<h1 align=" center" class="titulo">Registro de  Comprobante Comisión Conicet</h1>
<div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td>
          <ul class="tabs">
            <li><a href="cComprobanteAltaAction.do?accion=comprobante" onClick ="return confirmaPerdidaComprobante(this)">Tipo</a></li>
            <li><a href="#" onClick="return mostrarPanel('comprobante', this)" id="tab1">Comprobante</a></li>
            <li><a href="#" onClick="return mostrarPanel('contrataciones', this)" id="tabContrataciones">Contrataciones</a></li>
            <li><a href="#" onClick="return mostrarPanel('entidad',this)" id="tabEntidad">Entidad</a></li>
           
          </ul>
        </td>
      </tr>
    </table>
    <div>

<div id="contrataciones">
       <table  align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
	 		  <td width="630" class="CformAreaBotones">
			        <div align="center" >
			            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
			            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
			        </div>
		 	  </td>
			</tr>
      </table>

      <table class="CformTable"  class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
        <tr>
          <td>
            <table width="100%">
        	     <tr bgcolor="#DDEEFF">
	               <td>Asignadas a este Comprobante:&nbsp;</td>
	       	     </tr>
            </table>

            <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
          	  	<table width="100%" >
        	      <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
                            <display:column property="detalleContratacion" title="#" headerClass="tableCellHeader"  style="width: 10px" />
	        	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
        		        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
                            <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
	        	      </display:table>
		            </td>
        		  </tr>
	         	</table>
			</logic:notEmpty>
			<logic:empty property="loteContrataciones" name="cComprobanteActionForm">
	       	     <tr >
	               <td>No se seleccionaron contrataciones &nbsp;</td>
	       	     </tr>
	        </logic:empty>
          	<tr>
				<td width="630">
                        <div align="right" >
	            	          <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
						</div>
				</td>
	      	</tr>
    		<tr>
				<td>
				  <table width="100%">
			            
			            <tr>
			               <td class="CformAreaBotones">
			                <div align="right" >
			                	<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
								<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabEntidad')" />
			                </div>
			              </td>
			            </tr>
		          </table>
		       </td>
		     </tr>
    	</table>
</div>


  <div id="entidad">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
          </div>
        </td>
      </tr>
    </table>
     <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
       
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Entidad:&nbsp;</td>
             </tr>
            </table>
            <logic:notEmpty property="colEntidad" name="cComprobanteActionForm">
            <table width="100%" >
              <tr>
                <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
		                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
		                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
        		      </display:table>
                </td>
              </tr>
	    </table>
          </logic:notEmpty>
           <logic:empty property="colEntidad" name="cComprobanteActionForm">
            <table width="100%" >
       	     <tr>
               <td>No se seleccionó Entidad.&nbsp;</td>
       	     </tr>
	    </table>
          </logic:empty>
	   </td>
      </tr>

    
    <tr>
	<td>
	  <table width="100%">
            <tr>
               <td class="CformAreaBotones">
                <div align="right" >
                <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
                </div>
              </td>
            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>

  <div id="comprobante">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
 
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>

   	        <table width="100%"  >
             <tr>
               <td class="CformNombre"  width="100">Fecha:<span class="dato_obligatorio">*</span></td>
			 	<td class="CformDato" >
				<html:text property="diaF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
				<html:text property="mesF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
				<html:text property="anioF" maxlength="4" size="4" onkeypress="validarNumero()"/>
              	</td>
              </tr>
  			
              <tr>
       	        <td class="CformNombre" width="100">Detalle:&nbsp;&nbsp;</td>
                <td class="CformDato"><html:text property="detalle"  size="70"/></td>
       	      </tr>
			</table>
       </td>
      </tr>
    
    <tr>
	  <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
						<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabContrataciones')" />
	                </div>
	              </td>
	            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>



  </div>
</div>
</logic:equal>

<logic:equal property="accion" value="comprobanteProductividad" name="cComprobanteActionForm">
<h1 align=" center" class="titulo">Registro de  Comprobante Productividad</h1>
<div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td>
          <ul class="tabs">
            <li><a href="cComprobanteAltaAction.do?accion=comprobante" onClick ="return confirmaPerdidaComprobante(this)">Tipo</a></li>
            <li><a href="#" onClick="return mostrarPanel('comprobante', this)" id="tab1">Comprobante</a></li>
            <li><a href="#" onClick="return mostrarPanel('contrataciones', this)" id="tabContrataciones">Contrataciones</a></li>
            <li><a href="#" onClick="return mostrarPanel('entidad',this)" id="tabEntidad">Entidad</a></li>
            
          </ul>
        </td>
      </tr>
    </table>
    <div>

<div id="contrataciones">
       <table  align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
	 		  <td width="630" class="CformAreaBotones">
			        <div align="center" >
			            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
			            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
			        </div>
		 	  </td>
			</tr>
      </table>

      <table class="CformTable"  class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
        <tr>
          <td>
            <table width="100%">
        	     <tr bgcolor="#DDEEFF">
	               <td>Asignadas a este Comprobante:&nbsp;</td>
	       	     </tr>
            </table>

            <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
          	  	<table width="100%" >
        	      <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
                            <display:column property="detalleContratacion" title="#" headerClass="tableCellHeader"  style="width: 10px" />
	        	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
        		        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
                            <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
	        	      </display:table>
		            </td>
        		  </tr>
	         	</table>
			</logic:notEmpty>
			<logic:empty property="loteContrataciones" name="cComprobanteActionForm">
	       	     <tr >
	               <td>No se seleccionaron contrataciones &nbsp;</td>
	       	     </tr>
	        </logic:empty>
          	<tr>
				<td width="630">
                        <div align="right" >
	            	          <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
						</div>
				</td>
	      	</tr>
    		<tr>
				<td>
				  <table width="100%">
			            
			            <tr>
			               <td class="CformAreaBotones">
			                <div align="right" >
			                	<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
								<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabEntidad')" />
			                </div>
			              </td>
			            </tr>
		          </table>
		       </td>
		     </tr>
    	</table>
</div>


  <div id="entidad">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
          </div>
        </td>
      </tr>
    </table>
     <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
       
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Entidad:&nbsp;</td>
             </tr>
            </table>
            <logic:notEmpty property="colEntidad" name="cComprobanteActionForm">
            <table width="100%" >
              <tr>
                <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
		                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
		                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
        		      </display:table>
                </td>
              </tr>
	    </table>
          </logic:notEmpty>
           <logic:empty property="colEntidad" name="cComprobanteActionForm">
            <table width="100%" >
       	     <tr>
               <td>No se seleccionó Entidad.&nbsp;</td>
       	     </tr>
	    </table>
          </logic:empty>
	   </td>
      </tr>
     <tr>
	   <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
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
                <div align="right" >
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
                </div>
              </td>
            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>

  <div id="comprobante">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
 
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>

   	        <table width="100%"  >
             <tr>
               <td class="CformNombre"  width="100">Fecha:<span class="dato_obligatorio">*</span></td>
			 	<td class="CformDato" >
				<html:text property="diaF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
				<html:text property="mesF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
				<html:text property="anioF" maxlength="4" size="4" onkeypress="validarNumero()"/>
              	</td>
              </tr>
  			
              <tr>
       	        <td class="CformNombre" width="100">Detalle:&nbsp;&nbsp;</td>
                <td class="CformDato"><html:text property="detalle"  size="70"/></td>
       	      </tr>
			</table>
       </td>
      </tr>
    
    <tr>
	  <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
						<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabContrataciones')" />
	                </div>
	              </td>
	            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>



  </div>
</div>
</logic:equal>



<logic:equal property="accion" value="comprobanteComisionOrganismo" name="cComprobanteActionForm">

<logic:equal property="tipoComprobante" value="5" name="cComprobanteActionForm">
<h1 align=" center" class="titulo">Registro de  Comprobante Comisión Universidad</h1>
</logic:equal>
<logic:equal property="tipoComprobante" value="6" name="cComprobanteActionForm">
<h1 align=" center" class="titulo">Registro de  Comprobante Comisión Unidad Académica</h1>
</logic:equal>

<div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td>
          <ul class="tabs">
            <li><a href="cComprobanteAltaAction.do?accion=comprobante" onClick ="return confirmaPerdidaComprobante(this)">Tipo</a></li>
            <li><a href="#" onClick="return mostrarPanel('comprobante', this)" id="tab1">Comprobante</a></li>
            <li><a href="#" onClick="return mostrarPanel('contrataciones', this)" id="tabContrataciones">Contrataciones</a></li>
            <logic:equal property="tipoComprobante" value="5" name="cComprobanteActionForm">
            	<li><a href="#" onClick="return mostrarPanel('entidad',this)" id="tabEntidad">Universidad</a></li>
            </logic:equal>
            <logic:equal property="tipoComprobante" value="6" name="cComprobanteActionForm">
            	<li><a href="#" onClick="return mostrarPanel('entidad',this)" id="tabEntidad">Unidad Académica</a></li>
            </logic:equal>
          </ul>
        </td>
      </tr>
    </table>
    <div>

<div id="contrataciones">
       <table  align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
	 		  <td width="630" class="CformAreaBotones">
			        <div align="center" >
			            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
			            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
			        </div>
		 	  </td>
			</tr>
      </table>

      <table class="CformTable"  class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
        <tr>
          <td>
            <table width="100%">
        	     <tr bgcolor="#DDEEFF">
	               <td>Asignadas a este Comprobante:&nbsp;</td>
	       	     </tr>
            </table>

            <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
          	  	<table width="100%" >
        	      <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
                            <display:column property="detalleContratacion" title="#" headerClass="tableCellHeader"  style="width: 10px" />
	        	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
        		        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
                            <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
	        	      </display:table>
		            </td>
        		  </tr>
	         	</table>
			</logic:notEmpty>
			<logic:empty property="loteContrataciones" name="cComprobanteActionForm">
	       	     <tr >
	               <td>No se seleccionaron contrataciones &nbsp;</td>
	       	     </tr>
	        </logic:empty>
          	<tr>
				<td width="630">
                        <div align="right" >
	            	          <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
						</div>
				</td>
	      	</tr>
    		<tr>
				<td>
				  <table width="100%">
			            
			            <tr>
			               <td class="CformAreaBotones">
			                <div align="right" >
			                	<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
								<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabEntidad')" />
			                </div>
			              </td>
			            </tr>
		          </table>
		       </td>
		     </tr>
    	</table>
</div>


  <div id="entidad">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
          </div>
        </td>
      </tr>
    </table>
     <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
       
       <tr>
         <td>
           <table width="100%">

             <tr bgcolor="#DDEEFF">
			<logic:equal value="5" property="tipoComprobante" name="cComprobanteActionForm">
               <td>Universidad:&nbsp;</td>
			</logic:equal>
			<logic:equal value="6" property="tipoComprobante" name="cComprobanteActionForm">
               <td>Unidad Académica:&nbsp;</td>
			</logic:equal>
             </tr>
            </table>
            <logic:notEmpty property="colEntidad" name="cComprobanteActionForm">
            <table width="100%" >
              <tr>
                <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
		                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
		                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
        		      </display:table>
                </td>
              </tr>
		    </table>
          </logic:notEmpty>
           <logic:empty property="colEntidad" name="cComprobanteActionForm">
            <table width="100%" >
       	     <tr>
			<logic:equal value="5" property="tipoComprobante" name="cComprobanteActionForm">
               <td>No se seleccionó Universidad&nbsp;</td>
			</logic:equal>
			<logic:equal value="6" property="tipoComprobante" name="cComprobanteActionForm">
               <td>No se seleccionó Unidad Académica&nbsp;</td>
			</logic:equal>
       	     </tr>
	    </table>
          </logic:empty>
	   </td>
      </tr>
     <tr>
	   <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
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
                <div align="right" >
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
                </div>
              </td>
            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>

  <div id="comprobante">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabEntidad')" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
 
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>

   	        <table width="100%"  >
             <tr>
               <td class="CformNombre"  width="100">Fecha:<span class="dato_obligatorio">*</span></td>
			 	<td class="CformDato" >
				<html:text property="diaF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
				<html:text property="mesF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
				<html:text property="anioF" maxlength="4" size="4" onkeypress="validarNumero()"/>
              	</td>
              </tr>
  			
              <tr>
       	        <td class="CformNombre" width="100">Detalle:&nbsp;&nbsp;</td>
                <td class="CformDato"><html:text property="detalle"  size="70"/></td>
       	      </tr>
			</table>
       </td>
      </tr>
    
    <tr>
	  <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
						<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabContrataciones')" />
	                </div>
	              </td>
	            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>



  </div>
</div>
</logic:equal>



<logic:equal property="accion" value="comprobanteProveedor" name="cComprobanteActionForm">
<h1 align=" center" class="titulo">Registro Comprobantes de Proveedores</h1>
<div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td>
          <ul class="tabs">
            <li><a href="cComprobanteAltaAction.do?accion=comprobante" onClick ="return confirmaPerdidaComprobante(this)">Tipo</a></li>
            <li><a href="#" onClick="return mostrarPanel('comprobante', this)" id="tab1">Comprobante</a></li>
            <li><a href="#" onClick="return mostrarPanel('contrataciones', this)" id="tabContrataciones">Contrataciones</a></li>
            <li><a href="#" onClick="return mostrarPanel('proveedor',this)" id="tabProveedor">Proveedor</a></li>
            
          </ul>
        </td>
      </tr>
    </table>
    <div>

<div id="contrataciones">
       <table  align="center" cellpadding="0" cellspacing="0" width="600">
			<tr>
	 		  <td width="630" class="CformAreaBotones">
			        <div align="center" >
			            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
			            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabProveedor')" />
			            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabProveedor')" />
			        </div>
		 	  </td>
			</tr>
      </table>

      <table class="CformTable"  class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
        <tr>
          <td>
            <table width="100%">
        	     <tr bgcolor="#DDEEFF">
	               <td>Asignadas a este Comprobante:&nbsp;</td>
	       	     </tr>
            </table>

            <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
          	  	<table width="100%" >
        	      <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
                            <display:column property="detalleContratacion" title="#" headerClass="tableCellHeader"  style="width: 10px" />
	        	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
        		        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
                            <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
	        	      </display:table>
		            </td>
        		  </tr>
	         	</table>
			</logic:notEmpty>
			<logic:empty property="loteContrataciones" name="cComprobanteActionForm">
	       	     <tr >
	               <td>No se seleccionaron contrataciones &nbsp;</td>
	       	     </tr>
	        </logic:empty>
          	<tr>
				<td width="630">
                        <div align="right" >
	            	          <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
						</div>
				</td>
	      	</tr>
    		<tr>
				<td>
				  <table width="100%">
			            
			            <tr>
			               <td class="CformAreaBotones">
			                <div align="right" >
			                	<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
								<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabProveedor')" />
			                </div>
			              </td>
			            </tr>
		          </table>
		       </td>
		     </tr>
    	</table>
</div>


  <div id="proveedor">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabProveedor')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabProveedor')" />
          </div>
        </td>
      </tr>
    </table>
     <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
       
       <tr>
         <td>
           <table width="100%">

             <tr bgcolor="#DDEEFF">
               <td>Proveedor:&nbsp;</td>
             </tr>
            </table>
            <logic:notEmpty property="colProveedor" name="cComprobanteActionForm">
            <table width="100%" >
              <tr>
                <td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.colProveedor" decorator="conicet.apps.svt.web.proveedor.decorator.CProveedorDisplayWrapper">
		                <display:column property="indiceProveedor" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 150px;" />
        		      </display:table>
                </td>
              </tr>
		    </table>
          </logic:notEmpty>
           <logic:empty property="colProveedor" name="cComprobanteActionForm">
            <table width="100%" >
       	     <tr>
               <td>No se seleccionó Proveedor&nbsp;</td>
       	     </tr>
	    </table>
          </logic:empty>
	   </td>
      </tr>
     <tr>
	   <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
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
                <div align="right" >
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
                </div>
              </td>
            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>

  <div id="comprobante">
    <table align="center" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td width="100%" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cComprobanteActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cComprobanteActionForm"   onclick="irA('tabContrataciones')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cComprobanteActionForm"   onclick="irA('tabProveedor')" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
 
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>
           <table width="100%">
                 <tr>
	                <td class="CformNombre" width="100">Tipo:<span class="dato_obligatorio">*</span></td>
        	        <td class="CformDato">
                	  <html:select disabled="false" property="tipoFactura" >
	                    <html:options collection="comboTipoFactura" property="value" labelProperty="label"/>
        	          </html:select>
                	</td>
                      </tr>
                      <tr>
	                <td class="CformNombre"  width="100" >Nro:<span class="dato_obligatorio">*</span></td>
        	        <td class="CformDato">
                	<html:text property="facturaNroPrimario" size="4" maxlength="4" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,4)"  /> -
                	<html:text property="facturaNroSecundario" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,8)"  />
	                </td>
                 </tr>
           
	             <tr>
	               <td class="CformNombre"  width="100">Fecha:<span class="dato_obligatorio">*</span></td>
				 	<td class="CformDato" >
					<html:text property="diaF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
					<html:text property="mesF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
					<html:text property="anioF" maxlength="4" size="4" onkeypress="validarNumero()"/>
	              	</td>
	              </tr>
  			
              <tr>
       	        <td class="CformNombre" width="100">Detalle:&nbsp;&nbsp;</td>
                <td class="CformDato"><html:text property="detalle"  size="70"/></td>
       	      </tr>
			</table>
       </td>
      </tr>
    
    <tr>
	  <td>
		  <table width="100%">
	            <tr>
	               <td class="CformAreaBotones">
	                <div align="right" >
	                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
						<input type="button" class="CformBoton" value="Siguiente" name="cComprobanteActionForm" onclick="irA('tabContrataciones')" />
	                </div>
	              </td>
	            </tr>
          </table>
       </td>
     </tr>

   </table>
 </div>



  </div>
</div>
</logic:equal>





<logic:equal property="accion" value="altaCfm" name="cComprobanteActionForm">


<logic:equal property="tipoComprobante" value="1" name="cComprobanteActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Comprobante de Productividad</td>
  </tr>

  <tr>
         <td>

           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>
            <table width="100%">
	              <tr>
	                <td class="CformNombre"  width="100">Fecha:</td>
				 	<td class="CformDato" >
					<bean:write name="cComprobanteActionForm" property="diaF" /> -
					<bean:write name="cComprobanteActionForm" property="mesF"/> -
					<bean:write name="cComprobanteActionForm" property="anioF" />
	              	</td>
	             </tr>

    	         <tr>
        	        <td class="CformNombre"  width="100">Detalle:</td>
            	    <td class="CformDato"><bean:write name="cComprobanteActionForm" property="detalle" /></td>
              	 </tr>
            </table>


	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Contrataciones:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
		      	<table align="center" width="100%">
		          <tr>
		            <td colspan="10">
		       	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
		       	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
		       	        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
		                       <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
		       	      </display:table>
		            </td>
		          </tr>
		       </table>
			</logic:notEmpty>



	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Entidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
				                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
				                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
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
	            <tr>
	               <td class="CformAreaBotones">
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



<logic:equal property="tipoComprobante" value="2" name="cComprobanteActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Comprobante de Proveedor</td>
  </tr>

      <tr>
         <td>

           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>
            <table width="100%">
                 <tr>
		                <td class="CformNombre" width="100">Tipo:</td>
		                <td class="CformDato">
		                  <html:select disabled="true" property="tipoFactura" >
		                    <html:options collection="comboTipoFactura" property="value" labelProperty="label"/>
		                  </html:select>
		                </td>
	              </tr>
	              <tr>
		              	<td class="CformNombre"  width="100">Nro:</td>
		              	<td class="CformDato">
		              	<bean:write name="cComprobanteActionForm" property="facturaNro"/>
		              	</td>
	              </tr>
	              <tr>
	                <td class="CformNombre"  width="100">Fecha:</td>
				 	<td class="CformDato" >
					<bean:write name="cComprobanteActionForm" property="diaF" /> -
					<bean:write name="cComprobanteActionForm" property="mesF"/> -
					<bean:write name="cComprobanteActionForm" property="anioF" />
	              	</td>
	             </tr>

    	         <tr>
        	        <td class="CformNombre"  width="100">Detalle:</td>
            	    <td class="CformDato"><bean:write name="cComprobanteActionForm" property="detalle" /></td>
              	 </tr>
            </table>


	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Contrataciones:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
		      	<table align="center" width="100%">
		          <tr>
		            <td colspan="10">
		       	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
		       	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
		       	        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
		                       <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
		       	      </display:table>
		            </td>
		          </tr>
		       </table>
			</logic:notEmpty>



	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Proveedor:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colProveedor" name="cComprobanteActionForm">
            	<table width="100%" >
              	<tr>
                	<td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteActionForm.colProveedor" decorator="conicet.apps.svt.web.proveedor.decorator.CProveedorDisplayWrapper">
		                <display:column property="indiceProveedor" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 150px;" />
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
	            <tr>
	               <td class="CformAreaBotones">
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


<logic:equal property="tipoComprobante" value="3" name="cComprobanteActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Comprobante Comisión Conicet</td>
  </tr>

      <tr>
         <td>

           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>
            <table width="100%">
	              <tr>
	                <td class="CformNombre"  width="100">Fecha:</td>
				 	<td class="CformDato" >
					<bean:write name="cComprobanteActionForm" property="diaF" /> -
					<bean:write name="cComprobanteActionForm" property="mesF"/> -
					<bean:write name="cComprobanteActionForm" property="anioF" />
	              	</td>
	             </tr>

    	         <tr>
        	        <td class="CformNombre"  width="100">Detalle:</td>
            	    <td class="CformDato"><bean:write name="cComprobanteActionForm" property="detalle" /></td>
              	 </tr>
            </table>

	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Contrataciones:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
		      	<table align="center" width="100%">
		          <tr>
		            <td colspan="10">
		       	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
		       	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
		       	        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
		                       <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
		       	      </display:table>
		            </td>
		          </tr>
		       </table>
			</logic:notEmpty>


	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Entidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
				                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
				                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
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
	            <tr>
	               <td class="CformAreaBotones">
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

<logic:equal property="tipoComprobante" value="4" name="cComprobanteActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Comprobante de Comisión Uvt</td>
  </tr>

      <tr>
         <td>

           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>
            <table width="100%">
	              <tr>
	                <td class="CformNombre"  width="100">Fecha:</td>
				 	<td class="CformDato" >
					<bean:write name="cComprobanteActionForm" property="diaF" /> -
					<bean:write name="cComprobanteActionForm" property="mesF"/> -
					<bean:write name="cComprobanteActionForm" property="anioF" />
	              	</td>
	             </tr>

    	         <tr>
        	        <td class="CformNombre"  width="100">Detalle:</td>
            	    <td class="CformDato"><bean:write name="cComprobanteActionForm" property="detalle" /></td>
              	 </tr>
            </table>

	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Contrataciones:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
		      	<table align="center" width="100%">
		          <tr>
		            <td colspan="10">
		       	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
		       	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
		       	        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
		                       <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
		       	      </display:table>
		            </td>
		          </tr>
		       </table>
			</logic:notEmpty>


		    <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>UVT:&nbsp;</td>
	             </tr>
    	    </table>
    	    <logic:notEmpty property="colGestor" name="cComprobanteActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
		                  <display:table name="sessionScope.cComprobanteActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
		                    <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                    <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                    <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
		                    <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
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
	            <tr>
	               <td class="CformAreaBotones">
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

<logic:equal property="tipoComprobante" value="5" name="cComprobanteActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Comprobante Comisión Universidad</td>
  </tr>

      <tr>
         <td>

           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>
            <table width="100%">
	              <tr>
	                <td class="CformNombre"  width="100">Fecha:</td>
				 	<td class="CformDato" >
					<bean:write name="cComprobanteActionForm" property="diaF" /> -
					<bean:write name="cComprobanteActionForm" property="mesF"/> -
					<bean:write name="cComprobanteActionForm" property="anioF" />
	              	</td>
	             </tr>

    	         <tr>
        	        <td class="CformNombre"  width="100">Detalle:</td>
            	    <td class="CformDato"><bean:write name="cComprobanteActionForm" property="detalle" /></td>
              	 </tr>
            </table>

	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Contrataciones:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
		      	<table align="center" width="100%">
		          <tr>
		            <td colspan="10">
		       	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
		       	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
		       	        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
		                       <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
		       	      </display:table>
		            </td>
		          </tr>
		       </table>
			</logic:notEmpty>


	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Universidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
				                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
				                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
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
	            <tr>
	               <td class="CformAreaBotones">
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


<logic:equal property="tipoComprobante" value="6" name="cComprobanteActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Comprobante Comisión Unidad Académica </td>
  </tr>

      <tr>
         <td>

           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Comprobante:&nbsp;</td>
             </tr>
            </table>
            <table width="100%">
	              <tr>
	                <td class="CformNombre"  width="100">Fecha:</td>
				 	<td class="CformDato" >
					<bean:write name="cComprobanteActionForm" property="diaF" /> -
					<bean:write name="cComprobanteActionForm" property="mesF"/> -
					<bean:write name="cComprobanteActionForm" property="anioF" />
	              	</td>
	             </tr>

    	         <tr>
        	        <td class="CformNombre"  width="100">Detalle:</td>
            	    <td class="CformDato"><bean:write name="cComprobanteActionForm" property="detalle" /></td>
              	 </tr>
            </table>
            
            	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Contrataciones:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="loteContrataciones" name="cComprobanteActionForm">
		      	<table align="center" width="100%">
		          <tr>
		            <td colspan="10">
		       	      <display:table name="sessionScope.cComprobanteActionForm.loteContrataciones" id="comprobanteAlta" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteAltaDisplayWrapper">
		       	        	<display:column property="contratacion" title="Nro." headerClass="tableCellHeader"/>
		        	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
		       	        	<display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
		                       <display:column property="importeAsignado" title="Asignado" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
		       	      </display:table>
		            </td>
		          </tr>
		       </table>
			</logic:notEmpty>
            
            
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Unidad Académica:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
				                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
				                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
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
	            <tr>
	               <td class="CformAreaBotones">
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

</logic:equal>


</html:form>
