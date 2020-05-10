/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.NewClass;
import pojo.EnumUserType;
import pojo.User;

/**
 *
 * @author User
 */
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String us = req.getParameter("username");
        String ps = req.getParameter("password");
        NewClass newClass = new NewClass();
        boolean login = newClass.login(us, ps);
        if (login) {
            User loginuser = newClass.getloginuser(us, ps);
            Cookie c = new Cookie("id", loginuser.getIduser() + "");
            resp.addCookie(c);
            EnumUserType admin = newClass.getusertype("Admin");
            EnumUserType edior = newClass.getusertype("Editor");
            System.out.println(loginuser.getEnumUserType());
            System.out.println(admin.getIdusertype());
            if (loginuser.getEnumUserType().getIdusertype().equals(admin.getIdusertype()) || loginuser.getEnumUserType().getIdusertype().equals(edior.getIdusertype())) {
                resp.sendRedirect("dashboard.jsp");
            } else {
                resp.sendRedirect("Login.jsp?p=pass");
            }
        } else {
            resp.sendRedirect("Login.jsp?p=fail");
        }

    }

}
