<%@include file="layout/include.jsp"%>
<br>
  <h1 align="center" class="titulo">Carga de Archivos</h1>
  <html:form action="cOfertaTecnologicaDetalleSubirAction.do" method="POST" enctype="multipart/form-data">
  <html:hidden property="accion"/>
     <table style="width:538 height:118" align="center" cellpadding="0" cellspacing="0" class="CformTable" width="600">
       <tr style="height:25">
         <td colspan="2" class="CformRowHeader">Archivo de referencia </td>
       </tr>
       <tr style="height:25">
         <td colspan="2" class="CformDato">
           <table width="100%" align="center">
             <tr>
               <td width="100" class="CformNombre">Archivo:&nbsp;&nbsp;<span class="dato_obligatorio">*</span></td>
                 <td>
                   <html:file accept="application/pdf" size="38" property="archivo" name="cOfertaTecnologicaDetalleSubirActionForm"/>
                 </td>
                <td >&nbsp;</td>
             </tr>
           </table>
         </td>
       </tr>
       <tr>
         <td align="right" class="CformAreaBotones">
           <div align="left" class="dato_obligatorio"> &nbsp;&nbsp;* Tama&ntilde;o m&aacute;ximo del archivo 1 (un) MegaByte.&nbsp;
           </div>
         </td>
         <td class="CformAreaBotones" height="35" align="right">
           <html:submit property="btnSubmit" value="Adjuntar" styleClass="CformBoton"/>
           &nbsp;
           <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
         </td>
       </tr>
     </table>
  </html:form>

