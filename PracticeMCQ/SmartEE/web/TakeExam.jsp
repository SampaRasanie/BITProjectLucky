<%-- 
    Document   : Login
    Created on : Jul 24, 2019, 10:13:25 PM
    Author     : User
--%>

<%@page import="pojo.PracticeQuestion"%>
<%@page import="servlets.Answered"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.io.IOException"%>
<%@page import="moduls.Setting"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="pojo.PracticeQuestionSet"%>
<%@page import="pojo.AnswersHistory"%>
<%@page import="pojo.User"%>
<%@page import="java.util.List"%>
<%@page import="pojo.QuestionSet"%>
<%@page import="pojo.EnumSubject"%>
<%@page import="moduls.Getting"%>
<%@page import="moduls.NewClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html" lang="en">

    <head>
        <title>PracticeMCQ</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta charset="UTF-8"/>

        <!-- Font -->
        <!-- Stylesheets -->      
        <link href="assets/fonts/ionicons.css" rel="stylesheet"/>

        <!-- Stylesheets -->
        <link href="assets/plugin-frameworks/bootstrap.min.css" rel="stylesheet"/>
        <link href="assets/common/styles.css" rel="stylesheet"/>
        <style>
            .progress{
                background-color: #4e5256 !important;
            }

        </style>

    </head>

    <body style="background-color:#F7F8FA; margin-top: 100px; margin-bottom:100px;">

        <!-- menu -->
        <%@include file="Header.jsp" %>
        <!-- end of menu -->

        <%          
            String qsid = (String) request.getParameter("qsi");
            int pqid = 0;
            System.out.println("id " + qsid);

            String userid = "";
            Cookie[] cookies = request.getCookies();
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("id")) {
                    userid = cooky.getValue();
                }
            }
            try {
                Getting getting = new Getting();
                User userById = getting.getUserById(userid);

                QuestionSet qs = getting.getAQuestionSetById(qsid);

                System.out.println("user question");

                String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
                Date parse = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(format);
//
                getting.s.close();
                PracticeQuestionSet pq = new Setting().setPracticeQuestionSet(qs, 0, userById, parse);

                Cookie c1 = new Cookie("practicequestionset", pq.getIdpracticeQuestionHistory() + "");
                response.addCookie(c1);

                System.out.println("practice ques id = " + pq.getIdpracticeQuestionHistory());
                pqid = pq.getIdpracticeQuestionHistory();
                String strpqid = pqid + "";
          
        %>

        <label  id="qsis" style="visibility: hidden;"><%out.write(qsid); %></label>
        <label  id="prqueset" style="visibility: hidden;"><%out.write(strpqid); %> </label>

        <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <div class="container-fluid">
            <h2>TAKE PRACTICE EXAMINATION</h2>
            <div class="row">
                <div class="col-10 py-4">

                    <div class="progress">
                        <div class="progress-bar bg-warning" id="pro" role="progressbar" style="width:0%;" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100">Question Completion:0</div>
                    </div>
                    <hr>
                        <p>
                            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                Question Navigator <span class="badge badge-light">50</span>
                            </button>
                        </p>
                        <div class="collapse" id="collapseExample">
                            <div class="card card-body col-12">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <%
                                        for (int i = 1; i <= 25; i++) {

                                    %>
                                    <button type="button" class="btn btn-secondary col-1" onclick="selectque(<% out.write(i + "");  %>)"><% out.write(i + "");  %></button>
                                    <%                                        }
                                    %>

                                </div>
                                <hr>
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <%
                                            for (int i = 26; i <= 50; i++) {
                                        %>
                                        <button type="button" class="btn btn-secondary col-1" onclick="selectque(<% out.write(i + "");  %>)"><% out.write(i + "");  %></button>
                                        <%                                        }
                                        %>

                                    </div>
                            </div>
                        </div>

                </div>
             
            </div>
            <div class="row" id="question">

            </div>

        </div>

        <footer class="fixed-bottom">

            <div class="container ">
                <div class="row">
                    <div class="col-6 py-4">
                        <div>
                            <p>
                                @ 2019 ICTA. All Rights Reserved<br>
                                    Visit ICTA main site
                            </p>

                        </div>

                    </div>
                    <div class="col-6 py-4">
                        <div class="float-md-right">
                            <p>
                                No: 160/24, Kirimandala Mw, Col-5 Sri Lanka <br>
                                    Voice:  +94-11-2369099
                            </p>
                        </div>
                    </div>
                </div>
            </div>  
            </div><!-- container -->
        </footer>

        <!-- SCRIPTS -->



        <script src="assets/plugin-frameworks/popper.js'"></script>
        <script src="assets/plugin-frameworks/jquery-3.2.1.min.js"></script>

        <script src="assets/plugin-frameworks/bootstrap.min.js"></script>
        <script src="assets/plugin-frameworks/canvasjs.min.js"></script>


        <!-- <script src="common/scripts.js"></script> -->
        <script src="assets/common/scripts.js"></script>
        <script>

                                            var qe = 0;
                                            // var pro = document.getElementById("pro");

                                            //            pro.value = qe;

                                            function loadernext() {
                                                var qeset = document.getElementById("qsis").innerHTML;
                                                var xhttp = new XMLHttpRequest();
                                                xhttp.onreadystatechange = function() {
                                                    if (this.readyState === 4 && this.status === 200) {
                                                        document.getElementById("question").innerHTML = xhttp.responseText;
                                                         checkAnswerButton();
                                                    }
                                                };
                                                xhttp.open("Post", "Aquestion.jsp", true);
                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                xhttp.send("QeSet=" + qeset + "&Qe=" + qe + "&command=" + 1);
                                            }

                                            function checkAnswerButton() {

                                                var markedanswer = document.getElementById("markedanswer").innerHTML;
                                                                                            
                                                if (markedanswer.trim() == "AnswerA") {
                                                    $("#option1").attr("checked", "checked");
                                                    var eventHander = $("#option1").closest("label");
                                                    eventHander.addClass("active");
                                                } else if (markedanswer.trim() == "AnswerB") {
                                                    $("#option2").attr("checked", "checked");
                                                    var eventHander = $("#option2").closest("label");
                                                    eventHander.addClass("active");
                                                } else if (markedanswer.trim() == "AnswerC") {
                                                    $("#option3").attr("checked", "checked");
                                                    var eventHander = $("#option3").closest("label");
                                                    eventHander.addClass("active");
                                                } else if (markedanswer.trim() == "AnswerD") {
                                                    $("#option4").attr("checked", "checked");
                                                    var eventHander = $("#option4").closest("label");
                                                    eventHander.addClass("active");
                                                } else if (markedanswer.trim() == "AnswerE") {
                                                    $("#option5").attr("checked", "checked");
                                                    var eventHander = $("#option5").closest("label");
                                                    eventHander.addClass("active");
                                                }else{
                                                   
                                                }

                                            }

                                            function loaderback() {
                                                var qeset = document.getElementById("qsis").innerHTML;
                                                var xhttp = new XMLHttpRequest();
                                                xhttp.onreadystatechange = function() {
                                                    if (this.readyState === 4 && this.status === 200) {
                                                        document.getElementById("question").innerHTML = xhttp.responseText;
                                                        checkAnswerButton();
                                                    }
                                                };
                                                xhttp.open("Post", "Aquestion.jsp", true);
                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                xhttp.send("QeSet=" + qeset + "&Qe=" + qe + "&command=" + 2);
                                            }

                                            function next(q, ii) {

                                                var prqueset = document.getElementById("prqueset").innerHTML;
                                                var answerValue = $("input[name='options']:checked").val();
                                             
                                                var xhttp = new XMLHttpRequest();
                                                xhttp.onreadystatechange = function() {
                                                    if (this.readyState === 4 && this.status === 200) {
                                                     
                                                    var result=xhttp.responseText;
                                                    var resultarr= result.split("_");
                                                     console.log(result);
                                                     if(resultarr[0]=="SUBMIT "){
                                                     console.log(resultarr);
                                                     document.location = "results.jsp?finalscore="+resultarr[1]+"&userid="+resultarr[2];    
                                                        
                                                  }
                                                    }
                                                };
//                                             
                                               
                                                var nextorsubmit = document.getElementById("nextbtn").innerHTML;
                                                xhttp.open("Post", "Answered", true);
                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                xhttp.send("Que=" + ii + "&number=" + q + "&answer=" + answerValue + "&type=practice" + "&prqueset=" + prqueset + "&nextorsubmit=" + nextorsubmit);
                                                if (qe < 50) {
                                                    if (qe === 49) {

                                                    } else {
                                                        qe = ++q;
                                                        loadernext();
                                                    }
                                                }

                                                ////                    pro.value = q;
                                                //                                                    pro.style = "width:" + (qe * 2) + "%;";
                                                //                                                    pro.innerHTML = "question completion:" + qe;
                                                //                                                    
                                            }







                                            function back(ii) {
                                                if (qe !== 0) {

                                                    qe = --ii;
                                                 
                                                    loaderback();
                                                 

//                                                      pro.style = "width:" + (qe * 2) + "%;";
//                                                    pro.innerHTML = "question completion:" + qe;


                                                }
//                                                xhttp.open("Post", "BackAnswers", true);
//                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//                                                xhttp.send("Que=" + qe);
//
                                            }
                                            function selectque(ii) {
                                                qe = ii - 1;
                                                loader();
                                            }
                                            var clicked = 0;
                                            function selectanswer(ii, q) {
                                           
                                                if (clicked !== 0) {
                                                    clicked = 0;
                                                    document.getElementById("option" + ii).click();
                                                    clicked = ii;
                                                }
                                                if (clicked === 0) {
                                                    clicked = ii;
                                                }
                                                document.getElementById("nextbtn").disabled = "";
                                           
    }
                                            window.onload = loadernext();
        </script>

    </body>
</html>
