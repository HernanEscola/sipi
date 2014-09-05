<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">Eliminar Cuenta </h1>
<html:form action="cCuentaEliminarAction.do" method="POST">

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
   <tr height="25">
   <td class="CformRowHeader" colspan="11"> &nbsp;  Cuenta </td>
   </tr>
  <tr height="25">
    <td align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar la Cuenta, presione 'Grabar' para confirmar</b>
    </td>
  </tr>

   <tr>
   	<td >
             <table >
			  <tr>
				<td colspan="2"></td>
                                <td class="CformNombre">Tipo:&nbsp;</td>
			    	<td class="CformDato">
			        <html:select disabled="true" property="tipoCuenta" >
	 			<html:options collection="comboTipoCuenta" property="value" labelProperty="label"/>
			        </html:select><html:hidden property="tipoCuenta"/>
		            	</td>
				<td class="CformNombre" >Número:&nbsp;</td>
				<td class="CformDato"><bean:write name="cCuentaEliminarActionForm" property="cuentaNro"/><html:hidden property="cuentaNro"/></td>
			  </tr>
        		<tr>
				<td colspan="2"></td>
				<td class="CformNombre">Banco:&nbsp;</td>
				<td class="CformDato"><bean:write name="cCuentaEliminarActionForm" property="banco"/><html:hidden property="banco"/></td>
				<td class="CformNombre">Sucursal:&nbsp;&nbsp;</td>
				<td class="CformDato"><bean:write name="cCuentaEliminarActionForm" property="sucursal"/><html:hidden property="sucursal"/></td>
		     	</tr>

                    	<tr>
				<td colspan="2"></td>
			 	<td class="CformNombre">F.Inicio:&nbsp;</td>
				<td class="CformDato">
				 <bean:write name="cCuentaEliminarActionForm" property="fechaInicio"/>
	                        </td>
			 	<td class="CformNombre">F.Cierre:&nbsp;</td>
				<td class="CformDato"><bean:write name="cCuentaEliminarActionForm" property="fechaCierre"/></td>
 		    	</tr>

		       	<tr>
				<td colspan="2"></td>
  				<td class="CformNombre" width="80">UVT:&nbsp;</td>
			    	<td class="CformDato">
			        	<html:select disabled="true" property="gestor" >
	 				<html:options collection="comboGestor" property="value" labelProperty="label"/>
				        </html:select>
				</td>
		     	</tr>
		      </table>
	</td>
   </tr>
<tr>
      <td >
          <table>
		       	<tr>
				<td class="CformNombre"  width="80">Desc.Corta:&nbsp;</td>
				<td class="CformDato" ><bean:write name="cCuentaEliminarActionForm" property="descCorta" /></td>
	               	</tr>

			<tr>
	                       <td class="CformNombre"  width="80">Denominación:&nbsp;</td>
				<td class="CformDato" ><bean:write name="cCuentaEliminarActionForm" property="denominacion"/></td>
	        	</tr>


		       	<tr>
				<td class="CformNombre"  width="80" >Desc. Larga:&nbsp;</td>
				<td class="CformDato" ><bean:write name="cCuentaEliminarActionForm" property="descLarga"/></td>

	               	</tr>


	</table>
   </td>
</tr>


<tr>
      <td >
          <table>
		<tr>
	<td width="350" class="CformAreaBotones" >
	</td>
	<td class="CformAreaBotones" height="35" align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
	</td>

		</tr>

	</table>
    </td>
</tr>
</table>
</html:form>
