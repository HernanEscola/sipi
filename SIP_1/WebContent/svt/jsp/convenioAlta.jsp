<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script>
window.onload=function(){
setupPanes("container", document.cConvenioActionForm.tab.value);
}

function irA(obj){
document.cConvenioActionForm.tab.value=obj;
setupPanes("container", document.cConvenioActionForm.tab.value);
}

function confirmaPerdidaContratacion(url){
  url.href = 'cContratacionTipoSeleccionarAction.do?accion=ini';
  msg = 'Se perderán los datos no grabados, ¿desea continuar?';
  if (window.confirm(msg)){
    url.href = url.href;
  }else{
    url.href = '#';
  }
}

function cambiarPanel(paneId, activeTab){
  document.cConvenioActionForm.tab.value=activeTab.id;
  return showPane(paneId, activeTab);
}
</script>
<br>
<h1 align="center" class="titulo">Registro de Convenio</h1>

<html:form action="cConvenioOldAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="tab"/>

<logic:equal property="accion" value="alta" name="cConvenioActionForm">
  <div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <ul class="tabs">
            <li><a href="cContratacionTipoSeleccionarAction.do?accion=ini" onClick ="return confirmaPerdidaContratacion(this)">Contratación</a></li>
           
           <li><a href="#" onClick="return cambiarPanel('contratacion', this)" id="tabContratacion">Convenio</a></li>
           <li><a href="#" onClick="return cambiarPanel('contratantes', this)" id="tabContratantes">Contratantes</a></li>
           <li><a href="#" onClick="return cambiarPanel('ofertas', this)" id="tabOfertas">Ofertas</a></li>
			<li><a href="#" onClick="return cambiarPanel('resolucion', this)" id="tabResolucion">Resolución</a></li>
          </ul>
        </td>
      </tr>
    </table>
    <div>



      <div id="contratacion">

        <table width="100%">
        <tr>
          <td width="600" class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tabContratacion')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tabContratacion')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabContratantes')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|"  onclick="irA('tabResolucion')" />
            </div>
          </td>
        </tr>
      </table>

        <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">
          <tr>
            <td>
              <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr><td height="10" colspan="10"></td></tr>
                <tr>
                  <td>
                    <table width="100%">
                      <tr>
                        <td class="CformNombre"  width="135" >Responsable Técnico:<span class="dato_obligatorio">*</span></td>
                        <td class="CformDato">
                          <html:text property="responsableTecnico" maxlength="80" size="50"/></td>
                      </tr>
                      <tr>
                        <td class="CformNombre">Clasificación:&nbsp;</td>
                        <td class="CformDato">
                          <html:text property="clasificacion" maxlength="15"/>
                        </td>
                      </tr>

                      <tr>
                        <td class="CformNombre">Tipo Contacto:<span class="dato_obligatorio">*</span></td>
                        <td class="CformDato" >
                          <html:select disabled="false" property="tipoContacto" >
                            <html:options collection="comboTipoContacto" property="value" labelProperty="label" />
                          </html:select>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre">Contacto:&nbsp;</td>
                        <td class="CformDato">
                          <html:text property="contacto" maxlength="80" size="50"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre">Tipo Convenio:<span class="dato_obligatorio">*</span></td>
                        <td class="CformDato" >
                          <html:select disabled="false" property="tipoConvenio" >
                            <html:options collection="comboTipoConvenio" property="value" labelProperty="label" />
                          </html:select>
                        </td>
                      </tr>

		              <tr>
		                <td class="CformNombre" width="100">Fecha Firma:&nbsp;</td>
		                <td class="CformDato">
		                  <html:text size="2" property="diaFirma" maxlength="2" onkeypress="validarNumero()"/> -
		                  <html:text size="2" property="mesFirma" maxlength="2" onkeypress="validarNumero()"/> -
		                  <html:text size="4" property="anioFirma" maxlength="4" onkeypress="validarNumero()"/>
		                </td>
		              </tr>


                          <tr>
	                	<td class="CformNombre" width="100">Publicación Web:&nbsp;</td>
	         			<logic:equal value="S" property="publicable" name="cConvenioActionForm">
							<td class="CformDato" >
			                   Sí <html:radio property="publica" value="S"  />
		        	           No <html:radio property="publica" value="N" />
		        	        </td>
						</logic:equal>
	        	  		<logic:equal value="N" property="publicable" name="cConvenioActionForm">
							<td class="CformDato" >
			                   Sí <html:radio property="publica" value="S"  disabled="true" />
		        	           No <html:radio property="publica" value="N" disabled="true" />
			                </td>
						</logic:equal>
	       				<html:hidden property="publica"/>
              	  	  </tr>

                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="CformAreaBotones" height="35"><span class="dato_obligatorio">  * Datos obligatorios</span>
                    <div align="right">
                      <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabContratantes')" />
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


<!-- tab4-->
 <div id="resolucion">


     <table align="center" cellpadding="0" cellspacing="0" width="400">
		<tr>
 		  <td width="400" class="CformAreaBotones">
		        <div align="center" >
			          <input type="button"  class="CformBotonTranspBorde" value="|<<" name="cConvenioActionForm"   onclick="irA('tabContratacion')" />
			          <input type="button" class="CformBotonTranspBorde" value="<" name="cConvenioActionForm"   onclick="irA('tabOfertas')" />
			          <input type="button" class="CformBotonTranspBorde" value=">" name="cConvenioActionForm"   onclick="irA('tabResolucion')" />
			          <input type="button" class="CformBotonTranspBorde" value=">>|" name="cConvenioActionForm"   onclick="irA('tabResolucion')" />
			</div>
	 	  </td>
		</tr>
	  </table>


      <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="400">
        <tr>
          <td>
           <table width="100%">

                <tr bgcolor="#DDEEFF">
                    <td>Expediente&nbsp;<span class="dato_obligatorio">*</span></td>
                </tr>
       	   </table>

            <table width="100%">
               <tr>
                	 <td class="CformNombre" width="100">Nro:<span class="dato_obligatorio">*</span></td>
   		        <td class="CformDato"><html:text size="6" property="nroExpediente" maxlength="6" onkeypress="validarNumero()"/> /
   			<html:text size="4" property="anioExpediente" maxlength="4" onkeypress="validarNumero()"/> </td>
               </tr>
       	   </table>
           <table width="100%">
                  <tr bgcolor="#DDEEFF">
    	                <td>Autorización&nbsp;</td>
                  </tr>
            </table>
           <table width="100%">
             <tr>
               <td class="CformNombre" width="100">Fecha:&nbsp;<span class="dato_obligatorio">(1)</span></td>
               <td class="CformDato">
                 <html:text size="2" property="diaAutorizacion" maxlength="2" onkeypress="validarNumero()"/> -
                 <html:text size="2" property="mesAutorizacion" maxlength="2" onkeypress="validarNumero()"/> -
                 <html:text size="4" property="anioAutorizacion" maxlength="4" onkeypress="validarNumero()"/>
                </td>
              </tr>
           </table>
           <table width="100%">
                <tr bgcolor="#DDEEFF">
                    <td>Resolución&nbsp;</td>
                </tr>
       	   </table>
           <table>
             <tr>
               <td class="CformNombre" width="100">Tipo:&nbsp;<span class="dato_obligatorio">(1)</span></td>
               <td class="CformDato">
                 <html:select disabled="false" property="tipoResolucion" >
                   <html:options collection="comboTipoResolucion" property="value" labelProperty="label" />
                 </html:select>
               </td>
               <td class="CformNombre">Nro:&nbsp;</td>
               <td class="CformDato">
                 <html:text property="nroResolucion"  maxlength="6" size="6" onkeypress="validarImporte(this)"/>
               </td>
              </tr>
            </table>
            <table>
              <tr>
                <td class="CformNombre" width="100">Fecha:&nbsp;</td>
                <td class="CformDato">
                  <html:text size="2" property="diaResolucion" maxlength="2" onkeypress="validarNumero()"/> -
                  <html:text size="2" property="mesResolucion" maxlength="2" onkeypress="validarNumero()"/> -
                  <html:text size="4" property="anioResolucion" maxlength="4" onkeypress="validarNumero()"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Estado:&nbsp;</td>
                <td class="CformDato">
                  <html:select disabled="false" property="estadoResolucion" >
                    <html:options collection="comboEstadoResolucion" property="value" labelProperty="label" />
                  </html:select>
                </td>
              </tr>
       	   </table>
	</td>
      </tr>





      <tr>
	<td>
	  <table>
		<tr>
              		<td width="200" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">* Datos obligatorios </div>
		        </td>

			<td width="200" class="CformAreaBotones">
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
   <table  align="center" cellpadding="0" cellspacing="0" width="400">
	<tr>
     		<td ><span class="dato_obligatorio">(1)</span>
			" bla bla bla.
	        </td>
    	</tr>
   </table>

 </div>




      <div id="contratantes">

        <table width="600">
        <tr>
          <td width="600" class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tabContratacion')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tabContratacion')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabOfertas')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|"  onclick="irA('tabResolucion')" />
            </div>
          </td>
        </tr>
      </table>
      
      <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Contratantes:&nbsp;<span class="dato_obligatorio">*</span></td>
            </tr>
          </table>
          <logic:notEmpty property="contratantes" name="cConvenioActionForm">
            <table width="100%" >
              <tr>
                <td colspan="10">
                        <display:table name="sessionScope.cConvenioActionForm.contratantes" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteSeleccionarDisplayWrapper" style="width: 100%">
                          <display:column property="nombreRazon" title="Nombre o Razón" maxLength="30" headerClass="tableCellHeader" style="width: 160px"/>
                          <display:column property="tipoContratante" maxLength="30" title="Tipo" headerClass="tableCellHeader" style="width: 200px" />
                          <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 90px"/>
                          <display:column property="pais" title="País" headerClass="tableCellHeader"/>
                    	</display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>
          <logic:empty property="contratantes" name="cConvenioActionForm">
            <tr >
              <td>No se seleccionaron contratantes&nbsp;</td>
            </tr>
          </logic:empty>
        </td>
      </tr>
       <logic:equal name="cConvenioActionForm" property="categoriaComun" value="N">
            <tr>
                  <td class="CformAreaBotones" height="35">
                    <div align="left">
                     	<b>Categoria:&nbsp;<span class="dato_obligatorio">(1)</span></b>
	                <html:select disabled="false" property="categoriaTipo">
                          <html:options collection="comboCategoria" property="value" labelProperty="label"/><span class="dato_obligatorio">(1)</span>
                	</html:select>
                    </div>
                  </td>
          	</tr>
      </logic:equal>

      <tr>
	  <td>
	    <table>
		<tr>
		  <td class="CformAreaBotones" width="600">
	            <div align="right" >
  	             <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar"/>
	           </div>
	 	 </td>
		</tr>
	    </table>
         </td>
      </tr>

      <tr>
        <td>
          <table>
            <tr>
              <td width="390" class="CformAreaBotones" >
                     <logic:equal name="cConvenioActionForm" property="categoriaComun" value="N">
                            <div align="left" class="dato_obligatorio">(1)Dato obligatorio si desea seleccionar STAN&nbsp;</div>
              		</logic:equal>	              
              </td>
              		  
              <td width="210" class="CformAreaBotones">
                <div align="right" >
                  <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabOfertas')" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>

    <div id="ofertas">
      <table width="600">
        <tr>
          <td width="600" class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tabContratacion')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tabContratantes')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabResolucion')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irA('tabResolucion')" />
            </div>
          </td>
        </tr>
      </table>
      <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Ofertas Contratadas:&nbsp;<span class="dato_obligatorio">*</span></td>
            </tr>
          </table>
          <logic:notEmpty property="ofertas" name="cConvenioActionForm">
            <table width="100%" >
              <tr>
                <td colspan="10">
                        <display:table name="sessionScope.cConvenioActionForm.ofertas" id="ofertasSeleccionadas" decorator="conicet.apps.svt.web.instrumento.decorator.COfertaSeleccionarDisplayWrapper" style="width: 100%">
                          <display:column property="descripcion" maxLength="80" style="width: 200px" title="Descripción" headerClass="tableCellHeader" />
                          <display:column property="tipoOferta" title="Tipo Oferta" headerClass="tableCellHeader" style="width: 100px" />
                          <display:column property="cantidad" title="Cant." headerClass="tableCellHeader" />
                          <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 150px;text-align: right"/>
                        </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>
          <logic:empty property="ofertas" name="cConvenioActionForm">
            <tr >
              <td>No se seleccionaron ofertas tecnológicas&nbsp;</td>
            </tr>
          </logic:empty>
        </td>
      </tr>

      <tr>
	  <td>
	    <table>
		<tr>
		  <td class="CformAreaBotones" width="600">
	            <div align="right" >
  	             <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar"/>
	           </div>
	 	 </td>
		</tr>
	    </table>
         </td>
      </tr>

      <tr>
        <td>
          <table>
            <tr>
              <td width="210" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">*Dato obligatorio&nbsp;</div></td>
              <td width="390" class="CformAreaBotones">
                <div align="right" >
                    <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabResolucion')" />
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                    

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

<logic:equal property="accion" value="altaCfm" name="cConvenioActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">

  <tr>
    <td>
	  <table width="100%">
	     <tr bgcolor="#BFDFFF">
               <td><strong>Convenio &nbsp;</strong></td>
             </tr>
	   </table>

      <table align="center" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td class="CformNombre" width="130">Responsable Técnico&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cConvenioActionForm" property="responsableTecnico"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Clasificación&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cConvenioActionForm" property="clasificacion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Tipo Contacto&nbsp;:</td>
                <td class="CformDato" >
                  <html:select disabled="true" property="tipoContacto" >
                    <html:options collection="comboTipoContacto" property="value" labelProperty="label" />
                  </html:select>
                </td>
              </tr>

              <tr>
                <td class="CformNombre" width="130">Contacto&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cConvenioActionForm" property="contacto"/>
                </td>
              </tr>

              <tr>
                <td class="CformNombre" width="130">Tipo Convenio&nbsp;:</td>
                <td class="CformDato" >
                  <html:select disabled="true" property="tipoConvenio" >
                    <html:options collection="comboTipoConvenio" property="value" labelProperty="label" />
                  </html:select>
                </td>
              </tr>

              <tr>
                <td class="CformNombre" width="130">Fecha Firma&nbsp;:</td>
                <td class="CformDato">
                  <logic:notEmpty property="diaFirma" name="cConvenioActionForm">
                    <bean:write name="cConvenioActionForm"  property="diaFirma" /> -
                    <bean:write name="cConvenioActionForm"  property="mesFirma" /> -
                    <bean:write name="cConvenioActionForm"  property="anioFirma"/>
                  </logic:notEmpty>
                </td>
              </tr>




               <tr>
               <td class="CformNombre" width="130">Publicar&nbsp;:</td>
                <td class="CformDato" >
                   Sí <html:radio property="publica" value="S" disabled="true"/>
                   No <html:radio property="publica" value="N" disabled="true"/>
               </td>
              </tr>
              
 	   </table>
	  <table width="100%">
	     <tr bgcolor="#BFDFFF">
               <td><strong>Contratantes&nbsp;</strong></td>
             </tr>
	   </table>
      <logic:notEmpty property="contratantes" name="cConvenioActionForm">

       <table  width="100%">
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cConvenioActionForm.contratantes" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteSeleccionarDisplayWrapper" style="width: 100%">
              <display:column property="tipoContratante" maxLength="30" title="Tipo" headerClass="tableCellHeader" style="width: 200px" />
                <display:column property="nombreRazon" title="Nombre o Razón Social" maxLength="30" headerClass="tableCellHeader" style="width: 160px"/>
                <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 90px"/>
                <display:column property="pais" title="País" headerClass="tableCellHeader"/>
            </display:table>
          </td>
        </tr>
      </table>
      </logic:notEmpty>
      <logic:empty property="contratantes" name="cConvenioActionForm">
           <table width="100%">
            <tr >
              <td>No se seleccionaron contratantes&nbsp;</td>
            </tr>
            </table>
      </logic:empty>



      	  <table width="100%">
	     <tr bgcolor="#BFDFFF">
               <td><strong>Ofertas Contratadas&nbsp;</strong></td>
             </tr>
	   </table>

      <logic:notEmpty property="ofertas" name="cConvenioActionForm">
      <table width="100%">
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cConvenioActionForm.ofertas" id="ofertasSeleccionadas" decorator="conicet.apps.svt.web.instrumento.decorator.COfertaSeleccionarDisplayWrapper" style="width: 100%">
              <display:column property="descripcion" maxLength="80" style="width: 200px" title="Descripción" headerClass="tableCellHeader" />
              <display:column property="tipoOferta" title="Tipo Oferta" headerClass="tableCellHeader" style="width: 100px" />
              
              <display:column property="cantidad" title="Cant." headerClass="tableCellHeader" />
              <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 150px;text-align: right"/>
            </display:table>
          </td>
        </tr>
      </table>
      </logic:notEmpty>
      <logic:empty property="ofertas" name="cConvenioActionForm">
           <table width="100%">
            <tr >
              <td>No se seleccionaron ofertas tecnológicas&nbsp;</td>
            </tr>
            </table>
      </logic:empty>


      <table width="100%">
    	      <tr bgcolor="#DDEEFF">
        	    <td>
            	  <strong>Distribución de comisiones</strong>
            	</td>
          		</tr>
      </table>
	  <logic:notEmpty property="distribucion" name="cConvenioActionForm">

		      <table align="center" width="100%">
		        <tr>
		          <td colspan="10">
		            <display:table name="sessionScope.cConvenioActionForm.distribucion" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoDistribucionDetalleDisplayWrapper" style="width: 100%">
		              <display:column property="egreso" title="Comisión" headerClass="tableCellHeader" />
		              <display:column property="porcentaje" title="Porcentaje" headerClass="tableCellHeader" style="text-align: right"/>
		              <display:column property="importeParcial" title="Importe" headerClass="tableCellHeader" style="text-align: right"/>
		            </display:table>
		          </td>
		        </tr>
		      </table>
	  </logic:notEmpty>
	  <logic:empty property="distribucion" name="cConvenioActionForm">
	           <table width="100%">
	            <tr >
	              <td>No se informó una distribución&nbsp;</td>
	            </tr>
	            </table>
      </logic:empty>





	  <table width="100%">
	     <tr bgcolor="#BFDFFF">
               <td><strong>Resolución &nbsp;</strong></td>
             </tr>
	   </table>
      <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Expediente &nbsp;</td>
            </tr>
	  </table>
      <table width="100%">
            <tr>
              <td class="CformNombre" width="80">Nro:&nbsp;</td>
              <td class="CformDato">
               <logic:notEmpty property="nroExpediente" name="cConvenioActionForm">
		  <bean:write name="cConvenioActionForm"  property="nroExpediente"/> /
		  <bean:write name="cConvenioActionForm"  property="anioExpediente" />
		</logic:notEmpty>
               </td>
             </tr>
	   </table>

       <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Autorización&nbsp;</td>
             </tr>
	    </table>
        <table width="100%">
              <tr>
                <td class="CformNombre" width="80">Fecha:&nbsp;</td>
                <td class="CformDato">
                  <logic:notEmpty property="diaAutorizacion" name="cConvenioActionForm">
                    <bean:write name="cConvenioActionForm"  property="diaAutorizacion" /> -
                    <bean:write name="cConvenioActionForm"  property="mesAutorizacion" /> -
                    <bean:write name="cConvenioActionForm"  property="anioAutorizacion"/>
                  </logic:notEmpty>
                </td>
              </tr>
        </table>

        <table width="100%">
	        <tr bgcolor="#DDEEFF">
        	  <td>Resolución&nbsp;</td>
                </tr>
        </table>
        <table width="100%">
   	       <tr>
	         <td class="CformNombre" width="80">Tipo:&nbsp;</td>
                 <td class="CformDato">
                   <logic:notEmpty property="nroResolucion" name="cConvenioActionForm">
                     <html:select disabled="true" property="tipoResolucion" >
                       <html:options collection="comboTipoResolucion" property="value" labelProperty="label" />
                     </html:select>&nbsp;Nro: <bean:write name="cConvenioActionForm"  property="nroResolucion"  />
                   </logic:notEmpty>
                 </td>
	       </tr>
               <tr>
	         <td class="CformNombre" width="80">Fecha:&nbsp;</td>
                 <td class="CformDato">
                   <logic:notEmpty property="diaResolucion" name="cConvenioActionForm">
		     <bean:write name="cConvenioActionForm"  property="diaResolucion" /> -
		     <bean:write name="cConvenioActionForm"  property="mesResolucion" /> -
		     <bean:write name="cConvenioActionForm"  property="anioResolucion"/>
		   </logic:notEmpty>
                 </td>
               </tr>
	       <tr>
		 <td class="CformNombre" width="80">Estado:&nbsp;</td>
	     	 <td class="CformDato">
		   <logic:greaterThan value="-1" property="estadoResolucion" name="cConvenioActionForm">
		     <html:select disabled="true" property="estadoResolucion" >
        	       <html:options collection="comboEstadoResolucion" property="value" labelProperty="label" />
	             </html:select>
  		   </logic:greaterThan>
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
      </div>
    </td>
  </tr>
</table>

</logic:equal>
</html:form>
