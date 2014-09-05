<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<html>
<head>
<TITLE><tiles:getAsString name="title"/></TITLE>
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)">
<LINK rel="stylesheet" href="./styles/barra.css" type="text/css" media="screen, print" >
<link rel="stylesheet" href="./styles/screen.css" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./styles/autocomplete.css" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./styles/form.css" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./styles/css/autosuggest_inquisitor.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/scriptaculous/jquery-1.7.2.min.js"></script>



</head>
  <body>

    <%-- include body --%>
	<table width="475">
          <%/*tr><td class="CformRowHeader"><tiles:getAsString name="title"/></td></tr*/%>
	<tr><td valign="top">
    <tiles:insert attribute="messages"/>
    <tiles:insert attribute="body"/>
	</td></tr>
	</table>


  </body>
</html>
