<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<bean:define id="formulario" name="cDistribucionCobroActionForm" />
<bean:define id="importeCobro" name="formulario" property="importe"/>

<br>
<h1 align="center" class="titulo">Distribución de Cobro</h1>

<html:form action="cDistribucionCobroAction.do" method="POST">



<html:hidden property="accion"/>
<html:hidden property="importe" styleId="importe"/>

<script>
  
  function calcularPendienteYTotales(obj,pos,tipo,importePendiente){
	 
	  formatImporte(obj);
	  var importe=0;
  	  var impPen=0;

	  var precioFinal=eval($('#importe').attr('value'));
	  var importeComision=Number($(obj).attr('value'));

	  if (tipo=="RET"){
		  	impPen= Number($(totFacRet).attr('value'))- Number($(totCobAntRet).attr('value'))-Number(importeComision);
		  	$('#totPenRet').attr('value', Number(impPen).toFixed(2));
	  }else if(tipo=="RECU"){
		  	impPen= Number($(totFacRecu).attr('value'))- Number($(totCobAntRecu).attr('value'))-Number(importeComision);
		  	$('#totPenRecu').attr('value', Number(impPen).toFixed(2));
	  }else if (tipo=="INS"){
		  	impPen= Number($(totFacIns).attr('value'))- Number($(totCobAntIns).attr('value'))-Number(importeComision);
		  	$('#totPenIns').attr('value', Number(impPen).toFixed(2));
	  }else if (tipo=="COM"){
		  	impPen= Number(importePendiente)-Number(importeComision);
		  	$('#importePendiente_COM'+pos).attr('value', Number(impPen).toFixed(2));
	  }else if (tipo=="PRO"){
		  	impPen= Number(importePendiente)-Number(importeComision);
		  	$('#importePendiente_PRO'+pos).attr('value', Number(impPen).toFixed(2));
	  }

	  var i = Number(0);
  	  impPen=0;
	  
  	  // totales 
  	  var totalRecibo=0;
  	  var totalCOM=0;
  	  var totalPRO=0;
  	  var totalADISTRIBUIR=0;
	  
  	  
  	  if (precioFinal>0){
  		  
  		  $("[id^='importeComision_COM']").each(function() {
  			  if ($(this).attr('value') != "" ) {
  		        formatImporte($(this)[0]);
  			    importe=Number($(this).attr('value'));
    	  		totalRecibo=Number(totalRecibo)+Number((importe).toFixed(2));
    	  		totalCOM=Number(totalCOM)+Number((importe).toFixed(2));
    	  		totalADISTRIBUIR=Number(totalADISTRIBUIR)+Number((importe).toFixed(2));
    	  		impPen= Number(impPen)+Number($('#importePendiente_COM'+i).attr('value'));
  			  }
  	    	i= Number(i)+Number(1); 
  		  });
  		  // totales de comisiones
  	      $('#totalCOM').attr('value', totalCOM.toFixed(2));
  	      $('#totalPendienteCOM').attr('value', impPen.toFixed(2));
  	      
  	      
  	      i = Number(0);
  		  $("[id^='importeComision_COS']").each(function() {
  			  if ($(this).attr('value') != "" ) {
  		            formatImporte($(this)[0]);
  			        importe=Number($(this).attr('value'));
     	  			totalRecibo=Number(totalRecibo)+Number((importe).toFixed(2));
	   	  			totalADISTRIBUIR=Number(totalADISTRIBUIR)+Number((importe).toFixed(2));
  			  }
  	    	i= Number(i)+Number(1); 
  		  });
    	  
  		  i = Number(0);
    	  $("[id^='importeComision_RET']").each(function() {
   			  if ($(this).attr('value') != "" ) {
   		            formatImporte($(this)[0]);
   			        importe=Number($(this).attr('value'));
      	  			totalRecibo=Number(totalRecibo)+Number((importe).toFixed(2));
    	  			totalADISTRIBUIR=Number(totalADISTRIBUIR)+Number((importe).toFixed(2));
   			  }
   	    	i= Number(i)+Number(1); 
    	  });
  		  
  		  i = Number(0);
  		  $("[id^='importeComision_INS']").each(function() {
  			  if ($(this).attr('value') != "" ) {
  		          formatImporte($(this)[0]);
  			      importe=Number($(this).attr('value'));
   	  			  totalRecibo=Number(totalRecibo)+Number((importe).toFixed(2));
  			  }
  	    	i= Number(i)+Number(1); 
  		  });
		  impPen=0;	
  		  i = Number(0);
  		  $("[id^='importeComision_PRO']").each(function() {
  			  if ($(this).attr('value') != "" ) {
  		          formatImporte($(this)[0]);
  			      importe=Number($(this).attr('value'));
      	  		  totalRecibo=Number(totalRecibo)+Number((importe).toFixed(2));
	  			  totalPRO=Number(totalPRO)+Number((importe).toFixed(2));
    	  		  impPen= Number(impPen)+Number($('#importePendiente_PRO'+i).attr('value'));

  			  }
  	    	i= Number(i)+Number(1); 
  		  });
  		  // totales de productividad
  	      $('#totalPRO').attr('value', totalPRO.toFixed(2));
  	      $('#totalPendientePRO').attr('value', impPen.toFixed(2));
 
  	  }
      
  	  // totales de saldo a distribuir
  	  totalADISTRIBUIR = Number(precioFinal)-Number(totalADISTRIBUIR);
      $('#totalSaldoADistribuir').attr('value', totalADISTRIBUIR.toFixed(2));
      impPen= Number($(totFacADist).attr('value'))- Number($(totCobAntADist).attr('value'))-Number(totalADISTRIBUIR);
      $('#totPenADist').attr('value', impPen.toFixed(2));
      
      // totales generales del recibo
      $('#totalComisiones').attr('value', totalRecibo.toFixed(2));
      impPen= Number($(facturaImporte).attr('value'))-Number($(totalYaCobrado).attr('value'))-Number(totalRecibo);
      $('#totalPendiente').attr('value', impPen.toFixed(2));
      
  	 
  }

  
  

  window.onload=function() {

	  //deshabilita el enter, y quita el foco al presionarlo
		 $("input[type=text]").keypress(function(e){
		  	if(e.which == 13){ 
			  	this.blur();
			  	return false; 
			} 
		});
	}
  


	function validarImporteConDecimales(obj){
	   var tecla=window.event.keyCode;
	   if (!(((tecla>=48)&&(tecla<=57))||(tecla==46)&&(obj.value.indexOf(".",0)==-1)&&(obj.value.length!=0)))
	 	 window.event.keyCode=0;
	   if (obj.value.length==9 && (tecla!=46) && (obj.value.indexOf(".",0)==-1) )
	        window.event.keyCode=0;
	}
	
  
  </script>



<html:hidden property="totalYaCobrado" styleId="totalYaCobrado" name="cDistribucionCobroActionForm"/>

<logic:equal value="input" property="tipoPantalla" name="cDistribucionCobroActionForm">
 	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
		  <tr>
			   <td>
			 		<table width="100%" align="center" >
			 					

			 					<tr>
			                      <td class="CformNombre" >Factura Nro: </td>
			                      <td class="CformDato">
						          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="facturaTipoYNro" size="16" maxlength="16" /> 
			                      </td>
			                      
			                      <td class="CformNombre"  >Total Facturado: $</td>
			                      <td class="CformDato">
						          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="facturaImporte" size="11" maxlength="11" styleId="facturaImporte"/>
			                      </td>
			                      <td class="CformNombre"  >Imp. Cobro: $</td>
			                      <td class="CformDato">
						          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="importe" size="11" maxlength="11" styleId="importeCobro"/>
			                      </td>

			                    </tr>
					</table>
		        </td>
		 </tr>
		 <tr>
				   <td>
		             <table width="100%">
				            <tr bgcolor="#DDEEFF">
				              <td>Comisiones:&nbsp;<span class="dato_obligatorio">*</span></td>
				            </tr>
			          </table>
				   
				   
				       <table align="center" width="100%">
			                   
			                    <tr>
			                      <td colspan="10">
			                        <display:table name="sessionScope.cDistribucionCobroActionForm.distribucionComisionCOM" style="width: 100%" requestURI="cDistribucionCobroAction.do" id="distribucionCobro"  decorator="conicet.apps.siuvt.web.ingreso.decorator.CDistribucionCobroDisplayWrapper" >
			                          <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:20%;" />
			                          <display:column property="importeFactura" title="Dist.Factura $" headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                          <display:column property="cobrado" title="Cobrado $"  headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                          <display:column property="importeComision" title="Cobro $" headerClass="tableCellHeader" style="width:20%;text-align: right" />
			                          <display:column property="pendiente" title="Pendiente $" headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                        </display:table>
			                        
			                      </td>
			                    </tr>
			    	   </table>
			        </td>
			 </tr>
		     <tr>
				   <td>
				       <table class="tablaMin" align="center" width="100%">
			                   
			           			<tr>
			           			<td>
			           				<table class="tablaMin">
										<tbody>

											<tr class="odd">
											<td style="width:20%">Retención</td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totFacRet"/></td>
											<html:hidden property="totFacRet"  styleId="totFacRet"/>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totCobAntRet"/></td>
											<html:hidden property="totCobAntRet"  styleId="totCobAntRet"/>
											<td style="width:20%;text-align: right"><html:text styleId="importeComision_RET0" styleClass="importeComision" property="importeComisionRet" style="text-align:right" size="12" onblur="return calcularPendienteYTotales(this,0,'RET',0)" />
											<td style="width:20%;text-align: right"><html:text styleId="totPenRet" readonly="true" styleClass="importeComision" name="cDistribucionCobroActionForm" style="text-align:right" size="12" property="totPenRet"/></td>
											</tr>
											<tr class="odd">
											<td style="width:20%;">Costos</td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totFacRecu"/></td>
											<html:hidden property="totFacRecu"  styleId="totFacRecu"/>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totCobAntRecu"/></td>
											<td style="width: 20%;text-align: right"><html:text styleId="importeComision_COS0" styleClass="importeComision" property="importeComisionRecu" style="text-align:right" size="12" onblur="return calcularPendienteYTotales(this,0,'RECU',0)" />
											<html:hidden property="totCobAntRecu" styleId="totCobAntRecu"/>
											<td style="width: 20%;text-align: right"><html:text styleId="totPenRecu" readonly="true" styleClass="importeComision" name="cDistribucionCobroActionForm" style="text-align:right" size="12" property="totPenRecu"/></td>
											</tr>
											<tr class="tableRowFooter">
											<td class="tableCell" style="text-align:left;width: 20%" ><b> Saldo A distribuir (Beneficio)</b></td>
											<td  headerClass="tableCellHeader" style="text-align:right; width: 20%;"><b><bean:write name="cDistribucionCobroActionForm" property="totFacADist"/></td></b></td>
											<html:hidden property="totFacADist" styleId="totFacADist" />
											<td  headerClass="tableCellHeader" style="text-align:right; width: 20%;"><b><bean:write name="cDistribucionCobroActionForm" property="totCobAntADist"/></b></td>
											<html:hidden property="totCobAntADist" styleId="totCobAntADist" />
											<td  headerClass="tableCellHeader" style="text-align:right; width: 20%;"><b><html:text styleClass="textDisabled" styleId="totalSaldoADistribuir"  readonly="true"  property="totalSaldoADistribuir" style="text-align:right" size="12" disabled="disabled" /></b></td>
											<td  headerClass="tableCellHeader" style="text-align:right; width: 20%;"><b><html:text styleClass="textDisabled" styleId="totPenADist" readonly="true"  style="text-align:right" size="12" name="cDistribucionCobroActionForm" property="totPenADist"/></b></td>
											</tr>
											<tr class="odd">
											<td style="width:20%;">Unidad Divisional</td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totFacIns"/></td>
											<html:hidden property="totFacIns" styleId="totFacIns" />
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totCobAntIns"/></td>
											<html:hidden property="totCobAntIns" styleId="totCobAntIns" />
											<td style="width:20%;text-align: right"><html:text styleId="importeComision_INS0" styleClass="importeComision" property="importeComisionIns" style="text-align:right" size="12" onblur="return calcularPendienteYTotales(this,0,'INS',0)" />
											<td style="width: 20%;text-align: right"><html:text styleId="totPenIns" readonly="true" styleClass="importeComision" name="cDistribucionCobroActionForm" style="text-align:right" size="12" property="totPenIns"/></td>
											</tr>
										</tbody>
									</table>
			                      </td>
			                    </tr>

			    	   </table>
			                   
			              
			       
			       
			       
			        </td>
			 </tr>

  		     <tr>
				   <td>
		             <table width="100%">
				            <tr bgcolor="#DDEEFF">
				              <td>Productividad:&nbsp;</td>
				            </tr>
			          </table>
				       <table align="center" width="100%">
			                   
			                    <tr>
			                      <td colspan="10">
			                        <display:table name="sessionScope.cDistribucionCobroActionForm.distribucionComisionPRO" style="width: 100%" requestURI="cDistribucionCobroAction.do" id="distribucionCobro"  decorator="conicet.apps.siuvt.web.ingreso.decorator.CDistribucionCobroDisplayWrapper" >
			                          <display:column property="apellidoYNombre" title="Apellido,Nombre" headerClass="tableCellHeader" style="width: 20%;text-align: left" />
			                          <display:column property="importeFactura" title="Dist.Factura $" headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                          <display:column property="cobrado" title="Cobrado $"  headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                          <display:column property="importeComision" title="Cobro $" headerClass="tableCellHeader" style="width:20%;text-align: right" />
			                          <display:column property="pendiente" title="Pendiente $" headerClass="tableCellHeader" style="width: 20%;text-align: right" />

			                        </display:table>
			                      </td>
			    	   </table>
			       
			        </td>
			 </tr>



         <tr>
	          
		         <td class="CformAreaBotones">
		           <div align="left"><span class="dato_obligatorio">* Datos obligatorios</span>
					</div>		          
		           <div align="right">
		             <jsp:include page="/jsp/layout/botones.jsp">
		                <jsp:param name="formulario" value="cDistribucionCobroActionForm" />
		                <jsp:param name="entidad" value="cobro" />
		             </jsp:include> 
		           </div>
		   </td>
		 </tr>
		 
		 
    </table>
</logic:equal>
<logic:equal value="view" property="tipoPantalla" name="cDistribucionCobroActionForm">
 	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
		  <tr>
			   <td>
			 		<table width="100%" align="center" >
			 					

			 					<tr>
			                      <logic:notEqual value="SI" property="facturaTipo" name="cDistribucionCobroActionForm">
			                      <td class="CformNombre" >Factura Nro: </td>
			                      <td class="CformDato">
						          
						          <bean:write name="cDistribucionCobroActionForm" property="facturaTipoYNroByDisplay" />
						          <!-- html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="facturaTipoYNroByDisplay" /--> 
			                      </td>
			                      </logic:notEqual>
			                      <logic:equal value="SI" property="facturaTipo" name="cDistribucionCobroActionForm">
			                      <td class="CformNombre"  ><bean:write name="cDistribucionCobroActionForm" property="facturaTipoYNroByDisplay" /></td>
			                      <td class="CformDato" width="30%">
						          
						          <!-- html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="facturaTipoYNroByDisplay" /--> 
			                      </td>
			                      </logic:equal>
			                      
			                      
			                      <td class="CformNombre"  >Total Facturado: $</td>
			                      <td class="CformDato">
						          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="facturaImporte" size="11" maxlength="11" styleId="facturaImporte"/>
			                      
			                      
			                      </td>
			                      <td class="CformNombre"  >Imp.Cobro: $</td>
			                      <td class="CformDato">
						          <html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="importe" size="11" maxlength="11" styleId="importeCobro"/>
			                      
			                      
			                      </td>

			                    </tr>
					</table>
		        </td>
		 </tr>
		 <tr>
				   <td>
		             <table width="100%">
				            <tr bgcolor="#DDEEFF">
				              <td>Comisiones:&nbsp;<span class="dato_obligatorio">*</span></td>
				            </tr>
			          </table>
				   
				   
				       <table align="center" width="100%">
			                   
			                    <tr>
			                      <td colspan="10">
			                        <display:table name="sessionScope.cDistribucionCobroActionForm.distribucionComisionCOM" style="width: 100%" requestURI="cDistribucionCobroAction.do" id="distribucionCobro"  decorator="conicet.apps.siuvt.web.ingreso.decorator.CDistribucionCobroDisplayWrapper" >
			                          <display:column property="descripcionComision" title="Descripción"  headerClass="tableCellHeader" style="width:20%;" />
			                          <display:column property="importeFactura" title="Dist.Factura $" headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                          <display:column property="cobrado" title="Cobrado $"  headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                          <display:column property="importeComisionCfm" title="Cobro $" headerClass="tableCellHeader" style="width:20%;text-align: right" />
			                          <display:column property="pendienteCfm" title="Pendiente $" headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                        </display:table>
			                        
			                      </td>
			                    </tr>
			    	   </table>
			        </td>
			 </tr>
		     <tr>
				   <td>
				       <table class="tablaMin" align="center" width="100%">
			                   
			           			<tr>
			           			<td>
			           				<table class="tablaMin">
										<tbody>
											<tr class="odd">
											<td style="width:20%;">Retención</td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totFacRet"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totCobAntRet"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="importeComisionRet"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totPenRet"/></td>
											</tr>

											<tr class="odd">
											<td style="width:20%;">Costos</td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totFacRecu"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totCobAntRecu"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="importeComisionRecu"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totPenRecu"/></td>
											</tr>

											<tr class="tableRowFooter">
											<td class="tableCell" style="text-align:left;width:20%" ><b> Saldo A distribuir (Beneficio)</b></td>
											<td  headerClass="tableCellHeader" style="text-align:right; width: 20%;"><b><bean:write name="cDistribucionCobroActionForm" property="totFacADist"/></td></b></td>
											<td  headerClass="tableCellHeader" style="text-align:right; width: 20%;"><b><bean:write name="cDistribucionCobroActionForm" property="totCobAntADist"/></b></td>
											<td  headerClass="tableCellHeader" style="text-align:right; width: 20%;"><b><bean:write name="cDistribucionCobroActionForm" property="totalSaldoADistribuir"/></b></td>
											<td  headerClass="tableCellHeader" style="text-align:right; width: 20%;"><b><bean:write name="cDistribucionCobroActionForm" property="totPenADist"/></b></td>
											</tr>
											<tr class="odd">
											<td style="width:20%;">Unidad Divisional</td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totFacIns"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totCobAntIns"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="importeComisionIns"/></td>
											<td style="width: 20%;text-align: right"> <bean:write name="cDistribucionCobroActionForm" property="totPenIns"/></td>
											</tr>
										</tbody>
									</table>
			                      </td>
			                    </tr>

			    	   </table>
			       
			        </td>
			 </tr>

  		     <tr>
				   <td>
		             <table width="100%">
				            <tr bgcolor="#DDEEFF">
				              <td>Productividad:&nbsp;</td>
				            </tr>
			          </table>
				       <table align="center" width="100%">
			                   
			                    <tr>
			                      <td colspan="10">
			                        <display:table name="sessionScope.cDistribucionCobroActionForm.distribucionComisionPRO" style="width: 100%" requestURI="cDistribucionCobroAction.do" id="distribucionCobro"  decorator="conicet.apps.siuvt.web.ingreso.decorator.CDistribucionCobroDisplayWrapper" >
			                          <display:column property="apellidoYNombre" title="Apellido,Nombre" headerClass="tableCellHeader" style="width: 20%;text-align: left" />
			                          <display:column property="importeFactura" title="Dist.Factura $" headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                          <display:column property="cobrado" title="Cobrado $"  headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                          <display:column property="importeComisionCfm" title="Cobro $" headerClass="tableCellHeader" style="width:20%;text-align: right" />
			                          <display:column property="pendienteCfm" title="Pendiente $" headerClass="tableCellHeader" style="width: 20%;text-align: right" />
			                        </display:table>
			                      </td>
			                    </tr>
			                    </table>
			       
			        </td>
			

         <tr>
	         <td class="CformAreaBotones">
		           <div align="left"></div>		          
		           <div align="right">
					        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
		           </div>
		   </td>
		 </tr>
		 
		 
    </table>

</logic:equal>




</html:form>





    
