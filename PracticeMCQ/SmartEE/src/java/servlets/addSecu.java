/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.SeekableByteChannel;
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
public class addSecu extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean cesq = new Getting().chackEnumSecurityQuestionse(req.getParameter("que"));
        resp.getWriter().write("" + cesq);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean cesq = new Getting().chackEnumSecurityQuestionse(req.getParameter("que"));
        if (!cesq) {
            new Setting().setEnumSecurityQuestions(req.getParameter("que"));
            resp.sendRedirect("ManegeSecurity.jsp");
        }
    }

}
