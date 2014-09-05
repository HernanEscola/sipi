<%@page import="ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject"%>
<%@ page contentType="text/html;charset=iso-8859-1"%>
<%@ page import= "java.util.*
        ,java.math.*
        ,java.sql.*
        ,conicet.framework.util.*
        ,conicet.framework.web.*
        ,java.util.List" %>
        
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ taglib uri="/WEB-INF/conicet-security-tags.tld" prefix="csecurity" %>
<%@ taglib uri="/WEB-INF/conicet-application-tags.tld" prefix="capplication" %>
<%@ taglib uri="/WEB-INF/conicet-applicationNew-tags.tld" prefix="capplicationNew" %>
<%@ taglib uri="/WEB-INF/conicet-tipoEntidad-tags.tld" prefix="ctipoEntidad" %>
<%@ taglib uri="/WEB-INF/conicet-visibilidad-tags.tld" prefix="cvisibilidad" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-layout.tld" prefix="layout" %>

<%
response.setHeader("Pragma","No-Cache");
response.setDateHeader("Expires",0);
response.setHeader("Cache-Control","no-Cache");

  HttpSession sesion = request.getSession(true);
  
  IUsuarioObject usuario = (IUsuarioObject) sesion.getAttribute("iUsuario");
  if(usuario==null)  {
  	pageContext.forward("/salir.jsp");
  }
%>
