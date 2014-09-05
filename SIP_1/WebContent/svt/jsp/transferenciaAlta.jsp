<%@include file="layout/include.jsp"%>
<%@ page import= "conicet.apps.svt.object.gestor.*"%>

 <!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
  
<script type="text/javascript">

function seleccionar()
{	
	var select = $("#tipoTransferencia").val();
	
	if(select == "-1" || select == "-2")
	{
		$("#error").show();
	}
	else
	{
		window.location = select;
	}
}

</script>

<div id="error" style="display: none;">
	<font color="red" size="2" face="Arial, Helvetica, sans-serif">
		<strong>Errores encontrados</strong>
	</font>
	<ul>
		<li>El tipo es necesario/a.</li>
	</ul>
</div>

<br>
<h1 align="center" class="titulo">Registro de Transferencia</h1>

<div id="datos">

	  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	             <tr>
	               <td>
	                 <table align="center" cellpadding="0" cellspacing="0" width="100%" >
	                   <tr>
	                     <td>
		                     <div id="campos">
		                       <table width="100%" cellpadding="2" cellspacing="2">
		                       
		                         <tr bgcolor="#DDEEFF" >
		                           <td colspan="2" width="100%">Transferencia</td>
		                         </tr>
		                         <tr>
		                         <%String input = "";
		                         if(request.getAttribute("input")!=null){
		                         		input = "&input="+request.getAttribute("input");
		                         		}
		                         		%>
		                           <td class="CformNombre" >Tipo: <span class="dato_obligatorio">*</span></td>
		                           <%CUvt uvt = (CUvt)request.getSession().getAttribute("gestor");%>
		                           <td class="CformDato" >
			                          <select id="tipoTransferencia">
			                          <option value="-1">Seleccionar</option>
			                          <option value="-2">-----------</option>
			                          <%if(uvt != null && !uvt.getTipoUvt().equals(ETipoUvt.P) ){%>
				                          <option value="cTransferenciaComisionAltaAction.do?method=init&tipoTransferencia=CC<%=input%>">Comisión Conicet</option>
				                          <option value="cTransferenciaComisionAltaAction.do?method=init&tipoTransferencia=CUP<%=input%>">Comisión Uvt Propia</option>
				                          <%if(uvt != null && uvt.getTipoUvt().equals(ETipoUvt.D) ){%>
				                          	<option value="cTransferenciaComisionAltaAction.do?method=init&tipoTransferencia=CU<%=input%>">Comisión Uvt</option>
				                          <%}%> 
			
				                          <option value="cTransferenciaContraparteAltaAction.do?method=init<%=input%>">Contraparte</option>
				                          <option value="cTransferenciaUDAltaAction.do?method=init<%=input%>">Prestador</option>
			                          <%}%>
			                          <option value="cTransferenciaProductividadAltaAction.do?method=init&tipoTransferencia=PR<%=input%>">Productividad</option>
			                          <option value="cTransferenciaProductividadAltaAction.do?method=init&tipoTransferencia=PRP<%=input%>">Productividad Pendiente</option>		                      
			                          </select>
			                    	</td>
		                         </tr>		                
		                     </table>
		                   </div>     
	                    </td>
	                  </tr>
	               </table>
			          </td>
			        </tr>
			  <tr>
		      <td class="CformAreaBotones" height="35">
		      <span class="dato_obligatorio">* Datos obligatorios</span>
		        <div align="right">
		          <button id="boton" class="CformBoton" onclick="seleccionar()"
							 type="button">Siguiente</button>
		        </div>
		      </td>
		    </tr>
			</table>
			 

</div>