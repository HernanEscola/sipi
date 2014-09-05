<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>
<script language="JavaScript1.2" src="./js/comboPaisAjax.js?<resourceVersion:version
virtualPath='/js/comboPaisAjax.js'/>"></script>
<script language="JavaScript1.2" src="./js/contratante.js?<resourceVersion:version
virtualPath='/js/contratante.js'/>"></script>
<script language="JavaScript1.2" src="./js/tablaUtil.js?<resourceVersion:version
virtualPath='/js/tablaUtil.js'/>"></script>



<bean:define id="form" name="cContratanteModificarActionForm"/>
<bean:define id="actionPage" name="form" property="modificarActionName" />


<br>
<h1 align="center" class="titulo">Modificación  de Contratantes</h1>


<html:form action="cContratanteModificarAction.do" method="POST" enctype="multipart/form-data">
<html:hidden property="accion"/>
<html:hidden property="esConsumidorFinal"/>
<html:hidden property="cambiaPanel" />
<html:hidden property="esNuevoContratante" />
<!-- 
Esta variable la uso en contratante.jsp en la confirmación para que muestre bien el combo 
ya hay casos en que se bloquea y la variable original no se popula 
-->
<html:hidden styleId="seleccionadoComboCentral" property="seleccionadoComboCentral" />

  <logic:equal property="accion" value="modificar" name="cContratanteModificarActionForm">

    <script>

		
        solapas = new Array('tabDatos','tabContacto');
        <capplication:isApplication application="SVT">
    		solapas = new Array('tabDatos','tabContacto','tabDocumentacion');
    	</capplication:isApplication>
        
        
        function setFoco(){
	        x=event.keyCode
	        if((x==13)){ // enter
	         window.event.returnValue = false
	        }
        }
        
        function irTabFinal(){
        document.cContratanteModificarActionForm.cambiaPanel.value=solapas[solapas.length-1];
        setupPanes("container", document.cContratanteModificarActionForm.cambiaPanel.value);
        }
        
        function irTabInicial(){
        document.cContratanteModificarActionForm.cambiaPanel.value=solapas[0];
        setupPanes("container", document.cContratanteModificarActionForm.cambiaPanel.value);
        }
        
        function irTabAnterior(){
        var obj = document.cContratanteModificarActionForm.cambiaPanel.value;
        for(i=1;i<solapas.length;i++){
          if ((solapas[i] == obj)) {
            document.cContratanteModificarActionForm.cambiaPanel.value=solapas[i-1];
            break;
          }  
        }  
        setupPanes("container", document.cContratanteModificarActionForm.cambiaPanel.value);
        }
        
        function irTabSiguiente(){
        var obj = document.cContratanteModificarActionForm.cambiaPanel.value;
        for(i=0;i<(solapas.length-1);i++){
          if ((solapas[i] == obj)) {
            document.cContratanteModificarActionForm.cambiaPanel.value=solapas[i+1];
            break;
          }  
        }  
        setupPanes("container", document.cContratanteModificarActionForm.cambiaPanel.value);
        }
        
        function mostrarPanel(obj1, obj2){
        document.cContratanteModificarActionForm.cambiaPanel.value = obj2.id;
        return showPane(obj1, obj2);
        }
        
        function irA(obj){
        document.cContratanteModificarActionForm.cambiaPanel.value=obj;
        setupPanes("container", document.cContratanteModificarActionForm.cambiaPanel.value);
        
        }
        
        function setFocus(){
          document.getElementById('Busqueda').focus()
        }

        
        function hideForms()
		{
			var catIva = $("#iva").val();
		
			/*if(document.cContratanteActionForm.tipoBusqueda == "nuevo" && catIva == 4)
			{		
					$('#iva').attr('value', '-1');
			}
			else
			{*/
				if(catIva == "Seleccionar" || catIva == -1 || catIva == -2 )
				{
					$("[id^=formConsumidorFinal]").hide();
				}
				else if(catIva == "Consumidor Final" || catIva == 4)
				{
					$("[id^=formEmpresa]").hide();
					$("[id^=formConsumidorFinal]").show();
					$("[id^=formBusqueda]").hide();
				}
				else
				{
					$("[id^=formConsumidorFinal]").hide();
					$("[id^=formEmpresa]").show();
					$("[id^=formBusqueda]").show();
					irTabInicial();
				}
				
				// si cambio entre consumidor final y otro o viceversa limpio y actualizo la pantalla.
				if(categoriaIvaAnterior == 4 || catIva == 4 )
				{
					if(document.cContratanteModificarActionForm.tipoBusqueda != "nuevo")
					{
						document.cContratanteModificarActionForm.accion.value = "limpiarPantalla"
					}
					
					document.cContratanteModificarActionForm.submit();
				}
			//}
			
			
			// si cambio entre consumidor final y otro o viceversa limpio y actualizo la pantalla.
			
			
		}
		
		function hideTodo()
		{
			var tipoContratante = $("#tipoContratante").val();
		
			
			if(document.cContratanteModificarActionForm.accion.value == "modificar")
			{
				$("#tipoContratante").attr('disabled', true);
				if($("#tipoContratante").val() == 1){
					$("#iva").find("option[value='4']").remove();
				}
			}

					
			if(tipoContratante == 0)
			{
				$("[id^=formEmpresa]").hide();
				$("[id^=formConsumidorFinal]").show();
				$("[id^=formBusqueda]").hide();
			}
			else
			{
				$("[id^=formConsumidorFinal]").hide();
				$("[id^=formEmpresa]").show();
				$("[id^=formBusqueda]").show();
			}
		}
		
        $(document).ready(function() {
        	
			//Seteo el actionName q se usa en contratante.js
			var actionName = '<%=actionPage%>';

          	generarCombos("cContratanteModificarAction.do",null,"<%=CConstantes.paisArgentina%>");
          	generarCombos("cContratanteModificarAction.do","Adm","<%=CConstantes.paisArgentina%>");
          	generarCombos("cContratanteModificarAction.do","Contacto","<%=CConstantes.paisArgentina%>");
          	
          	hideTodo();
          	
			if (document.cContratanteModificarActionForm.rolUsrLoggeado.value != "DVJ" &&
				document.cContratanteModificarActionForm.rolUsrLoggeado.value != "DVH" &&
				document.cContratanteModificarActionForm.rolUsrLoggeado.value != "CCO" &&
				document.cContratanteModificarActionForm.rolUsrLoggeado.value != "ACO" && $("#tipoContratante").val() != 0) {
          		

				if(esContratanteOtro()) {
					documentReadyContratanteOtro(actionName);
				}
				
				$('#campos :input').attr('disabled', true);
				$("#botonBorrarOrganismo").hide();				
				
				habilitarProvinciaPartidoLocalidad("Contacto",false,"<%=CConstantes.paisArgentina%>");
				verificarPaisArgentina("Contacto",null,"<%=CConstantes.paisArgentina%>");
			} else {
				$('#campos :input').removeAttr('disabled');
				//si hubo un error de datos obligatorios y se recarga la página esta llamada mantiene el bloqueo de campos.
				verificarPaisArgentina("",null,"<%=CConstantes.paisArgentina%>");
				verificarPaisArgentina("Adm",null,"<%=CConstantes.paisArgentina%>");
				habilitarProvinciaPartidoLocalidad("",true,"<%=CConstantes.paisArgentina%>");
				habilitarProvinciaPartidoLocalidad("Adm",true,"<%=CConstantes.paisArgentina%>");
				if(esContratanteOtro()) {
					documentReadyContratanteOtro(actionName);
				}
			}
          
			//hideTodo();
          
			setupPanes("container", document.cContratanteModificarActionForm.cambiaPanel.value);
			document.cContratanteModificarActionForm.cambiaPanel.value = "tabDatos";
		  
          
			$("#tipoContratante").attr('disabled', true);

			$('#centralSeleccionada').change(function () { 
				//con esto lo que hago es que me popule en la variable hidden lo que quedó,
				//sino, como el combo se deshabilitaba, no me hace el populate de la variable relacionada 
				//y queda lo viejo en la pantalla de confirmación
				$('#seleccionadoComboCentral').attr('value',$('#centralSeleccionada').val());
			});
			
			/*if(esContratanteOtro()) {
				documentReadyContratanteOtro(actionName);
			}*/
			
        });         
        
    </script>
    <div class="tab-container" id="container">
      <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
        <tr>
          <td>
            <ul class="tabs">
              <li><a href="#" onClick="return mostrarPanel('datos', this)" id="tabDatos">Datos</a></li>
              <li id="formEmpresaTab"><a href="#" onClick="return mostrarPanel('contacto', this)" id="tabContacto">Contacto</a></li>
              <capplication:isApplication application="SVT">
              	<li id="formEmpresaTab"><a href="#" onClick="return mostrarPanel('documentacion', this)" id="tabDocumentacion">Documentación</a></li>
           	 </capplication:isApplication>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <jsp:include page="/jsp/entidades/contratanteInput.jsp">
          <jsp:param name="contratanteForm" value="cContratanteModificarActionForm" />
          <jsp:param name="showBtnLimpiar" value="no" />
          <jsp:param name="showBtnVolver" value="si" />
          <jsp:param name="isAlta" value="no" />
        </jsp:include>
      </div>
    </div>
 
  </logic:equal> 

  <logic:equal property="accion" value="modificarCfm" name="cContratanteModificarActionForm">
    <jsp:include page="/jsp/entidades/contratanteView.jsp">
      <jsp:param name="contratanteForm" value="cContratanteModificarActionForm" />
      <jsp:param name="pageName" value="contratanteCfm" />
    </jsp:include>
  </logic:equal>

</html:form>
