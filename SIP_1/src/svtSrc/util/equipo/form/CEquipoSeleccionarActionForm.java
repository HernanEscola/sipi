package conicet.apps.svt.web.equipo.form;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import conicet.apps.svt.object.equipo.CEquipo;


public class CEquipoSeleccionarActionForm extends ActionForm {
  public CEquipoSeleccionarActionForm() {
  }

  private String accion;
  private String btnSubmit;
  private String aDonde;
  private Collection asignados = new LinkedList();
  private Collection noAsignados = new LinkedList();
  private Collection aAsignar = new LinkedList();
  private Collection aDesasignar = new LinkedList();
  private String equipoDescripcion ;
  private Object elementoSeleccionado;

  public Object getElementoSeleccionado() {
	return elementoSeleccionado;
  }
	
  public void setElementoSeleccionado(Object elementoSeleccionado) {
	this.elementoSeleccionado = elementoSeleccionado;
  }
	
  public Collection getAsignados() {
	return asignados;
  }

  public void setAsignados(Collection asignados) {
    this.asignados = asignados;
  }

  public void setAccion(String accion) {
    this.accion = accion;
  }

  public void setBtnSubmit(String btnSubmit) {
    this.btnSubmit = btnSubmit;
  }

  public void setADonde(String aDonde) {
    this.aDonde = aDonde;
  }

  public void setADesasignar(Collection aDesasignar) {
    this.aDesasignar = aDesasignar;
  }

  public void setNoAsignados(Collection noAsignados) {
    this.noAsignados = noAsignados;
  }

  public void setAAsignar(Collection aAsignar) {
    this.aAsignar = aAsignar;
  }


  public void setEquipoDescripcion(String equipoDescripcion) {
    this.equipoDescripcion = equipoDescripcion;
  }

 
  public String getAccion() {
    return accion;
  }

  public String getBtnSubmit() {
    return btnSubmit;
  }

  public String getADonde() {
    return aDonde;
  }

  public Collection getADesasignar() {
    return aDesasignar;
  }

  public Collection getNoAsignados() {
    return noAsignados;
  }

  public Collection getAAsignar() {
    return aAsignar;
  }


  public String getEquipoDescripcion() {
    return equipoDescripcion;
  }



  public void limpiar(){
    this.equipoDescripcion = "";
    this.aDesasignar.clear();
    this.asignados.clear();
    this.noAsignados.clear();
    this.aAsignar.clear();

  }

  public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {
    ActionErrors errors = new ActionErrors();
    if (this.accion.equalsIgnoreCase("formulario")) {
      if (this.btnSubmit.equalsIgnoreCase("Buscar")) {
        if (this.getEquipoDescripcion().length() == 1){
          errors.add("seleccionarEquipos", new ActionMessage("errors.dynamic",
              "Debe ingresar al menos dos caracteres de la descripción del Equipo. "));
        }
      }
    }
    return errors;
  }

 // asignación de instrumentos pendientes
 public void asignar() {
   for (Iterator iter = aAsignar.iterator(); iter.hasNext(); ) {
     CEquipo e = (CEquipo)iter.next();

     this.getNoAsignados().remove(e);
     if (!yaFueSeleccionado(e,this.getAsignados())){
       this.getAsignados().add(e);
     }
   }
   aAsignar.clear();
 }

 public void desasignar() {
   for (Iterator iter = aDesasignar.iterator(); iter.hasNext(); ) {
     CEquipo e = (CEquipo)iter.next();
     this.getAsignados().remove(e);
     if (!yaFueSeleccionado(e,this.getNoAsignados())){
       this.getNoAsignados().add(e);
     }
   }
   aDesasignar.clear();
 }

 private boolean yaFueSeleccionado(CEquipo equipoAControlar,Collection col){

   for (Iterator itera = col.iterator(); itera.hasNext(); ) {
     CEquipo item= (CEquipo)itera.next();

     if (item.getId().compareTo(equipoAControlar.getId()) == 0){
       return true;
     }
   }
   return false;
 }

 public void setAsignarMapped(String key, String value){
   for (Iterator iter = this.noAsignados.iterator(); iter.hasNext(); ) {
     CEquipo e = (CEquipo)iter.next();
     if (key.equals(e.getId().toString())){
       if(!this.aAsignar.contains(e)){
         this.aAsignar.add(e);
       }
     }
   }
 }

 public void setDesasignarMapped(String key, String value){
   for (Iterator iter = this.asignados.iterator(); iter.hasNext(); ) {
     CEquipo e = (CEquipo)iter.next();
     if (key.equals(e.getId().toString())){
       this.aDesasignar.add(e);
     }
   }
 }

 public String getAsignarMapped(String key){
   for (Iterator iter = this.aAsignar.iterator(); iter.hasNext(); ) {
     CEquipo e = (CEquipo)iter.next();
     if (key.equals(e.getId().toString())){
       return e.getId().toString();
     }
   }
   return null;
 }

 public String getDesasignarMapped(String key){
   for (Iterator iter = this.aDesasignar.iterator(); iter.hasNext(); ) {
     CEquipo e = (CEquipo)iter.next();
     if (key.equals(e.getId().toString())){
       return e.getId().toString();
     }
   }
   return null;
 }

  /**
   * inicializarNoAsignados
   *
   * @param list List
   */
  public void inicializarNoAsignados(List list) {
    // este metodo se encarga de no mostrar en noAsignados items ya cargados en
    //asignados.
    this.noAsignados.clear();
    for (Iterator iter = list.iterator(); iter.hasNext(); ) {
      CEquipo item = (CEquipo)iter.next();
      String estaAsignado="N";
      for (Iterator iter2 = this.asignados.iterator(); iter2.hasNext(); ) {
        CEquipo item2 = (CEquipo)iter2.next();
        if (item.getId().compareTo(item2.getId())==0) {
          estaAsignado="S";
          break;
        }
      }
      if (estaAsignado.equalsIgnoreCase("N")){
        this.noAsignados.add(item);
      }
    }
  }

  public void setElementoSeleccionadoIndexAsignados(String index, String value){
    int indexInt = Integer.parseInt(index);
    this.setElementoSeleccionado(((List)this.getAsignados()).get(indexInt));
    this.setBtnSubmit("Detalles");
  }
  
  public void setElementoSeleccionadoIndexNoAsignados(String index, String value){
    int indexInt = Integer.parseInt(index);
    this.setElementoSeleccionado(((List)this.getNoAsignados()).get(indexInt));
    this.setBtnSubmit("Detalles");
  }
  
}
