<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:errors/>
<html:messages id="msg" message="true" header="messages.header" footer="messages.footer">
  <li><bean:write name="msg"/></li>
</html:messages>
