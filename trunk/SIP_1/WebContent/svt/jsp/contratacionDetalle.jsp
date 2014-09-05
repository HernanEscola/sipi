<%@include file="layout/include.jsp"%>

<br>
<h1 align=" center" class="titulo">Detalle de Contrataci&oacute;n </h1>

<html:form action="cContratacionDetalleAction.do" method="POST">
<html:hidden property="accion"/>

<logic:equal property="accion" value="detalle" name="cContratacionDetalleActionForm">
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">

    <logic:equal value="E" property="estado" name="cContratacionDetalleActionForm">
    <tr>
      <td align="center">
        <b class="CformDetalleOro">&nbsp;&nbsp;Este Comprobante se encuentra Eliminado</b>
      </td>
    </tr>
  </logic:equal>
  


  <tr>
    <td>

	  <table width="100%">
	     <tr bgcolor="#BFDFFF">
               <td><strong><bean:write name="cContratacionDetalleActionForm" property="tipoContratacionDescripcion"/></strong></td>
             </tr>
	   </table>

      <table align="center" cellpadding="0" cellspacing="0" width="100%">

        
        <tr>
            <td class="CformNombre" width="135">Responsable Técnico&nbsp;:</td>
            <td class="CformDato">
                  <bean:write name="cContratacionDetalleActionForm" property="responsableTecnico"/>
             </td>
         </tr>
         <tr>
                <td class="CformNombre" width="135">Clasificación&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cContratacionDetalleActionForm" property="clasificacion"/>
                </td>
         </tr>
         <tr>
                <td class="CformNombre" width="135">Tipo Contacto&nbsp;:</td>
                <td class="CformDato" >
                  <html:select disabled="true" property="tipoContacto" >
                    <html:options collection="comboTipoContacto" property="value" labelProperty="label" />
                  </html:select>
                </td>
         </tr>
         <tr>
                <td class="CformNombre" width="135">Contacto&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cContratacionDetalleActionForm" property="contacto"/>
                </td>
         </tr>
         <logic:equal value="2" property="tipoContratacionCodigo" name="cContratacionDetalleActionForm">

              <tr>
                 <td class="CformNombre" width="135">Autoriza Responsable&nbsp;:</td>
                 <td class="CformDato">
                 	<bean:write name="cContratacionDetalleActionForm" property="autorizaResponsable"/>
                 </td>
              </tr>
              <tr>
                 <td class="CformNombre" width="135">Lugar de Desarrollo&nbsp;:</td>
                 <td class="CformDato">
                 	<bean:write name="cContratacionDetalleActionForm" property="lugar"/>
                  </td>
              </tr>
		</logic:equal>
         <logic:equal value="3" property="tipoContratacionCodigo" name="cContratacionDetalleActionForm">
         <tr>
                <td class="CformNombre" width="135">Tipo Convenio&nbsp;:</td>
                <td class="CformDato" >
                  <html:select disabled="true" property="tipoConvenio" >
                    <html:options collection="comboTipoConvenio" property="value" labelProperty="label" />
                  </html:select>
                </td>
         </tr>
         <tr>
	         <td class="CformNombre" width="135">Fecha Firma&nbsp;:</td>
                 <td class="CformDato">
                   <logic:notEmpty property="firmaFecha" name="cContratacionDetalleActionForm">
		     		<bean:write name="cContratacionDetalleActionForm"  property="firmaFecha" /> 
		   		   </logic:notEmpty>
                 </td>
         </tr>
         
         </logic:equal>
         
         
         
                      <tr>
               <td class="CformNombre" width="135">Publicar&nbsp;:</td>
			<td class="CformDato" >
	                   Sí <html:radio property="publica" value="S"  disabled="true" />
        	           No <html:radio property="publica" value="N" disabled="true" />
	                </td>
              </tr>
      
      </table>
	  <table width="100%">
	     <tr bgcolor="#BFDFFF">
               <td><strong>Contratantes&nbsp;</strong></td>
             </tr>
	   </table>
      <logic:notEmpty property="contratantes" name="cContratacionDetalleActionForm">

       <table  width="100%">
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cContratacionDetalleActionForm.contratantes" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteDisplayWrapper" style="width: 100%">
              <display:column property="indiceDetalle" title="#" headerClass="tableCellHeader" />
              <display:column property="tipoContratante" maxLength="30" title="Tipo" headerClass="tableCellHeader" style="width: 150px" />
                <display:column property="nombreRazon" title="Nombre o Razón Social" maxLength="30" headerClass="tableCellHeader" style="width: 150px"/>
                <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 90px"/>
                <display:column property="pais" title="País" maxLength="15" headerClass="tableCellHeader"/>
            </display:table>
          </td>
        </tr>
      </table>
      </logic:notEmpty>
      <logic:empty property="contratantes" name="cContratacionDetalleActionForm">
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

      <logic:notEmpty property="instrumentos" name="cContratacionDetalleActionForm">
      <table width="100%">
        <tr>
          <td colspan="10">
	            <display:table name="sessionScope.cContratacionDetalleActionForm.instrumentos" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoListarDisplayWrapper" style="width: 100%">
	              <display:column property="indice" title="#" headerClass="tableCellHeader" />
	              <display:column property="descripcion" maxLength="30" title="Descripción" headerClass="tableCellHeader" />
	              <display:column property="tipoOferta" title="Tipo Oferta" headerClass="tableCellHeader" />
	              <display:column property="gestor" title="UVT" headerClass="tableCellHeader" />
	              <display:column property="cantidad" title="Cant." headerClass="tableCellHeader" />
	              <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="text-align: right"/>
	            </display:table>
          </td>
        </tr>
      </table>
      </logic:notEmpty>
      <logic:empty property="instrumentos" name="cContratacionDetalleActionForm">
           <table width="100%">
            <tr >
              <td>No se seleccionaron ofertas tecnológicas&nbsp;</td>
            </tr>
            </table>
      </logic:empty>
      
      
      	        <table width="100%">
    	      <tr bgcolor="#DDEEFF">
        	    <td>
            	  <strong>Distribución</strong>
            	</td>
          		</tr>
        	</table>
			<logic:notEmpty property="distribucion" name="cContratacionDetalleActionForm">

		      <table align="center" width="100%">
		        <tr>
		          <td colspan="10">
		            <display:table name="sessionScope.cContratacionDetalleActionForm.distribucion" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoDistribucionDetalleDisplayWrapper" style="width: 100%">
		              <display:column property="egreso" title="Comisión" headerClass="tableCellHeader" />
		              <display:column property="porcentaje" title="Porcentaje" headerClass="tableCellHeader" style="text-align: right"/>
		              <display:column property="importeParcial" title="Importe" headerClass="tableCellHeader" style="text-align: right"/>
		            </display:table>
		          </td>
		        </tr>
		      </table>
			</logic:notEmpty>
	        <logic:empty property="distribucion" name="cContratacionDetalleActionForm">
	           <table width="100%">
	            <tr >
	              <td>No se informó una distribución&nbsp;</td>
	            </tr>
	            </table>
      		</logic:empty>
      
      
      
      
      
      
      <logic:notEqual value="1" property="tipoContratacionCodigo" name="cContratacionDetalleActionForm">

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
               <logic:notEmpty property="expedienteNumero" name="cContratacionDetalleActionForm">
		  <bean:write name="cContratacionDetalleActionForm"  property="expedienteNumero"/> /
		  <bean:write name="cContratacionDetalleActionForm"  property="expedienteAnio" />
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
                  <logic:notEmpty property="autorizacionFecha" name="cContratacionDetalleActionForm">
                    <bean:write name="cContratacionDetalleActionForm"  property="autorizacionFecha" />
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
                   <logic:notEmpty property="resolucionNumero" name="cContratacionDetalleActionForm">
                     <html:select disabled="true" property="resolucionTipo" >
                       <html:options collection="comboTipoResolucion" property="value" labelProperty="label" />
                     </html:select>&nbsp;Nro: <bean:write name="cContratacionDetalleActionForm"  property="resolucionNumero"  />
                   </logic:notEmpty>
                 </td>
	       </tr>
           <tr>
	         <td class="CformNombre" width="80">Fecha:&nbsp;</td>
                 <td class="CformDato">
                   <logic:notEmpty property="resolucionFecha" name="cContratacionDetalleActionForm">
		     		<bean:write name="cContratacionDetalleActionForm"  property="resolucionFecha" /> 
		   		   </logic:notEmpty>
                 </td>
           </tr>
	       <tr>
		 <td class="CformNombre" width="80">Estado:&nbsp;</td>
	     	 <td class="CformDato">
		   <logic:greaterThan value="-1" property="resolucionEstado" name="cContratacionDetalleActionForm">
		     <html:select disabled="true" property="resolucionEstado" >
        	       <html:options collection="comboEstadoResolucion" property="value" labelProperty="label" />
	             </html:select>
  		   </logic:greaterThan>
	         </td>
	        </tr>
        </table>
      
		</logic:notEqual>      
      
    </td>
  </tr>
  
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
      <logic:notEqual value="E" property="estado" name="cContratacionDetalleActionForm">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Eliminar"/>
      </logic:notEqual>  
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
      </div>
    </td>
  </tr>
</table>

</logic:equal>
</html:form>
