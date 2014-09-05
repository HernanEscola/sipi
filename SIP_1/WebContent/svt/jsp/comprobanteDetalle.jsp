<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">Detalle  de  Comprobante</h1>

<html:form action="cComprobanteDetalleAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cComprobanteDetalleActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
	  <tr height="25">
	  <td class="CformRowHeader" colspan="10">&nbsp; Comprobante &nbsp;:&nbsp; <bean:write name="cComprobanteDetalleActionForm" property="tipoComprobanteDescripcion" /></td>
	  </tr>
    <logic:equal value="A" property="estado" name="cComprobanteDetalleActionForm">
    <tr>
      <td align="center">
        <b class="CformDetalleOro">&nbsp;&nbsp;Este Comprobante se encuentra Anulado</b>
      </td>
    </tr>
  </logic:equal>
  
  
  
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
				<logic:equal value="2" property="comprobanteTipo" name="cComprobanteDetalleActionForm">
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
		                <td class="CformDato"> <bean:write name="cComprobanteDetalleActionForm" property="facturaNro"/>
		                </td>
				  	</tr>
				</logic:equal>
               <tr>
                <td class="CformNombre" width="100">Importe:</td>
                <td class="CformDato">$<bean:write name="cComprobanteDetalleActionForm" property="importe" /></td>
               </tr>
               <tr>
                <td class="CformNombre" width="100">Pagado:</td>
                <td class="CformDato">$<bean:write name="cComprobanteDetalleActionForm" property="importePagado" /></td>
               </tr>
               <tr>
                <td class="CformNombre" width="100">Pendiente:</td>
                <td class="CformDato">$<bean:write name="cComprobanteDetalleActionForm" property="importePendiente" /></td>
               </tr>
                
              <tr>
                <td class="CformNombre">Fecha:</td>
	 	<td class="CformDato" ><bean:write name="cComprobanteDetalleActionForm" property="comprobanteFecha" />
              	</td>
              </tr>
	</table>
       <table width="100%" cellpadding="2" cellspacing="2"  >

              <tr>
                <td class="CformNombre" width="100">Detalle:</td>
                <td class="CformDato"><bean:write name="cComprobanteDetalleActionForm" property="detalle" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">UVT:</td>
                <bean:define id="gestor" name="cComprobanteDetalleActionForm" property="gestorEnSession"></bean:define>
                <td class="CformDato"><bean:write name="gestor" property="descripcion" /></td>
              </tr>
	</table>

	<logic:equal value="1" property="comprobanteTipo" name="cComprobanteDetalleActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Entidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteDetalleActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteDetalleActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
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
	<logic:equal value="2" property="comprobanteTipo" name="cComprobanteDetalleActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Proveedor:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colProveedor" name="cComprobanteDetalleActionForm">
            	<table width="100%" >
              	<tr>
                	<td colspan="10">
	        	      <display:table name="sessionScope.cComprobanteDetalleActionForm.colProveedor" decorator="conicet.apps.svt.web.proveedor.decorator.CProveedorDisplayWrapper">
		                <display:column property="indiceProveedor" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 150px;" />
        		      </display:table>
                	</td>
              	</tr>
		    	</table>
          	</logic:notEmpty>
     </logic:equal>     
	<logic:equal value="3" property="comprobanteTipo" name="cComprobanteDetalleActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Entidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteDetalleActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteDetalleActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
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
	<logic:equal value="4" property="comprobanteTipo" name="cComprobanteDetalleActionForm">
		    <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>UVT:&nbsp;</td>
	             </tr>
    	    </table>
    	    <logic:notEmpty property="colGestor" name="cComprobanteDetalleActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
		                  <display:table name="sessionScope.cComprobanteDetalleActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
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
	<logic:equal value="5" property="comprobanteTipo" name="cComprobanteDetalleActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Universidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteDetalleActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteDetalleActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
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
	<logic:equal value="6" property="comprobanteTipo" name="cComprobanteDetalleActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Unidad Académica:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cComprobanteDetalleActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cComprobanteDetalleActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
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
       	      <display:table name="sessionScope.cComprobanteDetalleActionForm.loteContrataciones" id="comprobanteDetalle" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteDetalleDisplayWrapper">
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

  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
		<logic:empty name="cComprobanteDetalleActionForm" property="pagosByComprobante">
		       	<html:submit property="btnSubmit" styleClass="CformBoton" value="Pagos Relacionados" disabled="true"/>
		</logic:empty>
		<logic:notEmpty name="cComprobanteDetalleActionForm" property="pagosByComprobante">
		       	<html:submit property="btnSubmit" styleClass="CformBoton" value="Pagos Relacionados"/>
		</logic:notEmpty>
	    <logic:equal property="habilitadoPagar" value="S" name="cComprobanteDetalleActionForm">
			<html:submit property="btnSubmit" styleClass="CformBoton" value="Ingresar Pago"/>
		</logic:equal>
		<logic:equal property="habilitadoPagar" value="N" name="cComprobanteDetalleActionForm">
			<html:submit property="btnSubmit" styleClass="CformBoton" value="Ingresar Pago" disabled="true"/>
		</logic:equal>
		
	    <logic:equal property="habilitadoModificar" value="S" name="cComprobanteDetalleActionForm">
	        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
		</logic:equal>
	    <logic:equal property="habilitadoModificar" value="N" name="cComprobanteDetalleActionForm">
	        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" disabled="true"/>
		</logic:equal>

	    <logic:equal property="habilitadoEliminar" value="S" name="cComprobanteDetalleActionForm">
	        <html:submit property="btnSubmit" styleClass="CformBoton" value="Anular" />
	        <html:submit property="btnSubmit" styleClass="CformBoton" value="Eliminar" />
		</logic:equal>
	    <logic:equal property="habilitadoEliminar" value="N" name="cComprobanteDetalleActionForm">
	        <html:submit property="btnSubmit" styleClass="CformBoton" value="Anular" disabled="true"/>
	        <html:submit property="btnSubmit" styleClass="CformBoton" value="Eliminar" disabled="true"/>
		</logic:equal>

        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
      </div>
    </td>
  </tr>
</table>
</logic:equal>
</html:form>













