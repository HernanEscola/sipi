<%@include file="/jsp/layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
	media="screen, print" />
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	

<bean:define id="sectorForm" name='<%=request.getParameter("sectorForm")%>' />


<html:hidden property="accion" styleId="accion" name="sectorForm" />


<div>

	<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="2">
				<table width="100%">
					<tr bgcolor="#DDEEFF">
						<td>Sector:&nbsp;</td>
					</tr>
				</table>
		<tr>
			<td height="10" colspan="10"></td>
		</tr>
		<tr>
			<td>
				<table width="100%" cellpadding="2" cellspacing="2">
									<tr>
						<td class="CformNombre">Descripción:<span class="dato_obligatorio">*</span></td>
						<td class="CformDato">
							<html:text property="descripcion" maxlength="255" size="60" styleId="descripcion"/>
						</td>
					</tr>
					
					<tr>
						<td class="CformNombre">Sigla:<span class="dato_obligatorio">*</span></td>
						<td class="CformDato">
							<html:text property="sigla" maxlength="30" size="60" styleId="sigla"/>
						</td>
					</tr>
					
					<tr>
                    	<td class="CformNombre" width="120">Estado:<span class="dato_obligatorio">*</span></td>
                    	<td class="CformDato">
                       		<html:select disabled="false" property="habilitado">
                        		<html:options collection="comboHabilitado" property="value" labelProperty="label" />
                      		</html:select>
                      	</td>
                    </tr>
					
					<tr>
						<td class="CformNombre">Email:<span class="dato_obligatorio">*</span></td>
						<td class="CformDato">
							<html:text property="email" maxlength="50" size="60" styleId="email"/>
						</td>
					</tr>
						
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td class="CformAreaBotones">
							<div align="left">
									<span class="dato_obligatorio">* Datos Obligatorios </span>
							 </div>
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value='<%=request.getParameter("sectorForm")%>' />
									<jsp:param name="entidad" value='sector' />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</div>