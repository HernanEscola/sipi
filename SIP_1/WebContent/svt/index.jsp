
<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@page import="conicet.apps.commons.users.providers.UsuarioObjectProvider"%>
<%@page import="ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject"%>
<%@page import="conicet.apps.svt.web.menu.CMenuGenerador"%>
<%@ page contentType="text/html;charset=iso-8859-1"%>
<%@ page import="conicet.apps.svt.service.CAdministracionService"%>
<%@ page import="conicet.apps.svt.service.CGestorService"%>

<%@ page import="conicet.apps.svt.object.gestor.CGestor"%>
<%@ page import="conicet.apps.svt.service.CUsuarioService"%>
<%@ page import="conicet.apps.svt.object.usuarioSvt.CUsuarioSvt"%>
<%@ page import="conicet.apps.svt.object.usuarioSvt.CUsuarioSvtGestor"%>
<%@ page import="conicet.apps.svt.object.usuarioSvt.CUsuarioSvtEntidad"%>
<%@ page import="conicet.framework.file.service.*"%>
<%@ page import="conicet.framework.file.object.configuracion.CConfiguracion"%>
<%@ page import="conicet.apps.svt.object.funcion.CFuncion"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="conicet.apps.svt.util.CProperty"%>

<%@page import="conicet.apps.svt.rol.factory.CRolFactory"%>
<%@page import="conicet.apps.svt.rol.interfaces.IRol"%>

<%
	IUsuarioObject usuario;
  HttpSession sesion = request.getSession(true);
  Object oUsuario = sesion.getAttribute("oUsuario");
  
  if(oUsuario==null)  {
	    pageContext.forward("salir.jsp");
	    return;
	  }
  usuario = UsuarioObjectProvider.getUsuarioObjectInitialized(oUsuario);
  sesion.setAttribute("iUsuario", usuario);
  String titulo = "Sistema de Vinculación Tecnológica";
  sesion.setAttribute("oTitulo",titulo);

  //obtengo y guardo en sesión la configuración para el sistema (dependiendo de que BD se trate la conf. cambia)
  CConfiguracion configuracion = conicet.framework.file.service.CAdministracionService.darConfiguracion();
  sesion.setAttribute("configuracion",configuracion);
  String nombreSistema = null;
  

 // if (usuario.getRol().equalsIgnoreCase("USR")) {
//	  usuario.setUobj(CAdministracionService.darFuncionesUsuarioMap(usuario));
//	  sesion.setAttribute("usuarioDescripcion", "");
 //  	  response.sendRedirect("./cGestorElegirAction.do?accion=ini");
	  
  if (usuario.getAttribute(EUsuarioObjectAttr.APLICACION.name()).toString().equalsIgnoreCase("SVA")||usuario.getAttribute(EUsuarioObjectAttr.APLICACION.name()).toString().equalsIgnoreCase("SPA")||usuario.getAttribute(EUsuarioObjectAttr.APLICACION.name()).toString().equalsIgnoreCase("SIUCO")){
	  //si la aplicación es alguna de auditoría, voy a elegir el usuario con el cual se quiere loggear.
      sesion.setAttribute("usuarioDescripcion", "");
	  response.sendRedirect("./cUsuarioElegirAction.do?accion=ini");
  } else {
	  CUsuarioSvt usuarioSVT = null;
	  List col = (List)CUsuarioService.findAllUsuariosSvtByUsuarioRegistrado(usuario, usuario.getMainRol());
	  if (col.isEmpty()) {
			pageContext.forward("salir.jsp");
			return;
	  } else if (col.size() == 1) {
  		 	 usuarioSVT = (CUsuarioSvt)col.iterator().next();
  		 	 //reemplazo el usuario que genera automaticamente el usuarioSvt por el q otorga Auth en Sesion que posee el rol
  		 	 usuarioSVT.setUsrRegistrado(usuario);
		  	 sesion.setAttribute("usuarioSVT",usuarioSVT);		  	

		  	 // si es uvt, dv, o usr (no puede ser prestador o cct en este index)
		     if (usuarioSVT.getTipoUsuario().getId().toString().equalsIgnoreCase("1")
	  		   ||usuarioSVT.getTipoUsuario().getId().toString().equalsIgnoreCase("2")
	  		   ||usuarioSVT.getTipoUsuario().getId().toString().equalsIgnoreCase("5")){
	    		 CUsuarioSvtGestor ug = (CUsuarioSvtGestor)usuarioSVT;
	    		 sesion.setAttribute("gestor",ug.getGestor());
	    		 IRol iRol = CRolFactory.getRolUsr(usuario.getMainRol(),ug.getGestor());
 	        	 sesion.setAttribute("iRol",iRol);	 
	  		

 	      	  
 	        	sesion.setAttribute("hojaEstilosSector", CProperty.getProperty("hojaEstilosSector" + ug.getGestor().getSigla(), ""));
 	    		
 	    		nombreSistema = CProperty.getProperty("nombreSistema" + ug.getGestor().getSigla());

	  		}
		     usuario.addAttribute(EUsuarioObjectAttr.FUNCIONES_ROL.name(), CAdministracionService.darFuncionesUsuarioMap(usuario));
  		   	/*@ se puede manejar los roles y sus destinos desde la administracion del sistema @*/
			sesion.setAttribute("usuarioDescripcion", CMenuGenerador.generarUsuarioDescripcionSVT(usuarioSVT));
  		   	response.sendRedirect("./index.do");
	  } else {
		  usuario.addAttribute(EUsuarioObjectAttr.FUNCIONES_ROL.name(), CAdministracionService.darFuncionesUsuarioMap(usuario));
			sesion.setAttribute("ListaUsuarios",col);
			sesion.setAttribute("usuarioDescripcion", "");
	   		response.sendRedirect("./cGestorElegirAction.do?accion=ini");
	  }
  }
  if (nombreSistema == null || nombreSistema.isEmpty()) {
      nombreSistema = CProperty.getProperty("nombreSistema");
  }
  sesion.setAttribute("nombreSistema", nombreSistema);
  
/* 	Collection<CFuncion> funciones = CUsuarioService.findFuncionesDeUnRol(usuario.getRol());
  	Map<String, CFuncion> funcionesMap = new HashMap<String, CFuncion>();
  	for (CFuncion funcion : funciones) {
  		funcionesMap.put(funcion.getFuncion(), funcion);
  	}
	sesion.setAttribute("funcionesMap", funcionesMap); */
	
	
%>