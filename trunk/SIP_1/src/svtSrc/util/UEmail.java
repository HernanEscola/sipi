package conicet.apps.svt.util;

import java.io.FileInputStream;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import conicet.apps.commons.users.model.impl.EUsuarioObjectAttr;
import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;

/**
 * <p>
 * Title: Utilitarios Conicet
 * </p>
 * <p>
 * Description: Métodos para manejo de correo
 * </p>
 * <p>
 * Copyright: Copyright (c) 2002
 * </p>
 * <p>
 * Company: CONICET
 * </p>
 * 
 * @author HER
 * @version 1.0
 */

public class UEmail {

	public UEmail() {
	}

	/**
	 * Envío simple, solo texto
	 */
	public static boolean simple(String origen, String destino, String subj,
			String strmsg) {
		boolean ret = true;
		Properties props = new Properties();
		// props.put("mail.smtp.host","berni.conicet.gov.ar");

		try {
			props.load(new FileInputStream(System.getProperty("catalina.home")
					+ "/conf/smtp.props"));

			Session sesion = Session.getDefaultInstance(props, null);
			MimeMessage msg = new MimeMessage(sesion);
			msg.setFrom(new InternetAddress(origen));
			InternetAddress[] addrs = { new InternetAddress(destino) };
			msg.setRecipients(Message.RecipientType.TO, addrs);
			msg.setSubject(subj);
			msg.setSentDate(new Date());
			msg.setText(strmsg);
			Transport.send(msg);
		} catch (Exception ex) {
			System.out.println("EMAIL-simple: Error: " + ex.getMessage());
			ret = false;
		}

		return ret;
	}

	/**
	 * Envío simple, solo texto, pero a varios destinatarios
	 */
	public static boolean simpleVariosDestinatarios(String origen,
			String[] destino, String subj, String strmsg) {
		boolean ret = true;
		Properties props = new Properties();
		// props.put("mail.smtp.host","berni.conicet.gov.ar");

		try {
			props.load(new FileInputStream(System.getProperty("catalina.home")
					+ "/conf/smtp.props"));

			Session sesion = Session.getDefaultInstance(props, null);
			MimeMessage msg = new MimeMessage(sesion);
			msg.setFrom(new InternetAddress(origen));
			InternetAddress[] addrs = new InternetAddress[destino.length];
			for (int i = 0; i < destino.length; i++) {
				addrs[i] = new InternetAddress(destino[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, addrs);
			msg.setSubject(subj);
			msg.setSentDate(new Date());
			msg.setText(strmsg);
			Transport.send(msg);
		} catch (Exception ex) {
			System.out.println("EMAIL-simple: Error: " + ex.getMessage());
			ret = false;
		}

		return ret;
	}

	/**
	 * Envío simple, solo texto, pero a varios destinatarios
	 */
	public static boolean simpleVariosDestinatariosConCopia(String origen,
			String[] to, String[] cc, String subj, String strmsg) {
		boolean ret = true;
		Properties props = new Properties();
		// props.put("mail.smtp.host","berni.conicet.gov.ar");

		try {
			props.load(new FileInputStream(System.getProperty("catalina.home")
					+ "/conf/smtp.props"));
			Session sesion = Session.getDefaultInstance(props, null);
			MimeMessage msg = new MimeMessage(sesion);
			msg.setFrom(new InternetAddress(origen));
			InternetAddress[] addrsTO = new InternetAddress[to.length];
			InternetAddress[] addrsCC = new InternetAddress[cc.length];
			for (int i = 0; i < to.length; i++) {
				addrsTO[i] = new InternetAddress(to[i]);
			}
			for (int i = 0; i < cc.length; i++) {
				addrsCC[i] = new InternetAddress(cc[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, addrsTO);
			msg.setRecipients(Message.RecipientType.CC, addrsCC);
			msg.setSubject(subj);
			msg.setSentDate(new Date());
			msg.setText(strmsg);
			Transport.send(msg);
		} catch (Exception ex) {
			System.out.println("EMAIL-simple: Error: " + ex.getMessage());
			ret = false;
		}

		return ret;
	}

	/**
	 * Envío simple de email, pero a varios destinatarios contenido HTML
	 */
	public static boolean simpleVariosDestinatariosHtml(String origen,
			String[] destino, String subj, String strmsg) {
		boolean ret = true;
		Properties props = new Properties();
		// props.put("mail.smtp.host","berni.conicet.gov.ar");

		try {
			props.load(new FileInputStream(System.getProperty("catalina.home")
					+ "/conf/smtp.props"));

			Session sesion = Session.getDefaultInstance(props, null);
			MimeMessage msg = new MimeMessage(sesion);
			msg.setFrom(new InternetAddress(origen));
			InternetAddress[] addrs = new InternetAddress[destino.length];
			for (int i = 0; i < destino.length; i++) {
				addrs[i] = new InternetAddress(destino[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, addrs);
			msg.setSubject(subj);
			msg.setSentDate(new Date());
			msg.setContent(strmsg, "text/html");
			Transport.send(msg);
		} catch (Exception ex) {
			System.out.println("EMAIL-simple: Error: " + ex.getMessage());
			ret = false;
		}

		return ret;
	}

	/**
	 * Envío de texto y attachment Parámetros: dirección origen, dirección
	 * destino, subject, texto, contenido de attach, nombre del attach
	 */
	public static boolean textoAttach(String origen, String destino,
			String subj, String strmsg, String attach, String fname) {
		boolean ret = true;
		Properties props = new Properties();
		// props.put("mail.smtp.host","berni.conicet.gov.ar");

		try {
			props.load(new FileInputStream(System.getProperty("catalina.home")
					+ "/conf/smtp.props"));
			Session sesion = Session.getDefaultInstance(props, null);
			MimeMessage msg = new MimeMessage(sesion);
			msg.setFrom(new InternetAddress(origen));
			InternetAddress[] addrs = { new InternetAddress(destino) };
			msg.setRecipients(Message.RecipientType.TO, addrs);
			msg.setSubject(subj);
			msg.setSentDate(new Date());
			// msg.setText(strmsg);
			MimeBodyPart mbp1 = new MimeBodyPart();
			mbp1.setText(strmsg);
			MimeBodyPart mbp2 = new MimeBodyPart();
			mbp2.setContent(attach, "text/plain");
			mbp2.setHeader("Content-Type", "application/octet-stream");
			mbp2.setHeader("Content-Transfer-Encoding", "base64");
			mbp2.setDisposition("attachment");
			mbp2.setFileName(fname);
			Multipart mp = new MimeMultipart("mixed");
			mp.addBodyPart(mbp1);
			mp.addBodyPart(mbp2);
			msg.setContent(mp);

			Transport.send(msg);
		} catch (Exception ex) {
			System.out.println("EMAIL-simple: Error: " + ex.getMessage());
			ret = false;
		}
		return ret;
	}

	/**
	 * Envío de texto y attachments Parámetros: Dirección origen, dirección
	 * destino, subject, texto, array de Strings con paths de archivos a
	 * componer el attach, array de Strings con nombress de archivos. NOTA:
	 * Estos dos arrays se usan en paralelo.
	 */
	public static boolean sendVariosArchivosAdjuntos(String origen,
			String destino, String subject, String texto, String pathsArchs[],
			String nombreArchs[]) {
		boolean ret = true;
		MimeBodyPart mbp2;
		Properties props = new Properties();
		// props.put("mail.smtp.host","berni.conicet.gov.ar");

		try {
			props.load(new FileInputStream(System.getProperty("catalina.home")
					+ "/conf/smtp.props"));
			Session sesion = Session.getDefaultInstance(props, null);
			MimeMessage msg = new MimeMessage(sesion);
			msg.setFrom(new InternetAddress(origen));
			InternetAddress[] addrs = { new InternetAddress(destino) };
			msg.setRecipients(Message.RecipientType.TO, addrs);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			MimeBodyPart mbp1 = new MimeBodyPart();
			mbp1.setText(texto);
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);
			for (int i = 0; i < pathsArchs.length; i++) {
				mbp2 = new MimeBodyPart();
				DataSource ds = new FileDataSource(pathsArchs[i]);
				mbp2.setDataHandler(new DataHandler(ds));
				mbp2.setFileName(nombreArchs[i]);
				mp.addBodyPart(mbp2);
			}
			msg.setContent(mp);

			Transport.send(msg);
		} catch (Exception ex) {
			System.out.println("EMAIL-Con archivos adjuntos: Error: "
					+ ex.getMessage());
			ret = false;
		}
		return ret;
	}

	public static boolean sendUsuarioHtmlMail(IUsuarioObject usuario, String to,
			String subject, String html) {
		String smtp = "";
		boolean ret = true;
		Properties props = new Properties();

		try {
			smtp = (String) ((HttpSession) usuario.getAttribute(EUsuarioObjectAttr.USR_SESSION.name())).getServletContext()
					.getInitParameter("conicet_smtp_server");
			// Create the JavaMail session
			if ((smtp == null) || (smtp == "")) {
				smtp = "berni.conicet.gov.ar";
			}
			props.put("mail.smtp.host", smtp);

			// Declara la sesion
			Session s = Session.getInstance(props, null);

			// Declara el mensaje
			MimeMessage message = new MimeMessage(s);

			// Obtiene la direccion de mail local
			InternetAddress iafrom = new InternetAddress(usuario.getEmail());

			iafrom.setPersonal(usuario.getLastName() + " "
					+ usuario.getFirstName());
			message.setFrom(iafrom);

			// Establece el destinatario
			InternetAddress iato = new InternetAddress(to);
			message.addRecipient(Message.RecipientType.TO, iato);

			// Asunto del mail
			message.setSubject(subject);

			// Cuerpo del mail
			// message.setText(text);
			message.setContent(html, "text/html");

			// Manda el mail
			Transport.send(message);
		} catch (AddressException e) {
			System.out.println("Hay un error en las direcciones de mail. "
					+ e.toString());
			ret = false;
		} catch (SendFailedException e) {
			System.out.println("Error al enviar el mail." + e.toString());
			ret = false;
		} catch (MessagingException e) {
			System.out.println("Error inesperado. " + e.toString());
			ret = false;
		} catch (Exception e) {
			System.out.println("Error inesperado. " + e.toString());
			ret = false;
		} finally {
			return ret;
		}
	}

	public static boolean simpleVariosDestinatariosHtmlConCopia(String origen,
			String[] destino, String[] cc, String subj, String strmsg) {
		boolean ret = true;
		Properties props = new Properties();
		// props.put("mail.smtp.host","berni.conicet.gov.ar");

		try {
			props.load(new FileInputStream(System.getProperty("catalina.home")
					+ "/conf/smtp.props"));

			Session sesion = Session.getDefaultInstance(props, null);
			MimeMessage msg = new MimeMessage(sesion);
			msg.setFrom(new InternetAddress(origen));
			InternetAddress[] addrs = new InternetAddress[destino.length];
			InternetAddress[] addrsCC = new InternetAddress[cc.length];
			for (int i = 0; i < destino.length; i++) {
				addrs[i] = new InternetAddress(destino[i]);
			}
			for (int i = 0; i < cc.length; i++) {
				addrsCC[i] = new InternetAddress(cc[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, addrs);
			msg.setRecipients(Message.RecipientType.CC, addrsCC);
			msg.setSubject(subj);
			msg.setSentDate(new Date());
			msg.setContent(strmsg, "text/html");
			Transport.send(msg);
		} catch (Exception ex) {
			System.out.println("EMAIL-simple: Error: " + ex.getMessage());
			ret = false;
		}

		return ret;
	}

	/**
	 * Valida el formato de la direccion de Email verifica que haya un @, y que
	 * haya 1 o 2 puntos despues. Si el Email es vallido devuelve true
	 * 
	 * @param email
	 *            String
	 * @return boolean
	 */
	public static boolean validaEmail(String email) {
		boolean valido = true;
		if (email != null
				&& !email
						.matches("[A-Za-z0-9_.-]+@[A-Za-z0-9_.-]+\\.[A-Za-z]{2,}")) {
			valido = false;
		}
		return valido;
	}
}
