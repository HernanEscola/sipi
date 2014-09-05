<%@include file="layout/include.jsp"%>

<script>
window.onload=function(){

habilitarDeshabilitarCamposLoad();

}


function habilitarDeshabilitarCampos(){
	
    habilitarDeshabilitarCamposLoad()
    
    
  	if ((document.cComprobanteBuscarActionForm.tipoComprobante.value == "1") || 
	  	(document.cComprobanteBuscarActionForm.tipoComprobante.value == "5") ||
  		(document.cComprobanteBuscarActionForm.tipoComprobante.value == "6")) {
	    
	    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.value="";
	}
	
	if ((document.cComprobanteBuscarActionForm.tipoComprobante.value == "2")) {
		    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.value="";
	}

}


function habilitarDeshabilitarCamposLoad(){
	
    
	if ((document.cComprobanteBuscarActionForm.tipoComprobante.value == "-1") || 
		(document.cComprobanteBuscarActionForm.tipoComprobante.value == "3") ||
		(document.cComprobanteBuscarActionForm.tipoComprobante.value == "4") ||
			(document.cComprobanteBuscarActionForm.tipoComprobante.value == "-2")){
			
			document.cComprobanteBuscarActionForm.facturaTipo.value="-1";
		    document.cComprobanteBuscarActionForm.facturaTipo.disabled=true;
		    document.cComprobanteBuscarActionForm.facturaTipo.className = 'CformTextDisabled';

			document.cComprobanteBuscarActionForm.facturaNroPrimario.value="";
		    document.cComprobanteBuscarActionForm.facturaNroPrimario.disabled=true;
		    document.cComprobanteBuscarActionForm.facturaNroPrimario.className = 'CformTextDisabled';
		
			document.cComprobanteBuscarActionForm.facturaNroSecundario.value="";
		    document.cComprobanteBuscarActionForm.facturaNroSecundario.disabled=true;
		    document.cComprobanteBuscarActionForm.facturaNroSecundario.className = 'CformTextDisabled';
		    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.value="";
		    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.disabled=true;
		    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.className = 'CformTextDisabled';
		    

	 }
  	
  	if ((document.cComprobanteBuscarActionForm.tipoComprobante.value == "1") || 
	  	(document.cComprobanteBuscarActionForm.tipoComprobante.value == "5") ||
  		(document.cComprobanteBuscarActionForm.tipoComprobante.value == "6")) {
	    

		document.cComprobanteBuscarActionForm.facturaTipo.value="-1";
	    document.cComprobanteBuscarActionForm.facturaTipo.disabled=true;
	    document.cComprobanteBuscarActionForm.facturaTipo.className = 'CformTextDisabled';
	
		document.cComprobanteBuscarActionForm.facturaNroPrimario.value="";
	    document.cComprobanteBuscarActionForm.facturaNroPrimario.disabled=true;
	    document.cComprobanteBuscarActionForm.facturaNroPrimario.className = 'CformTextDisabled';
	
		document.cComprobanteBuscarActionForm.facturaNroSecundario.value="";
	    document.cComprobanteBuscarActionForm.facturaNroSecundario.disabled=true;
	    document.cComprobanteBuscarActionForm.facturaNroSecundario.className = 'CformTextDisabled';
	    
	    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.value="";
	    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.className = 'CformTextEnabled';
		
		
	}
	
	if ((document.cComprobanteBuscarActionForm.tipoComprobante.value == "2")) {
				
		    document.cComprobanteBuscarActionForm.facturaTipo.disabled=false;
		    document.cComprobanteBuscarActionForm.facturaTipo.className = 'CformTextEnabled';
			
		    document.cComprobanteBuscarActionForm.facturaNroPrimario.disabled=false;
		    document.cComprobanteBuscarActionForm.facturaNroPrimario.className = 'CformTextEnabled';
			
		    document.cComprobanteBuscarActionForm.facturaNroSecundario.disabled=false;
		    document.cComprobanteBuscarActionForm.facturaNroSecundario.className = 'CformTextEnabled';
			
		    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.disabled=false;
		    document.cComprobanteBuscarActionForm.entidadOProveedorDesc.className = 'CformTextEnabled';

	}

}





</script>


<br>
<html:form action="cComprobanteBuscarAction.do" method="POST">
<html:hidden property="accion"/>


<logic:equal property="accion" value="formulario" name="cComprobanteBuscarActionForm">
<h1 align="center" class="titulo">Búsqueda de Comprobantes</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr height="25">
  <bean:define id="gestor" name="cComprobanteBuscarActionForm" property="gestorEnSession" />
    <td class="CformRowHeader" colspan="10">&nbsp; Búsqueda de Comprobantes de &nbsp;:&nbsp; <bean:write name="gestor" property="descripcion" /></td>
  </tr>

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
              <tr>
                <td class="CformNombre" width="120" >Tipo:</td>
                <td class="CformDato">&nbsp;
                  &nbsp;<html:select disabled="false" property="tipoComprobante" onchange="habilitarDeshabilitarCampos()" >
                    <html:options collection="comboTipoComprobante" property="value" labelProperty="label" />
                  </html:select>
                </td>
			  </tr>
              <tr>
                <td class="CformNombre" width="120" >Factura:</td>
                <td class="CformDato">&nbsp;
                  &nbsp;<html:select disabled="false" property="facturaTipo">
                    <html:options collection="comboTipoFactura" property="value" labelProperty="label"/>
                  </html:select>
                </td>
                <td class="CformNombre" >Nro:</td>
       	        <td class="CformDato" >&nbsp;
                	<html:text property="facturaNroPrimario" size="4" maxlength="4" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,4)"  /> -
                	<html:text property="facturaNroSecundario" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,8)"  />
                </td>
	     </tr>

	     

             <tr>
                <td class="CformNombre" width="120" >Importe Desde:</td>
                <td class="CformDato">$<html:text property="importeDesde" size="17" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
                <td class="CformNombre"  width="120" >Hasta:</td>
                <td class="CformDato">$<html:text property="importeHasta"  size="17" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
 	     </tr>

             <!--tr>
                <td class="CformNombre" width="120" >Saldo Pendiente&nbsp;:</td>
                <td class="CformDato">$<html:text property="saldoPendienteDesde"  size="17" onkeypress="validarImporte(this)"  /></td>
                <td class="CformNombre"  >Hasta&nbsp;:</td>
                <td class="CformDato">$<html:text property="saldoPendienteHasta"  size="17" onkeypress="validarImporte(this)" /></td>
 	     </tr-->

             <tr>
                <td class="CformNombre" width="120">Fecha Comprobante:</td>
			 	<td class="CformDato" >&nbsp;
					<html:text property="diaFD" maxlength="2" size="2"/> -
					<html:text property="mesFD" maxlength="2" size="2"/> -
					<html:text property="anioFD" maxlength="4" size="4"/>
              	</td>
                <td class="CformNombre" width="120">Hasta:</td>
			 	<td class="CformDato" >&nbsp;
					<html:text property="diaFH" maxlength="2" size="2"/> -
					<html:text property="mesFH" maxlength="2" size="2"/> -
					<html:text property="anioFH" maxlength="4" size="4"/>
              	</td>
             </tr>

             <!--tr>
                <td class="CformNombre" width="120">Fecha Alta &nbsp;:</td>
			 	<td class="CformDato" >&nbsp;
					<html:text property="diaAD" maxlength="2" size="2"/> -
					<html:text property="mesAD" maxlength="2" size="2"/> -
					<html:text property="anioAD" maxlength="4" size="4"/>
              	</td>
                <td class="CformNombre">Hasta&nbsp;:</td>
			 	<td class="CformDato" >&nbsp;
					<html:text property="diaAH" maxlength="2" size="2"/> -
					<html:text property="mesAH" maxlength="2" size="2"/> -
					<html:text property="anioAH" maxlength="4" size="4"/>
              	</td>
              </tr-->
		</table>
       <table width="100%" cellpadding="2" cellspacing="2" >

              <tr>
                <td class="CformNombre" width="120">Estado:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="estado" >
                    <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
          <tr>
                <td class="CformNombre" width="120">Proveedor/Entidad:</td>
                <td class="CformDato">&nbsp; 
                	<html:text property="entidadOProveedorDesc" maxlength="60" size="66" name="cComprobanteBuscarActionForm" />
                </td>
				
           </tr>
              

	</table>

    </td>
  </tr>


  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Búsqueda Avanzada"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
      </div>
    </td>
  </tr>

</table>
</logic:equal>





<logic:equal property="accion" value="formularioAvanzado" name="cComprobanteBuscarActionForm">
<h1 align="center" class="titulo">Búsqueda Avanzada de Comprobantes</h1>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr height="25">
    <bean:define id="gestor" name="cComprobanteBuscarActionForm" property="gestorEnSession" />
    <td class="CformRowHeader" colspan="10">&nbsp; Búsqueda Avanzada de Comprobantes de&nbsp;:&nbsp; <bean:write name="gestor" property="descripcion" /></td>
  </tr>

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
              <tr>
                <td class="CformNombre" width="120" >Tipo:</td>
                <td class="CformDato">&nbsp;
                  &nbsp;<html:select disabled="false" property="tipoComprobante"  onchange="habilitarDeshabilitarCampos()" >
                    <html:options collection="comboTipoComprobante" property="value" labelProperty="label"/>
                  </html:select>
                </td>
				</tr>
              <tr>
                <td class="CformNombre" width="120" >Factura:</td>
                <td class="CformDato">&nbsp;
                  &nbsp;<html:select disabled="false" property="facturaTipo" >
                    <html:options collection="comboTipoFactura" property="value" labelProperty="label"/>
                  </html:select>
                </td>
                <td class="CformNombre"  width="120">Nro:</td>
                <td class="CformDato">&nbsp;
                	<html:text property="facturaNroPrimario" size="4" maxlength="4" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,4)"  /> -
                	<html:text property="facturaNroSecundario" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,8)"  />
		</td>
	     </tr>

             <tr>
                <td class="CformNombre" width="120" >Importe Desde:</td>
                <td class="CformDato">$<html:text property="importeDesde" size="17" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
                <td class="CformNombre"  width="120" >Hasta:</td>
                <td class="CformDato">$<html:text property="importeHasta" size="17" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
 	     </tr>

             <tr>
                <td class="CformNombre" width="120">Fecha Comprobante:</td>
	 	<td class="CformDato" >&nbsp;
			<html:text property="diaFD" maxlength="2" size="2"/> -
			<html:text property="mesFD" maxlength="2" size="2"/> -
			<html:text property="anioFD" maxlength="4" size="4"/>
              	</td>
                <td class="CformNombre" width="120">Hasta:</td>
	 	<td class="CformDato" >&nbsp;
			<html:text property="diaFH" maxlength="2" size="2"/> -
			<html:text property="mesFH" maxlength="2" size="2"/> -
			<html:text property="anioFH" maxlength="4" size="4"/>
              	</td>
             </tr>

	</table>
       <table width="100%" cellpadding="2" cellspacing="2" >


              <tr>
                <td class="CformNombre" width="120">Estado:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="estado" >
                    <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="120">Proveedor/Entidad:</td>
                <td class="CformDato">&nbsp; <html:text  property="entidadOProveedorDesc" maxlength="60" size="66" /></td>
             </tr>


	</table>

    </td>
  </tr>


  <tr>
    <td>
           <table width="100%">
               <tr bgcolor="#DDEEFF">
                 <td>Oferta Contratada:</td>
               </tr>
           </table>


           <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="120">Contratante:</td>
                <td class="CformDato">&nbsp; <html:text property="contratanteDesc" maxlength="60" size="66" /></td>
             </tr>

             <tr>
                <td class="CformNombre" width="120">Contratación:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="tipoContratacion" >
                    <html:options collection="comboTipoContratacion" property="value" labelProperty="label"/>
                  </html:select>
                </td>
             </tr>
 	      <tr>
                 <td class="CformNombre" width="120" >Prestador:</td>
                 <td class="CformDato">&nbsp; <html:text property="prestadorDesc" maxlength="80"  size="66"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="120">Descripción Oferta:</td>
                 <td class="CformDato">&nbsp;  <html:text property="ofertaTecnologicaDesc" maxlength="80"  size="66"/></td>
              </tr>
              <tr>
                <td class="CformNombre" width="120">Tipo Oferta:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="tipoOferta" >
                    <html:options collection="comboTipoOferta" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>

	</table>
	</td>
    </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
      </div>
    </td>
  </tr>

</table>
</logic:equal>





<logic:equal property="accion" value="formularioBusqueda" name="cComprobanteBuscarActionForm">
<h1 align="center" class="titulo">Búsqueda Avanzada de Comprobantes</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr height="25">
  	<bean:define id="gestor" name="cComprobanteBuscarActionForm" property="gestorEnSession" />
    <td class="CformRowHeader" colspan="10">&nbsp; Búsqueda Avanzada de Comprobantes de&nbsp;:&nbsp; <bean:write name="gestor" property="descripcion" /></td>
  </tr>

 <tr>
   <td>
        <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="120">Tipo:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="tipoComprobante"  onchange="habilitarDeshabilitarCampos()">
                    <html:options collection="comboTipoComprobante" property="value" labelProperty="label"/>
                  </html:select>
                </td>
				</tr>
              <tr>
                <td class="CformNombre" width="120">Factura:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="facturaTipo" >
                    <html:options collection="comboTipoFactura" property="value" labelProperty="label"/>
                  </html:select>
                </td>
                <td class="CformNombre">Nro:</td>
                <td class="CformDato">&nbsp;
                	<html:text property="facturaNroPrimario" size="4" maxlength="4" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,4)"  /> -
                	<html:text property="facturaNroSecundario" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCeros(this,8)"  />
                </td>
              </tr>

              <tr>
                <td class="CformNombre" width="120">Importe Desde:</td>
                <td class="CformDato">$<html:text  property="importeDesde" size="17" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
                <td class="CformNombre" >Hasta:</td>
                <td class="CformDato">$<html:text  property="importeHasta" size="17" maxlength="12" onkeypress="validarImporteConDecimales(this)" /></td>
 	      </tr>

              <!--tr>
                <td class="CformNombre" width="120">Saldo Pendiente&nbsp;:</td>
                <td class="CformDato">$<html:text readonly="true" property="saldoPendienteDesde" size="17" onkeypress="validarImporte(this)" /></td>
                <td class="CformNombre" >Hasta&nbsp;:</td>
                <td class="CformDato">$<html:text readonly="true" property="saldoPendienteHasta" size="17" onkeypress="validarImporte(this)" /></td>
 	      </tr-->



              <tr>
                <td class="CformNombre" width="120" >Fe.Comprobante Desde:</td>
	 	<td class="CformDato" >&nbsp;
			<html:text property="diaFD" maxlength="2" size="2"/> -
			<html:text property="mesFD" maxlength="2" size="2"/> -
			<html:text property="anioFD" maxlength="4" size="4"/>
              	</td>
                <td class="CformNombre">Hasta:</td>
	 	<td class="CformDato" >&nbsp;
			<html:text property="diaFH" maxlength="2" size="2"/> -
			<html:text property="mesFH" maxlength="2" size="2"/> -
			<html:text property="anioFH" maxlength="4" size="4"/>
              	</td>
              </tr>

              <!--tr>
                <td class="CformNombre" width="120">Fe.Alta Desde&nbsp;:</td>
	 	<td class="CformDato" >&nbsp;
			<html:text property="diaAD" maxlength="2" size="2"/> -
			<html:text property="mesAD" maxlength="2" size="2"/> -
			<html:text property="anioAD" maxlength="4" size="4"/>
              	</td>
                <td class="CformNombre">Hasta&nbsp;:</td>
	 	<td class="CformDato" >&nbsp;
			<html:text property="diaAH" maxlength="2" size="2"/> -
			<html:text property="mesAH" maxlength="2" size="2"/> -
			<html:text property="anioAH" maxlength="4" size="4"/>
              	</td>
              </tr-->


	</table>
       <table width="100%" cellpadding="2" cellspacing="2" >


              <tr>
                <td class="CformNombre" width="120">Estado:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="estado" >
                    <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="120">Proveedor/Entidad:</td>
			     <logic:notEmpty property="entidadOProveedorDesc" name="cComprobanteBuscarActionForm">
		                <td class="CformDato">&nbsp;
		                  <html:select disabled="false" property="entidadOProveedor" >
		                    <html:options collection="comboEntidadOProveedor" property="value" labelProperty="label"/>
		                  </html:select>
		                </td>
				</logic:notEmpty>
              </tr>
              

	</table>

    </td>
  </tr>


  <tr>
    <td>
           <table width="100%">
               <tr bgcolor="#DDEEFF">
                 <td><strong>OFERTA CONTRATADA</strong></td>
               </tr>
           </table>


           <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="120">Contratante:</td>
	     <logic:notEmpty property="contratanteDesc" name="cComprobanteBuscarActionForm">
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="contratante" >
                    <html:options collection="comboContratante" property="value" labelProperty="label"/>
                  </html:select>
                </td>
	     </logic:notEmpty>
            </tr>
              <tr>
                <td class="CformNombre" width="120">Contratación:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="tipoContratacion" >
                    <html:options collection="comboTipoContratacion" property="value" labelProperty="label"/>
                  </html:select>
                </td>
		</tr>


		<tr>
                <td class="CformNombre" width="120">Prestador:</td>
	     <logic:notEmpty property="prestadorDesc" name="cComprobanteBuscarActionForm">

                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="prestador" >
                    <html:options collection="comboPrestador" property="value" labelProperty="label"/>
                  </html:select>
                </td>
		</logic:notEmpty>
              </tr>
              <tr>

                <td class="CformNombre" width="120">Oferta Contratada:</td>
	     <logic:notEmpty property="ofertaTecnologicaDesc" name="cComprobanteBuscarActionForm">

                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="ofertaTecnologica" >
                    <html:options collection="comboOfertaTecnologica" property="value" labelProperty="label"/>
                  </html:select>
                </td>
		</logic:notEmpty>
            </tr>
              <tr>
                <td class="CformNombre" width="120">Tipo Oferta:</td>
                <td class="CformDato">&nbsp;
                  <html:select disabled="false" property="tipoOferta" >
                    <html:options collection="comboTipoOferta" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>


	</table>
	</td>
    </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>

        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
      </div>
    </td>
  </tr>

</table>
</logic:equal>


<logic:notEqual property="accion" value="formularioAvanzado" name="cComprobanteBuscarActionForm">
<logic:notEqual property="accion" value="formularioBusqueda" name="cComprobanteBuscarActionForm">

 <logic:equal property="accion" value="formularioAvanzadoListar" name="cComprobanteBuscarActionForm">
  <h1 align=" center" class="titulo">Búsqueda Avanzada de Comprobantes</h1>
 </logic:equal>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >

 <logic:equal property="accion" value="formularioAvanzadoListar" name="cComprobanteBuscarActionForm">
    <tr height="25">
     <td class="CformRowHeader" colspan="10">&nbsp;Búsqueda Avanzada de Comprobantes </td>
    </tr>
  </logic:equal>

  <tr>
    <td>
      <table align="center" width="100%">



		<logic:equal property="accion" value="formularioAvanzadoListar" name="cComprobanteBuscarActionForm">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Criterios de la búsqueda:</td>
          </tr>
		  <tr>
            <td > <bean:write name="cComprobanteBuscarActionForm" property="criterioBusqueda"/>
            </td>
          </tr>
        </logic:equal>

          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda:</td>
          </tr>

           <tr>
                <td colspan="10">
	               <display:table sort="list"    name="sessionScope.cComprobanteBuscarActionForm.resultados" id="comprobanteListar" style="width: 100%" export="true"  requestURI="cComprobanteBuscarAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteDisplayWrapper">
					 <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" />
			  		  <display:column property="codigo"  title="Código" headerClass="sortable" sortable="true" maxLength="8" media="html" style="width: 50px;" />
			  		  <display:column property="tipoComprobante"  title="Tipo" headerClass="sortable" sortable="true"  media="html" style="width: 100px;" />
					 	
					 <logic:equal value="2" property="tipoComprobante" name="cComprobanteBuscarActionForm">
					 	<display:column property="facturaTipo"  title="Tipo Factura" headerClass="sortable" sortable="true" media="excel" style="width: 120px;" />
	  		  			<display:column property="facturaNro"  title="Núemro Factura" headerClass="sortable" sortable="true" media="excel" style="width: 120px;" />
						 <display:column property="proveedor" title="Proveedor" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="1" property="tipoComprobante" name="cComprobanteBuscarActionForm">
						 <display:column property="persona" title="Apellido y Nombre" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="5" property="tipoComprobante" name="cComprobanteBuscarActionForm">
						 <display:column property="universidad" title="Universidad" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="6" property="tipoComprobante" name="cComprobanteBuscarActionForm">
						 <display:column property="unidadAcademica" title="U.Académica" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <display:column property="prestador" title="Prestador" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 <display:column property="comprobanteFecha" title="Fecha" headerClass="sortable"  sortable="true" style="width: 100px;" />
                     <display:column property="estado" title="Estado" headerClass="sortable" sortable="true" style="width: 50px;" media="html" />
                     <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                     <display:column property="importePagado" title="Pagado" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                     <display:column property="importePendiente" title="Pendiente" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />

                   </display:table>
	    		</td>
            </tr>
		 	<tr>
			 	<td colspan="10" class="headTabla" height="30"><div align="right">
						<logic:equal property="accion" value="formularioAvanzadoListar" name="cComprobanteBuscarActionForm">
			                <html:submit property="btnSubmit" styleClass="CformBoton" value="Nueva Búsqueda" />
			        	</logic:equal>
		                <html:submit property="btnSubmit" styleClass="CformBoton" value="Ingresar Nueva" />
						<html:submit property="btnSubmit" styleClass="CformBoton" value="Salir" />
	           		</div>
	           	</td>
           	</tr>

       </table>
    </td></tr>
</table>

</logic:notEqual>
</logic:notEqual>


</html:form>



