<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">Selecci&oacute;n de  Contratantes</h1>

<html:form action="cContactoSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>


<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="650">
  <tr >
    <td class="CformRowHeader" colspan="10">&nbsp;  Contratante</td>
  </tr>
  <tr>
    <td width="100%">
       <table align="center" width="100%" bgcolor="efefef">
		<tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td width="10" rowspan="100"></td>
          <td width="100%">
            <table width="100%" cellpadding="2" cellspacing="2" >	         
			          <tr >
			            <td class="CformNombreGris" width="150" height="30">  
							Nombre / Razón Social:&nbsp;
						</td>
						<td >            
			           	<html:text property="contratanteDescripcion"/> 
			           	</td>         	
			          </tr>
			          <tr >
			            <td class="CformNombreGris" width="100" height="30">
			              Cuit:&nbsp; 
						</td>
						<td>   
							<html:text property="cuitBusqueda"/>    
			            </td>
			          </tr>
			          <tr >
			            <td class="CformNombreGris" width="100" height="30">
			              DNI:&nbsp; 
						</td>
						<td>            
			                <html:text property="documentoBusqueda" maxlength="9" size="10" styleId="DocBusqueda" style="text-align:right" /> 
			            </td>
			          </tr>
			          <tr >
			            <td class="CformNombreGris" width="100" height="30">
							Contacto:&nbsp;
						</td>
						<td >            
			           		<html:text property="contactoDescripcion"/> 
			           	</td>         	
			          </tr>
			          <tr>
				            <td colspan="10"  height="30">
				              <div align="right">
				                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
				                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
				              </div>
				            </td>
			          </tr>
			</table>          
      	</td>
      </tr>
      </table>
      </td>
      </tr>
      
      <tr>
      	<td>
	      <table align="center" width="100%">
	          
	          
	          <tr>
	            <td colspan="10"  align="center" class="headTabla">Contratantes Asignados</td>
	          </tr>
	          <tr>
	            <td colspan="10" width="100%">
	              <display:table name="sessionScope.cContactoSeleccionarActionForm.asignados" decorator="conicet.apps.svt.web.contratante.decorator.CContactoDisplayWrapper" style="width: 100%">
                <display:column property="codigo" title="Código" maxLength="30" headerClass="tableCellHeader" style="width: 100px"/>
	                <display:column property="nombreRazon" title="Nombre o Razón Social" maxLength="30" headerClass="tableCellHeader" style="width: 160px"/>
	                <display:column property="cuit" title="Cuit / Doc" headerClass="tableCellHeader" style="width: 90px"/>
                <display:column property="contacto" title="Contacto" headerClass="tableCellHeader"/>
                <display:column property="entidad" title="Entidad" headerClass="tableCellHeader"/>
                <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" style="width: 25px"/>
	              </display:table>
	            </td>
	          </tr>
	          <tr>
	            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
	              <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton"/>
	            </div></td>
	          </tr>
	       </table>
      </td>
    </tr>
    <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="10" align="center" class="headTabla">Contratantes No Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table name="sessionScope.cContactoSeleccionarActionForm.noAsignados" decorator="conicet.apps.svt.web.contratante.decorator.CContactoDisplayWrapper" style="width: 100%">
                <display:column property="codigo" title="Código" maxLength="30" headerClass="tableCellHeader" style="width: 100px"/>
                <display:column property="nombreRazon" title="Nombre o Razón Social" maxLength="30" headerClass="tableCellHeader" style="width: 160px"/>
                <display:column property="cuit" title="Cuit / Doc" headerClass="tableCellHeader" style="width: 90px"/>
                <display:column property="contacto" title="Contacto" headerClass="tableCellHeader"/>
                <display:column property="entidad" title="Entidad" headerClass="tableCellHeader"/>
                <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" style="width: 25px"/>
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
            <td colspan="10" class="CformAreaBotones" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
            </div></td>
          </tr>
</table>

</html:form>
