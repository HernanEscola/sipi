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
	if(document.cInformeProductividadBuscarActionForm.generarPDF.value=="S"){
		document.cInformeProductividadBuscarActionForm.generarPDF.value="N";
		go();
	}
}

function go(){
	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cInformeReciboProductividadPDFAction.do','_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}

</script>


<br>
<html:form action="cInformeProductividadBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="generarPDF" />  
<h1 align=" center" class="titulo">Búsqueda de Informes de Productividad</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%" >

   <tr>
     <td>

        <table width="100%" >
						     </tr>
						        <td class="CformNombre" width="20%" >UVT:</td>
			                    <td class="CformDato" width="20">
					                 <html:select  property="uvtId">
					                 <html:options collection="comboInformarABusqueda" property="value" labelProperty="label"  />
					                 </html:select>
					            </td>
			                    <td class="CformNombre" width="10%" >Fecha Desde:</td>
			                    <td	class="CformDato" width="10%" >
										<html:text styleId="id_fecha_desde" size="10" property="fechaDesdeBusqueda" maxlength="10" /> 
				                  </td>
			                    <td class="CformNombre"  width="10%" >Fecha Hasta:</td>
			                    <td class="CformDato" width="30%" >
										<html:text styleId="id_fecha_hasta" size="10" property="fechaHastaBusqueda" maxlength="10"/> 
			                    </td>
			                  </tr>
			                
						     
		    
	   </table>
	 </td>
  </tr>
   <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cInformeProductividadBuscarActionForm" />
		               <jsp:param name="entidad" value="informeProductividad" />
		               <jsp:param name="posicion" value="0" />
		            </jsp:include>
		          </div>
		        </td>
		      </tr>
</table>



<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%" >


  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda</td>
          </tr>

          <tr>
                <td colspan="10">
	              <display:table sort="list"    name="sessionScope.cInformeProductividadBuscarActionForm.resultados" id="informeProductividadListar" style="width: 100%" export="true"  requestURI="cInformeProductividadBuscarAction.do"   decorator="conicet.apps.siuvt.web.informe.decorator.CInformeProductividadDisplayWrapper">
				 <display:column property="uvt" title="UVT" headerClass="sortable"  sortable="true" style="width: 200px;" />
				 <display:column property="fechaDesde" title="Fecha Desde" headerClass="sortable"  sortable="true" style="width: 200px;" />
		  		 <display:column property="fechaHasta"  title="Fecha Hasta" headerClass="sortable" sortable="true" style="width: 200px;" />
	             <display:column property="fechaAlta" title="Fecha de Registro" headerClass="sortable" sortable="true" style="width: 200px;" media="html" />
				 <display:column property="indice" title="Informe" headerClass="tableCellHeader" media="html" />
	             <display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.informe.decorator.CInformeDisplayWrapper" />
              <display:setProperty name="export.excel.filename" value="ListadoDeInformes.xls" />
              <display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.informe.decorator.CInformeDisplayWrapper" />
              <display:setProperty name="export.pdf.filename" value="ListadoDeInformes.pdf" />
	              
	               </display:table>
	    		</td>
           </tr>

	 	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cInformeProductividadBuscarActionForm" />
                  <jsp:param name="entidad" value="informeProductividad" />
                  <jsp:param name="posicion" value="1" />
                </jsp:include>
              </div>
            </td>
          </tr>

       </table>
    </td></tr>
</table>


</html:form>



