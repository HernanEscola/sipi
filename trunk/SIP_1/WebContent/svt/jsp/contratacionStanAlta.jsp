<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script>
window.onload=function(){
setupPanes("container", document.cContratacionStanActionForm.tab.value);
}

function irA(obj){
document.cContratacionStanActionForm.tab.value=obj;
setupPanes("container", document.cContratacionStanActionForm.tab.value);
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
  document.cContratacionStanActionForm.tab.value=activeTab.id;
  return showPane(paneId, activeTab);
}
</script>
<br>
<h1 align="center" class="titulo">Registro de Contratación de Stan</h1>

<html:form action="cContratacionStanAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="tab"/>

<logic:equal property="accion" value="alta" name="cContratacionStanActionForm">
  <div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <ul class="tabs">
            <li><a href="cContratacionTipoSeleccionarAction.do?accion=ini" onClick ="return confirmaPerdidaContratacion(this)">Contratación</a></li>
           <li><a href="#" onClick="return cambiarPanel('contratacion', this)" id="tab1">Stan</a></li>
           <li><a href="#" onClick="return cambiarPanel('contratantes', this)" id="tabContratantes">Contratantes</a></li>
           <li><a href="#" onClick="return cambiarPanel('ofertas', this)" id="tabOfertas">Ofertas</a></li>
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
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tab1')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tab1')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabContratantes')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|"  onclick="irA('tabOfertas')" />
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
                        <td class="CformNombre" width="135" >Responsable Técnico:&nbsp;<span class="dato_obligatorio">*</span></td>
                        <td class="CformDato">
                          <html:text property="responsableTecnico" maxlength="80" size="50"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre">Clasificación:&nbsp;</td>
                        <td class="CformDato">
                         <html:text property="clasificacion" maxlength="15" size="15"/>
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
	                	<td class="CformNombre" width="125">Publicación Web:&nbsp;</td>
	         			<logic:equal value="S" property="publicable" name="cContratacionStanActionForm">
							<td class="CformDato" >
			                   Sí <html:radio property="publica" value="S"  />
		        	           No <html:radio property="publica" value="N" />
		        	        </td>
						</logic:equal>
	        	  		<logic:equal value="N" property="publicable" name="cContratacionStanActionForm">
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
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </div>

      <div id="contratantes">

        <table width="100%">
        <tr>
          <td width="600" class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tab1')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tab1')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabOfertas')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|"  onclick="irA('tabOfertas')" />
            </div>
          </td>
        </tr>
      </table>
      <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
                <table width="100%">
		            <tr bgcolor="#DDEEFF">
		              <td>Contratantes:&nbsp;<span class="dato_obligatorio">*</span></td>
		            </tr>
	          </table>
          
               <table align="center" width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cContratacionStanActionForm.contratantes" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteSeleccionarDisplayWrapper" style="width: 100%">
                          <display:column property="nombreRazon" title="Nombre o Razón" maxLength="30" headerClass="tableCellHeader" style="width: 160px"/>
                          <display:column property="tipoContratante" maxLength="30" title="Tipo" headerClass="tableCellHeader" style="width: 200px" />
                          <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 90px"/>
                          <display:column property="pais" title="País" headerClass="tableCellHeader"/>
                    	</display:table>
                      </td>
                    </tr>
                 </table>
          	</td>
       </tr>
       <logic:equal name="cContratacionStanActionForm" property="categoriaComun" value="N">
            <tr>
                  <td class="CformAreaBotones" height="35">
                    <div align="left">
                     	<b>Categoria:&nbsp;</b>
	                <html:select disabled="false" property="categoriaTipo">
                          <html:options collection="comboCategoria" property="value" labelProperty="label"/>
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
          	<td class="CformAreaBotones" height="35">
                 <div align="right">
                   <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabOfertas')" />
                   <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                 </div>
          	</td>
       </tr>
    </table>
  </div>

    <div id="ofertas">
      <table width="100%">
        <tr>
          <td width="600" class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tab1')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tabContratantes')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabOfertas')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irA('tabOfertas')" />
            </div>
          </td>
        </tr>
      </table>
      <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                   <table width="100%">
		            <tr bgcolor="#DDEEFF">
		              <td>Ofertas Contratadas:&nbsp;<span class="dato_obligatorio">*</span></td>
		            </tr>
		          </table>
            
            
            
                  <table align="center" width="100%">
                    <tr>
                      <td colspan="10"  width="100%">
                        <display:table name="sessionScope.cContratacionStanActionForm.ofertas" id="ofertasSeleccionadas" decorator="conicet.apps.svt.web.instrumento.decorator.COfertaSeleccionarDisplayWrapper" style="width: 100%">
                          <display:column property="descripcion" maxLength="80" style="width: 200px" title="Descripción" headerClass="tableCellHeader" />
                          <display:column property="tipoOferta" title="Tipo Oferta" headerClass="tableCellHeader" style="width: 100px" />
                          <display:column property="cantidad" title="Cant." headerClass="tableCellHeader" />
                          <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 150px;text-align: right"/>
                        </display:table>
                      </td>
                    </tr>
                  </table>
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
            <td class="CformAreaBotones" height="35">
                  <div align="right">
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                  </div>
            </td>
       </tr>
        </table>
      </div>
  </div>
</div>

</logic:equal>

<logic:equal property="accion" value="altaCfm" name="cContratacionStanActionForm">
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">

  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td>
            <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Contratación Stan&nbsp;</strong></td>
             </tr>
            </table>

            <table width="100%" cellpadding="0" cellspacing="0">

              <tr>
                <td class="CformNombre" width="130">Responsable Técnico:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cContratacionStanActionForm" property="responsableTecnico"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Clasificación:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cContratacionStanActionForm" property="clasificacion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Tipo Contacto:&nbsp;</td>
                <td class="CformDato" >
                  <html:select disabled="true" property="tipoContacto" >
                    <html:options collection="comboTipoContacto" property="value" labelProperty="label" />
                  </html:select>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Contacto:&nbsp;</td>
                <td class="CformDato">
                  <bean:write name="cContratacionStanActionForm" property="contacto"/>
                </td>
              </tr>
              <tr>
               <td class="CformNombre" width="130">Publicar:&nbsp;</td>
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

    	      <table align="center">
				        <tr>
				          <td colspan="10">
				            <display:table name="sessionScope.cContratacionStanActionForm.contratantes" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteSeleccionarDisplayWrapper" style="width: 100%">
				              <display:column property="tipoContratante" maxLength="30" title="Tipo" headerClass="tableCellHeader" style="width: 200px" />
				                <display:column property="nombreRazon" title="Nombre o Razón Social" maxLength="30" headerClass="tableCellHeader" style="width: 160px"/>
				                <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 90px"/>
				                <display:column property="pais" title="País" headerClass="tableCellHeader"/>
				            </display:table>
				          </td>
				        </tr>
		      </table>

            <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Ofertas Contratadas &nbsp;</strong></td>
             </tr>
            </table>

	      <table align="center">
			        <tr>
			          <td colspan="10">
			            <display:table name="sessionScope.cContratacionStanActionForm.ofertas"  id="ofertasSeleccionadas" decorator="conicet.apps.svt.web.instrumento.decorator.COfertaSeleccionarDisplayWrapper" style="width: 100%">
			              <display:column property="descripcion"  style="width: 400px" title="Descripción" headerClass="tableCellHeader" />
			              <display:column property="tipoOferta" title="Tipo Oferta" headerClass="tableCellHeader" style="width: 100px" />
			              <display:column property="cantidad" title="Cantidad" headerClass="tableCellHeader" />
			              <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 150px;text-align: right"/>

			            </display:table>
			          </td>
			        </tr>
	      </table>


      <table width="100%">
    	      <tr bgcolor="#DDEEFF">
        	    <td>
            	  <strong>Distribución de comisiones</strong>
            	</td>
          		</tr>
      </table>
	  <logic:notEmpty property="distribucion" name="cContratacionStanActionForm">

		      <table align="center" width="100%">
		        <tr>
		          <td colspan="10">
		            <display:table name="sessionScope.cContratacionStanActionForm.distribucion" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoDistribucionDetalleDisplayWrapper" style="width: 100%">
		              <display:column property="egreso" title="Comisión" headerClass="tableCellHeader" />
		              <display:column property="porcentaje" title="Porcentaje" headerClass="tableCellHeader" style="text-align: right"/>
		              <display:column property="importeParcial" title="Importe" headerClass="tableCellHeader" style="text-align: right"/>
		            </display:table>
		          </td>
		        </tr>
		      </table>
	  </logic:notEmpty>
	  <logic:empty property="distribucion" name="cContratacionStanActionForm">
	           <table width="100%">
	            <tr >
	              <td>No se informó una distribución&nbsp;</td>
	            </tr>
	            </table>
      </logic:empty>






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
