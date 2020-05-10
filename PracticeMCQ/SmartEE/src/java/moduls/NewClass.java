/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moduls;

import java.util.HashSet;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import pojo.Account;
import pojo.EnumSecurityQuestions;
import pojo.EnumUserStatus;
import pojo.EnumUserType;
import pojo.NewHibernateUtil;
import pojo.User;

/**
 *
 * @author User
 */
public class NewClass {

    private User u;
    public Session s;
    private Account account;
    private EnumSecurityQuestions enumSecurityQuestions;
    private EnumUserStatus enumUserStatus;
    private EnumUserType enumUserType;
    private HashSet<Object> hashSet;

    public NewClass() {
        s = NewHibernateUtil.getSessionFactory().openSession();

    }

    public void addmember() {
        try {

//            account = (Account) s.load(Account.class, 1);
//            account =(Account) s.createQuery("FROM account WHERE name = qwe").uniqueResult();
//            q.setParameter("n", "qwe");
//            account = (Account)q.list().get(0);
            account = (Account) s.get(
                    Account.class, 1
            );

            enumSecurityQuestions = (EnumSecurityQuestions) s.get(EnumSecurityQuestions.class, 1);
            enumUserStatus = (EnumUserStatus) s.get(EnumUserStatus.class, 1);
            enumUserType = (EnumUserType) s.get(EnumUserType.class, 1);
            hashSet = new HashSet<Object>();
            hashSet.add("sdf");
            u = new User();
//            s = sd.getSef().openSession();
            s.save(u);

            System.out.println("   asdasdhadahjdhasdhasdhakdhasdhsdasdsadhasd");

            s.beginTransaction().commit();
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public boolean login(String un, String ps) {

//        Query q = s.createQuery("FROM account WHERE username ='" + un + "' AND password = '" + ps + "' ");
        Criteria cr = s.createCriteria(User.class);
//        cr.add(Restrictions.like(ps, un, MatchMode.ANYWHERE);
        cr.add(Restrictions.eq("email", un));
        cr.add(Restrictions.eq("password", ps));
        User u = (User) cr.uniqueResult();

//        ge
//        List<User> list = cr.list();
//        for (User user : list) {
//            
//        }
        return u != null;
    }

    public User getloginuser(String un, String ps) {
        Criteria cr = s.createCriteria(User.class);
        cr.add(Restrictions.eq("email", un));
        cr.add(Restrictions.eq("password", ps));

        return (User) cr.uniqueResult();
    }

    private void Test() {
        Account acc = (Account) s.createCriteria(Account.class).add(Restrictions.eq("name", "qwe")).uniqueResult();
        User u = (User) s.createCriteria(User.class).add(Restrictions.eq("account", acc)).uniqueResult();

    }

    public void signup(String username, String pass, String fname, String lname, String email, String se_qu, String se_qu_an) {
        u = new User();
        Criteria cr = s.createCriteria(EnumSecurityQuestions.class);
        cr.add(Restrictions.eq("question", se_qu));
        EnumSecurityQuestions sequid = (EnumSecurityQuestions) cr.uniqueResult();

        account = (Account) s.get(
                Account.class, 1
        );
        enumUserStatus = (EnumUserStatus) s.get(EnumUserStatus.class, 1);
        enumUserType = (EnumUserType) s.get(EnumUserType.class, 1);
        hashSet = new HashSet<Object>();
        hashSet.add("sdf");

        u.setUsername(username);
        u.setPassword(pass);
        u.setFirstname(fname);
        u.setLastname(lname);
        u.setEmail(email);
        u.setEnumSecurityQuestions(sequid);
        u.setSecquestionaswer(se_qu_an);
        u.setAccount(account);
        u.setEnumUserStatus(enumUserStatus);
        u.setEnumUserType(enumUserType);
        s.save(u);
        s.beginTransaction().commit();
        s.close();
    }
    public void signup(String username, String pass, String fname, String lname, String email, String se_qu, String se_qu_an,String usertype) {
        u = new User();
        Criteria cr = s.createCriteria(EnumSecurityQuestions.class);
        cr.add(Restrictions.eq("question", se_qu));
        EnumSecurityQuestions sequid = (EnumSecurityQuestions) cr.uniqueResult();

        account = (Account) s.get(
                Account.class, 1
        );
        enumUserStatus = (EnumUserStatus) s.get(EnumUserStatus.class, 1);
        
        Criteria cr1 = s.createCriteria(EnumUserType.class);
        cr1.add(Restrictions.eq("usertype", usertype));
        enumUserType =(EnumUserType) cr1.uniqueResult();
//        enumUserType = (EnumUserType) s.get(EnumUserType.class, 1);
        hashSet = new HashSet<Object>();
        hashSet.add("sdf");

        System.out.println(sequid+"huuuuu");
        
        u.setUsername(username);
        u.setPassword(pass);
        u.setFirstname(fname);
        u.setLastname(lname);
        u.setEmail(email);
        u.setEnumSecurityQuestions(sequid);
        u.setSecquestionaswer(se_qu_an);
        u.setAccount(account);
        u.setEnumUserStatus(enumUserStatus);
        u.setEnumUserType(enumUserType);
        s.save(u);
        s.beginTransaction().commit();
        s.close();
    }

    public boolean chackemail(String s1) {
        Criteria cr = s.createCriteria(User.class);
        cr.add(Restrictions.eq("email", s1));
        return cr.list().isEmpty();
    }

    public EnumUserType getusertype(String s1) {
        Criteria cr = s.createCriteria(EnumUserType.class);
        cr.add(Restrictions.eq("usertype", s1));
        return (EnumUserType) cr.uniqueResult();
    }

    public User getUserbyid(String id) {
        Criteria cr = s.createCriteria(User.class);
        cr.add(Restrictions.eq("iduser", Integer.parseInt(id)));
        User u = (User) cr.uniqueResult();
        return u;
    }

    public boolean checkutype(String s1) {

        Criteria cr = s.createCriteria(EnumUserType.class);
        cr.add(Restrictions.eq("usertype", s1));
        EnumUserType un = (EnumUserType) cr.uniqueResult();

        return un != null;
    }

    public void settype(String s1) {
        EnumUserType eUT1 = new EnumUserType();
//        eUT1.setIdusertype(0);
        eUT1.setUsertype(s1);
        s.save(eUT1);
        s.beginTransaction().commit();
        s.close();
    }

    public List getSequ() {
        Criteria cr = s.createCriteria(EnumSecurityQuestions.class);
        cr.add(Restrictions.eq("isactive", 1));

        return cr.list();
    }

    public List getusty() {
        Criteria cr = s.createCriteria(EnumUserType.class);

        return cr.list();
    }
}
