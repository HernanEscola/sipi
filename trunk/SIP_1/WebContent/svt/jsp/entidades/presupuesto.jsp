<%@include file="/jsp/layout/include.jsp"%>

<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="showBtnLimpiar" value='<%= request.getParameter("showBtnLimpiar") %>' />
<bean:define id="isAlta" value='<%= request.getParameter("isAlta") %>' />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />



<script type='text/javascript' src="./js/teHtmlEditor/jquery-te-1.4.0.min.js"></script>
<link rel="stylesheet" href="./js/teHtmlEditor/jquery-te-1.4.0.css" type="text/css" media="screen, print" />

<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>

function deshabilitarCampos() {
  var modificable = '<bean:write name="cPresupuestoActionForm" property="modificable"/>';
  if (modificable == 'N') {
	  $(".desactivable").each(function() {
		  if ($(this).is('div') ) {
			  $(this).hide();
      } else {
    	  deshabilitarElemento($(this));
      }      
	  });  
  }
}

function deshabilitarElemento(element) {
    element.attr('readonly', true);
    element.addClass('textDisabled');
}

function formatoEntero(obj) {
    var test_result = /^\d+$/.test(obj.value);
    if (!test_result) {
      obj.value = 0;
    }
}


/*Funciones de precio*/
function calcularPrecioFinal(iva) {
  formatEntero(iva);
  var porcentaje = Number(iva.value) / Number(100);
  var sumaPrecios = $('#totalPrecioOfertas').val();
  sumaPrecios = Number(sumaPrecios)*Number(porcentaje +1);
  $('#precioFinal').val(sumaPrecios.toFixed(2));
}

/*Funciones de Pagos*/
function calcularTotalPagos() {
    var total = Number(0.00);
    var costo = Number(0.00);
    $("[id^=importePago_]").each(function() {
      if ($(this).attr('value') != '') {
        pago = eval($(this).attr('value'));
        pago = Math.round((pago) * 100) / 100;
        total = Math.round((total + Number(pago)) * 100) / 100;  
      }  
    });
    $('#totalPagos').val(total.toFixed(2));
}

function formatImportePagoCalcularTotal(obj) {
    formatImporte(obj);
    calcularTotalPagos();
}

/*Funciones de Facturación*/
function calcularTotalFacturacion() {
    var total = Number(0.00);
    var costo = Number(0.00);
    $("[id^=importeFactura_]").each(function() {
      if ($(this).attr('value') != '') {
        pago = eval($(this).attr('value'));
        pago = Math.round((pago) * 100) / 100;
        total = Math.round((total + Number(pago)) * 100) / 100;  
      }  
    });
    $('#totalFacturas').val(total.toFixed(2));
}

function formatImporteFacturaCalcularTotal(obj) {
    formatImporte(obj);
    calcularTotalFacturacion();
}

$(document).ready(function() {
	var input = new CInputNumero(true);
	input.bind("input[id='importeAF']");
	
	setVisibilidadComboContactos();
});

function contratanteAfterRemove(id) {
	$("#contactoDiv").hide();
	$("#comboContratanteContacto").val("-1");
}

function contratanteAfterSelect(id) {
	if (!hayContratanteSeleccionado()) {
		return;
	}
	
	$("#contactoDiv").show();
	switchMostrarContacto("cargandoContactosImg");
	
	$.ajax({
		url : '<%= request.getParameter("actionName") %>' + ".do?btnSubmit=cargarContactos",
		type : 'POST',
		dataType : "json",
		data : {
			"match":$("#idContratante").val(),
			"tipo":"contacto"
		},
		success : function(datos) {
			if (datos.length == 0) {
				switchMostrarContacto("noHayContactosMsj");
				return;
			}

			datos.unshift({'id':-2, 'descripcion': "-----------"});
			datos.unshift({'id':-1, 'descripcion': "Seleccionar"});
			var options = $("#comboContratanteContacto");
			options.empty();
			$.each(datos, function() {
			    options.append($("<option />").val(this.id).text(this.descripcion));
			});

			switchMostrarContacto("comboContratanteContacto");
		},
		timeout : function() {
			
		},
		error : function() {
			
		}
	});
}

function switchMostrarContacto(idAMostrar) {
	$("#noHayContactosMsj").hide();
	$("#comboContratanteContacto").hide();
	$("#cargandoContactosImg").hide();
	
	$("#" + idAMostrar).show();
}

function hayContratanteSeleccionado() {
	if ((isSelected("idContratante") && $("#idContratante").val() != 0) || isSelected("comboContratanteContacto")) {
		return true;
	} else {
		return false;
	}
}

function setVisibilidadComboContactos() {
	if (hayContratanteSeleccionado()) {
		if ($("#comboContratanteContacto").find('option').length > 2) {
			switchMostrarContacto("comboContratanteContacto");
		} else {
			switchMostrarContacto("noHayContactosMsj");
		}
	} else {
		$("#contactoDiv").hide();
	}
}


function quitar(tipo ,index) {
  submitAction("?btnSubmit=remove"+tipo+"&removeIndex="+index);
}


	


</script>


<html:hidden property="descargarArchivoMapped(PresupuestoDoc)" styleId="descargarArchivoPresupuestoDoc" />
<html:hidden property="removerArchivoMapped(PresupuestoDoc)" styleId="removerArchivoPresupuestoDoc" />

  
<logic:equal value="input" name="tipoPantalla">
<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_acuerdo_factura,id_fecha_de_entrega" />
  <!-- tabDatosGenerales-->
  <div id="datosGenerales">
    <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>
        <td class="CformAreaBotones">
          <div align="center"><input type="button" class="CformBotonTranspBorde" value="|<<" name="cPresupuestoActionForm"   onclick="irTabInicial()" /> 
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPresupuestoActionForm"   onclick="irTabAnterior()" /> 
            <input type="button" class="CformBotonTranspBorde" value=">"  name="cPresupuestoActionForm" onclick="irTabSiguiente()" /> 
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPresupuestoActionForm" onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="5" >
      <tr>
        <td>
          <table width="100%" cellpadding="2" cellspacing="2">
            <logic:notEqual value="si" name="isAlta">
	            <tr>
                <td class="CformNombre" width="150">Número:</td>
                <td class="CformDato">
                  <bean:write name="cPresupuestoActionForm" property="numeroPresupuesto" /> 
                </td>  
              </tr>
              <tr>
                <td class="CformNombre" width="150">Fecha:</td>
                <td class="CformDato">
                  <bean:write name="cPresupuestoActionForm" property="fechaPresupuesto" /> 
                </td>  
              </tr>
              <tr>
                <td class="CformNombre" width="150">Emisor:</td>
                <td class="CformDato">
                  <bean:write name="cPresupuestoActionForm" property="emisionPresupuesto" /> 
                </td>  
	            </tr>
            </logic:notEqual>
            <tr>
              <td class="CformNombre" width="150">Estado:<span class="dato_obligatorio">*</span></td>
              <td class="CformDato">
                <html:select disabled="false" property="tipoEstadoPresupuesto">
                <html:options collection="comboTipoEstadoPresupuesto" property="value"  labelProperty="label" />
              </html:select>
              </td>
            </tr>
            <tr>
              <td class="CformNombre" width="150">Descripción:</td>
              <td class="CformDato">
                 <html:text property="descripcion" size="50" maxlength="50" styleClass="desactivable"/>
              </td>
            </tr>
            </table>
            <table  width="100%">
            <tr>
              
              <td class="CformNombre" width="150">Contratante:<span class="dato_obligatorio">*</span></td>
              <td class="CformDato" > 
              
              	<capplication:autoComplete tipoAutocomplete="contratante" afterSelectCallBack="contratanteAfterSelect" tipoAction="BtnSubmit" 
              		afterRemoveCallBack="contratanteAfterRemove" actionIngresarNuevo="ingresarNuevoContratante"/>
                </td>
	
               <td class="CformDato">  
                   <html:submit property="btnSeleccionarContacto" styleClass="CformBoton" value="Seleccionar" />
                 
              </td>
				
			       	
	          <td class="CformDato">
              	<div id="contactoDiv">
              		<table>
              		<tr>
              		<td class="CformNombre" width="100"> Contacto:&nbsp; </td>
              		<td class="CformDato"> 
	              		<html:img styleId="cargandoContactosImg" src="imagenes/indicator.gif" height="15px" width="15px"/>
		              	<html:select styleId="comboContratanteContacto" property="contactoId">
		                	<html:options collection="comboContactos" property="value" labelProperty="label"/>
		              	</html:select>
		              	<label class="CformNombre" id="noHayContactosMsj">El contratante seleccionado no posee contactos</label>
		            </td>             		
              		</table>
	          	</div>
	          </td>
	          
            </tr>
          </table>
          <logic:notEqual value="si" name="isAlta">
            <table width="100%">
               <tr bgcolor="#DDEEFF">
                 <td>
                   Orden de Facturación
                 </td>
               </tr>
            </table>
            <table width="100%" cellpadding="2" cellspacing="2">
               <tr>
                  <td class="CformNombre" width="150">Número:</td>
                  <td class="CformDato">
                    <bean:write name="cPresupuestoActionForm" property="numeroOrdenFacturacion" /> 
                  </td>  
               </tr>
               <tr>
                  <td class="CformNombre" width="150">Fecha:</td>
                  <td class="CformDato">
                    <bean:write name="cPresupuestoActionForm" property="fechaOrdenFacturacion" /> 
                  </td>  
               </tr>
               <tr>
                  <td class="CformNombre" width="150">Emisor:</td>
                  <td class="CformDato">
                    <bean:write name="cPresupuestoActionForm" property="emisionOrdenFacturacion" /> 
                  </td>  
               </tr>
            </table>
          </logic:notEqual>
          <table width="100%" >
            <tr>
              <td width="430" class="CformAreaBotones">
                <div align="left" class="dato_obligatorio">* Datos obligatorios</div>
              </td>
              <td width="210" class="CformAreaBotones">
                <div align="right">
                  <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" /> 
                  <logic:equal value="si" name="showBtnLimpiar">
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                  </logic:equal>
                  <logic:equal value="no" name="showBtnLimpiar">
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                  </logic:equal>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>

  <!-- tabPrecios-->
  <div id="precio">
    <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>
        <td width="600" class="CformAreaBotones">
          <div align="center"><input type="button" class="CformBotonTranspBorde" value="|<<" name="cPresupuestoActionForm"   onclick="irTabInicial()" /> 
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPresupuestoActionForm"   onclick="irTabAnterior()" /> 
            <input type="button" class="CformBotonTranspBorde" value=">"  name="cPresupuestoActionForm" onclick="irTabSiguiente()" /> 
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPresupuestoActionForm" onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="5" >
      <tr>
        <td>
         <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>Ofertas Presupuestadas&nbsp;<span class="dato_obligatorio">*</span></td>
            </tr>
          </table>
          <logic:notEmpty property="precios" name="cPresupuestoActionForm">
            <table width="100%">
              <tr>
                <td colspan="10">
                   <display:table name="sessionScope.cPresupuestoActionForm.precios" style="width: 100%" class="displayTable" decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioDisplayWrapper">
                    <display:column property="indice" title="#" headerClass="tableCellHeader" maxLength="22" style="width: 20px;" />
                    <display:column property="codigo" title="Código" headerClass="tableCellHeader" maxLength="30" style="width: 50px;" />
                    <display:column property="descripcionOferta" title="Título + Prestación" headerClass="tableCellHeader" style="width: 370px;" />
                    <display:column property="cantidad" title="Cantidad" headerClass="tableCellHeader" maxLength="15" style="width: 80px;" />
                    <display:column property="precio" title="Precio" headerClass="tableCellHeader" style="width: 80px;" />
                  </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>
          <logic:empty property="precios" name="cPresupuestoActionForm">
            <table width="100%">
              <tr>
                <td>No se seleccionaron Ofertas Presupuestadas.&nbsp;</td>
              </tr>
            </table>
          </logic:empty>
          <table width="100%">
            <tr>
              <td class="CformAreaBotones" >
                 <div align="right" class="desactivable">
                    <html:submit property="btnSeleccionarCostosPrecios" styleClass="CformBoton" value="Seleccionar" />
                 </div>
              </td>
            </tr>
          </table>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>UVT&nbsp;<span class="dato_obligatorio">*</span></td>
            </tr>
          </table>
          
          <table width="100%">
            <tr>
              <td colspan="10"> <capplication:autoComplete tipoAutocomplete="uvt" tipoAction="BtnSubmit"/> </td>
            </tr>
          </table>

          <table width="100%">
            <tr>
              <td class="CformAreaBotones" >
                 <div align="right" class="desactivable">
                    <html:submit property="btnSeleccionarUVT" styleClass="CformBoton" value="Seleccionar" />
                 </div>
              </td>
            </tr>
          </table>
            <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>Precio</td>
            </tr>
          </table>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr>
              <td class="CformNombre" width="150">Total Precio Ofertas:</td>
              <td class="CformDato">
                 <html:text property="totalPrecioOfertas" styleId="totalPrecioOfertas" styleClass="textDisabled" style="text-align:right" readonly="true"/>
              </td>
            </tr>
            <tr>
              <td class="CformNombre" width="150">IVA (%):</td>
              <td class="CformDato">
                 <html:text property="ivaPorcentaje" style="text-align:right" styleId="ivaPorcentaje" readonly="true" styleClass="textDisabled"/>
              </td>
            </tr>
            <tr>
              <td class="CformNombre" width="150">Precio Final ($):</td>
              <td class="CformDato">
                 <html:text property="precioFinal" styleClass="textDisabled" style="text-align:right" readonly="true" styleId="precioFinal"/>
              </td>
            </tr>
          </table>
          <table width="100%">
            <tr>
              <td width="430" class="CformAreaBotones">
                <div align="left" class="dato_obligatorio">* Datos obligatorios</div>
              </td>
              <td width="210" class="CformAreaBotones">
                <div align="right">
                  <input type="button" class="CformBoton" value="Siguiente" name="cPresupuestoActionForm" onclick="irTabSiguiente()" /> 
                  <logic:equal value="si" name="showBtnLimpiar">
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                  </logic:equal>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>

  <!-- tabCondiciones-->
  <div id="condiciones">
    <table align="center" cellpadding="0" cellspacing="5" class="tablaMin">
      <tr>
        <td class="CformAreaBotones">
          <div align="center">
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPresupuestoActionForm" onclick="irTabInicial()" /> 
          <input type="button" class="CformBotonTranspBorde" value="<" name="cPresupuestoActionForm"   onclick="irTabAnterior()" />
          <input type="button" class="CformBotonTranspBorde" value=">" name="cPresupuestoActionForm" onclick="irTabSiguiente()" /> 
          <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPresupuestoActionForm" onclick="irTabFinal()" />
        </div>
      </td>
    </tr>
  </table>
  <table class="CformTable" align="center" cellpadding="0" cellspacing="5" width="600">
    <tr>
      <td>
        <table width="100%">
          <tr bgcolor="#DDEEFF">
            <td>Condiciones</td>
          </tr>
        </table>
        <table width="100%">
          <tr>
            <td class="CformNombre" width="150">Fecha de Entrega:</td>
            <td class="CformDato">
              <html:text name="cPresupuestoActionForm" styleId="id_fecha_de_entrega" property="fechaDeEntrega" size="10" maxlength="10" onkeypress="validarNumero()"/>
            </td>
          </tr>
          <tr>
             <td class="CformNombre" width="150">Validez:<span class="dato_obligatorio">*</span></td>
             <td class="CformDato">
               <html:text property="validez" maxlength="2" size="10" onblur="validarNumero()" styleClass="desactivable"/>(Máximo 15 días)</td>
           </tr>
           <tr>
             <td class="CformNombre" width="150">Otros:</td>
             <td class="CformDato">
               <html:text property="otros" size="60" styleClass="desactivable"/></td>
           </tr>
         </table>  
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Pagos</td>
            </tr>
          </table>
          <div class="desactivable">
          <table>
	        <tr>
	          	<td class="CformNombre" width="150">Precio Final ($):</td>
	          	<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="precioFinal" />  </td>
	        </tr>
            <tr>
              <td class="CformNombre" width="150">Cantidad de Pagos:</td>
              <td class="CformDato">
                <html:text property="cantidadPagos" size="10" onchange="formatoEntero(this)" />
              </td>
              <td>
                  <html:submit property="btnSubmitDistribucion" styleClass="CformBoton" value="Agregar / Quitar Pagos" />
              </td>
            </tr>
          </table>
          </div>
            <table width="100%">
              <tr>
                <td colspan="10">
                  <display:table name="sessionScope.cPresupuestoActionForm.pagosStruct" id="input" class="displayTable" decorator="conicet.apps.svt.web.presupuesto.decorator.CAcuerdoPagoDisplayWrapper" style="width:100%;">      
                    <display:column property="fechaVencimiento" title="Fecha de Vencimiento" headerClass="tableCellHeader" style="width: 300px;" />
                    <display:column property="formaPago" title="Forma de Pago" headerClass="tableCellHeader" style="width: 150px;" />
                    <display:column property="detalle" title="Detalle" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="width: 150px;" />
                  </display:table>
                </td>
              </tr>
            </table>
      </td>
    </tr>
    <tr>
    <td>
      <table width="100%">
        <tr>
          <td width="430" class="CformAreaBotones">
           <div align="left" class="dato_obligatorio">* Datos obligatorios</div>
         </td>
          <td width="210" class="CformAreaBotones">
            <div align="right">
              <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()"/> 
              <logic:equal value="si" name="showBtnLimpiar">
                <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
              </logic:equal>
            </div>
          </td>
        </tr>
      </table>
    </td>
   </tr>
  </table>
  </div>
      
  <!-- tabFacturacion-->
  <div id="facturacion">
    <table align="center" cellpadding="0" cellspacing="5" class="tablaMin">
      <tr>
        <td class="CformAreaBotones">
          <div align="center">
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPresupuestoActionForm" onclick="irTabInicial()" /> 
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPresupuestoActionForm"   onclick="irTabAnterior()" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cPresupuestoActionForm" onclick="irTabSiguiente()" /> 
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPresupuestoActionForm" onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="5">
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Facturación</td>
            </tr>
          </table>
          <div class="desactivable">
          <table width="100%">
          	<tr>
	          	<td class="CformNombre" width="150">Precio Final ($):</td>
	          	<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="precioFinal" />  
	          	 
	          	</td>
	      
	        </tr>
          
          
          </table>
          </div>

          <table width="100%">
            <tr>
              <td colspan="10">
                <display:table name="sessionScope.cPresupuestoActionForm.acuerdosFactura" id="input" class="displayTable" decorator="conicet.apps.svt.web.presupuesto.decorator.CAcuerdoFacturaDisplayWrapper" style="width:100%;">      
                  <display:column property="fecha" title="Fecha Factura" headerClass="tableCellHeader" style="width: 300px;" />
                  <display:column property="detalle" title="Detalle" headerClass="tableCellHeader" style="width: 350px;" />
                  <display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="width: 150px;" />
                
               	  <display:column property="remove" title=" Acción " headerClass="tableCellHeader" />
					<display:footer>
							<tr style="background-color: #FAFAFA;">
									
									<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
										 Ingresar Nuevo:
										 <html:text name="cPresupuestoActionForm" styleId="id_fecha_acuerdo_factura" property="fechaAF" size="10" maxlength="10" onkeypress="validarNumero()"/>
									</td>
									<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
										 <html:text name="cPresupuestoActionForm" property="detalleAF" size="30" maxlength="120" />
									</td>
									<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;">														
										 <html:text name="cPresupuestoActionForm" styleId="importeAF" property="importeAF" style="text-align:right;" maxlength="12" size="10"  onblur="formatImporte(this)" />
									</td>
									<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
										<html:submit style="width:100px;" property="btnSubmit" value="Agregar Factura" styleClass="CformBoton" />
									</td>
												
							</tr>
					</display:footer>
                </display:table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
      <td>
        <table width="100%">
          <tr>
            <td  class="CformAreaBotones">
              <div align="right">
                <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()"/> 
                <logic:equal value="si" name="showBtnLimpiar">
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                </logic:equal>
              </div>
            </td>
          </tr>
        </table>
      </td>
     </tr>
    </table>
  
  
	<logic:equal value="S" property="hayOrdenFacturacionEmitida" name="cPresupuestoActionForm">
	        <table align="center" cellpadding="0" cellspacing="5" class="tablaMin">
	              <tr >
	                <td >
	                  <b>
	                  Atención: No podrá eliminar los acuerdos de factura que tienen una orden de facturación emitida relacionada.
						</b>
	                </td>
	              </tr>
	           </table>
	</logic:equal>

  
  </div>
  <!-- tabInfoAdicional-->
  <div id="infoAdicional">
    <table align="center" cellpadding="0" cellspacing="5" class="tablaMin">
      <tr>
        <td class="CformAreaBotones">
          <div align="center">
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPresupuestoActionForm" onclick="irTabInicial()" /> 
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPresupuestoActionForm"   onclick="irTabAnterior()" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cPresupuestoActionForm" onclick="irTabSiguiente()" /> 
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPresupuestoActionForm" onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="5">
      <tr>
        <td>
          <table width="100%">
          <tr>
        	<td>
	          <table width="100%">
	          	<tr bgcolor="#DDEEFF">
	              <td>Información Adicional Para La Impresión (Antes):</td>
	            </tr>
	          	<tr>
	          	 <td class="CformDato">
	                 <html:textarea styleId="infoAdicionalImpresionAntes" property="infoAdicionalImpresionAntes" rows="6"/>
	              </td>
	          	</tr>
	          </table>
	        </td>
	      </tr>
	      <tr>
        	<td>
	          <table width="100%">
	          	<tr bgcolor="#DDEEFF">
	              <td>Información Adicional Para La Impresión (Después):</td>
	            </tr>
	          	<tr>
	          	<td class="CformDato">
	              <html:textarea styleId="infoAdicionalImpresionDespues" property="infoAdicionalImpresionDespues"  rows="6"/>
	            </td>
	          	</tr>
	          </table>
	        </td>
	      </tr>
	     <tr>
		  	<td height="10"></td>
		 </tr>
		  
	    <tr>
			<td>
			<table width="100%" cellpadding="2" cellspacing="2">
				<tr>
				<td colspan="2">
			      	<table width="100%" cellpadding="2" cellspacing="2">	    
						<tr bgcolor="#DDEEFF">
							<td>Documentación&nbsp;</td>
						</tr>
			  		</table>
			 	 	<table width="100%">
						<tr>
							<td>
								<display:table class="displayTable" style="width: 100%" name="sessionScope.cPresupuestoActionForm.documentos(PresupuestoDoc)" id="documentosPresupuesto"
									decorator="conicet.apps.svt.web.presupuesto.decorator.CPresupuestoDocumentoDisplayWrapper">
									<display:column property="observacion" title="Observación" headerClass="tableCellHeader" style="width: 100px;" />
									<display:column property="archivoDescargar" title="Documento" headerClass="tableCellHeader" style="width: 150px;" />
									<display:column property="eliminar" title="  " headerClass="tableCellHeader" style="width: 10px;" />
								</display:table>
							</td>
						</tr>
					</table>
				</td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="CformNombre" width="10%">Archivo:&nbsp;<span class="dato_obligatorio">*</span>
					</td>
					<td class="CformDato">
						<html:file property="fileMapped(PresupuestoDoc)" size="40" /> 
						<logic:notEmpty property="fileMapped(PresupuestoDoc)" name="cPresupuestoActionForm">
							<br/> Seleccionado: <bean:write property="descripcionDocumentoMapped(PresupuestoDoc)" name="cPresupuestoActionForm" />
						</logic:notEmpty>
					</td>
				</tr>
		
				<tr>
					<td class="CformNombre">Observación:&nbsp;</td>
					<td class="CformDato">
						<html:textarea property="observacionDocumentacion" rows="2" onkeyup="isMaxLength(this,250)" />
					</td>
				</tr>
				<tr>
					<td class="CformNombre">&nbsp;</td>
					<td>
						<html:submit property="btnSubmit" styleClass="CformBoton" value="Agregar Documento" />
					</td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
	      </table>
	    </td>
	  </tr>
	  <tr>
      <td>
        <table width="100%">
          <tr>
            <td  class="CformAreaBotones">
              <div align="right">
                <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" /> 
                <logic:equal value="si" name="showBtnLimpiar">
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                </logic:equal>
              </div>
            </td>
          </tr>
        </table>
      </td>
      </tr>

    </table>
  </div>
          
</logic:equal>

<logic:equal value="view" name="tipoPantalla">
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
    <tr>
      <td>
        <table align="center" cellpadding="0" cellspacing="5" width="100%">
					<tr>
						<td colspan="100%">
							<table width="100%">
								<tr bgcolor="#BFDFFF">
									<td><strong>Presupuesto</strong></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<logic:notEqual value="si" name="isAlta">
									<tr>
										<td class="CformNombre" width="150">Número:</td>
										<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="numeroPresupuesto" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="150">Fecha:</td>
										<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="fechaPresupuesto" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="150">Emisor:</td>
										<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="emisionPresupuesto" /></td>
									</tr>
								</logic:notEqual>
								<tr>
									<td class="CformNombre" width="150">Estado:</td>
									<td class="CformDato"><html:select disabled="true" property="tipoEstadoPresupuesto">
											<html:options collection="comboTipoEstadoPresupuesto" property="value" labelProperty="label" />
										</html:select></td>
								</tr>
								<tr>
									<td class="CformNombre" width="150">Descripcion:</td>
									<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="descripcion" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="150">Contratante:</td>
									<td class="CformDato"><capplication:autoCompleteView name="cPresupuestoActionForm" tipoAutocomplete="Contratante"/></td>
						            <td>
						            <div id="contactoDiv">
						            	<table><tr>
					              		<td class="CformNombre" width="150"> Contacto:&nbsp; </td>
					              		<td class="CformDato"> 
											<html:select styleId="comboContratanteContacto" disabled="true" property="contactoId">
												<html:options collection="comboContactos" property="value" labelProperty="label" />
											</html:select>
							            </td></tr>
							            </table>          		
							        </div>
							        </td>
								</tr>
							</table> <logic:notEmpty name="cPresupuestoActionForm" property="numeroOrdenFacturacion">
								<table width="100%">
									<tr bgcolor="#BFDFFF">
										<td><strong>Orden de Facturación</strong></td>
									</tr>
								</table>
								<table width="100%" cellpadding="2" cellspacing="2">
									<tr>
										<td class="CformNombre" width="150">Número:</td>
										<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="numeroOrdenFacturacion" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="150">Fecha:</td>
										<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="fechaOrdenFacturacion" /></td>
									</tr>
									<tr>
										<td class="CformNombre" width="150">Emisor:</td>
										<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="emisionOrdenFacturacion" /></td>
									</tr>
								</table>
							</logic:notEmpty>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr bgcolor="#BFDFFF">
									<td><strong>UVT</strong></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td colspan="10"><display:table name="sessionScope.cPresupuestoActionForm.uvt" class="displayTable" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper"
											style="width:100%;">
											<logic:equal value="si" name="displayLinks">
												<display:column property="indiceDetalle" title="#" headerClass="tableCellHeader" style="width:17px;" />
											</logic:equal>
											<display:column property="sigla" title="Sigla" headerClass="tableCellHeader" maxLength="22" style="width: 80px;" />
											<display:column property="central" title="Central" headerClass="tableCellHeader" style="width: 170px;" />
											<display:column property="iva" title="IVA" headerClass="tableCellHeader" maxLength="22" style="width: 150px;" />
											<display:column property="alicuota" title="Alícuota" headerClass="tableCellHeader" maxLength="15" style="width: 100px;" />
										</display:table></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr bgcolor="#BFDFFF">
									<td><strong>Ofertas Presupuestadas</strong></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td colspan="10"><display:table name="sessionScope.cPresupuestoActionForm.precios" style="width: 100%" class="displayTable"
											decorator="conicet.apps.svt.web.presupuesto.decorator.CPrecioDisplayWrapper">
											<logic:equal value="si" name="displayLinks">
												<display:column property="indiceDetalle" title="#" headerClass="tableCellHeader" style="width:20px;" />
											</logic:equal>
											<display:column property="codigo" title="Código" headerClass="tableCellHeader" maxLength="22" style="width: 50px;" />
											<display:column property="descripcionOferta" title="Título + Prestación" headerClass="tableCellHeader" style="width: 370px;" />
											<display:column property="cantidad" title="Cantidad" headerClass="tableCellHeader" maxLength="15" style="width: 80px;" />
											<display:column property="precio" title="Precio ($)" headerClass="tableCellHeader" style="width: 80px;" />
										</display:table></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td class="CformNombre" width="150">Precio Total Ofertas:</td>
									<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="totalPrecioOfertas" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="150">IVA (%):</td>
									<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="ivaPorcentaje" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="150">Precio Final:</td>
									<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="precioFinal" /></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr bgcolor="#BFDFFF">
									<td><strong>Condiciones</strong></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr>
									<td class="CformNombre" width="150">Fecha de Entrega:</td>
									<logic:notEmpty property="fechaDeEntrega" name="cPresupuestoActionForm">
										<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="fechaDeEntrega" /></td>
									</logic:notEmpty>
								</tr>
								<tr>
									<td class="CformNombre" width="150">Validez:</td>
									<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="validez" />&nbsp;días</td>
								</tr>
								<tr>
									<td class="CformNombre" width="150">Otros:</td>
									<td class="CformDato"><bean:write name="cPresupuestoActionForm" property="otros" /></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr bgcolor="#BFDFFF">
									<td><strong>Pago</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td colspan="10"><display:table name="sessionScope.cPresupuestoActionForm.pagosStruct" id="view" class="displayTable"
											decorator="conicet.apps.svt.web.presupuesto.decorator.CAcuerdoPagoDisplayWrapper" style="width:100%;">
											<display:column property="fechaVencimientoCfm" title="Fecha de Vencimiento" headerClass="tableCellHeader" style="width: 250px;" />
											<display:column property="formaPagoCfm" title="Forma de Pago" headerClass="tableCellHeader" style="width: 150px;" />
											<display:column property="detalleCfm" title="Detalle" headerClass="tableCellHeader" style="width: 350px;" />
											<display:column property="importeCfm" title="Importe ($)" headerClass="tableCellHeader" style="width: 100px; text-align:right;" />
										</display:table></td>
								</tr>
							</table>
							<table width="100%" cellpadding="2" cellspacing="2">
								<tr bgcolor="#BFDFFF">
									<td><strong>Facturación</strong></td>
								</tr>
							</table>
							<table width="100%">
								<display:table name="sessionScope.cPresupuestoActionForm.acuerdosFactura" id="input" class="displayTable" decorator="conicet.apps.svt.web.presupuesto.decorator.CAcuerdoFacturaDisplayWrapper"
									style="width:100%;">
									<display:column property="fecha" title="Fecha Factura" headerClass="tableCellHeader" style="width: 180px;" />
									<display:column property="detalle" title="Detalle" headerClass="tableCellHeader" style="width: 350px;" />
									<display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="width: 150px;" />
								</display:table>
							</table>
						</td>
					</tr>
					<tr>
						<td><table width="100%" cellpadding="2" cellspacing="2">
								<tr bgcolor="#BFDFFF">
									<td><strong>Información Adicional</strong></td>
								</tr>
							</table>
							<table width="100%">
								<tr>
									<td>
										<table width="100%">
											<tr bgcolor="#DDEEFF">
												<td>Información Adicional Para La Impresión (Antes):</td>
											</tr>
											<tr>
												<td class="CformDato"><bean:write  name="cPresupuestoActionForm" property="infoAdicionalImpresionAntes" filter="false"/></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr bgcolor="#DDEEFF">
												<td>Información Adicional Para La Impresión (Después):</td>
											</tr>
											<tr>
												<td class="CformDato"><bean:write  name="cPresupuestoActionForm" property="infoAdicionalImpresionDespues"  filter="false"/></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
					<td colspan="2">
				      	<table width="100%" cellpadding="2" cellspacing="2">	    
							<tr bgcolor="#BFDFFF">
								<td><strong>Documentación&nbsp;</strong></td>
							</tr>
				  		</table>
				 	 	<table width="100%">
							<tr>
								<td>
									<display:table class="displayTable" style="width: 100%" name="sessionScope.cPresupuestoActionForm.documentos(PresupuestoDoc)" id="documentosPresupuesto"
										decorator="conicet.apps.svt.web.presupuesto.decorator.CPresupuestoDocumentoDisplayWrapper">
										<display:column property="observacion" title="Observación" headerClass="tableCellHeader" style="width: 100px;" />
										<display:column property="archivoDescargar" title="Documento" headerClass="tableCellHeader" style="width: 150px;" />
									</display:table>
								</td>
							</tr>
						</table>
					</td>
					</tr>
					<tr>
					<td colspan="2">
				      	<table width="100%" cellpadding="2" cellspacing="2">	    
							<tr bgcolor="#BFDFFF">
								<td><strong>Cambio de Estados&nbsp;</strong></td>
							</tr>
				  		</table>
				 	 	<table width="100%">
							<tr>
								<td>
									<display:table class="displayTable" style="width: 100%" name="sessionScope.cPresupuestoActionForm.presupuestoEstados" id="presupuestoEstados"
										decorator="conicet.apps.svt.web.presupuesto.decorator.CPresupuestoEstadoDisplayWrapper">
										<display:column property="fecha" title="Fecha" headerClass="tableCellHeader" style="width: 100px;" />
										<display:column property="estadoDescripcion" title="Estado" headerClass="tableCellHeader" style="width: 150px;" />
										<display:column property="usuario" title="Usuario" headerClass="tableCellHeader" style="width: 150px;" />
									</display:table>
								</td>
							</tr>
						</table>
					</td>
					</tr>
					<tr>
						<td class="CformAreaBotones">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cPresupuestoActionForm" />
									<jsp:param name="entidad" value="presupuesto" />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
  </tr>
</table>
</logic:equal>