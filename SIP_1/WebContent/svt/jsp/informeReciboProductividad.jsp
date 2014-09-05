<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script>

$(document).ready(function() {
	  var opciones = {"desde":"id_fecha_desde","hasta":"id_fecha_hasta"};
	  var x = new CPeriodoPicker(opciones);
});

	window.onload=function(){
				if(document.cInformeGenerarActionForm.generarPDF.value=="S"){
					document.cInformeGenerarActionForm.generarPDF.value="N";
					go();
				}
	}
	
	function go(){
		var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
		window.open('/'+urlAppName+'/cInformeReciboProductividadPDFAction.do','_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
	}
	 
	
</script>  

<br>
<html:form action="cInformeReciboProductividadAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="generarPDF" />  
<h1 align="center" class="titulo">Generación de Informe y Recibos de Productividad</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table width="100%">
						      <tr>
						        <td class="CformNombre" >UVT:&nbsp;<span class="dato_obligatorio">*</span></td>
			                    <td class="CformDato">
					                 <html:select  property="uvtId">
					                 <html:options collection="comboInformarA" property="value" labelProperty="label"  />
					                 </html:select>
					            </td>
					         </tr> 
		                     
		                     <tr>
						        <td class="CformNombre" >Fecha Desde:&nbsp;<span class="dato_obligatorio">*</span></td>
			                    <td class="CformDato">
					                 <html:text  styleId="id_fecha_desde"  property="fechaDesde" maxlength="10" size="10">
					                 </html:text>
								</td>
						      </tr>	
						      
						      <tr>
						        <td class="CformNombre" >Fecha Hasta:&nbsp;<span class="dato_obligatorio">*</span></td>
			                    <td class="CformDato">
					                 <html:text  styleId="id_fecha_hasta"  property="fechaHasta" maxlength="10" size="10">
					                 </html:text>
								</td>
						      </tr>	
					</table>
				
				 </td>
			 </tr>
		
		     <tr>
		        <td class="CformAreaBotones" height="35">
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cInformeGenerarActionForm" />
		               <jsp:param name="entidad" value="informe" />
		               <jsp:param name="posicion" value="0" />
		            </jsp:include>
		          </div>
		        </td>
		      </tr>
	   </table>
	 </td>
  </tr>
</table>

</html:form>



