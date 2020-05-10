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

/**
 *
 * @author User
 */
public class checksubject extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    boolean checkusubject = new Getting().checkSubject(req.getParameter("subject"));
        if (!checkusubject) {
           new Setting().Setsubject(req.getParameter("subject"));
            resp.sendRedirect("Subject.jsp");
        }
    }
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean checkusubject = new Getting().checkSubject(req.getParameter("subject"));
        resp.getWriter().write(""+checkusubject);
    }

}
