package com.notifyme.utilities;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.codec.binary.Base64;
import org.apache.poi.util.IOUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
public class SendEmailController {
	public static Properties props = new Properties();
	public static void sendMail(String inputText) throws IOException, TemplateException
	{
		loadproperties();
		final String username =props.getProperty("ADMIN_ACCOUNT_EMAIL_ID");
		final String password =props.getProperty("ADMIN_ACCOUNT_EMAIL_PWD");
		
		
		props.put("mail.smtp.auth",props.getProperty("EMAIL_AUTH_REQ"));
		props.put("mail.smtp.starttls.enable",props.getProperty("EMAIL_TLS_ENABLE"));
		props.put("mail.smtp.host",props.getProperty("EMAIL_SERVICE_PROVIDER_HOST"));
		props.put("mail.smtp.port",props.getProperty("EMAIL_SERVICE_PROVIDER_PORT"));

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress());
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("vkalluri@deloitte.com"));
			message.setSubject("NotifyMeAdmin");
			
			Configuration cfg = new Configuration();            
            cfg.setClassForTemplateLoading(SendEmailController.class, "/templates/");
            
            cfg.setDefaultEncoding("UTF-8");
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            Template template = cfg.getTemplate("emailtemplate.ftl");
           
            File img = new File("C:\\Users\\vkalluri\\Desktop\\NotifyMe\\NotifyMe.png");
            byte[] imgBytes = IOUtils.toByteArray(new FileInputStream(img));
            byte[] imgBytesAsBase64 = Base64.encodeBase64(imgBytes);
            String imgDataAsBase64 = new String(imgBytesAsBase64);
            String imgAsBase64 = "data:image/png;base64," + imgDataAsBase64;
            
            Map paramMap = new HashMap();
            paramMap.put("data",inputText);  
            paramMap.put("img",imgAsBase64); 
            Writer out = new StringWriter();
            template.process(paramMap, out);
            
			BodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(out.toString(), "text/html");	        
	        Multipart multipart = new MimeMultipart();
	        multipart.addBodyPart(messageBodyPart);
	        messageBodyPart = new MimeBodyPart();
			
	        String filename = "C:\\Users\\vkalluri\\Desktop\\NotifyMe\\News.pdf";
	        DataSource source = new FileDataSource(filename);
	        messageBodyPart.setDataHandler(new DataHandler(source));
	        messageBodyPart.setFileName("News.pdf");
	        multipart.addBodyPart(messageBodyPart);	
	        message.setContent(multipart);
			Transport.send(message);
			System.out.println("Mail Sent");
			

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	public static void main(String[] args)
	{
		loadproperties();
		final String username =props.getProperty("ADMIN_ACCOUNT_EMAIL_ID");
		final String password =props.getProperty("ADMIN_ACCOUNT_EMAIL_PWD");
		
		
		props.put("mail.smtp.auth",props.getProperty("EMAIL_AUTH_REQ"));
		props.put("mail.smtp.starttls.enable",props.getProperty("EMAIL_TLS_ENABLE"));
		props.put("mail.smtp.host",props.getProperty("EMAIL_SERVICE_PROVIDER_HOST"));
		props.put("mail.smtp.port",props.getProperty("EMAIL_SERVICE_PROVIDER_PORT"));

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress());
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(""));
			message.setSubject("NotifyMeAdmin");
			message.setText("");
			

			Transport.send(message);

			

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

	private static void loadproperties() {
		
		InputStream input = null;

		try {

			input = new FileInputStream("C:\\RIIES\\Test\\NotifyMeBeta\\WebContent\\properties\\EmailConfig.properties");			
			props.load(input);
			
		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

}
