package conicet.apps.svt.util;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.svt.object.bitacora.CBitacora;
import conicet.apps.svt.object.bitacora.ETipoBitacora;
import conicet.apps.svt.object.bitacoraElemento.CBitacoraElemento;
import conicet.apps.svt.rol.interfaces.IRolBase;
import conicet.apps.svt.web.bitacora.decorator.CBitacoraElementoWrapperBean;
import conicet.framework.error.CException;

public class CBitacoraManager {
  private HttpSession session;
  private CBitacora bitacora;
  private List<CBitacoraElemento> bitacoraElementos =new LinkedList<CBitacoraElemento>();
  private String accion = MOSTRAR_RECIENTES;
  private static final int cantElementos = 5;
  public static final String MOSTRAR_RECIENTES = "mostrarRecientes";
  public static final String MOSTRAR_TODOS = "mostrarTodos";
  public static final String MOSTRAR_DETALLE = "mostrarDetalle";
  private List elementosMostrar = new LinkedList();
  private boolean todosVisibles = false;
  private boolean hayMas = false;
  private int detalleIndex = -1;
  private CBitacoraElementoWrapperBean detalle = null;
  private String visibilidadDefault ="-1";
  
  public String getVisibilidadDefault() {
	return visibilidadDefault;
  }


  public void setVisibilidadDefault(String visibilidadDefault) {
	this.visibilidadDefault = visibilidadDefault;
  }




public void setSession(HttpSession session) {
    this.session = session;
  }


public void setBitacora(CBitacora bitacora, List<CBitacoraElemento> bitacoraElementos) {
    this.bitacora = bitacora;
	this.bitacoraElementos= bitacoraElementos;

	this.actualizarEstado();
}


// REPROGRAMAR
	public void setBitacora(CBitacora bitacora) {
	    this.bitacora = bitacora;
	    this.actualizarEstado();
  }

  public void setAccion(String accion) {
	    this.accion = accion;
	    this.actualizarEstado();
  }
  


  private void actualizarEstado() {
	  IUsuarioObject usr = (IUsuarioObject) this.session.getAttribute("iUsuario");
	    if (MOSTRAR_TODOS.equals(this.getAccion())) {
	      this.setTodosVisibles(true);
	    }
	    else {
	      this.setTodosVisibles(false);
	    }
	    if (!MOSTRAR_DETALLE.equals(this.getAccion())) {
	      this.setDetalleIndex( -1);
	    }
	    this.recargarElementos(usr);
	  }


  public void setElementosMostrar(List elementosMostrar) {
    this.elementosMostrar = elementosMostrar;
  }

  public void setTodosVisibles(boolean todosVisibles) {
    this.todosVisibles = todosVisibles;
  }

  public void setHayMas(boolean hayMas) {
    this.hayMas = hayMas;
  }

  public void setDetalleIndex(int detalleIndex) {
    this.detalleIndex = detalleIndex;
    this.recargarDetalle();
  }

  public HttpSession getSession() {
    return session;
  }

  public CBitacora getBitacora() {
    return bitacora;
  }

  public String getAccion() {
    return accion;
  }

  public int getCantElementos() {
    return cantElementos;
  }

  public List getElementosMostrar() {
    return elementosMostrar;
  }

  public boolean isTodosVisibles() {
    return todosVisibles;
  }

  public int getDetalleIndex() {
    return detalleIndex;
  }

  public CBitacoraElementoWrapperBean getDetalle() {
    return detalle;
  }

  public boolean hayMas() {
    return hayMas;
  }

  public static CBitacoraManager getInstance(HttpServletRequest request) {
	    HttpSession session = request.getSession(true);
	    CBitacoraManager bitacoraManager = (CBitacoraManager)session.getAttribute("bitacoraManager");
	    if (bitacoraManager != null) {
	      return bitacoraManager;
	    } else {
	      bitacoraManager= new CBitacoraManager(request);
	      bitacoraManager.setVisibilidadDefault("-1");
	      session.setAttribute("bitacoraManager",bitacoraManager);
	      return bitacoraManager;
	    }
  }
  
  public static CBitacoraManager getInstance(HttpServletRequest request,CBitacora bitacora,ETipoBitacora tipoBitacora) throws CException {
	    HttpSession session = request.getSession(true);
	    CBitacoraManager bitacoraManager = (CBitacoraManager)session.getAttribute("bitacoraManager");

		IUsuarioObject usr = (IUsuarioObject) session.getAttribute("iUsuario");
		IRolBase iRol = (IRolBase)session.getAttribute("iRol");
		
	    if (bitacoraManager != null) {
	    	bitacoraManager.setBitacora(bitacora,iRol.findElementosBitacoraByRolTipo(bitacora,tipoBitacora,usr));
	    	bitacoraManager.setVisibilidadDefault("-1");
	    	return bitacoraManager;
	    } else {
	      bitacoraManager= new CBitacoraManager(request);
	      bitacoraManager.setVisibilidadDefault("-1");
	      session.setAttribute("bitacoraManager",bitacoraManager);
	      bitacoraManager.setBitacora(bitacora,iRol.findElementosBitacoraByRolTipo(bitacora,tipoBitacora,usr));
	      return bitacoraManager;
	    }
	  } 

  public static CBitacoraManager getInstance(HttpServletRequest request,CBitacora bitacora,ETipoBitacora tipoBitacora,String tipoVisibilidadDefault ) throws CException {
	    HttpSession session = request.getSession(true);
	    CBitacoraManager bitacoraManager = (CBitacoraManager)session.getAttribute("bitacoraManager");

		IUsuarioObject usr = (IUsuarioObject) session.getAttribute("iUsuario");
		IRolBase iRol = (IRolBase)session.getAttribute("iRol");
		
	    if (bitacoraManager != null) {
	    	bitacoraManager.setBitacora(bitacora,iRol.findElementosBitacoraByRolTipo(bitacora,tipoBitacora,usr));
	    	bitacoraManager.setVisibilidadDefault(tipoVisibilidadDefault);
	    	return bitacoraManager;
	    } else {
	      bitacoraManager= new CBitacoraManager(request);
	      session.setAttribute("bitacoraManager",bitacoraManager);
	      bitacoraManager.setBitacora(bitacora,iRol.findElementosBitacoraByRolTipo(bitacora,tipoBitacora,usr));
	      bitacoraManager.setVisibilidadDefault(tipoVisibilidadDefault);
	      return bitacoraManager;
	    }
	  } 
  private void recargarElementos(IUsuarioObject usr) {
	    int cant = 0;
	    
	   
	    this.elementosMostrar = new LinkedList();
	    Iterator iter;
	    if (this.bitacora!=null){
	    	for (iter = CBitacoraElementoWrapperBean.ordenarByHora(this.getBitacoraElementos()).iterator();
			         iter.hasNext() &&
			         ( cant++ < this.getCantElementos() || this.elementosMostrar.size()<this.getCantElementos() || this.isTodosVisibles()); ) {
			      CBitacoraElemento elemento = (CBitacoraElemento) iter.next();
			        this.elementosMostrar.add(new CBitacoraElementoWrapperBean(elemento));
			        this.setHayMas(!this.isTodosVisibles() && iter.hasNext());
	    	}
	    }
  }
			      
			      
			      
			      
	    	
	    	
	/*    	for (iter = CBitacoraElementoWrapperBean.ordenarByHora(this.bitacora.
		        getElementos()).iterator();
		         iter.hasNext() &&
		         ( cant++ < this.getCantElementos() || this.elementosMostrar.size()<this.getCantElementos() || this.isTodosVisibles()); ) {
		      CBitacoraElemento elemento = (CBitacoraElemento) iter.next();
	
		      
		      if (elemento.getVisible().equalsIgnoreCase("todos")) {
		        this.elementosMostrar.add(new CBitacoraElementoWrapperBean(
		            elemento));
		      }
		      
		     
		      if (elemento.getVisible().equalsIgnoreCase("rol")) {
		    		  
			    	if (elemento.getBitacora().getTipo().equals(ETipoBitacora.INSTRUMENTO) ){
				    	// LOS COMENTARIOS CARGADOS POR DVJ O DVH LOS VEN ELLOS, Y NO LOS USUARIOS ACO Y CCO 
		    			if ( (elemento.getUsuarioRol().substring(0,2)).equalsIgnoreCase("DV") && usr.getMainRol().substring(0,2).equalsIgnoreCase("DV")){
					    			this.elementosMostrar.add(new CBitacoraElementoWrapperBean(elemento));
					    	// LOS COMENTARIOS CARGADOS POR ACO Y CCO LOS VEN ELLOS, PERO NO LOS VEN LOS DV
		    			} else if (elemento.getUsuarioRol().equalsIgnoreCase("ACO") ||  elemento.getUsuarioRol().equalsIgnoreCase("CCO")){
					    		if (usr.getMainRol().equalsIgnoreCase("ACO") || usr.getMainRol().equalsIgnoreCase("CCO")){
					    			this.elementosMostrar.add(new CBitacoraElementoWrapperBean(elemento));
					    		}
				    	}
			    	}else {
			           if ( (!usr.getMainRol().equalsIgnoreCase("DVC"))  && (elemento.getUsuarioRol().substring(0,2)).equalsIgnoreCase(usr.getMainRol().substring(0,2)) ) {
			        	   this.elementosMostrar.add(new CBitacoraElementoWrapperBean(elemento));
			           }
			    	}
		      }	

		    
		      if (elemento.getVisible().equalsIgnoreCase("modulo") && elemento.getUsuarioAplicacion().equalsIgnoreCase(getAttribute(EUsuarioObjectAttr.APLICACION.name()).toString())) {
		        this.elementosMostrar.add(new CBitacoraElementoWrapperBean( elemento));
		      }
		      
		    
		      this.setHayMas(!this.isTodosVisibles() && iter.hasNext());
		    }
	    }	    
	   
	    
	  }
  */
  
  
  
  public CBitacoraManager(HttpServletRequest request) {
    this.session = request.getSession(true);
  }

  private void recargarDetalle() {
    if (this.getDetalleIndex() != -1){
      this.detalle = (CBitacoraElementoWrapperBean) this.getElementosMostrar().get(this.getDetalleIndex());
    } else {
      this.detalle = null;
    }
  }


public void setBitacoraElementos(List<CBitacoraElemento> bitacoraElementos) {
	this.bitacoraElementos = bitacoraElementos;
}


public List<CBitacoraElemento> getBitacoraElementos() {
	return bitacoraElementos;
}


}
