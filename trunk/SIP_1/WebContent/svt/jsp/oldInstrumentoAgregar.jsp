<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<script>

function cambioPorcentaje() {
  
  var importeParcial;
  var porcentajeTotal=0;
  var importeTotalAcumulado=0;
  var cien = Math.round(("100") * 100) / 100;
  var impoTotal = cInstrumentoAgregarActionForm.importeTotal.value;
  
  for(i=0;i<document.cInstrumentoAgregarActionForm.elements.length;i++) {
   
    if (cInstrumentoAgregarActionForm.elements[i].name.match(/porcentajeMapped/)){
      if (!(cInstrumentoAgregarActionForm.elements[i].value == "")){
        var a = 0;
        a = eval(cInstrumentoAgregarActionForm.elements[i].value);
        var porcentaje = Math.round((a) * 100) / 100;
        cInstrumentoAgregarActionForm.elements[i].value = porcentaje.toFixed(2);
      	importeParcial = (impoTotal/100) * porcentaje;
      	porcentajeTotal = porcentajeTotal * 1+porcentaje * 1;
      	
      	importeParcial = Math.round(importeParcial * 100) / 100;
      	importeTotalAcumulado = importeTotalAcumulado + importeParcial;
      }
    }
    
    if (cInstrumentoAgregarActionForm.elements[i].name.match(/importeParcialMapped/)){
      
      cInstrumentoAgregarActionForm.elements[i].value = importeParcial.toFixed(2);
      
    }
    cInstrumentoAgregarActionForm.porcentajeTotal.value = porcentajeTotal.toFixed(2);
    cInstrumentoAgregarActionForm.importeTotalAcumulado.value = importeTotalAcumulado.toFixed(2);
    
  }
  
	//Hacer el total
  return 1;
}

window.onload=function(){
setupPanes("container", document.cInstrumentoAgregarActionForm.tab.value);
}

function irA(obj){
if(document.cInstrumentoAgregarActionForm.tab.value != 'tabDistribucion' && obj == 'tabDistribucion'){
    if (document.cInstrumentoAgregarActionForm.tipoOferta.value == '3'){
    	return submitCostos();
    }	
}

document.cInstrumentoAgregarActionForm.tab.value=obj;
setupPanes("container", document.cInstrumentoAgregarActionForm.tab.value);
}

function cambiarPanel(paneId, activeTab){
    if(document.cInstrumentoAgregarActionForm.tab.value != 'tabDistribucion' && activeTab.id == 'tabDistribucion'){
    	if (document.cInstrumentoAgregarActionForm.tipoOferta.value == '3'){
    		return submitCostos();
    	}
    }
  
  document.cInstrumentoAgregarActionForm.tab.value=activeTab.id;
  return showPane(paneId, activeTab);
}

function submitCostos(){
	document.cInstrumentoAgregarActionForm.action = 'cInstrumentoAgregarAction.do?accion=cargarCostos';
	document.cInstrumentoAgregarActionForm.submit();
}



</script>
<br>
<h1 align="center" class="titulo">Instrumento</h1>

<html:form action="cInstrumentoAgregarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="tab"/>

<html:hidden property="tipoOferta"/>
<html:hidden property="haySugeridos"/>
<html:hidden property="tipoContratacionId"/>



<logic:equal property="accion" value="ingresarDatos" name="cInstrumentoAgregarActionForm">
<div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <ul class="tabs">
           <li><a href="#" onClick="return cambiarPanel('instrumento', this)" id="tabInstrumento">Instrumento</a></li>
           <li><a href="#" onClick="return cambiarPanel('gestor', this)" id="tabGestor">UVT</a></li>
           <li><a href="#" onClick="return cambiarPanel('distribucion', this)" id="tabDistribucion">Distribución </a></li>
           <li><a href="#" onClick="return cambiarPanel('cuotas', this)" id="tabCuotas">Obligaciones de Pago </a></li>
          </ul>
        </td>
      </tr>
    </table>
  <div>
  <div id="instrumento">
    <table width="100%">
        <tr>
          <td width="600" class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde"  value="|<<" onclick="irA('tabInstrumento')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tabInstrumento')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabGestor')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|"  onclick="irA('tabCuotas')" />
            </div>
          </td>
        </tr>
    </table>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
    <tr>
      <td>
        <table width="100%">
          <tr bgcolor="#DDEEFF">
            <td>
              <strong>OFERTA</strong>
            </td>
          </tr>
        </table>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
          <tr><td height="10" colspan="10"></td></tr>
          <tr>
            <td>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="200">Descripción:&nbsp;</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoAgregarActionForm" property="ofertaDescripcion"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Estado:&nbsp;</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoAgregarActionForm" property="ofertaEstado"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Prestador:&nbsp;</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoAgregarActionForm" property="ofertaPrestador"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Cantidad:<span class="dato_obligatorio">*</span></td>
                  <td class="CformDato">
                    <html:text property="ofertaCantidad" size="3" maxlength="4" onkeypress="validarNumero()"/>
                  </td>
                </tr>
              </table>
            </td>
            <td width="120"></td>
          </tr>
        </table>
        <table width="100%">
          <tr bgcolor="#DDEEFF">
            <td>
              <strong>INSTRUMENTO</strong>
            </td>
          </tr>
        </table>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
          <tr><td height="10" colspan="10"></td></tr>
          <tr>
            <td>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="200">Fecha Pedido:<span class="dato_obligatorio">*</span></td>
                  <td class="CformDato">
                    <html:text property="diaPedido" maxlength="2" size="2" onkeypress="validarNumero()"/> -
                    <html:text property="mesPedido" maxlength="2" size="2" onkeypress="validarNumero()"/> -
                    <html:text property="anioPedido" maxlength="4" size="4" onkeypress="validarNumero()"/>
                  </td>
                </tr>

                <tr>
                  <td class="CformNombre" width="200">Fecha Inicio:<span class="dato_obligatorio">*</span></td>
                  <td class="CformDato">
                    <html:text property="diaInicio" maxlength="2" size="2" onkeypress="validarNumero()"/> -
                    <html:text property="mesInicio" maxlength="2" size="2" onkeypress="validarNumero()"/> -
                    <html:text property="anioInicio" maxlength="4" size="4" onkeypress="validarNumero()"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="200">Fecha Fin:&nbsp;</td>
                  <td class="CformDato">
                    <html:text property="diaFin" maxlength="2" size="2" onkeypress="validarNumero()"/> -
                    <html:text property="mesFin" maxlength="2" size="2" onkeypress="validarNumero()"/> -
                    <html:text property="anioFin" maxlength="4" size="4" onkeypress="validarNumero()"/>
                  </td>
                </tr>

                <tr>
                  <td class="CformNombre" width="200">Responsable Administrativo:&nbsp;</td>
                  <td class="CformDato">
                    <html:text property="responsableTecnico" maxlength="80" size="48" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" id="testid" width="200">Descripción Corta:<span class="dato_obligatorio">*</span></td>
                  <td class="CformDato">
                    <html:text property="descripcionCorta" maxlength="80" size="48" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="200">Descripción:&nbsp;</td>
                  <td class="CformDato">
                    <html:textarea property="descripcion" rows="3" />
                  </td>
                </tr>
              </table>
            </td>
          </tr>
           <tr><td height="10" colspan="10"></td></tr>
        </table>

      </td>
    </tr>
    <tr>
      <td class="CformAreaBotones" height="35"><span class="dato_obligatorio"> * Datos obligatorios</span>
        <div align="right">
          <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabGestor')" />
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        </div>
      </td>
    </tr>
</table>
</div> 

<div id="gestor">
  <table width="100%">
        <tr>
          <td width="600" class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tabInstrumento')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tabInstrumento')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabDistribucion')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|"  onclick="irA('tabCuotas')" />
            </div>
          </td>
        </tr>
  </table>
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	<tr>
		<td colspan="2">
			<table width="100%">
				<tr bgcolor="#DDEEFF">
					<td>UVT:&nbsp;<span class="dato_obligatorio">*</span></td>
				</tr>
			</table>
			<table align="center" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table width="100%" cellpadding="2" cellspacing="2">
							<tr>
								<td>
									<logic:notPresent property="gestor" name="cInstrumentoAgregarActionForm">
										<table width="100%">
											<tr>
												<td width="550">
													No se seleccionó UVT&nbsp;
												</td>
											</tr>
										</table>
									</logic:notPresent>
									<logic:present property="gestor" name="cInstrumentoAgregarActionForm">
										<table width="100%">
										<tr>
											<td class="CformNombre" width="120">Descripción:</td>
											<td class="CformDato">
                  								<bean:write name="cInstrumentoAgregarActionForm" property="gestor.descripcion"/>
                							</td>
                						 </tr>
                						 <tr>	
                							<td class="CformNombre" width="120">Tipo:</td>
                							<td class="CformDato">
                  								<bean:write name="cInstrumentoAgregarActionForm" property="gestor.tipoGestor.descripcion"/>
                							</td>
              							</tr>
              							<tr>
                							<td class="CformNombre" width="120">Sigla:</td>
                							<td class="CformDato">
                  								<bean:write name="cInstrumentoAgregarActionForm" property="gestor.sigla"/>
                							</td>
                						 </tr>
                						 <tr>	
                							<td class="CformNombre" width="120">E-Mail:</td>
                							<td class="CformDato">
                  							<a href='mailto:<bean:write name="cInstrumentoAgregarActionForm" property="gestor.email"/>'>
                  								<bean:write name="cInstrumentoAgregarActionForm" property="gestor.email"/>
                  							</a>
                							</td>
              							</tr>
              							</table>
									</logic:present>
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
	  
	  <td class="CformAreaBotones" width="100%" colspan="2">
	            <div align="right" >
  	             <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar"/>
	           </div>
 	 </td>
	</tr>
	
	<tr>
		<td class="CformAreaBotones" height="35">
			<span class="dato_obligatorio"> * Dato obligatorio</span>
		</td>
		<td class="CformAreaBotones" height="35" >
			<div align="right">
				<input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabDistribucion')" />
				<html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
			</div>
		</td>
	</tr>
</table>
</div>

<div id="distribucion">
  <table width="100%">
        <tr>
          <td width="600" class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tabInstrumento')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tabGestor')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabCuotas')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|"  onclick="irA('tabCuotas')" />
            </div>
          </td>
        </tr>
    </table>
<logic:present property="distribucion" name="cInstrumentoAgregarActionForm">
<table align="center" class="CformTable">
  <tr>
    <td>
      <table width="100%">
       	  <tr bgcolor="#DDEEFF">
	            <td>
    	          <strong>Importe:</strong>
        	    </td>
          	</tr>
      </table>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
			
			<logic:equal value="3" property="tipoOferta" name="cInstrumentoAgregarActionForm">
				<tr >
            	<td class="CformNombre" >Costo:&nbsp;</td>
	            	<td class="CformDato">
		              	<html:select disabled="false" property="indiceCosto" onchange="submitCostos()">
		                	<html:options collection="comboCostos" property="value" labelProperty="label" />
		              	</html:select>
	            	</td>
           		</tr>
			
				<tr >
					<td class="CformNombre"  >PU:&nbsp;</td>
					<td >
						<html:text property="importeTotalOferta" maxlength="15" readonly="true" />
	               	</td>
				</tr>
				<tr >
					<td class="CformNombre" >PU * (<bean:write name="cInstrumentoAgregarActionForm" property="ofertaCantidad"/>):&nbsp;</td>
					<td class="CformDato">
						<html:text property="importeTotalOfertaPorCantidad" maxlength="15" readonly="true" />
	               	</td>
				</tr>
			</logic:equal>
			
			<tr >
				<td class="CformNombre" >Importe de esta Operación:&nbsp;<span class="dato_obligatorio">*</span></td>
				<td class="CformDato">
					<html:text property="importeTotal" maxlength="15" onchange="cambioPorcentaje()" onkeypress="validarImporte(this)"/>
               	</td>
			</tr>
	  </table>
    
    
      <table align="center">
        <tr>
          <td colspan="10" width="550" align="center" class="headTabla">Distribución:&nbsp;<span class="dato_obligatorio">*</span></td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cInstrumentoAgregarActionForm.distribucion" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoAgregarDistribucionDisplayWrapper" style="width: 100%">
              <display:column property="egreso" title="Categoría" headerClass="tableCellHeader" />
              <display:column property="porcentaje" title="Porcentaje" headerClass="tableCellHeader"/>
              <display:column property="importeParcial" title="Importe" headerClass="tableCellHeader"/>
             <logic:equal value="2" property="tipoContratacionId" name="cInstrumentoAgregarActionForm">
              <display:column property="sugerido" title="% Sugerido Conv.Marco" headerClass="tableCellHeader"/>
             </logic:equal>
            </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabCuotas')" />
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
          
        </div>
      </td>
    </tr>
</table>
</logic:present>
</div>

<div id="cuotas">
  <table width="100%">
        <tr>
          <td class="CformAreaBotones">
            <div align="center" >
              <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irA('tabInstrumento')" />
              <input type="button" class="CformBotonTranspBorde" value="<" onclick="irA('tabDistribucion')" />
              <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabCuotas')" />
              <input type="button" class="CformBotonTranspBorde" value=">>|"  onclick="irA('tabCuotas')" />
            </div>
          </td>
        </tr>
    </table>
  <table width="560" align="center" class="CformTable">
    <thead>
      <tr>
        <td colspan="10"  align="center" class="headTabla">
          <div align="center">
            Nro. de Cuotas:
            <html:text property="numeroCuotas" maxlength="2" size="2"/>&nbsp;&nbsp;
            Distribución:
            <html:select disabled="false" property="tipoDistribucion">
              <html:options collection="comboDistribucion" property="value" labelProperty="label"/>
            </html:select>&nbsp;&nbsp;
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Redistribuir" />
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="10">
          <display:table name="sessionScope.cInstrumentoAgregarActionForm.cuotas" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoPagosDisplayWrapper" style="width: 100%">
              <display:column property="indice" title="#" headerClass="tableCellHeader" />
              <display:column property="detalle" title="Detalle" headerClass="tableCellHeader" />
              <display:column property="fechaVto" title="Fecha Vencimiento" headerClass="tableCellHeader" />
              <display:column property="importe" title="Importe (pesos)" headerClass="tableCellHeader" />
          </display:table>
        </td>
      </tr>
      <tr>
      <td class="CformAreaBotones" height="35">
        <div align="right">
         <logic:equal value="asignar" property="tipoAccion" name="cInstrumentoAgregarActionForm">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Asignar"/>
         </logic:equal>
         
         <logic:equal value="desasignar" property="tipoAccion" name="cInstrumentoAgregarActionForm">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Desasignar"/>
          
         </logic:equal>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
        </div>
      </td>
    </tr>
    </thead>
  </table>
</div>
</div>
</div>
</logic:equal>

</html:form>
