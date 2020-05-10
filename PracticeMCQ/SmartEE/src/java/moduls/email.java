/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moduls;

import com.sun.mail.smtp.SMTPTransport;
import java.io.FileInputStream;
import java.util.Properties;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author User
 */
public class email {

    public static String e_mail_it(String email, String subject, String Message) throws javax.mail.MessagingException {
        try {
           
            String emailA = "deepamaladeepthi@gmail.com";
            String password = "March31@";
            String[] guy = {email};
//            String fnm = pat;                              // attatching file path............
            String from = emailA;
            String pass = password;
            String host = "smtp.gmail.com";
            Properties prop = new Properties();
            prop = System.getProperties();
            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.socketFactory.port", 587);
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            prop.put("mail.smtp.user", from);
            prop.put("mail.smtp.password", pass);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", "true");
            System.out.println("fine ok");
            Session ses = Session.getDefaultInstance(prop, null);
            javax.mail.internet.MimeMessage mm = new MimeMessage(ses);
            System.out.println(from);
            mm.setFrom(new InternetAddress(from));
            InternetAddress[] ias = new InternetAddress[guy.length];
            for (int i = 0; i < guy.length; i++) {
                ias[i] = new InternetAddress(guy[i]);
            }
            for (int i = 0; i < ias.length; i++) {
                mm.addRecipients(RecipientType.TO, ias);
            }
            mm.setSubject(subject);
            mm.setContent("<img src=" + "<h1>" + Message + "</h1>", "text/html");

            MimeBodyPart mbp = new MimeBodyPart();
            SMTPTransport tran = (SMTPTransport) ses.getTransport("smtp");
            tran.connect(host, 587, from, pass);
            tran.sendMessage(mm, mm.getAllRecipients());
            tran.close();
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

}
