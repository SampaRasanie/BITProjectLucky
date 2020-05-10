/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.Getting;
import moduls.Setting;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import pojo.NewHibernateUtil;
import pojo.User;

/**
 *
 * @author User
 */
public class resetpass extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("newpass");

        Session s = NewHibernateUtil.getSessionFactory().openSession();
        Transaction beginTransaction = s.beginTransaction();
        User user = (User) s.createCriteria(User.class).add(Restrictions.eq("email", email)).uniqueResult();
        user.setPassword(pass);
        s.update(user);
        beginTransaction.commit();
        s.close();
        
        resp.sendRedirect("Login.jsp");
    }

}
