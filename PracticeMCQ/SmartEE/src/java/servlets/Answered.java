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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import moduls.Getting;
import moduls.Setting;
import pojo.Answers;
import pojo.AnswersHistory;
import pojo.PracticeQuestion;
import pojo.PracticeQuestionSet;
import pojo.Question;
import pojo.User;

/**
 *
 * @author User
 */
public class Answered extends HttpServlet {

    public static int backpracticequestionset;
    public static int backsavedprquestion;
    public static int backsubmitanswernum;
    int finalscore;

    int submitanswernum, answerno;
    Answers correctanswerobj;
    int i = 0;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String que = req.getParameter("Que");
        String prqueset = req.getParameter("prqueset").trim();
        int number = Integer.parseInt(req.getParameter("number"));
        String type = req.getParameter("type");
        String submitanswer = req.getParameter("answer");
        String nextorsubmit = req.getParameter("nextorsubmit");

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

            String quessetid = "";
            Cookie[] cookiesqs = req.getCookies();
            for (Cookie cooky : cookiesqs) {
                if (cooky.getName().equals("practicequestionset")) {
                    quessetid = cooky.getValue();
                }
            }

            PracticeQuestionSet prquesetbyid = getting.getPracticeQuestionSetById(Integer.parseInt(quessetid));

            int currentscore = prquesetbyid.getScore();

            backpracticequestionset = prquesetbyid.getIdpracticeQuestionHistory();
            int score = 2;

            int saveid = getting.getPracticeQuestionmaxid();
            Question question = getting.getQuestionByQuestionId(que);

            List<Answers> answers = getting.getAnswerListByQuetionId(question);

            for (int j = 0; j < answers.size(); j++) {

                if (answers.get(j).getIscorrect() == 1) {
                    answerno = j + 1;
                    correctanswerobj = answers.get(j);
                }
            }

            switch (submitanswer) {
                case "AnswerA":
                    submitanswernum = 1;
                    break;
                case "AnswerB":
                    submitanswernum = 2;
                    break;
                case "AnswerC":
                    submitanswernum = 3;
                    break;
                case "AnswerD":
                    submitanswernum = 4;
                    break;
                case "AnswerE":
                    submitanswernum = 5;
                    break;
            }
            backsubmitanswernum = submitanswernum;

            String qno = number + 1 + "";
            PracticeQuestion savedpracticequestion = getting.getPracticeQuestionByPracticeQuestionsetIDandQNO(prquesetbyid, qno);

            if (getting.s.isOpen()) {
                getting.s.close();
            }
            if (savedpracticequestion == null) {

                PracticeQuestion savedprquestion = new Setting().setPracticeQuestion(saveid, prquesetbyid, number + 1);
                backsavedprquestion = savedprquestion.getIdpracticeQuestion();

                if (answerno == submitanswernum) {

                    finalscore = currentscore + score;

                    new Setting().updatePracticeExamScore(prquesetbyid, finalscore);

                }
                new Setting().setAnswersHistory(savedprquestion, userById, correctanswerobj, submitanswer, type);

            } else {
                Getting gettingsession = new Getting();
                AnswersHistory answerhistoryobj = gettingsession.getAnswersHistoryByPracticeQuetionId(savedpracticequestion);

                if (gettingsession.s.isOpen()) {
                    gettingsession.s.close();
                }

                new Setting().updateAnswersHistory(answerhistoryobj, submitanswer);

                if (answerno == submitanswernum) {

                    finalscore = currentscore + score;

                    new Setting().updatePracticeExamScore(prquesetbyid, finalscore);

                } else {
                    
                    if(currentscore>=2){
                    
                    finalscore = currentscore - score;
                     new Setting().updatePracticeExamScore(prquesetbyid, finalscore);
                    }else{
                    new Setting().updatePracticeExamScore(prquesetbyid, currentscore);
                    }
                }

            }

            PrintWriter out = resp.getWriter();
            out.print(nextorsubmit + "_" + finalscore + "_" + userid);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
