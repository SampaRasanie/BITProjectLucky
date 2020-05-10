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

/**
 *
 * @author User
 */
public class checkusertype extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    boolean checkutype = new NewClass().checkutype(req.getParameter("type"));
        if (!checkutype) {
            new NewClass().settype(req.getParameter("type"));
            resp.sendRedirect("userTypes.jsp");
        }
    }
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean checkutype = new NewClass().checkutype(req.getParameter("type"));
        resp.getWriter().write(""+checkutype);
    }

}
