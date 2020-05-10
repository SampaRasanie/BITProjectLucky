/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.Getting;
import moduls.Setting;
import org.hibernate.HibernateException;
import pojo.PracticeQuestionSet;
import pojo.QuestionSet;
import pojo.User;

/**
 *
 * @author User
 */
@WebServlet(name = "CreatePracticePaperSet", urlPatterns = {"/CreatePracticePaperSet"})
public class CreatePracticePaperSet extends HttpServlet {

    /**
     *
     * @param req
     * @param res
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String QeSet = req.getParameter("QeSet");

        String userid = "";
        Cookie[] cookies = req.getCookies();
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("id")) {
                userid = cooky.getValue();
            }
        }
        try {
            Getting getting = new Getting();
            User userById = getting.getUserById(userid);

            QuestionSet qs = getting.getAQuestionSetById(QeSet);
            getting.s.close();

            String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            Date parse = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(format);

            PracticeQuestionSet pq = new Setting().setPracticeQuestionSet(qs, 0, userById, parse);

            System.out.println("practice ques id = " + pq.getIdpracticeQuestionHistory());
            Integer pqid = pq.getIdpracticeQuestionHistory();
            res.sendRedirect("TakeExam.jsp?savedpq="+pqid);
            
        } catch (HibernateException | ParseException | IOException e) {
            e.printStackTrace();
        }

    }

}
