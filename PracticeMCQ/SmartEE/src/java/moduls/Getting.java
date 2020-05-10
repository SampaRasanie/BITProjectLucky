/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moduls;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import pojo.Answers;
import pojo.AnswersHistory;
import pojo.EnumQuestionSetStatus;
import pojo.EnumQuestionStatus;
import pojo.EnumSections;
import pojo.EnumSecurityQuestions;
import pojo.EnumSubject;
import pojo.EnumUserType;
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
public class Getting {

    private User u;
    public Session s;

    public Getting() {
        s = NewHibernateUtil.getSessionFactory().openSession();
    }

    public Getting(Session session) {
        s = session;
    }

    public Session getS() {
        return s;
    }

    public List<Question> getAllQuestions() {
        Criteria cc = s.createCriteria(Question.class);
        return cc.list();
    }

    public List<User> getallRegisteredUsers() {
        Criteria cc = s.createCriteria(User.class);
        return cc.list();
    }

    public List<User> getallRegisteredUsersbyType(String type) {
        Criteria cc1 = s.createCriteria(EnumUserType.class);
        cc1.add(Restrictions.eq("usertype", type));
        EnumUserType ur = (EnumUserType) cc1.uniqueResult();

        Criteria cc = s.createCriteria(User.class);
        cc.add(Restrictions.eq("enumUserType", ur));

        return cc.list();
    }

    public List<EnumSecurityQuestions> getallquestion() {
        Criteria cc = s.createCriteria(EnumSecurityQuestions.class);

        return cc.list();
    }

    public List<EnumSubject> getallsubject() {
        return s.createCriteria(EnumSubject.class).list();
    }

    public EnumSubject getSubjectIdBySuject(String sub) {
        Criteria cc = s.createCriteria(EnumSubject.class);
        cc.add(Restrictions.eq("subject", sub));

        return (EnumSubject) cc.uniqueResult();
    }

    public boolean checkSubject(String s1) {

        Criteria cr = s.createCriteria(EnumSubject.class);
        cr.add(Restrictions.eq("subject", s1));
        EnumSubject un = (EnumSubject) cr.uniqueResult();

        return un != null;
    }

    public User getUserById(String id) {
        Criteria cc = s.createCriteria(User.class);
        cc.add(Restrictions.eq("iduser", Integer.parseInt(id)));
        return (User) cc.uniqueResult();
    }

    public EnumQuestionSetStatus getQSSByStateus(String state) {
        Criteria cc = s.createCriteria(EnumQuestionSetStatus.class);
        cc.add(Restrictions.eq("status", state));
        return (EnumQuestionSetStatus) cc.uniqueResult();
    }

    public EnumSections getEnumsilecions() {
        Criteria cc = s.createCriteria(EnumSections.class);
        cc.add(Restrictions.eq("title", "name"));

        return (EnumSections) cc.uniqueResult();
    }

    public EnumQuestionStatus getEQS() {
        Criteria cc = s.createCriteria(EnumQuestionStatus.class);
        cc.add(Restrictions.eq("status", "Active"));
        return (EnumQuestionStatus) cc.uniqueResult();
    }

    public EnumQuestionStatus getEQSByStatus(String q) {
        return (EnumQuestionStatus) s.createCriteria(EnumQuestionStatus.class).add(Restrictions.eq("status", q)).uniqueResult();
    }

    public int getQuestionmaxid() {
        Criteria cc = s.createCriteria(QuestionSet.class);
        int i = 0;
        try {
            List<QuestionSet> list = cc.list();
            QuestionSet nameid = (QuestionSet) list.get(list.size() - 1);
            Integer idquestionset = nameid.getIdquestionset();

            i = idquestionset + 1;

        } catch (Exception e) {
            i = 1;
        }

        return i;
    }

    public int getPracticeQuestionmaxid() {
        Criteria cc = s.createCriteria(PracticeQuestion.class);
        int i = 0;
        try {
            List<PracticeQuestion> list = cc.list();
            PracticeQuestion nameid = (PracticeQuestion) list.get(list.size() - 1);
            Integer idprquestionset = nameid.getIdpracticeQuestion();

            i = idprquestionset + 1;

        } catch (Exception e) {
            i = 1;
        }

        return i;
    }

    public List<Question> getAllQuestions(String state, boolean all) {
        Criteria cc = s.createCriteria(Question.class);
//        cc.add(Restrictions.eq("questionSet", ));
        List<Question> l = new ArrayList<>();
        List<Question> list = cc.list();
        EnumQuestionSetStatus eqss = getQSSByStateus(state);

        myloop:
        for (Question question : list) {
            if (all) {
                l.addAll(list);
                break myloop;
            } else {
                if (question.getQuestionSet().getEnumQuestionSetStatus().getIdqestionsetstatus() == eqss.getIdqestionsetstatus()) {
                    l.add(question);
                }
            }
        }
        return cc.list();
    }

    public List<QuestionSet> getAllQuestionSets() {
        Criteria cc = s.createCriteria(QuestionSet.class);
//        cc.add(Restrictions.eq("questionSet", ));
//        List<Question> l = new ArrayList<>();
//        List<Question> list = cc.list();
//        EnumQuestionSetStatus eqss = getQSSByStateus(state);
//
//        myloop:
//        for (Question question : list) {
//            if (all) {
//                l.addAll(list);
//                break myloop;
//            } else {
//                if (question.getQuestionSet().getEnumQuestionSetStatus().getIdqestionsetstatus() == eqss.getIdqestionsetstatus()) {
//                    l.add(question);
//                }
//            }
//        }
        return cc.list();
    }

    public Answers getAnswersesByQuetionId(Question q) {
        Criteria cc = s.createCriteria(Answers.class);
        cc.add(Restrictions.eq("question", q));

        return (Answers) cc.uniqueResult();
    }

    public List<Answers> getAnswerListByQuetionId(Question q) {
        Criteria cc = s.createCriteria(Answers.class);
        cc.add(Restrictions.eq("question", q));

        return cc.list();
    }

    public int getQuestionsCount() {
        return s.createCriteria(Question.class).list().size();
    }

    public int getPapersCount() {
        return s.createCriteria(QuestionSet.class).list().size();
    }

    public int getUserCount() {
        return s.createCriteria(User.class).list().size();
    }

    public int getEditorscount() {
        Criteria cc = s.createCriteria(EnumUserType.class);
        cc.add(Restrictions.eq("usertype", "editor"));
        return s.createCriteria(User.class).add(Restrictions.eq("enumUserType", (EnumUserType) cc.uniqueResult())).list().size();
    }

    public QuestionSet getAQuestionSetById(String id) {
        QuestionSet qs = (QuestionSet) s.load(QuestionSet.class, Integer.parseInt(id));
        return qs;
    }

    public PracticeQuestionSet getPracticeQuestionSetById(Integer id) {
        PracticeQuestionSet pqs = (PracticeQuestionSet) s.load(PracticeQuestionSet.class, id);
        return pqs;
    }

    public List<PracticeQuestionSet> getPracticeQuestionSetByUser(User user) {
        Criteria cc = s.createCriteria(PracticeQuestionSet.class);
        cc.add(Restrictions.eq("user", user));
        return cc.list();

    }

    public List<Question> getQuestionByQuestionset(QuestionSet qs) {
        return s.createCriteria(Question.class).add(Restrictions.eq("questionSet", qs)).list();
    }

    public List<QuestionSet> getQuestionSetBySubject(EnumSubject es) {
        Criteria cc = s.createCriteria(QuestionSet.class);
        cc.add(Restrictions.eq("enumSubject", es));
        return cc.list();
    }

    public List<QuestionSet> getQuestionSetBySubjectAndlan(EnumSubject es, String lan) {
        Criteria cc = s.createCriteria(QuestionSet.class);
        cc.add(Restrictions.eq("enumSubject", es));
        cc.add(Restrictions.like("name", lan, MatchMode.END));
        return cc.list();
    }

    public List<AnswersHistory> getAnswersHistoryByUserAndQuestionsetAndType(User u, QuestionSet qs, String type) {
        Criteria cc = s.createCriteria(AnswersHistory.class);
        cc.add(Restrictions.eq("user", u));
        cc.add(Restrictions.eq("type", type));
        cc.add(Restrictions.eq("questionSet", qs));
        return cc.list();
    }

    public List<AnswersHistory> getAnswersHistoryByUserAndType(User u, String type) {
        Criteria cc = s.createCriteria(AnswersHistory.class);
        cc.add(Restrictions.eq("user", u));
        cc.add(Restrictions.eq("type", type));
        return cc.list();
    }

    public Question getQuestionByQuestionId(String qs) {
        Criteria cc = s.createCriteria(Question.class);
        cc.add(Restrictions.eq("idquestion", Integer.parseInt(qs)));
        return (Question) cc.uniqueResult();
    }

    public List<Question> getQuestionByQuestionsetlans(String lan, String subject, String type, User u) {
        Criteria cc1 = s.createCriteria(EnumSubject.class);
        cc1.add(Restrictions.eq("subject", subject));

        System.out.println("cc1 " + cc1.list().size());

        Criteria cc = s.createCriteria(QuestionSet.class);
        cc.add(Restrictions.like("name", "_" + lan, MatchMode.END));
        cc.add(Restrictions.eq("enumSubject", (EnumSubject) cc1.uniqueResult()));

        System.out.println("cc " + cc.list().size());

        List<Question> l = new ArrayList<>();

        Criteria cc2 = s.createCriteria(Question.class);
        List<QuestionSet> list = cc.list();

        for (QuestionSet qs : list) {
            Criteria cc4 = s.createCriteria(Answers.class);

            System.out.println("cc result " + ((QuestionSet) cc.uniqueResult()).getIdquestionset());

            cc4.add(Restrictions.eq("question", qs));

            System.out.println("cc4 " + cc4.list().size());

            Criteria cc3 = s.createCriteria(AnswersHistory.class);

            cc3.add(Restrictions.eq("answers", cc4.uniqueResult()));
            cc3.add(Restrictions.eq("type", type));
            cc3.add(Restrictions.eq("user", u));

            System.out.println("cc3 " + cc3.list().size());

            cc2.add(Restrictions.eq("questionSet", qs));

            System.out.println("cc2 " + cc2.list().size());

            List<AnswersHistory> list1 = cc3.list();
            List<Question> list2 = cc2.list();
            for (AnswersHistory ah : list1) {
                Integer idquestion1 = ah.getAnswers().getQuestion().getIdquestion();
                for (Question q : list2) {
                    Integer idquestion = q.getIdquestion();
                    if (idquestion != idquestion1) {
                        l.add(q);
                    }
                }
            }
        }
        System.out.println("final " + l.size());
        return l;
    }

    public QuestionSet getQuestionByQuestionsetID(Integer quesetid) {
        Criteria cc = s.createCriteria(QuestionSet.class);
        cc.add(Restrictions.eq("idquestionset", quesetid));

        return (QuestionSet) cc.uniqueResult();
    }

    public List<Question> getQuestionByQuestionsetlan(String lan, String subject, String type, User u) {
        List<Question> l = new ArrayList<>();

        Criteria cc = s.createCriteria(AnswersHistory.class);
        cc.add(Restrictions.eq("user", u));
        cc.add(Restrictions.eq("type", type));

        List<AnswersHistory> list = cc.list();
        System.out.println(list.size());
        List<Question> allQuestions = getAllQuestions("Active", false);
        for (Question allQuestion : allQuestions) {
            if (list.size() == 0) {
                Boolean method = method(allQuestion, lan, subject);
                if (method) {
                    l.add(allQuestion);
                }
            }
            for (AnswersHistory ah : list) {
                System.out.println(allQuestion.getIdquestion());
                Question question = ah.getAnswers().getQuestion();
                if (question.getIdquestion() != allQuestion.getIdquestion()) {
                    Boolean method = method(allQuestion, lan, subject);
                    if (method) {
                        l.add(allQuestion);
                    }
                }
            }
        }

        return l;
    }

    private boolean method(Question q, String lan, String sub) {
        QuestionSet qs = q.getQuestionSet();
        EnumSubject enumSubject = qs.getEnumSubject();
        boolean b = false;
        if (enumSubject.getSubject().equals(sub)) {
            Criteria cc = s.createCriteria(QuestionSet.class);
            cc.add(Restrictions.eq("idquestionset", qs.getIdquestionset()));
            cc.add(Restrictions.like("name", lan, MatchMode.END));
            cc.add(Restrictions.eq("enumSubject", enumSubject));

            if (cc.list().size() > 0) {
                b = true;
            }
        }
        return b;
    }

    public List<EnumSecurityQuestions> getAllEnumSecurityQuestionses() {
        return s.createCriteria(EnumSecurityQuestions.class).list();
    }

    public boolean chackEnumSecurityQuestionse(String sw) {
        return s.createCriteria(EnumSecurityQuestions.class).add(Restrictions.eq("question", sw)).uniqueResult() != null;
    }

    public List<QuestionSet> getQuestionSetBySubAndLanAndTitel(String Sub, String lan, String Title) {

        System.out.println(Sub + " " + lan + " " + Title);
        List<QuestionSet> l = new ArrayList<>();
        List<QuestionSet> questionSetBySubject = getQuestionSetBySubject(getSubjectIdBySuject(Sub));
        Criteria cc = s.createCriteria(QuestionSet.class);
        cc.add(Restrictions.like("name", Title, MatchMode.ANYWHERE));
        cc.add(Restrictions.like("name", lan, MatchMode.END));
        List<QuestionSet> list = cc.list();
        for (QuestionSet qs : questionSetBySubject) {
            for (QuestionSet qs1 : list) {
                if (qs.getIdquestionset() == qs1.getIdquestionset()) {
                    System.out.println("sub " + qs.getName());
                    l.add(qs);
                }
            }
        }

        return l;
    }

    public User getUserByEmail(String email) {
        return (User) s.createCriteria(User.class).add(Restrictions.eq("email", email)).uniqueResult();
    }

    public PracticeQuestion getPracticeQuestionByPracticeQuestionsetIDandQNO(PracticeQuestionSet quesetid, String queno) {
        Criteria cc = s.createCriteria(PracticeQuestion.class);
        cc.add(Restrictions.and(Restrictions.eq("practiceQuestionSet", quesetid), Restrictions.eq("status", queno)));
        return (PracticeQuestion) cc.uniqueResult();
    }

    public AnswersHistory getAnswersHistoryByPracticeQuetionId(PracticeQuestion q) {
        Criteria cc = s.createCriteria(AnswersHistory.class);
        cc.add(Restrictions.eq("practiceQuestion", q));
       
        return (AnswersHistory) cc.uniqueResult();
    }

    public List<Question> getQuestionsBySubject(String subjectname) {
        System.out.println("in getQuestionsBySubject");
        List<Question> quesonsubject = new ArrayList<>();
        Criteria cc = s.createCriteria(EnumSubject.class);
        EnumSubject subjectobj = (EnumSubject) cc.add(Restrictions.eq("subject", subjectname)).uniqueResult();
        List<QuestionSet> qslist = s.createCriteria(QuestionSet.class).add(Restrictions.eq("enumSubject", subjectobj)).list();
        for (QuestionSet questionSet : qslist) {
            List<Question> qlist = s.createCriteria(Question.class).add(Restrictions.eq("questionSet", questionSet)).list();
            for (Question question : qlist) {
                quesonsubject.add(question);
            }
        }

        return quesonsubject;
    }

}
