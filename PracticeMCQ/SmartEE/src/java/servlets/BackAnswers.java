/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.Getting;
import pojo.AnswersHistory;
import pojo.PracticeQuestion;
import pojo.PracticeQuestionSet;

/**
 *
 * @author User
 */
@WebServlet(name = "BackAnswers", urlPatterns = {"/BackAnswers"})
public class BackAnswers extends HttpServlet {

    public static String answer;

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in back");
        String que = request.getParameter("Que");

        String quessetid = "";
        Cookie[] cookiesqs = request.getCookies();
        for (Cookie cooky : cookiesqs) {
            if (cooky.getName().equals("practicequestionset")) {
                quessetid = cooky.getValue();
            }
        }

        answer = findSavedAnswer(quessetid, que);

    }

    public static String findSavedAnswer(String quessetid, String que) {

        Getting getting = new Getting();
        PracticeQuestionSet prquesetbyid = getting.getPracticeQuestionSetById(Integer.parseInt(quessetid));
        PracticeQuestion practicequestion = getting.getPracticeQuestionByPracticeQuestionsetIDandQNO(prquesetbyid, que);
        AnswersHistory answershistory = getting.getAnswersHistoryByPracticeQuetionId(practicequestion);
        String answer = answershistory.getAnswer();
        System.out.println("answer " + answer);
        return answer;
    }

}
