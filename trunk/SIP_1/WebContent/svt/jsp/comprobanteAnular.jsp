<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">Anulaci&oacute;n de Comprobante</h1>

<html:form action="cComprobanteAnularAction.do" method="POST">
<html:hidden property="accion"/>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
	  <tr height="25">
	  <td class="CformRowHeader" colspan="10">&nbsp; Comprobante &nbsp;:&nbsp; <bean:write name="cComprobanteAnularActionForm" property="tipoComprobanteDescripcion" /></td>
	  </tr>
   <tr height="25">
    <td align="center">
    	<b class="CformDetalleRojo">Está a punto de anular el comprobante, presione 'Grabar' para confirmar</b>
    </td>
  </tr>

  
 
 
 <tr>
   <td>
        <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="100">Tipo:</td>
                <td class="CformDato">
                  <html:select disabled="true" property="comprobanteTipo" >
                    <html:options collection="comboTipoComprobante" property="value" labelProperty="label"/>
                  </html:select>
                </td>
                </tr>
				<logic:equal value="2" property="comprobanteTipo" name="cComprobanteAnularActionForm">
	              	<tr>
		                <td class="CformNombre" width="100">Factura:</td>
		                <td class="CformDato">
		                  <html:select disabled="true" property="facturaTipo" >
		                    <html:options collection="comboTipoFactura" property="value" labelProperty="label"/>
		                  </html:select>
		                </td>
	                </tr>
	                <tr>
		                <td class="CformNombre">Nro:</td>
		                <td class="CformDato"> <bean:write name="cComprobanteAnularActionForm" property="facturaNro"/>
		                </td>
				  	</tr>
				</logic:equal>
               <tr>
                <td class="CformNombre" width="100">Importe:</td>
                <td class="CformDato">$<bean:write name="cComprobanteAnularActionForm" property="importe" /></td>
              <tr>
                <td class="CformNombre">Fecha:</td>
	 	<td class="CformDato" ><bean:write name="cComprobanteAnularActionForm" property="comprobanteFecha" />
              	</td>
              </tr>
	</table>
       <table width="100%" cellpadding="2" cellspacing="2"  >

              <tr>
                <td class="CformNombre" width="100">Detalle:</td>
                <td class="CformDato"><bean:write name="cComprobanteAnularActionForm" property="detalle" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">UVT:</td>
                <bean:define id="gestor" name="cComprobanteAnularActionForm" property="gestorEnSession"></bean:define>
                <td class="CformDato"><bean:write name="gestor" property="descripcion" /></td>
              </tr>
	</table>

	<logic:equal value="1" property="comprobanteTipo" name="cComprobanteAnularActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Entidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteAnularActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteAnularActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
				                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
				                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
		        		      </display:table>
		                </td>
		              </tr>
				    </table>
            </logic:notEmpty>
     </logic:equal>     
	<logic:equal value="2" property="comprobanteTipo" name="cComprobanteAnularActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Proveedor:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colProveedor" name="cComprobanteAnularActionForm">
            	<table width="100%" >
              	<tr>
                	<td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteAnularActionForm.colProveedor" decorator="conicet.apps.svt.web.proveedor.decorator.CProveedorDisplayWrapper">
		                <display:column property="indiceProveedor" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 150px;" />
        		      </display:table>
                	</td>
              	</tr>
		    	</table>
          	</logic:notEmpty>
     </logic:equal>     
	<logic:equal value="3" property="comprobanteTipo" name="cComprobanteAnularActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Entidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteAnularActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteAnularActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
				                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
				                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
		        		      </display:table>
		                </td>
		              </tr>
				    </table>
            </logic:notEmpty>


     </logic:equal>     
	<logic:equal value="4" property="comprobanteTipo" name="cComprobanteAnularActionForm">
		    <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>UVT:&nbsp;</td>
	             </tr>
    	    </table>
    	    <logic:notEmpty property="colGestor" name="cComprobanteAnularActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
		                  <display:table name="sessionScope.cComprobanteAnularActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
		                    <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                    <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                    <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
		                    <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
		                  </display:table>
		                </td>
		              </tr>
		    	    </table>
	         </logic:notEmpty>

     </logic:equal>     
	<logic:equal value="5" property="comprobanteTipo" name="cComprobanteAnularActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Universidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteAnularActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteAnularActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
				                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
				                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
		        		      </display:table>
		                </td>
		              </tr>
				    </table>
            </logic:notEmpty>

     </logic:equal>     
	<logic:equal value="6" property="comprobanteTipo" name="cComprobanteAnularActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Unidad Académica:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteAnularActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteAnularActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="indiceEntidad" title="#" style="width:10px" headerClass="tableCellHeader"/>
				                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
				                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
				                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
		        		      </display:table>
		                </td>
		              </tr>
				    </table>
            </logic:notEmpty>

     </logic:equal>     




    </td>
  </tr>
  <tr>
    <td>

     <table align="center">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Contrataciones: </td>
          </tr>
          <tr>
            <td colspan="10">
       	      <display:table name="sessionScope.cComprobanteAnularActionForm.loteContrataciones" id="comprobanteAnular" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteDetalleDisplayWrapper">
               <display:column property="detalleContratacion" title="#" headerClass="tableCellHeader"  style="width: 10px" />
        	    <display:column property="contratacion" title="Nro." headerClass="tableCellHeader" />
       	        <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader" />
        	    <display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 300px;" />
               <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 150px;text-align: right" />
       	      </display:table>
            </td>
          </tr>
       </table>
      </td>
    </tr>
   <tr><td height="10" colspan="10"></td></tr>
   <tr><td height="10" colspan="10"></td></tr>


  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
      </div>
    </td>
  </tr>


</table>
</html:form>













