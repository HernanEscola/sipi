package conicet.apps.svt.web.error.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class CErrorHandlerActionForm extends ActionForm {
  private String submit;
  private String exception;
  private String descripcion;

  /**
   * void clear(): vacia todas las propiedades de la form poniendo valor "".
   */
  public void clear(){
    this.setSubmit("");
    this.setDescripcion("");
  }

  public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {
    return null;
  }

  public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {
  }

  public String getSubmit() {
    return submit;
  }
  public void setSubmit(String submit) {
    this.submit = submit;
  }
  public String getException() {
    return exception;
  }
  public void setException(String exception) {
    this.exception = exception;
  }
  public String getDescripcion() {
    return descripcion;
  }
  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

}
