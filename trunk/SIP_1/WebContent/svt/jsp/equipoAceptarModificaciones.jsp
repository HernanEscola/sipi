<%@include file="layout/include.jsp"%>


<br>
<h1 align="center" class="titulo"><bean:write name="cEquipoAceptarModificacionesActionForm" property="titulo"/></h1>
<html:form action="cEquipoAceptarModificacionesAction.do" method="POST">

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="615">
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
         <tr>
         <td colspan="100%">
            <table width="100%">
               <tr bgcolor="#DDEEFF">
                 <logic:empty name="cEquipoAceptarModificacionesActionForm" property="equipoNuevo">
                    <td>Equipamiento&nbsp;</td>
                 </logic:empty> 
                </tr>

              <tr bgcolor="#DDEEFF">
                 <logic:notEmpty name="cEquipoAceptarModificacionesActionForm" property="equipoNuevo">
                    <td>Equipamiento Original&nbsp;</td>
                 </logic:notEmpty> 
                </tr>
            </table>
            <table>
             <tr>
                <td class="CformNombre" width="130">Descripción:</td>
                <td class="CformDato">
                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="descripcion(original)"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Marca:</td>
                <td class="CformDato">
                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="marca(original)"/>
                </td>
                </tr>
                <tr>
                <td class="CformNombre" width="130">Modelo:</td>
                <td class="CformDato">
                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="modelo(original)"/>
                </td>
              </tr>
              <tr>
                 <td class="CformNombre" width="130">Año:</td>
                  <td class="CformDato">
                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="anio(original)"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Propietario:</td>
                <td class="CformDato">
                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="propietario(original)"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Patrimonio&nbsp;Nro:</td>
                <td class="CformDato">
                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="nroPatrimonio(original)"/>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      
       
        
        <logic:notEmpty name="cEquipoAceptarModificacionesActionForm" property="equipoNuevo" >
          <tr>
	         <td colspan="100%">
	            <table width="100%">
	              <tr bgcolor="#DDEEFF">
                    <td>Equipamiento Modificado&nbsp;</td>
	                </tr>
	            </table>
	            <table>
	             <tr>
	                <td class="CformNombre" width="130">Descripción:</td>
	                <td class="CformDato">
	                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="descripcion(nuevo)"/>
	                </td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="130">Marca:</td>
	                <td class="CformDato">
	                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="marca(nuevo)"/>
	                </td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="130">Modelo:</td>
	                <td class="CformDato">
	                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="modelo(nuevo)"/>
	                </td>
	              </tr>
	              <tr>
	                 <td class="CformNombre" width="130">Año:</td>
	                  <td class="CformDato">
	                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="anio(nuevo)"/>
	                </td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="130">Propietario:</td>
	                <td class="CformDato">
	                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="propietario(nuevo)"/>
	                </td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="130">Patrimonio&nbsp;Nro:</td>
	                <td class="CformDato">
	                  <bean:write name="cEquipoAceptarModificacionesActionForm" property="nroPatrimonio(nuevo)"/>
	                </td>
	              </tr>
	            </table>
	          </td>
	        </tr>
	       
           
          
        </logic:notEmpty>
          
        <tr>
	        <td class="CformAreaBotones" height="35">
	          <div align="right">
	          
	          	<logic:notEqual value="aceptado" property="estado" name="cEquipoAceptarModificacionesActionForm">
              	<html:submit property="btnSubmit" styleClass="CformBoton" value="Aceptar" />
            	</logic:notEqual>
            	<logic:notEqual value="rechazado" property="estado" name="cEquipoAceptarModificacionesActionForm">
              	<html:submit property="btnSubmit" styleClass="CformBoton" value="Rechazar" />
            	</logic:notEqual>
	          
	             <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
	          </div>
	        </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

</html:form>
