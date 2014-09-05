<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<link href="./js/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="./js/facebox/facebox.js" type="text/javascript"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<style type="text/css">
    .ui-widget, .ui-widget button {
        font-family: Verdana,Arial,Helvetica,sans-serif;
        font-size: 1em;
    }
    </style>
<script type="text/javascript">

$(document).ready(function(){
});


function pedirConfirmacion(textoDialogo, funcionOK, funcionCancelar, titulo,inputTexto) {
	
	$('<div style="padding: 10px; max-width: 600px; "><p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>' + textoDialogo+'</p>' + inputTexto+'</div>').dialog({
	    draggable: false,
	    modal: true,
	    resizable: false,
	    width: 'auto',
	    title: titulo || 'Confirmar',
	    minHeight: 75,
	    height:170,
	   
	     
	    
	    buttons: {
	      Aceptar: function () {
	    	  
	        if (typeof (funcionOK) == 'function') {
	        	
	        	setTimeout(funcionOK, 50);
	        	$("#motivoRechazo").attr("value", $("#myInput").val());
	        	
	  	    	
	        }
	        $(this).dialog('destroy');
	      },
	      Cancelar: function () {
	        if (typeof (funcionCancelar) == 'function') {
	          setTimeout(funcionCancelar, 50);
	        }
	        $(this).dialog('destroy');
	      }
	    }
	  });
		
	}



function generar(idSeleccionado){
	// texto del dialogo- funcion de ok, funcion de cancelar, titulo, input si corresponde
 	pedirConfirmacion(
 			'Generar la Orden de Facturación?', 
 			function () {irAGrabar(idSeleccionado,"generar");}, 
 			function () {},
 			'Confirmar Generación'
	  		,''
	);
	return false;
}

function anular(idSeleccionado){
	// texto del dialogo- funcion de ok, funcion de cancelar, titulo, input si corresponde
 	pedirConfirmacion(
 			'Ingrese Motivo de Anulación:', 
 			function () {irAGrabar(idSeleccionado,"anular");}, 
 			function () {},
 			'Anulación de Orden de Facturación',
 			'<input type="text" name="myInput" id="myInput" maxlength="80" size="50" />'
 			);
	
	return false;

}

function irAGrabar(idSeleccionado,queHacer){
	document.cAdministrarOFActionForm.action = 'cAdministrarOFAction.do?btnSubmit='+queHacer+'OF&idSeleccionado='+idSeleccionado;
	document.cAdministrarOFActionForm.submit();
	

}

function imprimirPDF(id){
	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cOrdenFacturacionPDFAction.do?idOrdenFacturacion='+id,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}


</script>
<br>
<h1 align="center" class="titulo">
 Acuerdos y Ordenes de Facturación 
</h1>
<html:form action="cAdministrarOFAction.do" method="POST">
<html:hidden property="motivoRechazo"  name="cAdministrarOFActionForm"  styleId="motivoRechazo"/>
 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
         <tr>
            <td colspan="100%">
             <table width="100%" cellpadding="2" cellspacing="2">   
                <tr bgcolor="#BFDFFF">
                  <td>
                    <strong>Acuerdos de Factura de <bean:write name="cAdministrarOFActionForm" property="descripcion" /></strong>
                   </td>
                </tr>
             </table>
             
             <table width="100%">
              <tr>
                <td colspan="10">
                  
                  <display:table name="sessionScope.cAdministrarOFActionForm.acuerdosFactura" id="view" class="displayTable" decorator="conicet.apps.svt.web.ordenFacturacion.decorator.CAdministrarOFDisplayWrapper" style="width:100%;">      
                    <display:column property="fecha" title="Fecha Factura" headerClass="tableCellHeader" style="width: 200px;" />
                    <display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="width: 200px;" />
                    <display:column property="estadoOF" title="Estado Orden Fact." headerClass="tableCellHeader" style="width: 200px; text-align:left;" />
                    <display:column property="numeroOF" title="N° Orden Fact." headerClass="tableCellHeader" style="width:150px; text-align:left;" />
                   <csecurity:hasFuncion funcion="administrar_of_generar">
                    	<display:column property="generarAnular" title="Acción " headerClass="tableCellHeader" style="width:15px; text-align:center;" />
                    </csecurity:hasFuncion>	                  
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
                <jsp:param name="formulario" value="cAdministrarOFActionForm" />
                <jsp:param name="entidad" value="presupuesto" />
             </jsp:include>
            </div>
          </td>
        </tr>
</table>
            
</html:form>
