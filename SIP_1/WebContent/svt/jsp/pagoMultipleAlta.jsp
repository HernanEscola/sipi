<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />


<script>
window.onload=function(){

setupPanes("container", document.cPagoMultipleActionForm.cambiaPanel.value);
}

function irA(obj){
document.cPagoMultipleActionForm.cambiaPanel.value=obj;
setupPanes("container", document.cPagoMultipleActionForm.cambiaPanel.value);
}


</script>


<br>
<h1 align="center" class="titulo">Registro de Pago Múltiple</h1>

<html:form action="cPagoMultipleAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="cambiaPanel"/>
<logic:equal property="accion" value="alta" name="cPagoMultipleActionForm">
<div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <ul class="tabs">
           <li><a href="#" onClick="return showPane('pago', this)" id="tab1">Pago</a></li>
           <li><a href="#" onClick="return showPane('detalle', this)" id="tab2">Comprobantes</a></li>
          </ul>
        </td>
      </tr>
    </table>
 <div>

<!-- tab1-->
<div id="pago">
       <table align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
 		  <td width="630" class="CformAreaBotones">
		        <div align="center" >
			          <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPagoMultipleActionForm"   onclick="irA('tab1')" />
			          <input type="button" class="CformBotonTranspBorde" value="<" name="cPagoMultipleActionForm"   onclick="irA('tab1')" />
			          <input type="button" class="CformBotonTranspBorde" value=">" name="cPagoMultipleActionForm"   onclick="irA('tab2')" />
			          <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPagoMultipleActionForm"   onclick="irA('tab2')" />
		        </div>
	 	  </td>
		</tr>
	  </table>


	<table class="CformTable"  align="center" cellpadding="0" cellspacing="0" width="600" >
	   <tr>
	     <td>
	        <table width="100%">
	             <tr bgcolor="#DDEEFF">
        	       <td>Alta de Pago Múltiple&nbsp;:</td>
	             </tr>
        	</table>

	 <tr>
	   <td>

        	<table width="100%" cellpadding="2" cellspacing="2">
	          <tr>
        	        <td class="CformNombre"  width="80">Nro:</td>
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
        	        <td class="CformNombre"  width="80">Cuenta No.:<span class="dato_obligatorio">*</span></td>
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
		<table>
			<tr>
        		<td width="390" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">* Datos obligatorios </div>
		        </td>
			<td width="210" class="CformAreaBotones">
		          <div align="right" >
		          <input type="button" class="CformBoton" value="Siguiente" name="cPagoMultipleActionForm"   onclick="irA('tab2')" />
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


<!-- tab1-->
<div id="detalle">
       <table  align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
 		  <td width="630" class="CformAreaBotones">
		        <div align="center" >
			          <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPagoMultipleActionForm"   onclick="irA('tab1')" />
			          <input type="button" class="CformBotonTranspBorde" value="<" name="cPagoMultipleActionForm"   onclick="irA('tab1')" />
			          <input type="button" class="CformBotonTranspBorde" value=">" name="cPagoMultipleActionForm"   onclick="irA('tab2')" />
			          <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPagoMultipleActionForm"   onclick="irA('tab2')" />
		        </div>
	 	  </td>
		</tr>
      </table>

      <table class="CformTable"  class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
        <tr>
          <td>
            <table width="100%">
        	     <tr bgcolor="#DDEEFF">
	               <td>Detalle:&nbsp;</td>
	       	     </tr>
            </table>

           <logic:notEmpty property="loteComprobanteDetalle" name="cPagoMultipleActionForm">
            	<table width="100%">
        	       <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cPagoMultipleActionForm.loteComprobantes" id="pagoDetalle" decorator="conicet.apps.svt.web.egreso.decorator.CComprobantePendienteDisplayWrapper">
			  		  <display:column property="comprobante"  title="Código" headerClass="sortable" sortable="true" maxLength="8" media="html" style="width: 50px;" />
			  		  <display:column property="tipoComprobante"  title="Tipo" headerClass="sortable" sortable="true"  media="html" style="width: 100px;" />
					 <display:column property="prestador" title="Prestador" headerClass="sortable" maxLength="30" sortable="true"  />
					 <display:column property="fechaComprobante" title="Fecha" headerClass="sortable"  sortable="true" style="width: 120px;" />
                     <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                     <display:column property="saldo" title="A Pagar" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                		<display:column property="asignado" title="Asignado" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
                        </display:table>
		            </td>
        		  </tr>
	    		</table>
          </logic:notEmpty>

           <logic:empty property="loteComprobanteDetalle" name="cPagoMultipleActionForm">
       	     <tr >
               <td>No se seleccionaron comprobantes &nbsp;</td>
       	     </tr>
          </logic:empty>
              <tr>
		<td width="630">
            <div align="right" >
	            <html:submit property="btnSubmit" value="Seleccionar Comprobantes" styleClass="CformBoton" />
			</div>
		</td>
	      </tr>
      <tr>
	<td>
	  <table>
		<tr>
        		<td width="210" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">&nbsp;</div>
                        </td>
			<td width="400" class="CformAreaBotones">
		        	<div align="right" >
			          <html:submit property="btnSubmit" styleClass="CformBoton" value=  "Registrar"/>
			          <html:submit property="btnSubmit" styleClass="CformBoton" value=  "Salir"/>
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

<logic:equal property="accion" value="confirmar" name="cPagoMultipleActionForm">

<table class="CformTable"  align="center" cellpadding="0" cellspacing="0" width="600" >
	<tr>
	   <td>
        	<table width="100%">
	             <tr bgcolor="#DDEEFF">
        	       <td>Alta de Pago Múltiple&nbsp;:</td>
	             </tr>
	       	</table>

        	<table width="100%" cellpadding="2" cellspacing="2">
	          <tr>
        	        <td class="CformNombre" width="80">Nro:</td>
                	<td class="CformDato">
	                       	<bean:write name="cPagoMultipleActionForm" property="pagoNro"/>
        	        </td>
			  </tr>

	          <tr>
        	        <td class="CformNombre">Fecha:</td>
                    <td class="CformDato" >
				 		<bean:write name="cPagoMultipleActionForm" property="diaF"/>-
				 		<bean:write name="cPagoMultipleActionForm" property="mesF"/>-
			 			<bean:write name="cPagoMultipleActionForm" property="anioF"/>
	              	</td>
        	   </tr>

	           <tr>
        	        <td class="CformNombre"  width="80">Cuenta No.:</td>
                	<td class="CformDato">
	                  <html:select disabled="true" property="cuenta" >
        	            <html:options collection="comboCuenta" property="value" labelProperty="label"/>
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
	               <td>Detalle:&nbsp;</td>
	       	     </tr>
            </table>

            <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cPagoMultipleActionForm.loteComprobantes" id="pagoDetalle" decorator="conicet.apps.svt.web.egreso.decorator.CComprobantePendienteDisplayWrapper">
			  		  <display:column property="comprobante"  title="Código" headerClass="sortable" sortable="true" maxLength="8" media="html" style="width: 50px;" />
			  		  <display:column property="tipoComprobante"  title="Tipo" headerClass="sortable" sortable="true"  media="html" style="width: 100px;" />
					 <display:column property="prestador" title="Prestador" headerClass="sortable" maxLength="30" sortable="true"  />
					 <display:column property="fechaComprobante" title="Fecha" headerClass="sortable"  sortable="true" style="width: 120px;" />
                     <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                     <display:column property="saldo" title="A Pagar" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                		<display:column property="asignado" title="Asignado" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
                      </display:table>
		            </td>
        		  </tr>
		    </table>
	   </td>
    </tr>
	<tr><td height="10" colspan="10"></td></tr>
	<tr><td height="10" colspan="10"></td></tr>

    <tr>
       <td>
		  <table>
			<tr>
        		<td width="210" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">&nbsp;</div>
                </td>
				<td width="400" class="CformAreaBotones">
		        	<div align="right" >
        			<html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
			        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
			          <html:submit property="btnSubmit" styleClass="CformBoton" value=  "Salir"/>
			        </div>
				</td>
			</tr>
	  	 </table>
       </td>
    </tr>
</table>
</logic:equal>
</html:form>



