/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moduls;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Answerdescription;
import pojo.Answers;
import pojo.AnswersHistory;
import pojo.EnumSecurityQuestions;
import pojo.EnumSubject;
import pojo.NewHibernateUtil;
import pojo.PracticeQuestion;
import pojo.PracticeQuestionSet;
import pojo.Question;
import pojo.QuestionSet;
import pojo.User;

/**
 *
 * @author User
 */
public class Setting {

    public Session s;
    private Getting getting;

    public Setting() {

        if (s == null) {

            s = NewHibernateUtil.getSessionFactory().openSession();
            getting = new Getting();
        }
    }

    public void Setsubject(String s1) {
        EnumSubject eUT1 = new EnumSubject();
        eUT1.setSubject(s1);
        s.save(eUT1);
        s.beginTransaction().commit();
        s.close();
    }

    public QuestionSet addPaperset(int id, String title, String sub, String uid) {
        QuestionSet qs = new QuestionSet();

        try {
            String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            qs.setIdquestionset(id);
            qs.setName(title);
            qs.setInitiateddate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(format));
            qs.setUser(getting.getUserById(uid));
            qs.setEnumSubject(getting.getSubjectIdBySuject(sub));
            qs.setEnumQuestionSetStatus(getting.getQSSByStateus("Active"));

            Transaction beginTransaction = s.beginTransaction();
            s.save(qs);
            beginTransaction.commit();
            s.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return qs;
    }

    public Question AddQueaction(String Question, QuestionSet qs, String imagepath) {
        Question q = new Question();
        q.setQuestiontext(Question);
        q.setQuestionSet(qs);
        q.setImgpath(imagepath);
        q.setEnumSections(getting.getEnumsilecions());
        q.setEnumQuestionStatus(getting.getEQS());

        s.save(q);
        s.beginTransaction().commit();
        s.close();
        return q;
    }

    public void AddAnswers(Question q, String text, String ans, String ansdesc) {
        System.out.println("add answers in");
        Answers an = new Answers();
        an.setQuestion(q);
        an.setText(text);
        an.setIscorrect(Byte.parseByte(ans));
        an.setDescription(ansdesc);
        s.save(an);
        s.beginTransaction().commit();
        s.close();

        //    AddAnswerDescription(an.getIdAnswers(), ansdesc);
    }

//    public void AddAnswerDescription(Integer ansno, String anstext) {
//        System.out.println("add answers desc in");
//
//        Answerdescription an = new Answerdescription();
//        an.setIdanswerdescription(ansno);
//        an.setAnsdtext(anstext);
//        an.setAnsdstatus("Active");
//        an.setIdanswer(ansno);
//        s.save(an);
//        s.beginTransaction().commit();
//        s.close();
//        System.out.println("add answers desc out");
//
//    }
    public PracticeQuestionSet setPracticeQuestionSet(QuestionSet questionSet, int score, User u, Date d) {

        PracticeQuestionSet pq = new PracticeQuestionSet();
        pq.setQuestionSet(questionSet);
        pq.setScore(score);
        pq.setUser(u);
        pq.setInsertTs(d);
        s.save(pq);
        s.beginTransaction().commit();
        s.close();
        return pq;
    }

    public PracticeQuestion setPracticeQuestion(int idpracticeQuestion, PracticeQuestionSet practiceQuestionSet, Integer status) {

        PracticeQuestion pq = new PracticeQuestion();
        pq.setIdpracticeQuestion(idpracticeQuestion);
        pq.setPracticeQuestionSet(practiceQuestionSet);
        pq.setStatus(status + "");
        s.save(pq);
        s.beginTransaction().commit();
        s.close();
        return pq;
    }

    public void setAnswersHistory(PracticeQuestion practiceQuestion, User user, Answers answersobj, String answer, String type) {
        AnswersHistory ah = new AnswersHistory();
        ah.setPracticeQuestion(practiceQuestion);
        ah.setUser(user);
        ah.setType(type);
        ah.setAnswer(answer);
        ah.setAnswers(answersobj);

        s.save(ah);
        s.beginTransaction().commit();
        s.close();

    }

    public void setEnumSecurityQuestions(String quection) {
        EnumSecurityQuestions esq = new EnumSecurityQuestions();
        esq.setQuestion(quection);
        esq.setIsactive(1);
        s.save(esq);
        s.beginTransaction().commit();
        s.close();
    }

    public void updeteUserPass(User u) {
        Transaction beginTransaction = s.beginTransaction();
        s.update(u);
        beginTransaction.commit();
        s.close();
    }

//    public synchronized void updateEnumQuestionSetStatus(QuestionSet eqss) {
//        Transaction beginTransaction = s.beginTransaction();
//        s.update(eqss);
//        beginTransaction.commit();
//        s.close();
//    }
    public synchronized void updateEnumQuestionStatus(QuestionSet eqss, Question eqs) {
        Session openSession = NewHibernateUtil.getSessionFactory().openSession();
        System.out.println(openSession.getStatistics().getCollectionCount() + "");
        try {
            Transaction beginTransaction = openSession.beginTransaction();
//            s.update(eqss);
            openSession.update(eqs);
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (openSession.isOpen()) {
                openSession.close();
            }
        }

//        s.close();
    }

    public boolean updatePracticeExamScore(PracticeQuestionSet prquesetbyid, int finalscore) {

        prquesetbyid.setScore(finalscore);

        s.update(prquesetbyid);
        s.beginTransaction().commit();
        s.close();
        System.out.println("updated");

        return true;
    }

    public void updateAnswersHistory(AnswersHistory ah, String answer) {
     
        ah.setAnswer(answer);
      

        s.update(ah);
        s.beginTransaction().commit();
        s.close();

    }

}
