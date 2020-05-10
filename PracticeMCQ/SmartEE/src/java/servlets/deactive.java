/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.Getting;
import moduls.Setting;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import pojo.EnumQuestionSetStatus;
import pojo.EnumQuestionStatus;
import pojo.NewHibernateUtil;
import pojo.Question;
import pojo.QuestionSet;

/**
 *
 * @author User
 */
public class deactive extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String qsid = req.getParameter("qsid");
        System.out.println(qsid);
        //  String qid = req.getParameter("qid");
        String sta = req.getParameter("sta");

        Session s = NewHibernateUtil.getSessionFactory().openSession();

        QuestionSet questionSet = (QuestionSet) s.load(QuestionSet.class, Integer.parseInt(qsid));
        System.out.println("qset id " + questionSet.getIdquestionset());

       // Getting loaddata = new Getting();
//                
        // List<Question> question = loaddata.getQuestionByQuestionset(questionSet);
//       
        List<Question> question = s.createCriteria(Question.class).add(Restrictions.eq("questionSet", questionSet)).list();
        // Question question = (Question) s.load(Question.class, Integer.parseInt(questionSet.getIdquestionset()));
//
        Criteria cc = s.createCriteria(EnumQuestionSetStatus.class);
        EnumQuestionSetStatus eqss = (EnumQuestionSetStatus) cc.add(Restrictions.eq("status", sta)).uniqueResult();
//
        Criteria cc1 = s.createCriteria(EnumQuestionStatus.class);
        EnumQuestionStatus eqs = (EnumQuestionStatus) cc1.add(Restrictions.eq("status", sta)).uniqueResult();
        for (Question question1 : question) {
            System.out.println("Question " + question1.getIdquestion());
            // Question question = (Question) s.load(Question.class, Integer.parseInt(question1.get));

            question1.setEnumQuestionStatus(eqs);
            s.update(question1);
            System.out.println("updated");
        }
//
        Transaction tr = s.beginTransaction();
        questionSet.setEnumQuestionSetStatus(eqss);
        // question1.setEnumQuestionStatus(eqs);
        s.update(questionSet);
        //  s.update(question1);
        tr.commit();
        s.close();

        resp.sendRedirect("manegePapers.jsp");
    }

}
