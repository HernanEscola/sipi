package conicet.apps.svt.web.dispatcher.form;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import conicet.apps.svt.util.valida.CManejadorErrorSVT;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.framework.error.CException;

public abstract class CSeleccionarActionForm<T> extends CDispatchActionForm<T> {
		/**
		 *
		 */

	private static final long serialVersionUID = 1L;
		private String descripcionSeleccionar;
		private List asignados = new LinkedList();
		private List noAsignados = new LinkedList();
		private List aAsignar = new LinkedList();
		private List aDesasignar = new LinkedList();
		private String volver; //Este String lo uso para volver al action que hizo la llamada a este otro
		private Object elementoSeleccionado;

		public String getDescripcionSeleccionar() {
			return descripcionSeleccionar;
		}
		public void setDescripcionSeleccionar(String descripcionSeleccionar) {
			this.descripcionSeleccionar = descripcionSeleccionar;
		}
		public List getAsignados() {
			return asignados;
		}
		public void setAsignados(List asignados) {
			this.asignados = asignados;
		}
		public List getNoAsignados() {
			return noAsignados;
		}
		public void setNoAsignados(List noAsignados) {
			this.noAsignados = noAsignados;
		}
		public List getaAsignar() {
			return aAsignar;
		}
		public void setaAsignar(List aAsignar) {
			this.aAsignar = aAsignar;
		}
		public List getaDesasignar() {
			return aDesasignar;
		}
		public void setaDesasignar(List aDesasignar) {
			this.aDesasignar = aDesasignar;
		}
		public String getVolver() {
			return volver;
		}
		public void setVolver(String volver) {
			this.volver = volver;
		}


		protected abstract String buscarIdObjeto(Object o);
		 // debe devolver id del objeto buscado ((castear a objeto)o).getId().toString();

		public void setElementoAsignadoSeleccionadoIndex(String key, String value){
			 for (@SuppressWarnings("rawtypes")
			Iterator iter = this.asignados.iterator(); iter.hasNext(); ) {
			      Object o = iter.next();
			      if (key.equals(buscarIdObjeto(o))){
						this.setElementoSeleccionado(o);
			      }
			 }
			this.setBtnSubmit("detalle");
		}

		public void setElementoAsignarSeleccionadoIndex(String key, String value){
			 for (Iterator iter = this.noAsignados.iterator(); iter.hasNext(); ) {
			      Object o = iter.next();
			      if (key.equals(buscarIdObjeto(o))){
						this.setElementoSeleccionado(o);
			      }
			    }
			this.setBtnSubmit("detalle");
		}


		public void setAsignarMapped(String key, String value){
			    for (Iterator iter = this.noAsignados.iterator(); iter.hasNext(); ) {
			      Object o = iter.next();
			      if (key.equals(buscarIdObjeto(o))){
			        if(!this.aAsignar.contains(o)){
			          this.aAsignar.add(o);
			        }
			      }
			    }
			  }

		public void setDesasignarMapped(String key, String value){
			    for (Iterator iter = this.asignados.iterator(); iter.hasNext(); ) {
			    	Object o = iter.next();
			      if (key.equals(buscarIdObjeto(o))){
			        this.aDesasignar.add(o);
			      }
			    }
			  }

		public String getAsignarMapped(String key){
			    for (Iterator iter = this.aAsignar.iterator(); iter.hasNext(); ) {
			    	Object o = iter.next();
			      if (key.equals(buscarIdObjeto(o))){
			        return buscarIdObjeto(o);
			      }
			    }
			    return null;
			  }

		public String getDesasignarMapped(String key){
			    for (Iterator iter = this.aDesasignar.iterator(); iter.hasNext(); ) {
			    	Object o = iter.next();
			      if (key.equals(buscarIdObjeto(o))){
			        return buscarIdObjeto(o);
			      }
			    }
			    return null;
			  }

		public void asignar() {
			    for (Iterator iter = aAsignar.iterator(); iter.hasNext(); ) {
			    	Object o = iter.next();
			      this.getNoAsignados().remove(o);
			      if (!yaFueSeleccionado(o)){
			        this.getAsignados().add(o);
			      }
			    }
			    aAsignar.clear();
			  }

		public void desasignar() {
			    for (Iterator iter = aDesasignar.iterator(); iter.hasNext(); ) {
			    	Object o = iter.next();
			      this.getAsignados().remove(o);
			      this.getNoAsignados().add(o);
			    }
			    aDesasignar.clear();
			  }

		private boolean yaFueSeleccionado(Object cp){
			    for (Iterator iter = this.asignados.iterator(); iter.hasNext(); ) {
			    	Object o = iter.next();
			      if (buscarIdObjeto(o).equalsIgnoreCase(buscarIdObjeto(cp))){
			        return true;
			      }
			    }
			    return false;
		}

		protected boolean yaFueDeseleccionado(Object cp){
		    for (Iterator iter = this.noAsignados.iterator(); iter.hasNext(); ) {
		    	Object o = iter.next();
		      if (buscarIdObjeto(o).equalsIgnoreCase(buscarIdObjeto(cp))){
		        return true;
		      }
		    }
		    return false;
	}



		@Override
		public void clear() {
			    this.descripcionSeleccionar = "";
			    this.aDesasignar.clear();
			    this.asignados.clear();
			    this.noAsignados.clear();
			    this.aAsignar.clear();
		}


		private List<CBoton> botones = new LinkedList<CBoton>();


		@Override
		public List<CBoton> getBotones() {
			return botones;
		}

		@Override
		public void setBotones(List<CBoton> botones) {
			this.botones = botones;
		}

		@Override
		public ActionErrors validate(ActionMapping actionMapping,
				HttpServletRequest httpServletRequest) {
			ActionErrors ae = new ActionErrors();
			ActionMessages am = new ActionMessages();
			if (this.getBtnSubmit()!=null && "Buscar".equalsIgnoreCase(this.getBtnSubmit()) ){
				try {
					this.validarFields(ae, am, new CManejadorErrorSVT());
				} catch (CException ex) {
					ae.add("seleccionar", new ActionMessage(ex.getMessage()));
					ex.printStackTrace();
				}
			}
			return ae;
		}
		public void setElementoSeleccionado(Object elementoSeleccionado) {
			this.elementoSeleccionado = elementoSeleccionado;
		}
		public Object getElementoSeleccionado() {
			return elementoSeleccionado;
		}


}
