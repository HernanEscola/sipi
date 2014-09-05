<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="layout/include.jsp"%>
<link href="./js/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="./js/facebox/facebox.js" type="text/javascript"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>

<script>
window.onload=function(){
        if(document.cOfertaTecnologicaPresentacionActionForm.generarPdf.value=="S"){
          document.cOfertaTecnologicaPresentacionActionForm.generarPdf.value="N";
          go();
        }
}
  
function go(){
	var id = <bean:write name="cOfertaTecnologicaPresentacionActionForm" property="idSelected" />;
	var app = "<bean:write name="cOfertaTecnologicaPresentacionActionForm" property="aplicacion"/>";
	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cOfertaTecnologicaPDFAction.do?id='+id+'&aplicacion='+app,'_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}

</script>
<style>
.contentFacebox {
  padding-top:5px;
  padding-right:0px;
  padding-left:0px;
}

#tableFacebox .td {
  padding:15px;
}
</style>
<!-- Inicialización facebox -->
<script type="text/javascript">
  jQuery(document).ready( function($) {
    $('a[rel*=facebox]').facebox({})
  })
</script>
<h1 align="center" class="titulo">Listado de Presentaciones</h1>
<html:form action="cOfertaTecnologicaPresentacionAction.do" method="POST">
<html:hidden property="generarPdf" name="cOfertaTecnologicaPresentacionActionForm"/>
 
  <logic:equal property="tipoOferta" value="3" name="cOfertaTecnologicaPresentacionActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>STAN &nbsp;</strong></td>
                  </tr>
                </table>
                <table width="100%">
                  
			                  <logic:notEmpty property="codigo" name="cOfertaTecnologicaPresentacionActionForm">
			                  			<tr>
									        <td class="CformNombre" width="114">Código:&nbsp;</td>
									        <td class="CformDato">
									          <bean:write name="cOfertaTecnologicaPresentacionActionForm" property="codigo" />
									        </td>
									    </tr>
							  </logic:notEmpty>	
							  <tr>
							         <td class="CformNombre" width="150">
							           Es Servicio:&nbsp;&nbsp;
							         </td>
							         <td class="CformDato">
							           <html:radio property="tipoStan" value="ST" disabled="true" />
							         </td>
							         <td class="CformNombre" width="150">
							           Es Asesoramiento:&nbsp;&nbsp;
							         </td>
							         <td class="CformDato">
							           <html:radio property="tipoStan" value="AINS" disabled="true" />
							         </td>
						      </tr>				    
						      <tr>
						        <td class="CformNombre" width="114">Título:&nbsp;</td>
						        <td class="CformDato">
						          <bean:write name="cOfertaTecnologicaPresentacionActionForm" property="descripcion" />
						        </td>
						      </tr>
						      <tr>
						       <td class="CformNombre" width="114">Prestación:&nbsp;</td>
						       <td class="CformDato">
						         <bean:write name="cOfertaTecnologicaPresentacionActionForm" property="prestacion" />
						       </td>
						      </tr>
                </table>  
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Prestador &nbsp;</strong></td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td colspan="10">
                      <display:table name="sessionScope.cOfertaTecnologicaPresentacionActionForm.prestador" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaPresentacionDisplayWrapper">
                        <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                      </display:table>
                   </td>
                 </tr>
                </table>
                 <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Presentaciones &nbsp;</strong></td>
                 </tr>
                </table>
                <logic:notEmpty property="colPresentaciones" name="cOfertaTecnologicaPresentacionActionForm">
                  <table width="100%">
                    <tr>
                       <td colspan="10">
                          <display:table requestURI="cOfertaTecnologicaPresentacionAction.do" name="sessionScope.cOfertaTecnologicaPresentacionActionForm.colPresentaciones" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaPresentacionDisplayWrapper">
                           <display:column property="codigoEnvio" title="Código" headerClass="tableCellHeader" style="width: 11%;" />
                           <display:column property="fechaAlta" title="Fecha Presentación" headerClass="tableCellHeader" style="width: 25%;"/>
                           <display:column property="usuario" title="Usuario" headerClass="tableCellHeader" style="width: 30%;"/>
                           <display:column property="procesamiento" title="Estado" headerClass="tableCellHeader" style="width: 13%;" />
                           <display:column property="origen" title="Origen" headerClass="tableCellHeader" style="width: 13%;" />
                           <display:column property="motivo" title="Resultado" headerClass="tableCellHeader" style="width: 30%;" />
                         </display:table>
                       </td>
                    </tr>
                   </table>
                 </logic:notEmpty>
                 <logic:empty property="colPresentaciones" name="cOfertaTecnologicaPresentacionActionForm">
                    <table width="100%">
                      <tr>
                        <td>No se realizaron presentaciones.</td>
                      </tr>
                    </table>
                </logic:empty>
               </td>
              </tr>
              <tr>
                <td class="CformAreaBotones" height="35">
                 <div align="right">
                    <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
                 </div>
               </td>
             </tr>
           </table>
         </td>
       </tr>
     </table>     
  </logic:equal>
  
  <logic:notEqual property="tipoOferta" value="3" name="cOfertaTecnologicaPresentacionActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td>
                <logic:equal value="1" property="tipoOferta" name="cOfertaTecnologicaPresentacionActionForm">
	                <table width="100%">
	                   <tr bgcolor="#BFDFFF">
	                     <td><strong>Desarrollos y Conocimientos &nbsp;</strong></td>
	                   </tr>
	                 </table>
						    </logic:equal>
						    <logic:equal value="2" property="tipoOferta" name="cOfertaTecnologicaPresentacionActionForm">
						      <table width="100%">
						        <tr bgcolor="#BFDFFF">
						          <td><strong>Propiedad Intelectual &nbsp;</strong></td>
						        </tr>
						      </table>
						    </logic:equal>
						    <table width="100%">
							  <logic:notEmpty property="codigo" name="cOfertaTecnologicaPresentacionActionForm">
							      <tr>
							        <td class="CformNombre" width="114">Código:&nbsp;</td>
							        <td class="CformDato">
							          <bean:write name="cOfertaTecnologicaPresentacionActionForm" property="codigo" />
							        </td>
							      </tr>
						      </logic:notEmpty> 
						      <tr>
						        <td class="CformNombre" width="114">Título:&nbsp;</td>
						        <td class="CformDato">
						          <bean:write name="cOfertaTecnologicaPresentacionActionForm" property="descripcion" /></td>
						      </tr>
						      <tr>
						       <td class="CformNombre" width="114">Detalle:&nbsp;</td>
						       <td class="CformDato">
						         <bean:write name="cOfertaTecnologicaPresentacionActionForm" property="detalle" />
						       </td>
						      </tr>
						    </table>  
						    <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td><strong>Prestador &nbsp;</strong></td>
						      </tr>
						    </table>
						    <table width="100%">
						      <tr>
						        <td colspan="10">
						          <display:table name="sessionScope.cOfertaTecnologicaPresentacionActionForm.prestador" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaPresentacionDisplayWrapper">
						            <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
						            <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
						            <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
						            <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
						          </display:table>
						       </td>
						     </tr>
						    </table>
						     <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td><strong>Presentaciones &nbsp;</strong></td>
						     </tr>
						    </table>
						    <logic:notEmpty property="colPresentaciones" name="cOfertaTecnologicaPresentacionActionForm">
                  <table width="100%">
                    <tr>
                       <td colspan="10">
                          <display:table requestURI="cOfertaTecnologicaPresentacionAction.do" name="sessionScope.cOfertaTecnologicaPresentacionActionForm.colPresentaciones" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaPresentacionDisplayWrapper">
                           <display:column property="codigoEnvio" title="Código" headerClass="tableCellHeader" style="width: 11%;" />
                           <display:column property="fechaAlta" title="Fecha Presentación" headerClass="tableCellHeader" style="width: 25%;"/>
                           <display:column property="usuario" title="Usuario" headerClass="tableCellHeader" style="width: 30%;"/>
                           <display:column property="procesamiento" title="Estado" headerClass="tableCellHeader" style="width: 13%;" />
                            <display:column property="origen" title="Origen" headerClass="tableCellHeader" style="width: 13%;" />
                           <display:column property="motivo" title="Resultado" headerClass="tableCellHeader" style="width: 30%;" />
                         </display:table>
                       </td>
                    </tr>
                   </table>
                 </logic:notEmpty>
                 <logic:empty property="colPresentaciones" name="cOfertaTecnologicaPresentacionActionForm">
                    <table width="100%">
                      <tr>
                        <td>No se realizaron presentaciones.</td>
                      </tr>
                    </table>
                </logic:empty>
						  </td>
				     </tr>
						 <tr>
               <td class="CformAreaBotones" height="35">
                 <div align="right">
                    <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
                 </div>
               </td>
             </tr>
           </table>
         </td>
       </tr>
     </table>         
	</logic:notEqual>
</html:form>  
 