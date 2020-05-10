
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.EnumQuestionSetStatus;
import pojo.NewHibernateUtil;
import pojo.Question;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author User
 */
public class qwe {

    public static void main(String[] args) {
        Session openSession = NewHibernateUtil.getSessionFactory().openSession();
        Session openSessions = NewHibernateUtil.getSessionFactory().openSession();
        EnumQuestionSetStatus qs = new EnumQuestionSetStatus();
        qs.setIdqestionsetstatus(2);
        qs.setStatus("qwe");
        Transaction vt = openSession.beginTransaction();
        Transaction vts = openSessions.beginTransaction();
        openSession.update(qs);
        vt.commit();
        vts.commit();
        openSession.close();
        openSessions.close();
    }
}
