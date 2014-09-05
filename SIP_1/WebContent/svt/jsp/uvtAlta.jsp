<%@include file="layout/include.jsp"%>
<%@ page import= "conicet.apps.svt.object.gestor.CUvt" %>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
  media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type='text/javascript' src="./js/comboPaisAjax.js"></script>
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	


<script>

window.onload=function(){
		 
		  generarCombos("",null,"<%=CConstantes.paisArgentina%>");
		  generarCombos("","Legal","<%=CConstantes.paisArgentina%>");
		  setupPanes("container", document.cUvtAltaActionForm.cambiaPanel.value);
		
		  
		  $('#trPuntoFacturacion').hide();
		  
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
		
			
		}


function setFoco(){
	x=event.keyCode
	//alert(x)
	if((x==13)){ // enter
		window.event.returnValue = false
	}
}


function irA(obj){
document.cUvtAltaActionForm.cambiaPanel.value=obj;
setupPanes("container", document.cUvtAltaActionForm.cambiaPanel.value);

}

function mostrarPanel(obj1, obj2){
  document.cUvtAltaActionForm.cambiaPanel.value = obj2.id;
  return showPane(obj1, obj2);
}

function pedirConfirmacion(url){
	  url.href = 'cUvtAltaAction.do?accion=uvt';
	  msg = 'Se perderán los datos no grabados, ¿desea continuar?';
	  if (window.confirm(msg)){
	    url.href = url.href;
	  }else{
	    url.href = '#';
	  }
	}



function cargarCuitDeCentralElegida(){
/*  Si elije una central cargará el cuit de esa central en el campo cuil */
	var idSeleccionada;
		if($('#tipoUvt').val() != "P")
			idSeleccionada = $('#central').val();
		else
			idSeleccionada = $('#centralPuntoFacturacion').val();
		
	if (idSeleccionada == "-1" || idSeleccionada =="-2" ){
        document.cUvtAltaActionForm.cuitPrefijo.value="";
        document.cUvtAltaActionForm.cuitNumero.value="";
        document.cUvtAltaActionForm.cuitSufijo.value="";
	}else{
		
				
		<logic:iterate name="cUvtAltaActionForm" property="centrales" id="elemento">
		var idCentral = "";
		
		idCentral = new String("<bean:write name="elemento" property="id"/>");
	    
		if (idSeleccionada == idCentral){
			var cuit="";
			cuit= new String("<%=((CUvt)elemento).getCentralRoot().getCuit()!= null? ((CUvt)elemento).getCentralRoot().getCuit():""%>");
			//java.lang.Object elemento = (java.lang.Object) pageContext.getAttribute("elemento");
			document.cUvtAltaActionForm.cuitPrefijo.value=cuit.substring(0,2);
			document.cUvtAltaActionForm.cuitNumero.value=cuit.substring(2,10);
	        document.cUvtAltaActionForm.cuitSufijo.value=cuit.substring(10);
	        foundAny = true;
	    }
		</logic:iterate>
		
	}
}


function refrescarCuitDeCentralElegida(){
	var idSeleccionada;
	if($('#tipoUvt').val() != "P")
		idSeleccionada = $('#central').val();
	else
		idSeleccionada = $('#centralPuntoFacturacion').val();
	
 	if ( $('#tipoUvt').val() == "D"  || $('#tipoUvt').val() == "P" ){
		if (idSeleccionada != "-1" && idSeleccionada !="-2" ){
			<logic:iterate name="cUvtAltaActionForm" property="centrales" id="elemento">
		
			var idCentral = "";
			idCentral = new String("<bean:write name="elemento" property="id"/>");
		    
			if (idSeleccionada == idCentral){
				var cuit="";
				cuit= new String(<%=((CUvt)elemento).getCentralRoot().getCuit()!= null? ((CUvt)elemento).getCentralRoot().getCuit():""%>);
				if(cuit!=null){
					document.cUvtAltaActionForm.cuitPrefijo.value=cuit.substring(0,2);
			        document.cUvtAltaActionForm.cuitNumero.value=cuit.substring(2,10);
			        document.cUvtAltaActionForm.cuitSufijo.value=cuit.substring(10);
				}
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

 	function mostrarAlicuota(){
 		  var element = $('#alicuota');
 		  element.attr('readonly', true);
      element.addClass('CformTextDisabled');

		  if (document.cUvtAltaActionForm.iva.value == "-1" || document.cUvtAltaActionForm.iva.value == "-2"){
			   $('#alicuota').attr('value', "");
 	 		  }
 		  else{

 		 	    if(document.cUvtAltaActionForm.iva.value == "5"){
 		 	    	$('#alicuota').attr('value', "0");
 	    		 
 	 	    	   }
 	    	  if(document.cUvtAltaActionForm.iva.value == "1"){
 	    		 $('#alicuota').attr('value', "21");
 	          }
 	    	  if(document.cUvtAltaActionForm.iva.value == "2"){
 	    		 $('#alicuota').attr('value', "21 + 10,5");
 	         }
 	    	 
 		    }
 	    
	}




var nav4 = window.event ? true : false;
function IsNumber(evt){
// Backspace = 8, Enter = 13, "0" = 48, "9" = 57, "." = 46
var key = nav4 ? evt.which : evt.keyCode;
return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
}

function habilitarConvenioLaboral(){
	  /*  Habilita o deshabilita los datos del convenio laboral*/
	        if (document.cUvtAltaActionForm.firmaConvenioLaboral[0].checked==true){
	              document.cUvtAltaActionForm.responsableConvenioLaboral.disabled=false;
	              document.cUvtAltaActionForm.convenioLaboralFecha.disabled=false;
	              document.cUvtAltaActionForm.tipoResolucionConvenioLaboral.disabled=false;
	              document.cUvtAltaActionForm.numeroConvenioLaboral.disabled=false;

	              document.cUvtAltaActionForm.responsableConvenioLaboral.className = 'CformTextEnabled';
	              document.cUvtAltaActionForm.convenioLaboralFecha.className = 'CformTextEnabled';
	              document.cUvtAltaActionForm.tipoResolucionConvenioLaboral.className = 'CformTextEnabled';
	              document.cUvtAltaActionForm.numeroConvenioLaboral.className = 'CformTextEnabled';
	      }
	        else{  
	              document.cUvtAltaActionForm.firmaConvenioLaboral[0].checked==false;
	              document.cUvtAltaActionForm.responsableConvenioLaboral.disabled=true;
	              document.cUvtAltaActionForm.convenioLaboralFecha.disabled=true;
	              document.cUvtAltaActionForm.tipoResolucionConvenioLaboral.disabled=true;
	              document.cUvtAltaActionForm.numeroConvenioLaboral.disabled=true;

	              document.cUvtAltaActionForm.responsableConvenioLaboral.className = 'CformTextDisabled';
	              document.cUvtAltaActionForm.convenioLaboralFecha.className = 'CformTextDisabled';
	              document.cUvtAltaActionForm.tipoResolucionConvenioLaboral.className = 'CformTextDisabled';
	              document.cUvtAltaActionForm.numeroConvenioLaboral.className = 'CformTextDisabled';
	  }
	}
	  
	function habilitarConvenioMarco(){
	    /*  Habilita o deshabilita los datos del convenio marco*/
	       
	          if (document.cUvtAltaActionForm.firmaConvenioMarco[0].checked==true){
	                document.cUvtAltaActionForm.responsableConvenioMarco.disabled=false;
	                document.cUvtAltaActionForm.convenioMarcoFecha.disabled=false;
	                document.cUvtAltaActionForm.tipoResolucionConvenioMarco.disabled=false;
	                document.cUvtAltaActionForm.numeroConvenioMarco.disabled=false;

	                document.cUvtAltaActionForm.responsableConvenioMarco.className = 'CformTextEnabled';
	                document.cUvtAltaActionForm.convenioMarcoFecha.className = 'CformTextEnabled';
	                document.cUvtAltaActionForm.tipoResolucionConvenioMarco.className = 'CformTextEnabled';
	                document.cUvtAltaActionForm.numeroConvenioMarco.className = 'CformTextEnabled';
	        }
	          else{  
	                document.cUvtAltaActionForm.firmaConvenioMarco[0].checked==false;
	                document.cUvtAltaActionForm.responsableConvenioMarco.disabled=true;
	                document.cUvtAltaActionForm.convenioMarcoFecha.disabled=true;
	                document.cUvtAltaActionForm.tipoResolucionConvenioMarco.disabled=true;
	                document.cUvtAltaActionForm.numeroConvenioMarco.disabled=true;

	                document.cUvtAltaActionForm.responsableConvenioMarco.className = 'CformTextDisabled';
	                document.cUvtAltaActionForm.convenioMarcoFecha.className = 'CformTextDisabled';
	                document.cUvtAltaActionForm.tipoResolucionConvenioMarco.className = 'CformTextDisabled';
	                document.cUvtAltaActionForm.numeroConvenioMarco.className = 'CformTextDisabled';
	              }
	  }
	
	var tipoUvtAnterior = "-1";

	function habilitarBotonCentral(){
		/*  Habilita o deshabilita el combo central y el campo cuit  S*/
		      
		     
		      
		if ( $('#tipoUvt').val() == "-1" || $('#tipoUvt').val() == "-2"){
			tipoUvtAnterior = "-1";
			$('#central').attr("disabled", true);
			
	       	
	       	$('#centralPuntoFacturacion').attr("value", "-1");
	       	$('#central').attr("value", "-1");
	       	
	       	$('#centralPuntoFacturacion').attr("disabled", true);
			$('#trPuntoFacturacion').hide();
			$('#trNormal').show();
	       	document.cUvtAltaActionForm.elegirCentral.value="N";
	        document.cUvtAltaActionForm.cuitPrefijo.value="";
	        document.cUvtAltaActionForm.cuitNumero.value="";
	        document.cUvtAltaActionForm.cuitSufijo.value="";
	        
	        document.cUvtAltaActionForm.cuitPrefijo.disabled=true;
	        document.cUvtAltaActionForm.cuitNumero.disabled=true;
	        document.cUvtAltaActionForm.cuitSufijo.disabled=true;
	        document.cUvtAltaActionForm.cuitPrefijo.className = 'CformTextDisabled';
	        document.cUvtAltaActionForm.cuitNumero.className = 'CformTextDisabled';
	        document.cUvtAltaActionForm.cuitSufijo.className = 'CformTextDisabled';
	        
	        document.cUvtAltaActionForm.numeroSucursal.disabled=true;
	        document.cUvtAltaActionForm.numeroSucursal.className = 'CformTextDisabled';
	        
				}
		else  if ( $('#tipoUvt').val() == "D" && tipoUvtAnterior != "D"){
					tipoUvtAnterior = "D";
					$('#central').removeAttr("disabled");
		            document.cUvtAltaActionForm.elegirCentral.value="S";
		            $('#centralPuntoFacturacion').attr("value", "-1");
		            $('#centralPuntoFacturacion').attr("disabled", true);
					$('#trPuntoFacturacion').hide();
					$('#trNormal').show();
		            document.cUvtAltaActionForm.cuitPrefijo.readOnly=true;
		            document.cUvtAltaActionForm.cuitNumero.readOnly=true;
		            document.cUvtAltaActionForm.cuitSufijo.readOnly=true;
		            document.cUvtAltaActionForm.numeroSucursal.readOnly=false;

		            document.cUvtAltaActionForm.cuitPrefijo.className = 'CformTextDisabled';
		            document.cUvtAltaActionForm.cuitNumero.className = 'CformTextDisabled';
		            document.cUvtAltaActionForm.cuitSufijo.className = 'CformTextDisabled';
		            document.cUvtAltaActionForm.numeroSucursal.className = 'CformTextEnabled';
		            document.cUvtAltaActionForm.cuitPrefijo.value="";
		            document.cUvtAltaActionForm.cuitNumero.value="";
		            document.cUvtAltaActionForm.cuitSufijo.value="";
			        document.cUvtAltaActionForm.numeroSucursal.disabled=false;
			        document.cUvtAltaActionForm.numeroSucursal.className = '';
		            
		    }
		    if ( $('#tipoUvt').val() == "P" && tipoUvtAnterior != "P"){
		    		tipoUvtAnterior = "P";
		    		$('#central').attr("disabled", true);
		            document.cUvtAltaActionForm.elegirCentral.value="S";
		            $('#central').attr("value", "-1");
		            
		            $('#centralPuntoFacturacion').attr("disabled", false);
					$('#trPuntoFacturacion').show();
					$('#trNormal').hide();
					
		            document.cUvtAltaActionForm.cuitPrefijo.readOnly=true;
		            document.cUvtAltaActionForm.cuitNumero.readOnly=true;
		            document.cUvtAltaActionForm.cuitSufijo.readOnly=true;
		            document.cUvtAltaActionForm.numeroSucursal.readOnly=false;

		            document.cUvtAltaActionForm.cuitPrefijo.className = 'CformTextDisabled';
		            document.cUvtAltaActionForm.cuitNumero.className = 'CformTextDisabled';
		            document.cUvtAltaActionForm.cuitSufijo.className = 'CformTextDisabled';
		            document.cUvtAltaActionForm.numeroSucursal.className = 'CformTextEnabled';
			        document.cUvtAltaActionForm.numeroSucursal.disabled=false;
			        document.cUvtAltaActionForm.numeroSucursal.className = '';
		            document.cUvtAltaActionForm.cuitPrefijo.value="";
		            document.cUvtAltaActionForm.cuitNumero.value="";
		            document.cUvtAltaActionForm.cuitSufijo.value="";
		            
		    }
		    if (  $('#tipoUvt').val() == "C" ){
		    	tipoUvtAnterior = "C";
		    	$('#centralPuntoFacturacion').attr("value", "-1");
		       	$('#central').attr("value", "-1");
		          $('#central').attr("disabled", true);
		          document.cUvtAltaActionForm.elegirCentral.value="N";
		          
		          $('#centralPuntoFacturacion').attr("disabled", true);
					$('#trPuntoFacturacion').hide();
					$('#trNormal').show();
					
		          document.cUvtAltaActionForm.cuitPrefijo.readOnly=false;
		          document.cUvtAltaActionForm.cuitNumero.readOnly=false;
		          document.cUvtAltaActionForm.cuitSufijo.readOnly=false;
		          document.cUvtAltaActionForm.cuitPrefijo.disabled=false;
		          document.cUvtAltaActionForm.cuitNumero.disabled=false;
		          document.cUvtAltaActionForm.cuitSufijo.disabled=false;
		          document.cUvtAltaActionForm.numeroSucursal.readOnly=true;

		          document.cUvtAltaActionForm.cuitPrefijo.className = 'CformTextEnabled';
		          document.cUvtAltaActionForm.cuitNumero.className = 'CformTextEnabled';
		          document.cUvtAltaActionForm.cuitSufijo.className = 'CformTextEnabled';
		          document.cUvtAltaActionForm.numeroSucursal.className = 'CformTextDisabled';

		          document.cUvtAltaActionForm.numeroSucursal.value = "";
		          document.cUvtAltaActionForm.cuitPrefijo.value="";
	            document.cUvtAltaActionForm.cuitNumero.value="";
	            document.cUvtAltaActionForm.cuitSufijo.value="";
		        }
		} 

	function refrescarDatos(){
		
	 if ( $('#tipoUvt').val() == "C"){
		 $('#centralPuntoFacturacion').attr("value", "-1");
	       	$('#central').attr("value", "-1");
	       	
         document.cUvtAltaActionForm.elegirCentral.value="N";

         $('#centralPuntoFacturacion').attr("disabled", true);
         $('#central').attr("disabled", true);
			$('#trPuntoFacturacion').hide();
			$('#trNormal').show();
			
         document.cUvtAltaActionForm.cuitPrefijo.readOnly=false;
         document.cUvtAltaActionForm.cuitNumero.readOnly=false;
         document.cUvtAltaActionForm.cuitSufijo.readOnly=false;
         document.cUvtAltaActionForm.numeroSucursal.readOnly=true;

         document.cUvtAltaActionForm.cuitPrefijo.className = 'CformTextEnabled';
         document.cUvtAltaActionForm.cuitNumero.className = 'CformTextEnabled';
         document.cUvtAltaActionForm.cuitSufijo.className = 'CformTextEnabled';
         document.cUvtAltaActionForm.numeroSucursal.className = 'CformTextDisabled';
         
       }
}
	
</script>


<br>
<h1 align="center" class="titulo">
  Registro de UVT
</h1>
<html:form action="cUvtAltaAction.do" method="POST">
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
                <input type="button" class="CformBotonTranspBorde" value="|<<" name="cUvtAltaActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value="<" name="cUvtAltaActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value=">" name="cUvtAltaActionForm" onclick="irA('tabSeguimiento')" />
                <input type="button" class="CformBotonTranspBorde" value=">>|" name="cUvtAltaActionForm" onclick="irA('tabSeguimiento')" />
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
			                  <td>UVT</td>
			                </tr>
			              </table>
                    <table width="100%" cellpadding="2" cellspacing="2">
                      <tr>
	                    <td class="CformNombre" width="120">
	                       Tipo:<span class="dato_obligatorio">*</span>
	                    </td>
	                    <td class="CformDato" colspan="3">
	                    	<html:select property="tipoUvt" styleId="tipoUvt" onchange="habilitarBotonCentral()">
	                        	<html:options collection="comboTipoUvt" property="value" labelProperty="label"  />
	                      	</html:select>
	                    </td>
	                  </tr>
                      <tr id="trNormal">
                        <td class="CformNombre" width="120">Depende de:<span class="dato_obligatorio">(1)</span> </td>
                        <td class="CformDato" colspan="3">
                          <!-- si NO va a elegir una central el combo central debe estar deshabilitado -->
                          <logic:equal value="N" property="elegirCentral" name="cUvtAltaActionForm">
                          
                          <html:select styleId="central" property="central" disabled="true" onchange="cargarCuitDeCentralElegida()">
                            <html:options collection="comboCentral" property="value" labelProperty="label"  />
                          </html:select>
                          
                          
                          </logic:equal>
                          
                          <!-- si va a elegir una central el combo central debe estar habilitado -->
                          <logic:equal value="S" property="elegirCentral" name="cUvtAltaActionForm">
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
                          <logic:equal value="N" property="elegirCentral" name="cUvtAltaActionForm">
                          
                          <html:select styleId="centralPuntoFacturacion" property="central" disabled="true" onchange="cargarCuitDeCentralElegida()">
                            <html:options collection="comboCentralesYDelegaciones" property="value" labelProperty="label"  />
                          </html:select>
                          </logic:equal>
                          
                          <!-- si va a elegir una central el combo central debe estar habilitado -->
                          <logic:equal value="S" property="elegirCentral" name="cUvtAltaActionForm">
                          <html:select styleId="centralPuntoFacturacion" property="central" disabled="false" onchange="cargarCuitDeCentralElegida()">
                            <html:options collection="comboCentralesYDelegaciones" property="value" labelProperty="label"  />
                          </html:select>
                          </logic:equal>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Sigla:<span class="dato_obligatorio">*</span></td>
                        <td class="CformDato" colspan="3">
                          <html:text property="sigla" maxlength="30" size="30" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Denominaci&oacute;n:<span class="dato_obligatorio">*</span></td>
                        <td class="CformDato" colspan="3">
                          <html:textarea property="descripcion" rows="3" cols="60" onkeyup="isMaxLength(this,250)"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Cuit:<span class="dato_obligatorio">*</span></td>
                        <td class="CformDato" colspan="3">
                      <!-- si no va a elegir una central el campo cuit debe estar activo-->
                        <logic:equal value="N" property="elegirCentral" name="cUvtAltaActionForm">
                          <!--  <html:text property="cuit"/></td-->
                          <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                          <html:text property="cuitPrefijo" maxlength="2" size="2" onkeypress="javascript:validarNumeroCompatible(event);" />
                          -
                          <html:text property="cuitNumero" maxlength="8" size="9" onkeypress="javascript:validarNumeroCompatible(event);" />
                          -
                          <html:text property="cuitSufijo" maxlength="1" size="1" onkeypress="javascript:validarNumeroCompatible(event);"/>


                        </logic:equal>
                      <!-- si va a elegir una central (o ya eligio) el campo cuit debe estar deshabilitado -->  
                        <logic:equal value="S" property="elegirCentral" name="cUvtAltaActionForm">
                          <!--  <html:text property="cuit"/></td-->
                          <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                          <html:text property="cuitPrefijo" maxlength="2" size="2" />
                          -
                          <html:text property="cuitNumero" maxlength="8" size="9" />
                          -
                          <html:text property="cuitSufijo" maxlength="1" size="1" />


                          </logic:equal>
                         
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Nro. Delegación<span class="dato_obligatorio">(1)</span></td>
                        <td class="CformDato" colspan="3">
                          <html:text property="numeroSucursal" maxlength="12" size="50" onkeypress="validarNumero()"/>
                        </td>
                      </tr>
                      <tr>
                      <tr>
                        <td class="CformNombre" width="120">Situación IVA:<span class="dato_obligatorio">*</span> </td>
                        <td class="CformDato" colspan="3">
                          <html:select property="iva" disabled="false" onchange="mostrarAlicuota()">
                            <html:options collection="comboIva" property="value" labelProperty="label"/>
                          </html:select>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Alícuota:&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:text property="alicuota" size="10" styleClass="CformTextDisabled" styleId="alicuota" style="text-align:right" readonly="true"/>
                          <html:hidden property="alicuota"/>
                          %
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">E-Mail Oficial:<span class="dato_obligatorio">*</span></td>
                        <td class="CformDato" colspan="3">
                          <html:text property="email" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Web:&nbsp;</td>
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
                      <input type="button"  class="CformBoton" value="Siguiente" name="cUvtAltaActionForm" onclick="irA('tabDomicilio')" />
                      <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
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
        <table align="center" cellpadding="0" cellspacing="0" >
          <tr>
            <td width="100%" class="CformAreaBotones">
              <div align="center">
                <input type="button" class="CformBotonTranspBorde" value="|<<" name="cUvtAltaActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value="<" name="cUvtAltaActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value=">" name="cUvtAltaActionForm" onclick="irA('tabDirector')" />
                <input type="button" class="CformBotonTranspBorde" value=">>|" name="cUvtAltaActionForm" onclick="irA('tabDirector')" />
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
                        <td>Domicilio Legal</td>
                      </tr>
                    </table>
                    <table width="100%" cellpadding="2" cellspacing="2">
                       <tr>
                        <td class="CformNombre" width="120">Direcci&oacute;n:&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="domicilioLegal" maxlength="150" size="50" />
                        </td>
                      </tr>
	                     <tr>
	                        <td class="CformNombre" width="120">Provincia:&nbsp;
	                        </td>
	                        <td class="CformDato" colspan="3">
	                          <html:select  styleId="cboProvinciaLegal"  property="provinciaDomicilioLegal" >
	                            <html:options collection="comboProvinciaDomicilioLegal" property="value" labelProperty="label" />
	                          </html:select>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td class="CformNombre" width="120">Partido:&nbsp;
	                        </td>
	                        <td class="CformDato" colspan="3">
	                          <html:select  styleId="cboPartidoLegal"  property="partidoDomicilioLegal" disabled="true" >
	                            <html:options collection="comboPartidoDomicilioLegal" property="value" labelProperty="label" />
	                          </html:select>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td class="CformNombre" width="120">Localidad:&nbsp;
	                        </td>
	                        <td class="CformDato" colspan="3">
	                          <html:select  styleId="cboLocalidadLegal"  property="localidadDomicilioLegal" disabled="true">
	                            <html:options collection="comboLocalidadDomicilioLegal" property="value" labelProperty="label"  />
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
                          <html:select styleId="cboProvincia" property="provincia" >
                            <html:options collection="comboProvinciaG" property="value" labelProperty="label" />
                          </html:select>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Partido:&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:select styleId="cboPartido" property="partido" disabled="true" >
                            <html:options collection="comboPartido" property="value" labelProperty="label"  />
                          </html:select>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Localidad:&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:select  styleId="cboLocalidad" property="localidad" disabled="true">
                            <html:options collection="comboLocalidadG" property="value" labelProperty="label"  />
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
                        <td class="CformNombre" width="120">Casilla de Correo:&nbsp;</td>   
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
                        <td class="CformNombre" width="120">Tel&eacute;fono 2:&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="telefono2" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Tel&eacute;fono 3:&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="telefono3" maxlength="50" size="50"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">Fax:&nbsp;
                        </td>
                        <td class="CformDato" colspan="3">
                          <html:text property="fax" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">E-Mail 1:&nbsp;</td>   
                        <td class="CformDato" colspan="3">
                          <html:text property="email1" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">E-Mail 2:&nbsp;</td>
                        <td class="CformDato" colspan="3">
                          <html:text property="email2" maxlength="50" size="50" />
                        </td>
                      </tr>
                      <tr>
                        <td class="CformNombre" width="120">E-Mail 3:&nbsp;</td>
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
                      <input type="button"  class="CformBoton" value="Siguiente" name="cUvtAltaActionForm" onclick="irA('tabDirector')" />
                      <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
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
        <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
          <tr>
            <td width="100%" class="CformAreaBotones">
              <div align="center">
                <input type="button" class="CformBotonTranspBorde" value="|<<" name="cUvtAltaActionForm"  onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value="<" name="cUvtAltaActionForm"   onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value=">" name="cUvtAltaActionForm" onclick="irA('tabDirector')" />
                <input type="button" class="CformBotonTranspBorde" value=">>|" name="cUvtAltaActionForm" onclick="irA('tabDirector')" />
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
              <logic:notEmpty property="director" name="cUvtAltaActionForm">
                <table width="100%">
                  <tr>
                    <td colspan="10">
                      <display:table name="sessionScope.cUvtAltaActionForm.director" style="width:100%" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                        <display:column property="indiceDirector" title="#" style="width:10px" headerClass="tableCellHeader" />
                        <display:column property="descripcion" title="Apellido, Nombre" headerClass="tableCellHeader" style="width: 500px;" />
                        <display:column property="mail" title="E-mail" headerClass="tableCellHeader" style="width: 90px;" />                      
                      </display:table>
                    </td>
                  </tr>
                </table>
              </logic:notEmpty>
              <logic:empty property="director" name="cUvtAltaActionForm">
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
                      <input type="button"  class="CformBoton" value="Siguiente" name="cUvtAltaActionForm" onclick="irA('tabSeguimiento')" />
                      <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
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
        <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
          <tr>
            <td width="100%" class="CformAreaBotones">
              <div align="center">
                <input type="button" class="CformBotonTranspBorde" value="|<<" name="cUvtAltaActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value="<" name="cUvtAltaActionForm" onclick="irA('tab1')" />
                <input type="button" class="CformBotonTranspBorde" value=">" name="cUvtAltaActionForm" onclick="irA('tabDirector')" />
                <input type="button" class="CformBotonTranspBorde" value=">>|" name="cUvtAltaActionForm" onclick="irA('tabDirector')" />
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
                  <td class="CformNombre" width="180">
                    Se firmó Convenio de Trabajo:
                  </td>
                  <td class="CformDato">
                      Sí
                      <html:radio property="firmaConvenioLaboral" value="S" disabled="false" onclick="habilitarConvenioLaboral()"/>
                      No
                      <html:radio property="firmaConvenioLaboral" value="N" disabled="false" onclick="habilitarConvenioLaboral()" />
                    <html:hidden property="firmaConvenioLaboral" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="180">Responsable:</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="responsableConvenioLaboral" maxlength="50" size="50" disabled="true"/>
                  </td>
                </tr>
                <tr>
                 <td class="CformNombre" width="180" >Fecha:</td>   
                 <td class="CformDato" colspan="3">
                   <html:text styleId="id_fecha_convenio_laboral" property="convenioLaboralFecha" maxlength="10" size="10" onkeypress="javascript:validarNumeroCompatible(event);" disabled="true"/>
                   
                 </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="180">Resolución Tipo:</td>
                  <td class="CformDato" colspan="3">
                    <html:select property="tipoResolucionConvenioLaboral" disabled="true" >
                      <html:options collection="comboTipoResolucionConvenioLaboral" property="value" labelProperty="label"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="180">Número:</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="numeroConvenioLaboral" maxlength="50" size="50" onkeypress="javascript:validarNumeroCompatible(event);" disabled="true" />
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
                  <td class="CformNombre" width="180">
                    Se firmó Convenio Marco:
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
                  <td class="CformNombre" width="180">Responsable:</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="responsableConvenioMarco" maxlength="50" size="50" disabled="true" />
                  </td>
                </tr>
                <tr>
                 <td class="CformNombre" width="180">Fecha:</td>   
                 <td class="CformDato" colspan="3">
                   <html:text styleId="id_fecha_convenio_marco" property="convenioMarcoFecha" maxlength="10" size="10" onkeypress="javascript:validarNumeroCompatible(event);" disabled="true" />
                 </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="180">Resolución Tipo:</td>
                  <td class="CformDato" colspan="3">
                    <html:select property="tipoResolucionConvenioMarco" disabled="true">
                      <html:options collection="comboTipoResolucionConvenioMarco" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="180">Número:</td>   
                  <td class="CformDato" colspan="3">
                    <html:text property="numeroConvenioMarco" maxlength="50" size="50" onkeypress="javascript:validarNumeroCompatible(event);" disabled="true" />
                  </td>
                </tr>
              </table>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr bgcolor="#DDEEFF">
                  <td>
                    Web:
                  </td>
                </tr>
              </table>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="180">
                    Publicar Web:<span class="dato_obligatorio">*</span>
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
<script>
habilitarConvenioMarco()
habilitarConvenioLaboral()
refrescarDatos()
</script>
</html:form>
