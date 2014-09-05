package conicet.apps.svt.util;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.svt.object.admPrestadores.CEntidadOrganismoAdm;
import conicet.apps.svt.object.bitacora.CBitacora;
import conicet.apps.svt.object.bitacora.ETipoBitacora;
import conicet.apps.svt.object.convenioMarco.CConvenioMarco;
import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.entidad.CPersonaSVT;
import conicet.apps.svt.object.ofertaTecnologica.COfertaTecnologica;
import conicet.apps.svt.object.ofertaTecnologica.CStan;
import conicet.apps.svt.service.CAdministracionService;
import conicet.apps.svt.service.CConvenioMarcoService;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.service.COfertaTecnologicaService;
import conicet.apps.svt.util.mail.CMailAddres;
import conicet.framework.error.CException;
import conicet.framework.file.object.configuracion.CConfiguracion;
import conicet.framework.util.UEmail;

public class CEMailBitacora {
  public CEMailBitacora() {
  }
  private List destinatario = new LinkedList();

  public void setDestinatario(List destinatario) {
    this.destinatario = destinatario;
  }

  public List getDestinatario() {
    return destinatario;
  }

/* private String enviarMailAdministrador(CBitacora bitacora,IUsuarioObject usr, String elemento)throws  CException{
   StringBuffer mail = new StringBuffer();
   CAdministrador adm = new CAdministrador(new Long(bitacora.getObjId().toString()));
   adm = CAdministradorService.findAdministradorById(adm);

   mail.append("En relación con la Administradora "+adm.getSigla()+" la Sede Central de Conicet informa\nque:\n");
   mail.append("\t\t\t\t\""+elemento+"\"");

   agregarDestinatario(adm);

   return mail.toString();
 }

private void agregarDestinatario(CAdministrador adm) throws
    NumberFormatException, CException {
  //agrego a la lista de destinatarios a la administradora
  if ("UE".equalsIgnoreCase(adm.getTipo())){
    CUnidadEjecutora ue = (CUnidadEjecutora)adm;
    CPersonaSAS director = ue.getDirector();
    this.getDestinatario().add(director.getEmail());
    //busco a los colaboradores.
    Collection colColaboradores = CAdministradorService.darColaboradoresByUePorTipo(ue,"A01");
    UsuarioRegistrado ur = null;
    for (Iterator iter = colColaboradores.iterator(); iter.hasNext(); ) {
      CPersonal perso = (CPersonal)iter.next();
      ur = UserDataAccessorProvider.getUserDataAccesor().getUsuarioRegistradoByUsrNum(Long.valueOf(perso.getNumeroUsuario()).longValue());
      if (ur != null){
        this.getDestinatario().add(ur.getEmail());
      }
    }
  }else{
    CAdministradoraFondos af = (CAdministradoraFondos)adm;
    this.getDestinatario().add(af.getEmail());
  }
}

 private String enviarMailSubsidio(CBitacora bitacora,IUsuarioObject usr, String elemento)throws  CException{
   StringBuffer mail = new StringBuffer();
   CSubsidio sub = new CSubsidio(new Long(bitacora.getObjId().toString()));
   sub = CSubsidioService.darSubsidioById(sub);
   CAdministrador adm = sub.getAdministrador();

   mail.append("En relación con el Subsidio "+sub.getResolucionTipo()+"-"+sub.getResolucionNumero()+"/"+UFecha.anio(sub.getResolucionFecha().toString())+" del tipo "+sub.getTipoSubsidio().getDescripcion()+"\nadministrado por "+sub.getAdministrador().getSigla());
   //pregunto por el titular
   //solo para los rubros con id = 2,3,6,8,9 o 10
   CTipoSubsidio ts = sub.getTipoSubsidio();
   if (ts.getId().intValue() == 2 ||ts.getId().intValue() == 3 || ts.getId().intValue() == 6 ||
      ts.getId().intValue() == 8 || ts.getId().intValue() == 9 || ts.getId().intValue() == 10 ){
    mail.append(" y cuyo titular es "+sub.getProyecto().getTitularApellido()+", "+sub.getProyecto().getTitularNombre()+ "\n");
  }
   mail.append(" la Sede Central de Conicet informa que:\n");
   mail.append("\t\t\t\t\""+elemento+"\"");

  agregarDestinatario(adm);
   return mail.toString();
 }

 private  String enviarMailRendicion(CBitacora bitacora,IUsuarioObject usr, String elemento)throws  CException{
   StringBuffer mail = new StringBuffer();
   CRendicion ren = new CRendicion();
   ren.setId(new Long(bitacora.getObjId().toString()));
   ren = CAdministracionService.findRendicionById(ren);
   CAdministrador adm = ren.getAdministrador();
   CSubsidio sub = null;
   Collection colSub = CSubsidioService.darSubsidiosByRendicion(ren);
   if (!colSub.isEmpty()){
     sub = (CSubsidio)colSub.iterator().next();
   }

   mail.append("En relación con la Rendición ");
   if (null != ren.getNumeroDas()){//solo puede ser si tiene nuemro das!!
     mail.append("recibida con Nº DAS " +
                 CRendicionWrapper.darNroDasAnioDas(ren));
   }
   mail.append("del Subsidio ");

   if (sub != null){
     mail.append(sub.getResolucionTipo() + "-" + sub.getResolucionNumero() +
                 "/" + UFecha.anio(sub.getResolucionFecha().toString()) +
                 " del tipo " + sub.getTipoSubsidio().getDescripcion());
   }else{
     mail.append(" ---- " + "-" + " ---- " + "/" + " ---- " + "\n " + " del tipo " + " ---- ");
   }

   mail.append(" y otros administrado por "+adm.getSigla());
  //pregunto por el titular
  //solo para los rubros con id = 2,3,6,8,9 o 10
  if (sub!=null){
    CTipoSubsidio ts = sub.getTipoSubsidio();
    if (ts.getId().intValue() == 2 || ts.getId().intValue() == 3 || ts.getId().intValue() == 6 ||
        ts.getId().intValue() == 8 || ts.getId().intValue() == 9 || ts.getId().intValue() == 10) {
      if (sub.getProyecto() != null) {
        mail.append(" y cuyo titular es " +
                    sub.getProyecto().getTitularApellido() + ", " +
                    sub.getProyecto().getTitularNombre() + ", y otros\n");
      }
    }
  }
   mail.append(", la Sede Central de Conicet informa que:\n");
   mail.append("\t\t\t\t\""+elemento+"\"");

  agregarDestinatario(adm);

   return mail.toString();
 }*/

 public  void enviarMail(CBitacora bitacora,IUsuarioObject usr, String elemento,HttpServletRequest request)throws  CException{
   StringBuffer mail = new StringBuffer();
   String asunto = "Sistema SVT";

 //obtengo la conf de la tabla de BD 
   HttpSession sesion = request.getSession();
   CConfiguracion conf = (CConfiguracion)sesion.getAttribute("configuracion");
	
	
	String origen = "svt@conicet.gov.ar";
	String[] to = null;
	String[] cc = null;
    
	// por default envio de prueba
	to = new String[1];
	cc = new String[1];
    to[0] = usr.getEmail();
	cc[0] = usr.getEmail();
	
	// si es OT ARMA TEXTO A IMPRIMIR Y BUSCA LOS TO Y CC		
   if (ETipoBitacora.OT.equals(bitacora.getTipo())){
	   COfertaTecnologica ot = new COfertaTecnologica();
	   ot.setId(new Long(bitacora.getObjId().toString()));
	   ot = COfertaTecnologicaService.findOfertaTecnologicaById(ot);
	   mail.append(enviarMailOT(bitacora,usr,elemento, ot));
	   asunto = "Sistema SVT - Observaciones en Oferta Tecnológica";
	   CEntidad prestador =ot.getPrestador().getEntidad();
	   //si envia mail de prueba, le envía mail al usr loggeado solamente. sino a quien corresponda
	   //enviar a mismos de aceptacion de novedades de ofertas
	   if ((conf.get("enviaMailDePrueba")).equalsIgnoreCase("no")){
			to = CMailAddres.getAddressToBitacora(prestador);
			cc = CMailAddres.getAddressCCtransferYSoporte();
	   }
   }else if (ETipoBitacora.ConvenioMarco.equals(bitacora.getTipo())){
	   
	   CConvenioMarco convenioMarco = new CConvenioMarco();
	   convenioMarco.setId(new Long(bitacora.getObjId().toString()));
	   convenioMarco = CConvenioMarcoService.findConvenioMarcoById(convenioMarco);
	   mail.append(enviarMailConvenioMarco(bitacora,usr,elemento, convenioMarco));
	   asunto = "Sistema SVT - Observaciones en Convenio Marco";
	   
	   CEntidad prestador =CEntidadService.findEntidadById(convenioMarco.getInstituto());
	   
	   //si envia mail de prueba, le envía mail al usr loggeado solamente. sino a quien corresponda
	   //enviar a mismos de aceptacion de novedades de ofertas
	   if ((conf.get("enviaMailDePrueba")).equalsIgnoreCase("no")){
			to = CMailAddres.getAddressToBitacora(prestador);
			cc = CMailAddres.getAddressCCSoporte();
	   }
	
   }
 
  
  UEmail.simpleVariosDestinatariosHtmlConCopia(origen, to, cc, asunto, mail.toString());
   
   
 
  }


 private  String enviarMailOT(CBitacora bitacora,IUsuarioObject usr, String elemento, COfertaTecnologica ot)throws  CException{
	   StringBuffer mail = new StringBuffer();
	   
	   CEntidadOrganismoAdm administradoPor= CAdministracionService.findOrganismoByPrestador(ot.getPrestador().getEntidad());
	   CStan stan= new CStan();
	   if (ot.getTipoOferta().getId().toString().equalsIgnoreCase("3")){
		   stan= (CStan)ot;
	   }
	   mail.append("<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>" +
               "<html> <head> <title></title> <meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'></head>" +
               " <body>\n");
	   mail.append("<span style='font-size:10.0pt;font-family:Courier New'>\n");

	   mail.append("En relación con la Oferta Tecnológica cuyo número de identificación es ");
       mail.append(ot.getCodigoOferta());
       mail.append(" con el Título "+ot.getDescripcion());
       
       if (!StringUtils.isEmpty(stan.getPrestacionDescripcion())){
    	   mail.append(", Prestación "+stan.getPrestacionDescripcion());
       }
       if (administradoPor!=null){
    	   mail.append(", administrado por "+administradoPor.getOrganismo().getDescripcion());
       }
       mail.append(" y cuyo prestador es ");
       
       CEntidad enti= ot.getPrestador().getEntidad();
       
       if (enti.getTipo().getId().toString().equalsIgnoreCase("1")){
       
    	   mail.append(((CPersonaSVT)enti).getNombre()+" "+((CPersonaSVT)enti).getApellido());
       }else {
    		mail.append(enti.getDescripcion());   
       }
       
	   mail.append("; la Sede Central de Conicet informa que: <br><dd>");
	   if (StringUtils.isNotEmpty(elemento)) {
		   elemento= "&quot;"+elemento+"&quot;";
		   elemento = elemento.replaceAll("\n", "<br><dd>");
		   mail.append(elemento);
			
	   }
	   
	   mail.append("<br><br>");
	   mail.append(getFooter());
	   mail.append("</span>");
	   mail.append("</body></html>");
	   

	   return mail.toString();
	 }
 
 
 
	private static String getFooter() {
		StringBuffer ret = new StringBuffer();
		ret.append("Este es un mail automático del ");
		ret.append("Sistema de Vinculación Tecnológica.");
		//ret.append("\n");
		ret.append("<br>");
		
		ret.append("Por favor no responder a este remitente.");
	
		return ret.toString();
	}
 
 
	private  String enviarMailConvenioMarco(CBitacora bitacora,IUsuarioObject usr, String elemento, CConvenioMarco c)throws  CException{
		   StringBuffer mail = new StringBuffer();
		   
		   CEntidadOrganismoAdm administradoPor= CAdministracionService.findOrganismoByPrestador(c.getInstituto());
		  
		   mail.append("<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>" +
	               "<html> <head> <title></title> <meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'></head>" +
	               " <body>\n");
		   mail.append("<span style='font-size:10.0pt;font-family:Courier New'>\n");

		   mail.append("En relación con el Convenio Marco del tipo ");
	       mail.append(c.getTipoConvenio().getDescripcion());
	       mail.append(" cuya descripción es "+c.getDenominacion());
	      
	       mail.append(", cuyo prestador es ");
	       
	       CEntidad enti= c.getInstituto();
	       
	       if (enti.getTipo().getId().toString().equalsIgnoreCase("1")){
	       
	    	   mail.append(((CPersonaSVT)enti).getNombre()+" "+((CPersonaSVT)enti).getApellido());
	       }else {
	    		mail.append(enti.getDescripcion());   
	       }
	      
	       if (administradoPor!=null){
	    	   mail.append(", administrado por "+administradoPor.getOrganismo().getDescripcion());
	       }
	       
		   mail.append("; la Dirección de Vinculación de Conicet informa que: <br><dd>");
		   if (StringUtils.isNotEmpty(elemento)) {
			   elemento= "&quot;"+elemento+"&quot;";
			   elemento = elemento.replaceAll("\n", "<br><dd>");
			   mail.append(elemento);
				
		   }
		   
		   mail.append("<br><br>");
		   mail.append(getFooter());
		   mail.append("</span>");
		   mail.append("</body></html>");
		   

		   return mail.toString();
		 }
	 
	
	
}
