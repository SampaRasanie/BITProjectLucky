package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.NewClass;
import moduls.autogen;

/**
 *
 * @author User
 */
public class emailchack extends HttpServlet {

//    @Resource(name = "mail/gmail")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write("" + new NewClass().chackemail(req.getParameter("email")));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        boolean chackemail = new NewClass().chackemail(req.getParameter("email"));
//        resp.getWriter().write("" + req.getParameter("email"));
        String emails = req.getParameter("email");
        try {
            autogen.runlk();
//            email.e_mail_it(emails, "Reset password", autogen.getMessge());
            Properties props = System.getProperties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.stocketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.stocketFactory.port", "465");
            props.put("mail.smtp.stocketFactory.fallback", "false");

            Session mailse = Session.getDefaultInstance(props, null);
            mailse.setDebug(true);

            Message mimeMessage = new MimeMessage(mailse);
            mimeMessage.setFrom(new InternetAddress("deepamaladeepthi@gmail.com"));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(emails));
            mimeMessage.setContent(autogen.getMessge(),"text/html");
            mimeMessage.setSubject("nothing");

            Transport transport = mailse.getTransport("smtp");
            transport.connect("smtp.gmail.com","Deepamala Deepthi","March31@");
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
