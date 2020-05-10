<%-- 
    Document   : Login
    Created on : Jul 24, 2019, 10:13:25 PM
    Author     : User
--%>

<%@page import="java.util.Random"%>
<%@page import="pojo.Question"%>
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

    </head>

    <body style="background-color:#F7F8FA; margin-top: 100px; margin-bottom:100px; ">

        <!-- menu -->
        <%@include file="Header.jsp" %>
        <!-- end of menu -->

        <%            String name1 = "";
            String subject = request.getParameter("subject");
            String la = request.getParameter("lan");
            String que = request.getParameter("que");

            Getting getting = new Getting();
            if (request.getCookies() == null) {
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

//                   
        %>
        <label  id="id" style="visibility: hidden;"><% out.write(name1); %></label>
        <label  id="lan" style="visibility: hidden;"><% out.write(la); %></label>
        <label  id="sub" style="visibility: hidden;"><% out.write(subject); %></label>
        <label  id="type" style="visibility: hidden;">time</label>
        <div class="container-fluid">
            <h2>Question Time Line</h2>
            <div class="row">
                <div class="col-10 py-4">

<!--                    <div class="progress">
                        <div class="progress-bar bg-warning" id="pro" role="progressbar" style="width:0%;" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100">question completion:0</div>
                    </div>-->
                    <hr>
                        <!--                        <p>
                                                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                        Question Navigator <span class="badge badge-light">50</span>
                                                    </button>
                                                </p>-->
                        <!--                        <div class="collapse" id="collapseExample">
                                                    <div class="card card-body col-12">
                                                        <div class="btn-group" role="group" aria-label="Basic example">
                        <%                                        for (int i = 1; i <= 25; i++) {

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
        </div>-->

                </div>
                <div class="col-2">
                    <div id="clockDiv">10:50:30</div>
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
            var qe = 1;
//            pro.value = qe;
            function loader() {

                var ln = document.getElementById("lan").innerHTML;
                var sub = document.getElementById("sub").innerHTML;
                var id = document.getElementById("id").innerHTML;
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("question").innerHTML = xhttp.responseText;
                        qe++;
                    }
                };
                xhttp.open("Post", "Aquestion.jsp", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("sub=" + sub + "&type=time&lan=" + ln + "&id=" + id + "&no=" + qe);


            }

            function next(ii) {
                loader();

            }
//            function back(ii) {
//                if (qe !== 0) {
//                    qe = --ii;
//                    loader();
//                    pro.style = "width:" + (qe * 2) + "%;";
//                    pro.innerHTML = "question completion:" + qe;
//                }
//            }
//            function selectque(ii) {
//                loader();
//            }

            function selectanswer(ii, q) {
                var cor = "";
                var type = document.getElementById("type").innerHTML;
                for (var i = 1; i <= 5; i++) {
                    if (i != ii) {
                        document.getElementById("option" + i).disabled = "true";
                    } else {
                        cor = document.getElementById("answer" + i).innerHTML;
//                        alert(cor);
                    }
                }
//                var qeset = document.getElementById("qsis").innerHTML;
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        next(qe);
                    }
                };
                xhttp.open("Post", "Answered", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("Qe=" + q + "&sele=" + q + "&seleq=" + cor + "&type=" + type);
            }

            2
            var today = new Date();
//            var time = today.getFullYear() + " " + today.getMonth() + " " + today.getDate() + " " + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var v = (today.getMonth()+1)+" "+today.getDate()+", "+today.getFullYear()+" "+(today.getHours()+1)+":"+today.getMinutes()+":"+today.getSeconds();
            var deadline = new Date(""+v).getTime();
            var x = setInterval(function () {
//                alert(time);
                var now = new Date().getTime();
                var t = deadline - now;
//                var days = Math.floor(t / (1000 * 60 * 60 * 24));
                var hours = Math.floor((t % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((t % (1000 * 60)) / 1000);
                document.getElementById("clockDiv").innerHTML = hours + "h " + minutes + "m " + seconds + "s ";
                if (t < 0) {
                    clearInterval(x);
                    document.getElementById("clockDiv").innerHTML = "EXPIRED";
                    document.getElementById("next").disabled = true;
                    
                }
            }, 1000);


            window.onload = loader();

        </script>
        <%
                }
            }
//               
        %>
    </body>
</html>
