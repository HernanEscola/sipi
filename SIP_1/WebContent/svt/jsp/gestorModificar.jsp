<%@include file="layout/include.jsp"%>
<%@ page import= "conicet.apps.svt.object.gestor.CUvt" %>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
  media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script type='text/javascript' src="./js/comboPaisAjax.js"></script>
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<script>



/**/

function irA(obj){
document.cGestorModificarActionForm.cambiaPanel.value=obj;
setupPanes("container", document.cGestorModificarActionForm.cambiaPanel.value);

}

function mostrarPanel(obj1, obj2){
  document.cGestorModificarActionForm.cambiaPanel.value = obj2.id;
  return showPane(obj1, obj2);
}

window.onload=function(){
	setupPanes("container", document.cGestorModificarActionForm.cambiaPanel.value);
	generarCombos("",null,"<%=CConstantes.paisArgentina%>");
	generarCombos("","Legal","<%=CConstantes.paisArgentina%>");

	if (document.cGestorModificarActionForm.tipoGestor.value =="1"){

		
		//
		if ($('#tipoUvt').val() != "C" ){
			habilitarBotonCentral();
		}else{
     		
     		$('#centralPuntoFacturacion').attr("value", "-1");
	       	$('#central').attr("value", "-1");
	        $('#central').attr("disabled", true);
	          
	        $('#centralPuntoFacturacion').attr("disabled", true);
			$('#trPuntoFacturacion').hide();
			$('#trNormal').show();
				
			document.cGestorModificarActionForm.central.value="-1";
		    document.cGestorModificarActionForm.elegirCentral.value="N";
		
		    document.cGestorModificarActionForm.cuitPrefijo.disabled=false;
		    document.cGestorModificarActionForm.cuitNumero.disabled=false;
		    document.cGestorModificarActionForm.cuitSufijo.disabled=false;
		    document.cGestorModificarActionForm.cuitPrefijo.className = '';
		    document.cGestorModificarActionForm.cuitNumero.className = '';
		    document.cGestorModificarActionForm.cuitSufijo.className = '';
		    document.cGestorModificarActionForm.numeroSucursal.disabled=true;
		    document.cGestorModificarActionForm.numeroSucursal.className = 'CformTextDisabled';
        }
		tipoUvtAnterior = $('#tipoUvt').val();
		
		refrescarCuitDeCentralElegida();
		habilitarConvenioLaboral();
		habilitarConvenioMarco();
	}
	
}

var tipoUvtAnterior = "-1";

function habilitarBotonCentral(){
	/*  Habilita o deshabilita el combo central y el campo cuit  S*/
	     	
	     
	if ( $('#tipoUvt').val() == "-1" || $('#tipoUvt').val() == "-2" ){
	     
		tipoUvtAnterior = "-1";
		$('#central').attr("disabled", true);
		
       	
       	$('#centralPuntoFacturacion').attr("value", "-1");
       	$('#central').attr("value", "-1");
       	
       	$('#centralPuntoFacturacion').attr("disabled", true);
		$('#trPuntoFacturacion').hide();
		$('#trNormal').show();
		
       	document.cGestorModificarActionForm.elegirCentral.value="N";
        document.cGestorModificarActionForm.cuitPrefijo.value="";
        document.cGestorModificarActionForm.cuitNumero.value="";
        document.cGestorModificarActionForm.cuitSufijo.value="";
        
        document.cGestorModificarActionForm.cuitPrefijo.disabled=true;
        document.cGestorModificarActionForm.cuitNumero.disabled=true;
        document.cGestorModificarActionForm.cuitSufijo.disabled=true;
        document.cGestorModificarActionForm.cuitPrefijo.className = 'CformTextDisabled';
        document.cGestorModificarActionForm.cuitNumero.className = 'CformTextDisabled';
        document.cGestorModificarActionForm.cuitSufijo.className = 'CformTextDisabled';
        
        document.cGestorModificarActionForm.numeroSucursal.disabled=false;
        document.cGestorModificarActionForm.numeroSucursal.className = '';
        document.cGestorModificarActionForm.numeroSucursal.disabled=true;
        document.cGestorModificarActionForm.numeroSucursal.className = 'CformTextDisabled';
        
			}
	else if ( $('#tipoUvt').val() == "D" && tipoUvtAnterior != "D"){
	           	
				
				tipoUvtAnterior = "D";
				$('#central').removeAttr("disabled");
	            $('#centralPuntoFacturacion').attr("value", "-1");
	            $('#centralPuntoFacturacion').attr("disabled", true);
				$('#trPuntoFacturacion').hide();
				$('#trNormal').show();
	            document.cGestorModificarActionForm.elegirCentral.value="S";

	            document.cGestorModificarActionForm.cuitPrefijo.value="";
	            document.cGestorModificarActionForm.cuitNumero.value="";
	            document.cGestorModificarActionForm.cuitSufijo.value="";
	            
	            document.cGestorModificarActionForm.cuitPrefijo.disabled=true;
	            document.cGestorModificarActionForm.cuitNumero.disabled=true;
	            document.cGestorModificarActionForm.cuitSufijo.disabled=true;
	            document.cGestorModificarActionForm.cuitPrefijo.className = 'CformTextDisabled';
		        document.cGestorModificarActionForm.cuitNumero.className = 'CformTextDisabled';
		        document.cGestorModificarActionForm.cuitSufijo.className = 'CformTextDisabled';
	            
	            document.cGestorModificarActionForm.numeroSucursal.disabled=false;
		        document.cGestorModificarActionForm.numeroSucursal.className = '';
	            
			}
	     	else if ($('#tipoUvt').val() == "C" ){
	     		tipoUvtAnterior = "C";
	     		
	     		$('#centralPuntoFacturacion').attr("value", "-1");
		       	$('#central').attr("value", "-1");
		          $('#central').attr("disabled", true);
		          
		          $('#centralPuntoFacturacion').attr("disabled", true);
					$('#trPuntoFacturacion').hide();
					$('#trNormal').show();
					
			document.cGestorModificarActionForm.central.value="-1";
        document.cGestorModificarActionForm.elegirCentral.value="N";

        document.cGestorModificarActionForm.cuitPrefijo.value="";
        document.cGestorModificarActionForm.cuitNumero.value="";
        document.cGestorModificarActionForm.cuitSufijo.value="";

        document.cGestorModificarActionForm.cuitPrefijo.disabled=false;
        document.cGestorModificarActionForm.cuitNumero.disabled=false;
        document.cGestorModificarActionForm.cuitSufijo.disabled=false;
        document.cGestorModificarActionForm.cuitPrefijo.className = '';
        document.cGestorModificarActionForm.cuitNumero.className = '';
        document.cGestorModificarActionForm.cuitSufijo.className = '';
        document.cGestorModificarActionForm.numeroSucursal.value="";
        document.cGestorModificarActionForm.numeroSucursal.disabled=true;
        document.cGestorModificarActionForm.numeroSucursal.className = 'CformTextDisabled';
		            
	        }else if ($('#tipoUvt').val() == "P" && tipoUvtAnterior != "P"){
	        	tipoUvtAnterior = "P";
	        	$('#central').attr("disabled", true);
	            $('#central').attr("value", "-1");
	            
	            $('#centralPuntoFacturacion').attr("disabled", false);
				$('#trPuntoFacturacion').show();
				$('#trNormal').hide();
				
	            document.cGestorModificarActionForm.elegirCentral.value="S";

	            document.cGestorModificarActionForm.cuitPrefijo.value="";
	            document.cGestorModificarActionForm.cuitNumero.value="";
	            document.cGestorModificarActionForm.cuitSufijo.value="";
	            
	            document.cGestorModificarActionForm.cuitPrefijo.disabled=true;
	            document.cGestorModificarActionForm.cuitNumero.disabled=true;
	            document.cGestorModificarActionForm.cuitSufijo.disabled=true;
	            document.cGestorModificarActionForm.cuitPrefijo.className = 'CformTextDisabled';
		        document.cGestorModificarActionForm.cuitNumero.className = 'CformTextDisabled';
		        document.cGestorModificarActionForm.cuitSufijo.className = 'CformTextDisabled';
	            
	            document.cGestorModificarActionForm.numeroSucursal.disabled=false;
		        document.cGestorModificarActionForm.numeroSucursal.className = '';
	        }
	}



	function refrescarCuitDeCentralElegida(){
		var idSeleccionada;
		if($('#tipoUvt').val() != "P")
			idSeleccionada = $('#central').val();
		else
			idSeleccionada = $('#centralPuntoFacturacion').val();
		
     	if ($('#tipoUvt').val() == "D"  || $('#tipoUvt').val() == "P"){
    		
			if (idSeleccionada!="-1" && idSeleccionada!="-2"){
				<logic:iterate name="cGestorModificarActionForm" property="centrales" id="elemento">
			
				var idCentral = "";
				idCentral = new String("<bean:write name="elemento" property="id"/>");
			    
				if (idSeleccionada == idCentral){
					var cuit="";
					cuit= new String(<%=((CUvt)elemento).getCentralRoot().getCuit()!= null? ((CUvt)elemento).getCentralRoot().getCuit():""%>);
					document.cGestorModificarActionForm.cuitPrefijo.value=cuit.substring(0,2);
			        document.cGestorModificarActionForm.cuitNumero.value=cuit.substring(2,10);
			        document.cGestorModificarActionForm.cuitSufijo.value=cuit.substring(10);
	
			        foundAny = true;
			    }
				
				</logic:iterate>
			}
			
     	}else{
         	
     		if($('#tipoUvt').val() != "P")
     			idSeleccionada = $('#central').attr("value", "-1");
     		else
     			idSeleccionada = $('#centralPuntoFacturacion').attr("value", "-1");
     	}
	
	

	}


	function cargarCuitDeCentralElegida(){
		/*  Si elije una central cargará el cuit de esa central en el campo cuil */
		
		var idSeleccionada;
		if($('#tipoUvt').val() != "P")
			idSeleccionada = $('#central').val();
		else
			idSeleccionada = $('#centralPuntoFacturacion').val();
		
		
		if (idSeleccionada=="-1" || idSeleccionada=="-2"){
			
		    document.cGestorModificarActionForm.cuitPrefijo.value="";
	        document.cGestorModificarActionForm.cuitNumero.value="";
	        document.cGestorModificarActionForm.cuitSufijo.value="";
	        
			
		}else{ 
			
			<logic:iterate name="cGestorModificarActionForm" property="centrales" id="elemento">
		
			var idCentral = "";
			idCentral = new String("<bean:write name="elemento" property="id"/>");
		    
			if (idSeleccionada == idCentral){
				var cuit="";
				cuit= new String("<%=((CUvt)elemento).getCentralRoot().getCuit()!= null? ((CUvt)elemento).getCentralRoot().getCuit():""%>");
				document.cGestorModificarActionForm.cuitPrefijo.value=cuit.substring(0,2);
		        document.cGestorModificarActionForm.cuitNumero.value=cuit.substring(2,10);
		        document.cGestorModificarActionForm.cuitSufijo.value=cuit.substring(10);
		        foundAny = true;
		    }
			
			</logic:iterate>
		}
		
	}



 	function mostrarAlicuota(){
		  var element = $('#alicuota');
		  element.attr('readonly', true);
  element.addClass('cFromTextDisabled');

		    if (document.cGestorModificarActionForm.iva.value == "-1" || document.cGestorModificarActionForm.iva.value == "-2"){
				   $('#alicuota').attr('value', "");
					document.cGestorModificarActionForm.alicuota.value="" ;

		    }
			  else{
					<logic:iterate name="cGestorModificarActionForm" property="comboIva" id="elemento">
					
					var idCategoriaIva = "";
					idCategoriaIva = new String("<bean:write name="elemento" property="id"/>");
				    
					if (document.cGestorModificarActionForm.iva.value == idCategoriaIva){
						if (idCategoriaIva == "2"){
							var alicuota="";
							alicuota= new String("<bean:write name="elemento" property="alicuota"/>");
							var adicional = "";
							adicional= new String("<bean:write name="elemento" property="adicional"/>");
						 	    	$('#alicuota').attr('value', alicuota+"% + " +adicional);
							document.cGestorModificarActionForm.alicuota.value=alicuota + " % + " +adicional;
						}else{
							var alicuota="";
							alicuota= new String("<bean:write name="elemento" property="alicuota"/>");
						 	    	$('#alicuota').attr('value', alicuota);
							document.cGestorModificarActionForm.alicuota.value=alicuota ;
						} 
		
						foundAny = true;
				    }
					
					</logic:iterate>
		
		
			}
	}


 	function habilitarConvenioLaboral(){
 		
 		/*  Habilita o deshabilita los datos del convenio laboral*/
 		      if (document.cGestorModificarActionForm.firmaConvenioLaboral[0].checked==true){

		            document.cGestorModificarActionForm.responsableConvenioLaboral.disabled=false;
 		            document.cGestorModificarActionForm.convenioLaboralFecha.disabled=false;
 		            document.cGestorModificarActionForm.tipoResolucionConvenioLaboral.disabled=false;
 		            document.cGestorModificarActionForm.numeroConvenioLaboral.disabled=false;
 		           
 	              document.cGestorModificarActionForm.responsableConvenioLaboral.className = 'CformTextEnabled';
 	              document.cGestorModificarActionForm.convenioLaboralFecha.className = 'CformTextEnabled';
 	              document.cGestorModificarActionForm.tipoResolucionConvenioLaboral.className = 'CformTextEnabled';
 	              document.cGestorModificarActionForm.numeroConvenioLaboral.className = 'CformTextEnabled';
 		           
 		      }
 		   
 		      else {
		 		        document.cGestorModificarActionForm.firmaConvenioLaboral[0].checked==false;
 	              document.cGestorModificarActionForm.responsableConvenioLaboral.disabled=true;
 	              document.cGestorModificarActionForm.convenioLaboralFecha.disabled=true;
 	              document.cGestorModificarActionForm.tipoResolucionConvenioLaboral.disabled=true;
 	              document.cGestorModificarActionForm.numeroConvenioLaboral.disabled=true;
 	             
 	  		        document.cGestorModificarActionForm.responsableConvenioLaboral.className = 'CformTextDisabled';
 		            document.cGestorModificarActionForm.convenioLaboralFecha.className = 'CformTextDisabled';
 		            document.cGestorModificarActionForm.tipoResolucionConvenioLaboral.className = 'CformTextDisabled';
 		            document.cGestorModificarActionForm.numeroConvenioLaboral.className = 'CformTextDisabled';

 		      }
 	}
 		
 	function habilitarConvenioMarco(){
 		
 		  /*  Habilita o deshabilita los datos del convenio marco*/
 		        if (document.cGestorModificarActionForm.firmaConvenioMarco[0].checked==true){
 		              document.cGestorModificarActionForm.responsableConvenioMarco.disabled=false;
 		              document.cGestorModificarActionForm.convenioMarcoFecha.disabled=false;
 		              document.cGestorModificarActionForm.tipoResolucionConvenioMarco.disabled=false;
 		              document.cGestorModificarActionForm.numeroConvenioMarco.disabled=false;

 	 	              document.cGestorModificarActionForm.responsableConvenioMarco.className = 'CformTextEnabled';
 	 	              document.cGestorModificarActionForm.convenioMarcoFecha.className = 'CformTextEnabled';
 	 	              document.cGestorModificarActionForm.tipoResolucionConvenioMarco.className = 'CformTextEnabled';
 	 	              document.cGestorModificarActionForm.numeroConvenioMarco.className = 'CformTextEnabled';
 
 		        }
 		        else{  
 		              document.cGestorModificarActionForm.firmaConvenioMarco[0].checked==false;
 		              document.cGestorModificarActionForm.responsableConvenioMarco.disabled=true;
 		              document.cGestorModificarActionForm.convenioMarcoFecha.disabled=true;
 		              document.cGestorModificarActionForm.tipoResolucionConvenioMarco.disabled=true;
 		              document.cGestorModificarActionForm.numeroConvenioMarco.disabled=true;

 	  		          document.cGestorModificarActionForm.responsableConvenioMarco.className = 'CformTextDisabled';
 	  		          document.cGestorModificarActionForm.convenioMarcoFecha.className = 'CformTextDisabled';
 	 		            document.cGestorModificarActionForm.tipoResolucionConvenioMarco.className = 'CformTextDisabled';
 	 		            document.cGestorModificarActionForm.numeroConvenioMarco.className = 'CformTextDisabled';
 
 		        }
 		}		  	

 	


</script>
<br>
<h1 align="center" class="titulo">Modificar UVT</h1>
<html:form action="cGestorModificarAction.do" method="POST">
  <html:hidden property="tipoGestor" />
  <logic:equal property="tipoGestor" value="1" name="cGestorModificarActionForm">
  
    <!-- indico que el pais es argentina en ambos juegos de combos, para utilizar comboPaisAjax.js  -->	
  <html:hidden property="cboPais" styleId="cboPais" value='<%=CConstantes.paisArgentina%>' />
  <html:hidden property="cboPaisLegal" styleId="cboPaisLegal" value='<%=CConstantes.paisArgentina%>' />
  
  
    <html:hidden property="accion" />
    <html:hidden property="cambiaPanel" />
    <html:hidden property="elegirCentral"/>
    <html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_convenio_laboral,id_fecha_convenio_marco"/>
    
    <div class="tab-container" id="container">
      <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="#" onClick="return mostrarPanel('uvt', this)" id="tab1">Datos</a>
              </li>
	             <li>
	              <a href="#" onClick="return mostrarPanel('domicilio', this)" id="tabDomicilio">Domicilio</a>
	            </li>
	            <li>
	              <a href="#" onClick="return mostrarPanel('contacto', this)" id="tabDirector">Contacto</a>
	            </li>
	            <li>
	              <a href="#" onClick="return mostrarPanel('seguimiento', this)" id="tabSeguimiento">Seguimiento</a>
	            </li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <!-- tab1-->
        <div id="uvt">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td width="100%" class="CformAreaBotones">
                <div align="center">
                <input type="button" class="CformBotonTranspBorde" value="|<<" name="cGestorModificarActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value="<" name="cGestorModificarActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value=">" name="cGestorModificarActionForm" onclick="irA('tabDomicilio')" />
                <input type="button" class="CformBotonTranspBorde" value=">>|" name="cGestorModificarActionForm" onclick="irA('tabSeguimiento')" />
                </div>
              </td>
            </tr>
          </table>
        <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
          <tr>
            <td>
              <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                  <td>
                    <table width="100%" cellpadding="2" cellspacing="2">
			                <tr bgcolor="#DDEEFF">
			                  <td>UVT</td>
			                </tr>
			              </table>
                    <table width="100%" cellpadding="2" cellspacing="2">
                      <tr>
                    	<td class="CformNombre" width="150">
                      		Código:&nbsp;&nbsp;&nbsp;&nbsp;
                    	</td>
                    	<td class="CformDato">
                      		<bean:write name="cGestorModificarActionForm" property="codigo" />
                    	</td>
                  	  </tr>
                    
                      <tr>
	                    <td class="CformNombre" width="120">
	                       Tipo:<span class="dato_obligatorio">*</span>
	                    </td>
	                    <td class="CformDato" colspan="3">
	                    	<html:select property="tipoUvt" styleId="tipoUvt" onchange="habilitarBotonCentral()">
	                        	<html:options collection="comboTipoUvt" property="value" labelProperty="label" />
	                      	</html:select>
	                    </td>
	                  </tr>
                      <tr id="trNormal">
                        <td class="CformNombre" width="120">Depende de:<span class="dato_obligatorio">(1)</span> </td>
                        <td class="CformDato" colspan="3">
                          <!-- si NO va a elegir una central el combo central debe estar deshabilitado -->
                          <logic:equal value="N" property="elegirCentral" name="cGestorModificarActionForm">
                          
                          <html:select styleId="central" property="central" disabled="true" onchange="cargarCuitDeCentralElegida()">
                            <html:options collection="comboCentral" property="value" labelProperty="label"  />
                          </html:select>
                          
                          
                          </logic:equal>
                          
                          <!-- si va a elegir una central el combo central debe estar habilitado -->
                          <logic:equal value="S" property="elegirCentral" name="cGestorModificarActionForm">
                          <html:select styleId="central" property="central" disabled="false" onchange="cargarCuitDeCentralElegida()">
                            <html:options collection="comboCentral" property="value" labelProperty="label"  />
                          </html:select>
                          </logic:equal>
                        </td>
                      </tr>
                      <tr id="trPuntoFacturacion">
                        <td class="CformNombre" width="120">Depende de:<span class="dato_obligatorio">(1)</span> </td>
                        <td class="CformDato" colspan="3">
                          <!-- si NO va a elegir una central el combo central debe estar deshabilitado -->
                          <logic:equal value="N" property="elegirCentral" name="cGestorModificarActionForm">
                          
                          <html:select styleId="centralPuntoFacturacion" property="central" disabled="true" onchange="cargarCuitDeCentralElegida()">
                            <html:options collection="comboCentralesYDelegaciones" property="value" labelProperty="label"  />
                          </html:select>
                          </logic:equal>
                          
                          <!-- si va a elegir una central el combo central debe estar habilitado -->
                          <logic:equal value="S" property="elegirCentral" name="cGestorModificarActionForm">
                          <html:select styleId="centralPuntoFacturacion" property="central" disabled="false" onchange="cargarCuitDeCentralElegida()">
                            <html:options collection="comboCentralesYDelegaciones" property="value" labelProperty="label"  />
                          </html:select>
                          </logic:equal>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="150">Sigla:<span class="dato_obligatorio">*</span>&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:text property="sigla" maxlength="30" size="30" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="150">Denominaci&oacute;n:<span class="dato_obligatorio">*</span>&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:textarea property="descripcion" rows="3" cols="60"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="150">Cuit:<span class="dato_obligatorio">*</span>&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                      <!-- si no va a elegir una central el campo cuit debe estar activo-->
                        <logic:equal value="N" property="elegirCentral" name="cGestorModificarActionForm">
                          <!--  <html:text property="cuit"/></td-->
                          <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                          <html:text property="cuitPrefijo" maxlength="2" size="2" onkeypress="validarNumero()" />
                          -
                          <html:text property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()" />
                          -
                          <html:text property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()" />


                        </logic:equal>
                      <!-- si va a elegir una central (o ya eligio) el campo cuit debe estar deshabilitado -->  
                        <logic:equal value="S" property="elegirCentral" name="cGestorModificarActionForm">
                          <!--  <html:text property="cuit"/></td-->
                          <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                          <html:text property="cuitPrefijo" maxlength="2" size="2" disabled="true" onkeypress="validarNumero()" />
                          -
                          <html:text property="cuitNumero" maxlength="8" size="9" disabled="true" onkeypress="validarNumero()" />
                          -
                          <html:text property="cuitSufijo" maxlength="1" size="1" disabled="true" onkeypress="validarNumero()" />


                          </logic:equal>
                         
                        </td>
                      </tr>
                      <logic:equal value="S" property="elegirCentral" name="cGestorModificarActionForm">
	                      <tr>
	                        <td class="CformNombre" width="150">Nro. Delegación:<span class="dato_obligatorio">(1)</span></td>
	                        <td class="CformDato" colspan="3">
	                          <html:text property="numeroSucursal" maxlength="80" size="50" onkeypress="validarNumero()"/>
	                        </td>
	                      </tr>
				          		</logic:equal>
                      <logic:equal value="N" property="elegirCentral" name="cGestorModificarActionForm">
	                      <tr>
	                        <td class="CformNombre" width="150">Nro. Delegación:<span class="dato_obligatorio">(1)</span></td>
	                        <td class="CformDato" colspan="3">
	                          <html:text property="numeroSucursal" maxlength="80" size="50" disabled="true"  styleClass="cFormTextDisabled"/>
	                        </td>
	                      </tr>
						          </logic:equal>
                      <tr>
                        <td class="CformNombre" width="150">Situación IVA:<span class="dato_obligatorio">*</span>&nbsp;&nbsp; </td>
                        <td class="CformDato" colspan="3">
                          <html:select property="iva" disabled="false" onchange="mostrarAlicuota()">
                            <html:options collection="comboIva" property="value" labelProperty="label"/>
                          </html:select>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="150">Alícuota:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:text property="alicuota" size="15" styleClass="cFormTextDisabled" styleId="alicuota" style="text-align:right" readonly="true"/>
                          <html:hidden property="alicuota"/>
                          %
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="150">E-Mail Oficial:<span class="dato_obligatorio">*</span>&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:text property="email" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="150">Web:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:text property="web" maxlength="255" size="50" />
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="CformAreaBotones" height="35">
                    <div align="left">
											<span class="dato_obligatorio">* Datos obligatorios</span>
                    </div>
										<div align="right">
                      <input type="button"  class="CformBoton" value="Siguiente" name="cGestorModificarActionForm" onclick="irA('tabDomicilio')" />
                      <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <div align="center">
           <span class="dato_obligatorio">(1)</span>
            Si la UVT es del tipo Delegación o Punto de Facturación, los campos depende de y Nro. Delegación son obligatorios.
        </div>
      </div>

    <!-- fin tab 1 -->

     <!-- Domicilio-->
      <div id="domicilio">
        <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
          <tr>
            <td width="100%" class="CformAreaBotones">
              <div align="center">
                <input type="button" class="CformBotonTranspBorde" value="|<<" name="cGestorModificarActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value="<" name="cGestorModificarActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value=">" name="cGestorModificarActionForm" onclick="irA('tabDirector')" />
                <input type="button" class="CformBotonTranspBorde" value=">>|" name="cGestorModificarActionForm" onclick="irA('tabSeguimiento')" />
              </div>
            </td>
          </tr>
        </table>
        <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>
              <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                  <td>
                    <table width="100%" cellpadding="2" cellspacing="2">
                      <tr bgcolor="#DDEEFF">
                        <td>Domicilio Legal</td>
                      </tr>
                    </table>
                    <table width="100%" cellpadding="2" cellspacing="2">
                       <tr>
                        <td class="CformNombre" width="120">Direcci&oacute;n:&nbsp;&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="domicilioLegal" maxlength="150" size="50" />
                        </td>
                      </tr>
	                     <tr>
	                        <td class="CformNombre" width="120">Provincia:&nbsp;&nbsp;
	                        </td>
	                        <td class="CformDato" colspan="3">
	                          <html:select   styleId="cboProvinciaLegal" property="provinciaDomicilioLegal" >
	                            <html:options collection="comboProvinciaLegal" property="value" labelProperty="label" />
	                          </html:select>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td class="CformNombre" width="120">Partido:&nbsp;&nbsp;
	                        </td>
	                        <td class="CformDato" colspan="3">
	                          <html:select   styleId="cboPartidoLegal" property="partidoDomicilioLegal" disabled="true" >
	                            <html:options collection="comboPartidoLegal" property="value" labelProperty="label" />
	                          </html:select>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td class="CformNombre" width="120">Localidad:&nbsp;&nbsp;
	                        </td>
	                        <td class="CformDato" colspan="3">
	                          <html:select   styleId="cboLocalidadLegal"  property="localidadDomicilioLegal" disabled="true">
	                            <html:options collection="comboLocalidadLegal" property="value" labelProperty="label"  />
	                          </html:select>
	                        </td>
	                      </tr>
                    </table>
                    <table width="100%" cellpadding="2" cellspacing="2">
                      <tr bgcolor="#DDEEFF">
                        <td>Domicilio Administrativo</td>
                      </tr>
                    </table>
                    <table width="100%" cellpadding="2" cellspacing="2">
                       <tr>
                        <td class="CformNombre" width="120">Direcci&oacute;n:<span class="dato_obligatorio">*</span>
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="domicilio" maxlength="150" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Provincia:<span class="dato_obligatorio">*</span>
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:select   styleId="cboProvincia" property="provincia" >
                            <html:options collection="comboProvincia" property="value" labelProperty="label" />
                          </html:select>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Partido:&nbsp;&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:select   styleId="cboPartido" property="partido" disabled="true" >
                            <html:options collection="comboPartido" property="value" labelProperty="label"  />
                          </html:select>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Localidad:&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:select   styleId="cboLocalidad" property="localidad" disabled="true">
                            <html:options collection="comboLocalidad" property="value" labelProperty="label"  />
                          </html:select>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">C&oacute;digo Postal:<span class="dato_obligatorio">*</span>
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="codPostal" maxlength="10" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Casilla de Correo:&nbsp;&nbsp;</td>   
                        <td class="CformDato" colspan="3">
                          <html:text property="casillaCorreo" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Tel&eacute;fono 1:<span class="dato_obligatorio">*</span>
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="telefono" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Tel&eacute;fono 2:&nbsp;&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="telefono2" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Tel&eacute;fono 3:&nbsp;&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="telefono3" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Fax:&nbsp;&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="fax" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">E-Mail 1:&nbsp;&nbsp;</td>   
                        <td class="CformDato" colspan="3">
                          <html:text property="email1" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">E-Mail 2:&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:text property="email2" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">E-Mail 3:&nbsp;&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:text property="email3" maxlength="50" size="50" />
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="CformAreaBotones" height="35">
                    <span class="dato_obligatorio">* Datos obligatorios</span>
                    <div align="right">
                      <input type="button"  class="CformBoton" value="Siguiente" name="cGestorModificarActionForm" onclick="irA('tabDirector')" />
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </div>

      <!-- tabDirector-->
      <div id="contacto">
        <table align="center" cellpadding="0" cellspacing="0" class="tablaMin" >
          <tr>
            <td width="100%" class="CformAreaBotones">
              <div align="center">
                <input type="button" class="CformBotonTranspBorde" value="|<<" name="cGestorModificarActionForm"  onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value="<" name="cGestorModificarActionForm"   onclick="irA('tabDomicilio')" />
                <input type="button" class="CformBotonTranspBorde" value=">" name="cGestorModificarActionForm" onclick="irA('tabSeguimiento')" />
                <input type="button" class="CformBotonTranspBorde" value=">>|" name="cGestorModificarActionForm" onclick="irA('tabSeguimiento')" />
              </div>
            </td>
          </tr>
        </table>
        <table class="CformTable" align="center" cellpadding="2" cellspacing="0" >
          <tr>
            <td>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr bgcolor="#DDEEFF">
                  <td>
                    Presidente:<span class="dato_obligatorio">*</span>
                  </td>
                </tr>
              </table>
              <logic:notEmpty property="director" name="cGestorModificarActionForm">
                <table width="100%">
                  <tr>
                    <td colspan="10">
                      <display:table name="sessionScope.cGestorModificarActionForm.director" style="width:100%" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                        <display:column property="indiceDirector" title="#" style="width:10px" headerClass="tableCellHeader" />
                        <display:column property="descripcion" title="Apellido, Nombre" headerClass="tableCellHeader" style="width: 500px;" />
                        <display:column property="mail" title="E-mail" headerClass="tableCellHeader" style="width: 90px;" />                      
                      </display:table>
                    </td>
                  </tr>
                </table>
              </logic:notEmpty>
              <logic:empty property="director" name="cGestorModificarActionForm">
                <table width="100%">
                  <tr>
                    <td>
                      No se seleccionó presidente.&nbsp;
                    </td>
                  </tr>
                </table>
              </logic:empty>
              <table width="100%">
                <tr>
                  <td class="CformAreaBotones">
                    <div align="right">
                      <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
                    </div>
                  </td>
                </tr>
              </table>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr bgcolor="#DDEEFF">
                  <td>
                    Contacto Gerencial:
                  </td>
                </tr>
              </table>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="120">Apellido:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="gerenciaApellido" maxlength="50" size="50" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="120">Nombre:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="gerenciaNombre" maxlength="50" size="50" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="120">Cargo:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="gerenciaCargo" maxlength="50" size="50" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="120">E-Mail:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="gerenciaMail" maxlength="50" size="50" />
                  </td>
                </tr>
              </table>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr bgcolor="#DDEEFF">
                  <td>
                    Contacto Administrativo:
                  </td>
                </tr>
              </table>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="120">Apellido:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="administracionApellido" maxlength="50" size="50" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="120">Nombre:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="administracionNombre" maxlength="50" size="50" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="120">Cargo:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="administracionCargo" maxlength="50" size="50" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="120">E-Mail:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="administracionMail" maxlength="50" size="50" />
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table width="100%">
                <tr>
                  <td class="CformAreaBotones">
                  <span class="dato_obligatorio">* Datos obligatorios</span>
                    <div align="right">
                      <input type="button"  class="CformBoton" value="Siguiente" name="cGestorModificarActionForm" onclick="irA('tabSeguimiento')" />
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </div>
      <!-- tabSeguimiento-->
      <div id="seguimiento">
        <table align="center" cellpadding="0" cellspacing="0" class="tablaMin" >
          <tr>
            <td width="100%" class="CformAreaBotones">
              <div align="center">
                <input type="button" class="CformBotonTranspBorde" value="|<<" name="cGestorModificarActionForm"  onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value="<" name="cGestorModificarActionForm"   onclick="irA('tabDirector')" />
                <input type="button" class="CformBotonTranspBorde" value=">" name="cGestorModificarActionForm" onclick="irA('tabSeguimiento')" />
                <input type="button" class="CformBotonTranspBorde" value=">>|" name="cGestorModificarActionForm" onclick="irA('tabSeguimiento')" />
              </div>
            </td>
          </tr>
        </table>
        <table class="CformTable" align="center" cellpadding="2" cellspacing="0" >
          <tr>
            <td>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr bgcolor="#DDEEFF">
                  <td>
                    Convenio de Trabajo:
                  </td>
                </tr>
              </table>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="185">
                    Se firmó Convenio de Trabajo:<span class="dato_obligatorio">*</span>
                  </td>
                  <td class="CformDato">
                      Sí
                      <html:radio property="firmaConvenioLaboral" value="S" disabled="false" onclick="habilitarConvenioLaboral()" />
                      No
                      <html:radio property="firmaConvenioLaboral" value="N" disabled="false" onclick="habilitarConvenioLaboral()" />
                    <html:hidden property="firmaConvenioLaboral" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="185">Responsable:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="responsableConvenioLaboral" maxlength="50" size="50" />
                  </td>
                </tr>
                <tr>
                 <td class="CformNombre" width="185" >Fecha:&nbsp;</td>   
                 <td class="CformDato" colspan="3">
                   <html:text styleId="id_fecha_convenio_laboral" property="convenioLaboralFecha" maxlength="10" size="10" onkeypress="javascript:validarNumeroCompatible(event);"/>
                 </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="185">Resolución Tipo:&nbsp;</td>
                  <td class="CformDato" colspan="3">
                    <html:select property="tipoResolucionConvenioLaboral" disabled="false">
                      <html:options collection="comboTipoResolucionConvenioLaboral" property="value" labelProperty="label"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="185">Número:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="numeroConvenioLaboral" maxlength="50" size="50" onkeypress="javascript:validarNumeroCompatible(event);" />
                  </td>
                </tr>
              </table>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr bgcolor="#DDEEFF">
                  <td>
                    Convenio Marco:
                  </td>
                </tr>
              </table>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="185">
                    Se firmó Convenio Marco:<span class="dato_obligatorio">*</span>
                  </td>
                  <td class="CformDato">
                      Sí
                      <html:radio property="firmaConvenioMarco" value="S" disabled="false" onclick="habilitarConvenioMarco()" />
                      No
                      <html:radio property="firmaConvenioMarco" value="N" disabled="false" onclick="habilitarConvenioMarco()" />
                    <html:hidden property="firmaConvenioMarco" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="185">Responsable:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="responsableConvenioMarco" maxlength="50" size="50" />
                  </td>
                </tr>
                <tr>
                 <td class="CformNombre" width="185">Fecha:&nbsp;</td>   
                 <td class="CformDato" colspan="3">
                   <html:text styleId="id_fecha_convenio_marco" property="convenioMarcoFecha" maxlength="10" size="10" onkeypress="javascript:validarNumeroCompatible(event);" />
                 </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="185">Resolución Tipo:&nbsp;</td>
                  <td class="CformDato" colspan="3">
                    <html:select property="tipoResolucionConvenioMarco" disabled="false">
                      <html:options collection="comboTipoResolucionConvenioMarco" property="value" labelProperty="label"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="185">Número:&nbsp;</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="numeroConvenioMarco" maxlength="50" size="50" onkeypress="javascript:validarNumeroCompatible(event);" />
                  </td>
                </tr>
              </table>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr bgcolor="#DDEEFF">
                  <td>
                    Web:<span class="dato_obligatorio">*</span>
                  </td>
                </tr>
              </table>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="185">
                    Publicar Web:&nbsp;
                  </td>
                  <td class="CformDato">
                      Sí
                      <html:radio property="publicar" value="S" disabled="false" />
                      No
                      <html:radio property="publicar" value="N" disabled="false" />
                    <html:hidden property="publicar" />
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table width="100%">
                <tr>
                  <td class="CformAreaBotones">
                  <span class="dato_obligatorio">* Datos obligatorios</span>
                    <div align="right">
                      <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
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

<logic:equal property="tipoGestor" value="2" name="cGestorModificarActionForm">
 <div class="tab-container" id="container">
   <html:hidden property="accion" />
    <html:hidden property="cambiaPanel" />
      <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="#" onClick="return mostrarPanel('sector', this)" id="tab1">Sector</a>
              </li>
             </ul>
          </td>
        </tr>
      </table>
      <div>
        <!-- tab1-->
        <div id="sector">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td width="100%" class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cGestorModificarActionForm" onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cGestorModificarActionForm" onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cGestorModificarActionForm" onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cGestorModificarActionForm" onclick="irA('tab1')" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                    <td>
                      <table width="100%" cellpadding="2" cellspacing="2">
                        <tr>
                    <td class="CformNombre" width="120">Descripción: <span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato"> <html:text property="descripcion" maxlength="80" size="50" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="120">Tipo:<span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="tipoGestor">
                        <html:options collection="comboTipoGestor" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="tipoGestor" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="120">Habilitado:<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato">
                       <html:select disabled="false"
                        property="habilitado">
                        <html:options collection="comboHabilitado"
                          property="value" labelProperty="label" />
                      </html:select>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="120">Sigla:<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato">
                      <html:text property="sigla" maxlength="30" size="30" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="120">E-Mail:<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato">
                      <html:text property="email" maxlength="50" size="50" />
                    </td>
                  </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformAreaBotones" height="35">
                      <span class="dato_obligatorio">* Datos obligatorios</span>
                      <div align="right">
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
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
</html:form>
