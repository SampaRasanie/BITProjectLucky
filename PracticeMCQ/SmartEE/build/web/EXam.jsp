<%--
    /**Document   : Login
    Created on : Jul 24, 2019, 10:13:25 PM
    Author     : User
--%>

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
        <title>Smart EE</title>
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

    <body style="background-color:#F7F8FA; margin-top: 100px; margin-bottom:100px; ">

        <!-- menu -->
        <%@include file="Header.jsp" %>
        <!-- end of menu -->

        <%            
            String name1 = "";
            String type = request.getParameter("type");
            String la = request.getParameter("lan");
            if (type.equals("time")) {
                response.sendRedirect("Examtime.jsp?lan=" + la + "&subject=" + request.getParameter("subject"));
            }
            // String QSI = request.getParameter("QSI");
            Getting getting = new Getting();
            if (request.getCookies() == null && type == null) {
                response.sendRedirect("Login.jsp");
            } else {
                boolean bc = false;
                Cookie c[] = request.getCookies();
                for (Cookie co : c) {
                    if (co.getName().equals("id")) {
                        name1 = co.getValue();
                        bc = true;
                        break;
                    }
                }

                if (!bc) {
                    response.sendRedirect("Login.jsp");
                } else {
//                    if (type.equals("subject") && QSI == null) {
//                        String sub = request.getParameter("subject");
//                        EnumSubject es = getting.getSubjectIdBySuject(sub);
//                        List<QuestionSet> qs = getting.getQuestionSetBySubjectAndlan(es, "_" + la);
//                        User u = getting.getUserById(name1);
//                        QuestionSet qs3 = null;
//                        boolean flag = true;
//                        presetquestionloop:
//                        for (QuestionSet qs1 : qs) {
//
//                            //   getting.getQuestionsCount()
//                            List<AnswersHistory> ahl = getting.getAnswersHistoryByUserAndQuestionsetAndType(u, qs1, type);
//                            System.out.println(ahl.size());
//                            if (ahl.size() == 50) {
//                                for (QuestionSet qs2 : qs) {
//                                    for (AnswersHistory ah : ahl) {
//
////                                        System.out.println(ah.getQuestionSet().getIdquestionset() + " " + qs2.getIdquestionset());
//                                        if (!qs2.getIdquestionset().equals(ah.getPracticeQuestion().getPracticeQuestionSet().getQuestionSet().getIdquestionset())) {
//                                            System.out.println("send");
//                                            flag = false;
//                                            qs3 = qs2;
//                                            response.sendRedirect("EXam.jsp?type=" + type + "&Subject=" + sub + "&QSI=" + qs2.getIdquestionset());
//                                            break presetquestionloop;
//                                        }
//                                    }
//
//                                }
//                            } else {
//                                if (flag) {
//                                    qs3 = qs1;
//                                    flag = true;
//                                    System.out.println("not");
//                                    break presetquestionloop;
//                                }
//                            }
//
//                        }
//                        response.sendRedirect("EXam.jsp?type=" + type + "&subject=" + sub + "&lan=" + la + "&QSI=" + qs3.getIdquestionset());
////                        if (flag) {
////                            response.sendRedirect("EXam.jsp?type=" + type + "&Subject=" + sub + "&QSI=" + qs2.getIdquestionset());
////                        }
//                    }
////                        for (AnswersHistory ah : ahl) {
////
////                        }
                    // if (QSI != null && la != null) {
//                    Integer qsid = Integer.parseInt(request.getParameter("qsid"));
//                    QuestionSet qs = getting.getQuestionByQuestionsetID(qsid);
//                    System.out.print(qsid);
        %>
        <!--label  id="qsis" style="visibility: hidden;"><% //out.write(QSI); %></label>
        <label  id="type" style="visibility: hidden;"><%// out.write(type); %></label-->

        <div class="container-fluid">
            <h2>PRACTICE EXAMINATION</h2>
            <div class="row">
                <div class="col-10 py-4">

                    <div class="progress">
                        <div class="progress-bar bg-warning" id="pro" role="progressbar" style="width:0%;" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"> Question Completion:0</div>
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
                                            }
                                        %>


                                    </div>
                            </div>
                        </div>

                </div>
                <!--                <div class="col-2">
                                    <div id="clockDiv">10:50:30</div>
                                </div>-->
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
                                    Visite ICTA main site
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
                                            var pro = document.getElementById("pro");
//            pro.value = qe;
                                            function loader() {

                                                var qeset = document.getElementById("qsis").innerHTML;

                                                var xhttp = new XMLHttpRequest();

                                                xhttp.onreadystatechange = function() {
                                                    if (this.readyState == 4 && this.status == 200) {
                                                        document.getElementById("question").innerHTML = xhttp.responseText;
                                                    }
                                                };
                                                xhttp.open("Post", "Aquestion.jsp", true);
                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                xhttp.send("QeSet=" + qeset + "&Qe=" + qe);


                                            }

                                            function next(q, ii) {

                                                var answerValue = $("input[name='options']:checked").val();
                                                console.log(answerValue);
                                                var type = document.getElementById("type").innerHTML;
                                                qe++;
                                                var xhttp = new XMLHttpRequest();

                                                xhttp.onreadystatechange = function() {
                                                    if (this.readyState == 4 && this.status == 200) {
                                                        //next(qe);
                                                    }
                                                };
                                                xhttp.open("Post", "Answered", true);
                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                xhttp.send("Qe=" + ii + "&sele=" + ii + "&seleq=" + answerValue + "&type=" + type);


//                                                if (ii === 3) {
//                                                    document.getElementById("nextbtn").value = "FINISH";
//
//                                                }

                                                //  if (qe !== 50) {
                                                qe = q;
                                                loader();
                                                //   }
////                    pro.value = q;
//                                                    pro.style = "width:" + (qe * 2) + "%;";
//                                                    pro.innerHTML = "question completion:" + qe;
//                                                    
//                                                    
//                                                    
//                                                    
//                                                    
//                                                }
                                            }
                                            function back(ii) {
                                                if (qe !== 0) {
                                                    qe = --ii;
                                                    loader();
                                                    pro.style = "width:" + (qe * 2) + "%;";
                                                    pro.innerHTML = "question completion:" + qe;
                                                }
                                            }
                                            function selectque(ii) {
                                                qe = ii - 1;
                                                loader();
                                            }
                                            var clicked = 0;


                                            function selectanswer(ii, q) {
                                                var cor = "";

                                              //  var type = document.getElementById("type").innerHTML;
                                                //for (var i = 1; i <= 5; i++) {
                                                // if(document.getElementById("option" + i).c)
//                                                    if (i != ii) {
//                                                      //  document.getElementById("option" + i).disabled = "true";
//                                                    } else {

                                                if (clicked !== 0) {
                                                    clicked = 0;
                                                    document.getElementById("option" + ii).click();
                                                    clicked = ii;
                                                }
                                                if (clicked === 0) {
                                                    clicked = ii;
                                                }
                                               // cor = document.getElementById("option" + ii).value;

                                                document.getElementById("nextbtn").disabled = "";
//                                                        alert(cor);
                                                // }
                                                // }
//                                                var qeset = document.getElementById("qsis").innerHTML;
//                                                var xhttp = new XMLHttpRequest();
//
//                                                xhttp.onreadystatechange = function() {
//                                                    if (this.readyState == 4 && this.status == 200) {
//                                                        //next(qe);
//                                                    }
//                                                };
//                                                xhttp.open("Post", "Answered", true);
//                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//                                                xhttp.send("Qe=" + q + "&sele=" + q + "&seleq=" + cor + "&type=" + type);
                                            }



                                            window.onload = loader();

        </script>
        <%
                }
            }
        }
        %>
    </body>
</html>
