package conicet.apps.svt.web.equipo.form;

import java.lang.reflect.Field;
import java.sql.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;

import conicet.apps.svt.object.equipo.CEquipo;
import conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm;
import conicet.framework.validator.annotation.AField;



public class CEquipoBuscarActionForm extends CBusquedaActionForm {

/*Se agregó la palabra Busqueda al final de la property para que se puedan diferenciar
  de las properties del Detalle y se puedan listar los últimos resultados. */
  private String descripcionBusqueda;
  private String marcaBusqueda;
  
  private Date fechaAlta;
  private String nroSerie;
  private String tipo;
  private String nombre;
  

  public String getDescripcionBusqueda() {
    return descripcionBusqueda;
  }

  public void setDescripcionBusqueda(String descripcionBusqueda) {
    this.descripcionBusqueda = descripcionBusqueda;
  }

  public String getMarcaBusqueda() {
    return marcaBusqueda;
  }

  public void setMarcaBusqueda(String marcaBusqueda) {
    this.marcaBusqueda = marcaBusqueda;
  }


  public Date getFechaAlta() {
    return fechaAlta;
  }



  public void setFechaAlta(Date fechaAlta) {
    this.fechaAlta = fechaAlta;
  }

  protected void validar(ActionErrors ae) {
    if ("Buscar".equalsIgnoreCase(this.getBtnSubmit())) {
    }
  }

  @Override
  public void clear() {
    super.clear();
	this.descripcionBusqueda = null;
    this.marcaBusqueda = null;
    this.nroSerie="";
    this.tipo="";
    this.nombre="";
  }
  @Override
  public void limpiar(){
	 super.limpiar();
	 clear();
  }
 


public String getNroSerie() {
	return nroSerie;
}

public void setNroSerie(String nroSerie) {
	this.nroSerie = nroSerie;
}

public String getTipo() {
	return tipo;
}

public void setTipo(String tipo) {
	this.tipo = tipo;
}

public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

@Override
public Object getData() {
    CEquipo equipo = new CEquipo();
    if (!StringUtils.isEmpty(this.getDescripcionBusqueda())) {
      equipo.setDescripcion(this.getDescripcionBusqueda());
    }
    if (!StringUtils.isEmpty(this.getMarcaBusqueda())) {
    	equipo.setMarca(this.getMarcaBusqueda());
    }
    if (!StringUtils.isEmpty(this.getNroSerie())) {
    	equipo.setNroSerie(this.getNroSerie());
    }
    
    if (!StringUtils.isEmpty(this.getTipo())) {
    	equipo.setTipo(this.getTipo());
    }
    if (!StringUtils.isEmpty(this.getNombre())) {
    	equipo.setNombre(this.getNombre());
    }
    
    return equipo;
}

@Override
public void setData(Object arg0) {
	// TODO Auto-generated method stub
	
}

@Override
public void validarField(AField arg0, Field arg1, ActionErrors arg2)
		throws Exception {
	// TODO Auto-generated method stub
	
}

}
