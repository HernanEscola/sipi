<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>



<br>
<h1 align="center" class="titulo">
  Modificar Presupuesto
</h1>
<html:form action="cPresupuestoModificarAction.do" method="POST" enctype="multipart/form-data">
  <html:hidden property="accion"/>
  <html:hidden property="cambiaPanel"/>
  <logic:equal property="accion" value="modificar" name="cPresupuestoActionForm">
    <script>
      solapas = new Array('tabDatosGenerales','tabPrecio','tabCondiciones', 'tabFacturacion', 'tabInfoAdicional');
      
      window.onload=function(){
        setupPanes("container", document.cPresupuestoActionForm.cambiaPanel.value);
        deshabilitarCampos();
      }
      
      function setFoco(){
        var x = event.keyCode;
        if((x==13)){ // enter
         window.event.returnValue = false;
        }
      }
      
      function irTabFinal(){
        document.cPresupuestoActionForm.cambiaPanel.value=solapas[solapas.length-1];
        setupPanes("container", document.cPresupuestoActionForm.cambiaPanel.value);
      }
      
      function irTabInicial(){
        document.cPresupuestoActionForm.cambiaPanel.value=solapas[0];
        setupPanes("container", document.cPresupuestoActionForm.cambiaPanel.value);
      }
      
      function irTabAnterior(){
        var obj = document.cPresupuestoActionForm.cambiaPanel.value;
        for(i=1;i<solapas.length;i++){
          if ((solapas[i] == obj)) {
            document.cPresupuestoActionForm.cambiaPanel.value=solapas[i-1];
            break;
          }  
        }  
        setupPanes("container", document.cPresupuestoActionForm.cambiaPanel.value);
      }
      
      function irTabSiguiente(){
        var obj = document.cPresupuestoActionForm.cambiaPanel.value;
        for(i=0;i<(solapas.length-1);i++){
          if ((solapas[i] == obj)) {
            document.cPresupuestoActionForm.cambiaPanel.value=solapas[i+1];
            break;
          }  
        }  
        setupPanes("container", document.cPresupuestoActionForm.cambiaPanel.value);
      }
      
      function irA(obj){
        document.cPresupuestoActionForm.cambiaPanel.value=obj;
        setupPanes("container", document.cPresupuestoActionForm.cambiaPanel.value);
      }
      
      function mostrarPanel(obj1, obj2){
        document.cPresupuestoActionForm.cambiaPanel.value = obj2.id;
        return showPane(obj1, obj2);
      }
    </script>  
    <div class="tab-container"  id="container">
      <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
        <tr>
          <td>
            <ul class="tabs">
              <li><a href="#" onClick="return mostrarPanel('datosGenerales', this)" id="tabDatosGenerales">Datos</a></li>
              <li><a href="#" onClick="return mostrarPanel('precio', this)" id="tabPrecio">Precio</a></li>
              <li><a href="#" onClick="return mostrarPanel('condiciones', this)" id="tabCondiciones">Condiciones</a></li>
              <li><a href="#" onClick="return mostrarPanel('facturacion', this)" id="tabFacturacion">Facturación</a></li>
              <li><a href="#" onClick="return mostrarPanel('infoAdicional', this)" id="tabInfoAdicional">Información Adicional</a></li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <jsp:include page="/jsp/entidades/presupuesto.jsp">
          <jsp:param name="tipoPantalla" value="input" />
          <jsp:param name="showBtnLimpiar" value="no" />
          <jsp:param name="isAlta" value="no" />
          <jsp:param name="displayLinks" value="no" />
      	  <jsp:param name="actionName" value="cPresupuestoModificarAction" />
        </jsp:include>
      </div>
    </div>
  </logic:equal>

  <logic:equal property="accion" value="modificarCfm" name="cPresupuestoActionForm">
    <jsp:include page="/jsp/entidades/presupuesto.jsp">
      <jsp:param name="tipoPantalla" value="view" />
      <jsp:param name="showBtnLimpiar" value="no" />
      <jsp:param name="isAlta" value="no" />
      <jsp:param name="displayLinks" value="no" />
      <jsp:param name="actionName" value="cPresupuestoModificarAction" />
    </jsp:include>
  </logic:equal>

</html:form>
