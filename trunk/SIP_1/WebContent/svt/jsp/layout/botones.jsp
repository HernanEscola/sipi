<%@include file="/jsp/layout/include.jsp"%>

<bean:define id="entidad" value='<%= request.getParameter("entidad") %>' />
<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />

<logic:iterate id="boton" name="formulario" property="botones">
  <bean:define id="label" name="boton" property="label"/>
  <bean:define id="lavelValue" name="label" property="valor" type="String"/>
  <bean:define id="aplicacion" name="boton" property="aplicacion"/>
  <bean:define id="aplicacionValue" name="aplicacion" property="aplicacion" type="String"/>
  
  <logic:present parameter="posicion">
    <bean:define id="posicion" value='<%= request.getParameter("posicion") %>'/>
    <bean:define id="boton_posicion" name="boton" property="posicion"/>
    <bean:define id="boton_posicion_valor" name="boton_posicion" property="posicionStr" type="String"/>
    <logic:equal value='<%= posicion %>' name="boton_posicion_valor">
      <capplication:isApplication application='<%= aplicacionValue %>' >
        <logic:equal name="boton" property="checkFuncion" value="N" >
          <html:submit property="btnSubmit" styleClass="CformBoton" value='<%= lavelValue %>' styleId='<%= "id_btn"+lavelValue %>'/>
        </logic:equal>
        <logic:equal name="boton" property="checkFuncion" value="S" >
          	  <bean:define id="funcion" name="boton" property="function" type="String"/>

	          <csecurity:hasFuncion funcion='<%= entidad + "_" + funcion %>'>
	            <html:submit property="btnSubmit" styleClass="CformBoton" value='<%= lavelValue %>' />
	          </csecurity:hasFuncion>  
	    
        </logic:equal>
      </capplication:isApplication>
    </logic:equal>
  </logic:present>
  
  <logic:notPresent parameter="posicion">
    <capplication:isApplication application='<%= aplicacionValue %>' >
      <logic:equal name="boton" property="checkFuncion" value="N" >
        <html:submit property="btnSubmit" styleClass="CformBoton" value='<%= lavelValue %>' />
      </logic:equal>
      <logic:equal name="boton" property="checkFuncion" value="S" >
        <bean:define id="funcion" name="boton" property="function" type="String"/>
        <csecurity:hasFuncion funcion='<%= entidad + "_" + funcion %>'>
          <html:submit property="btnSubmit" styleClass="CformBoton" value='<%= lavelValue %>' />
        </csecurity:hasFuncion>  
      </logic:equal>
    </capplication:isApplication>
  </logic:notPresent>
</logic:iterate>