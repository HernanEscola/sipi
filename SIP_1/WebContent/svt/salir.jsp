<%@page import="conicet.apps.commons.users.providers.UserDataAccessorProvider"%>
<%@page import="conicet.apps.commons.users.access.impl.AuthUserDataAccessor"%>
<%@ page contentType="text/html;charset=iso-8859-1"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="ar.gov.conicet.commons.users.models.interfaces.*"%>
<%@ page import="ar.gov.conicet.commons.users.access.interfaces.*"%>
<%
	HttpSession sesion = request.getSession(true);

	IUsuarioObject usr = (IUsuarioObject) sesion.getAttribute("iUsuario");
	if (null != usr)
		((AuthUserDataAccessor)UserDataAccessorProvider.getUserDataAccesor()).retornarMenu(usr, request, response);
	try {
		sesion.invalidate();
	} catch (IllegalStateException ex) {
	}
%>
<html>
<head>
<title>Vinculación Tecnológica</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="Refresh" CONTENT="1;URL=/auth/index.jsp">
</head>

<body background="imagenes/fondo2.gif" text="#000000" marginwidth="0" marginheight="0" topmargin="0">
	<table width="770" cellpadding="0" cellspacing="0" height="100%">
		<tr>
			<td height="100%">
				<table width="400" align="center" cellpadding="0" cellspacing="0" bgcolor="#EDEEF3" height="100%">
					<tr>
						<td align="center" valign="middle">
							<p>
								<font face="Verdana, Arial, Helvetica, sans-serif" size="5"> Gracias por usar SVT </font>
							</p>
						</td>
					</tr>
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="/auth/index.jsp" class="salir">Volver a la página inicial </a></strong></font></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
