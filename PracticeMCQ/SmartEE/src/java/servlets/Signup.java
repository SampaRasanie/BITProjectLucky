/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.NewClass;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import pojo.NewHibernateUtil;
import pojo.User;

/**
 *
 * @author User
 */
public class Signup extends HttpServlet {

    private Session s;

    public Signup() {
        s = NewHibernateUtil.getSessionFactory().openSession();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String email = req.getParameter("email");
        String un = req.getParameter("un");
        String pw = req.getParameter("pw");
        String sq = req.getParameter("security_question");
        String ans = req.getParameter("answer");
        String usertype = req.getParameter("usertype");

        Criteria cr = s.createCriteria(User.class);

        cr.add(Restrictions.eq("email", email));
        User u = (User) cr.uniqueResult();

        if (u == null) {
            if (usertype == null) {
                new NewClass().signup(un, pw, fname, lname, email, sq, ans);

            } else {
                new NewClass().signup(un, pw, fname, lname, email, sq, ans, usertype);
            }
            Criteria cr1 = s.createCriteria(User.class);
            cr1.add(Restrictions.eq("username", un));
            User u1 = (User) cr1.uniqueResult();
            if (usertype == null) {
                if (u1 == null) {
                    resp.sendRedirect("Login.jsp");
                } else {
                    resp.sendRedirect("registration.jsp?p=fail&re=Alrady Use That Username");
                }
            } else {
                resp.sendRedirect("userForm.jsp?p=fail&re=Alrady Use That Username");
            }
        } else {
            if (usertype == null) {
                resp.sendRedirect("registration.jsp?p=fail&re=Alrady Registerted");
            } else {
                resp.sendRedirect("userForm.jsp?p=fail&re=Alrady Registerted");
            }
        }
    }

}
