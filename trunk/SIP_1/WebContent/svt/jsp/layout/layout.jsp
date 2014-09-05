<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/conicet-application-tags.tld"
	prefix="capplication"%>
<%@ taglib uri="/WEB-INF/conicet-applicationNew-tags.tld"
	prefix="capplicationNew"%>
<%@ taglib uri="/WEB-INF/conicet-rol-tags.tld" prefix="crol"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://www.conicet.gov.ar/tags/resources"
	prefix="resourceVersion"%>

<html>
<head>
<title><tiles:getAsString name="title" /></title>
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)" />

<link rel="stylesheet" href="./styles/redmond/jquery-ui-1.10.1.custom.css?<resourceVersion:version
virtualPath='/styles/redmond/jquery-ui-1.10.1.custom.css'/>" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./imagenes/barra.css?<resourceVersion:version
virtualPath='/imagenes/barra.css'/>" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./styles/screen.css?<resourceVersion:version
virtualPath='/styles/screen.css'/>" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./styles/form.css?<resourceVersion:version
virtualPath='/styles/form.css'/>" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./styles/accordion.css?<resourceVersion:version
virtualPath='/styles/accordion.css'/>" type="text/css" media="screen" />

<link rel="stylesheet" href="./styles/estilo_menu_svt.css?<resourceVersion:version
virtualPath='/styles/estilo_menu_svt.css'/>" type="text/css" media="screen" />

<!--link rel="stylesheet" href="./styles/redmond/jquery-ui-1.8.20.custom.css" type="text/css" media="screen, print" /-->
<link rel="stylesheet" href="./styles/jquery.multiselect.css?<resourceVersion:version
virtualPath='/styles/jquery.multiselect.css'/>" type="text/css" media="screen, print" />
<!-- link rel="stylesheet" href="./styles/overwrite-jquery-ui.css?<resourceVersion:version
virtualPath='/styles/overwrite-jquery-ui.css'/>" type="text/css" media="screen, print" /-->

<script type="text/javascript" src="./js/scriptaculous/jquery-1.7.2.min.js?<resourceVersion:version
virtualPath='/js/scriptaculous/jquery-1.7.2.min.js'/>"></script>
<script type="text/javascript" src="./js/generalScript.js?<resourceVersion:version
virtualPath='/js/generalScript.js'/>">
</script>

<logic:notEmpty name="hojaEstilosSector" scope="session">
	<link rel="stylesheet" href="./styles/<%=request.getSession(true).getAttribute("hojaEstilosSector")%>.css?<resourceVersion:version
	virtualPath='/styles/<%=request.getSession(true).getAttribute("hojaEstilosSector")%>.css'/>" type="text/css" media="screen" />
</logic:notEmpty>


<jsp:include page="/jsp/layout/timer.jsp" />


<script type="text/javascript">
   $("#contenido").ready(function() {
	   setTimeout('doRewrite()', 1000);
	   resetTimeOut();
   });
</script>

</head>

<style type="text/css">
body {
	background: none repeat scroll 0 0 white;
	color: #000000;
	font: 76% 'Lucida Sans Unicode', verdana, helvetica, sans-serif;
	margin: 0;
	min-width: 1024px;
	width: auto;
	padding: 0;
}
</style>

<body>
	<div id="coni_header">
		<tiles:insert attribute="include" />
		<tiles:insert attribute="header" />
		<tiles:insert attribute="menu" />
	</div>
	<div align="right" id="timer">
		Tiempo Restante:<b>--:--</b>
	</div>
	<center>
		<div id="coni_container" align="center">
			<tiles:insert attribute="messages" />
			<tiles:insert attribute="body" />
		</div>
		<div id="coni_footer">
			<tiles:insert attribute="footer" />
			<tiles:insert attribute="loger" />
		</div>
	</center>
</body>

</html>
