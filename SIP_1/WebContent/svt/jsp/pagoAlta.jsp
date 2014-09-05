<%@include file="layout/include.jsp"%>


<script>
function finpepe(){
 alert("pepe");
}
function controlAcumulado() {
   var totalAsignadoMap = 0.00;

  for(i=0;i<document.cPagoActionForm.elements.length;i++) {
      if (cPagoActionForm.elements[i].name.match(/importeAsignadoMapped/)){
        if (cPagoActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cPagoActionForm.elements[i].value);
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) / 100;
      	}
      }
  }
  cPagoActionForm.importe.value = totalAsignadoMap;
  return 1;

}
</script>


<br>
<h1 align="center" class="titulo">Registro de Pago</h1>

<html:form action="cPagoAltaAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="alta" name="cPagoActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550" >
	
  <tr height="25">
    <bean:define id="gestor" property="gestorEnSession" name="cPagoActionForm"></bean:define>
    <td class="CformRowHeader" colspan="10">&nbsp;  Comprobante a Pagar de <bean:write name="gestor" property="descripcion"/></td>
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
				<logic:equal value="2" property="comprobanteTipo" name="cPagoActionForm">
	                <tr>
		                <td class="CformNombre" width="100">Factura:</td>
		                <td class="CformDato">
		                  <html:select disabled="true" property="factTipo" >
		                    <html:options collection="comboTipoPago" property="value" labelProperty="label"/>
		                  </html:select>
		                </td>
		               
		                <td class="CformNombre">Nro:</td>
		                <td class="CformDato">
		                <bean:write name="cPagoActionForm" property="factNro"/>
		                </td>
					</tr>
				</logic:equal>
              <tr>
                <td class="CformNombre" width="100">Importe:</td>
                <td class="CformDato">$<bean:write name="cPagoActionForm" property="comprobanteImporte" /></td>
                <td class="CformNombre">Fecha:</td>
	 	<td class="CformDato" ><bean:write name="cPagoActionForm" property="comprobanteFecha" /></td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Pagado:</td>
                <td class="CformDato">$<bean:write property="importePagadoComprobante" name="cPagoActionForm" /></td>

                <td class="CformNombre" width="100">A pagar:</td>
                <td class="CformDato">$<bean:write name="cPagoActionForm" property="saldoComprobante" /></td>
              </tr>
	</table>
       <table width="100%" cellpadding="2" cellspacing="2"  >
              <tr>
                <td class="CformNombre" width="100">Detalle:</td>
                <td class="CformDato"><bean:write name="cPagoActionForm" property="detalle" /></td>

              </tr>
    </table>

    </td>
  </tr>
  <tr>
	<td>
		<logic:equal value="1" property="comprobanteTipo" name="cPagoActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Entidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cPagoActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cPagoActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
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
		<logic:equal value="2" property="comprobanteTipo" name="cPagoActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Proveedor:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colProveedor" name="cPagoActionForm">
            	<table width="100%" >
              	<tr>
                	<td colspan="10">
	        	      <display:table name="sessionScope.cPagoActionForm.colProveedor" decorator="conicet.apps.svt.web.proveedor.decorator.CProveedorDisplayWrapper">
		                <display:column property="indiceProveedor" title="#" style="width:10px" headerClass="tableCellHeader"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="cuit" title="Cuit" headerClass="tableCellHeader" style="width: 150px;" />
        		      </display:table>
                	</td>
              	</tr>
		    	</table>
          	</logic:notEmpty>
     	</logic:equal>     
		<logic:equal value="3" property="comprobanteTipo" name="cPagoActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Entidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cPagoActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cPagoActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
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
		<logic:equal value="4" property="comprobanteTipo" name="cPagoActionForm">
		    <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>UVT:&nbsp;</td>
	             </tr>
    	    </table>
    	    <logic:notEmpty property="colGestor" name="cPagoActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
		                  <display:table name="sessionScope.cPagoActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
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
		<logic:equal value="5" property="comprobanteTipo" name="cPagoActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Universidad:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cPagoActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cPagoActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
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
		<logic:equal value="6" property="comprobanteTipo" name="cPagoActionForm">
	       <table width="100%">
        	     <tr bgcolor="#DDEEFF">
               		<td>Unidad Académica:&nbsp;</td>
	             </tr>
   	        </table>
   	        <logic:notEmpty property="colEntidad" name="cPagoActionForm">
		            <table width="100%" >
		              <tr>
		                <td colspan="10">
			        	      <display:table name="sessionScope.cPagoActionForm.colEntidad" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
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


</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Pago</td>
  </tr>


 <tr>
   <td>

        <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre">Nro:</td>
                <td class="CformDato">
                  	<html:text property="pagoNroPrimario" size="4" maxlength="4" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,4)"  /> -
                	<html:text property="pagoNroSecundario" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,8)"  />
                </td>
		</tr>

              <tr>
                <td class="CformNombre">Fecha:<span class="dato_obligatorio">*</span></td>
	 	<td class="CformDato" >
			<html:text property="diaF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
			<html:text property="mesF" maxlength="2" size="2" onkeypress="validarNumero()"/> -
			<html:text property="anioF" maxlength="4" size="4" onkeypress="validarNumero()"/>
              	</td>
              </tr>

              <tr>
                <td class="CformNombre"  width="100">Cuenta No.:<span class="dato_obligatorio">*</span></td>
                <td class="CformDato">
                  <html:select disabled="false" property="cuenta" >
                    <html:options collection="comboCuenta" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
	</table>

    </td>
  </tr>

  <tr>
    <td>

      <table align="center">

          <tr>
            <td colspan="10"  align="center" class="headTabla">Detalle</td>
          </tr>
          <tr>
            <td colspan="10">
              <display:table name="sessionScope.cPagoActionForm.comprobanteSaldosDetalle" id="lotePagoAlta" decorator="conicet.apps.svt.web.egreso.decorator.CPagoAltaDisplayWrapper">
                <display:column property="contratacion" title="NªContr" headerClass="tableCellHeader"  />
                <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader"  />
                <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" />
                <display:column property="oferta" title="Oferta" headerClass="tableCellHeader" style="width: 150px;" />
                <display:column property="pendiente" title="A Cobrar" headerClass="tableCellHeader"  style="width: 100px;text-align:right;"/>
                <display:column property="importeAsignado" title="Asignado*" headerClass="tableCellHeader"  style="width: 100px;text-align:right;"/>
              </display:table>
            </td>
          </tr>
          <tr>
             	<td width="50%"><div  align="right">	      Total </div></td>
		<td width="50%"><div align="right">$<html:text style="text-align:right" property="importe" name="cPagoActionForm" readonly="true" size="10" /></div></td>
          </tr>

       </table>
      </td>
    </tr>

  <tr>
    <td class="CformAreaBotones" height="35"><span class="dato_obligatorio">  * Datos obligatorios</span>
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
      </div>
    </td>
  </tr>
</table>
</logic:equal>




<logic:equal property="accion" value="confirmar" name="cPagoActionForm">

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Pago</td>
  </tr>


 <tr>
   <td>

        <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="100">Nro:</td>
                <td class="CformDato"><bean:write name="cPagoActionForm" property="pagoNro" /></td>
		</tr>

              <tr>
                <td class="CformNombre"  width="100">Cuenta No.:</td>
                <td class="CformDato">
                  <html:select disabled="true" property="cuenta" >
                    <html:options collection="comboCuenta" property="value" labelProperty="label"/>
                  </html:select>
                </td>
                <td class="CformNombre" width="100">Fecha:</td>
	 	<td class="CformDato" >
			<bean:write name="cPagoActionForm" property="diaF"/> -
			<bean:write name="cPagoActionForm" property="mesF" /> -
			<bean:write name="cPagoActionForm" property="anioF" />
              	</td>

              </tr>
	</table>

    </td>
  </tr>

  <tr>
    <td>

      <table align="center">

          <tr>
            <td colspan="10"  align="center" class="headTabla">Detalle Imputación</td>
          </tr>
          <tr>
            <td colspan="10">
               <display:table name="sessionScope.cPagoActionForm.pagoDetalle" id="altaPago" decorator="conicet.apps.svt.web.egreso.decorator.CPagoDetalleDisplayWrapper">
                <display:column property="contratacion" title="NªContr" headerClass="tableCellHeader"  />
                <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader"  />
                <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 150px;"/>
                <display:column property="descripcionCorta" title="Descripción" headerClass="tableCellHeader" style="width: 150px;" />
                <display:column property="oferta" title="Oferta" headerClass="tableCellHeader" style="width: 150px;" />
                <display:column property="importe" title="Importe" total="true" headerClass="tableCellHeader" style="width: 100px;text-align:right;"/>
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
</logic:equal>
</html:form>



