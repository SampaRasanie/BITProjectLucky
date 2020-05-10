<%-- 
    Document   : Login
    Created on : Jul 24, 2019, 10:13:25 PM
    Author     : User
--%>

<%@page import="pojo.EnumSubject"%>
<%@page import="pojo.QuestionSet"%>
<%@page import="java.util.List"%>
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

        <!-- Animate.css -->
        <link rel="stylesheet" href="assets2/css/animate.css" />
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="assets2/css/icomoon.css"/>
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="assets2/css/bootstrap.css"/>

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="assets2/css/magnific-popup.css"/>

        <!-- Flexslider  -->
        <link rel="stylesheet" href="assets2/css/flexslider.css"/>

        <!-- Owl Carousel -->
        <link rel="stylesheet" href="assets2/css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="assets2/css/owl.theme.default.min.css"/>

        <!-- Flaticons  -->
        <link rel="stylesheet" href="assets2/fonts/flaticon/font/flaticon.css"/>

        <!-- Theme style  -->
        <link rel="stylesheet" href="assets2/css/style.css"/>

        <style>
            @import url("http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,400italic");
            @import url("//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css");
            body {
                padding: 60px 0px;
                background-color: rgb(220, 220, 220);
            }

            .event-list {
                list-style: none;
                font-family: 'Lato', sans-serif;
                margin: 0px;
                padding: 0px;
            }
            .event-list > li {
                background-color: rgb(255, 255, 255);
                box-shadow: 0px 0px 5px rgb(51, 51, 51);
                box-shadow: 0px 0px 5px rgba(51, 51, 51, 0.7);
                padding: 0px;
                margin: 0px 0px 20px;
            }
            .event-list > li > time {
                display: inline-block;
                width: 100%;
                color: rgb(255, 255, 255);
                background-color: rgb(197, 44, 102);
                padding: 5px;
                text-align: center;
                text-transform: uppercase;
            }
            .event-list > li:nth-child(even) > time {
                background-color: rgb(165, 82, 167);
            }
            .event-list > li > time > span {
                display: none;
            }
            .event-list > li > time > .day {
                display: block;
                font-size: 56pt;
                font-weight: 100;
                line-height: 1;
            }
            .event-list > li time > .month {
                display: block;
                font-size: 24pt;
                font-weight: 900;
                line-height: 1;
            }
            .event-list > li > img {
                width: 100%;
            }
            .event-list > li > .info {
                padding-top: 5px;
                text-align: center;
            }
            .event-list > li > .info > .title {
                font-size: 17pt;
                font-weight: 700;
                margin: 0px;
            }
            .event-list > li > .info > .desc {
                font-size: 13pt;
                font-weight: 300;
                margin: 0px;
            }
            .event-list > li > .info > ul,
            .event-list > li > .social > ul {
                display: table;
                list-style: none;
                margin: 10px 0px 0px;
                padding: 0px;
                width: 100%;
                text-align: center;
            }
            .event-list > li > .social > ul {
                margin: 0px;
            }
            .event-list > li > .info > ul > li,
            .event-list > li > .social > ul > li {
                display: table-cell;
                cursor: pointer;
                color: rgb(30, 30, 30);
                font-size: 11pt;
                font-weight: 300;
                padding: 3px 0px;
            }
            .event-list > li > .info > ul > li > a {
                display: block;
                width: 100%;
                color: rgb(30, 30, 30);
                text-decoration: none;
            } 
            .event-list > li > .social > ul > li {    
                padding: 0px;
            }
            .event-list > li > .social > ul > li > a {
                padding: 3px 0px;
            } 
            .event-list > li > .info > ul > li:hover,
            .event-list > li > .social > ul > li:hover {
                color: rgb(30, 30, 30);
                background-color: rgb(200, 200, 200);
            }
            .facebook a,
            .twitter a,
            .google-plus a {
                display: block;
                width: 100%;
                color: rgb(75, 110, 168) !important;
            }
            .twitter a {
                color: rgb(79, 213, 248) !important;
            }
            .google-plus a {
                color: rgb(221, 75, 57) !important;
            }
            .facebook:hover a {
                color: rgb(255, 255, 255) !important;
                background-color: rgb(75, 110, 168) !important;
            }
            .twitter:hover a {
                color: rgb(255, 255, 255) !important;
                background-color: rgb(79, 213, 248) !important;
            }
            .google-plus:hover a {
                color: rgb(255, 255, 255) !important;
                background-color: rgb(221, 75, 57) !important;
            }

            @media (min-width: 768px) {
                .event-list > li {
                    position: relative;
                    display: block;
                    width: 100%;
                    height: 120px;
                    padding: 0px;
                }
                .event-list > li > time,
                .event-list > li > img  {
                    display: inline-block;
                }
                .event-list > li > time,
                .event-list > li > img {
                    width: 120px;
                    float: left;
                }
                .event-list > li > .info {
                    background-color: rgb(245, 245, 245);
                    overflow: hidden;
                }
                .event-list > li > time,
                .event-list > li > img {
                    width: 120px;
                    height: 120px;
                    padding: 0px;
                    margin: 0px;
                }
                .event-list > li > .info {
                    position: relative;
                    height: 120px;
                    text-align: left;
                    padding-right: 40px;
                }	
                .event-list > li > .info > .title, 
                .event-list > li > .info > .desc {
                    padding: 0px 10px;
                }
                .event-list > li > .info > ul {
                    position: absolute;
                    left: 0px;
                    bottom: 0px;
                }
                .event-list > li > .social {
                    position: absolute;
                    top: 0px;
                    right: 0px;
                    display: block;
                    width: 40px;
                }
                .event-list > li > .social > ul {
                    border-left: 1px solid rgb(230, 230, 230);
                }
                .event-list > li > .social > ul > li {			
                    display: block;
                    padding: 0px;
                }
                .event-list > li > .social > ul > li > a {
                    display: block;
                    width: 40px;
                    padding: 10px 0px 9px;
                }
            }             

        </style>

    </head>

    <body style="background-color:#F7F8FA;">

        <!-- menu -->
        <%@include file="Header.jsp" %>
        <!-- end of menu -->

        <div class="colorlib-loader"></div>
        <div  style="margin-top: 250px; ">
            <div class="colorlib-search">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 search-wrap">
                            <div class="search-wrap-2">
                                <form method="post" class="colorlib-form" action="Search.jsp">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <!-- <label for="search">Search Course</label> -->
                                                <div class="form-field">
                                                    <input type="text" id="search" name="text"   class="form-control" placeholder="Search Papers"  required/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <!-- <label for="course">Category Course</label> -->
                                                <div class="form-field">
                                                    <i class="icon icon-arrow-down3"></i>
                                                    <select name="Subjectss" id="people" class="form-control" style="height: 50px;">
                                                        <%                                                        List<EnumSubject> l = new Getting().getallsubject();
                                                            for (EnumSubject row : l) {
                                                                pageContext.setAttribute("rows", row.getSubject());
                                                        %>
                                                        <option value="${rows}">${rows}</option>
                                                        <%                                                            }
                                                        %>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <!-- <label for="difficulty">Difficulty</label> -->
                                                <div class="form-field">
                                                    <i class="icon icon-arrow-down3"></i>
                                                    <select name="people" id="people" class="form-control" style="height: 50px;">
                                                        <option value="sin">සිංහල</option>
                                                        <option value="en">English</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="submit" name="submit" id="submit" value="Search Papers" class="btn btn-primary btn-block">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="[ col-xs-12 col-sm-offset-2 col-sm-8 ]">
                    <ul class="event-list">

                        <%            boolean b = false;
                            String text = request.getParameter("text");
                            String sub = request.getParameter("Subjectss");
                            String lan = request.getParameter("people");
                            if (text != null && sub != null && lan != null) {
                                b = true;
                            } else {
                                response.sendRedirect("Index.jsp");
                            }
                            if (b) {
                                int i = 1;
                                List<QuestionSet> l2 = new Getting().getQuestionSetBySubAndLanAndTitel(sub, lan, text);
                                for (QuestionSet elem : l2) {
                                    String ss[] = elem.getName().split("_");
                                    //            }

                        %>
                        <li>
                            <!--<a href="EXam.jsp?type=subject&subject=<% out.write(sub); %>&lan=<% out.write(lan); %>&QSI=<% out.write(elem.getIdquestionset() + ""); %>"/>-->
                            <time datetime="2014-07-20">
                                <span class="day" style="margin-top: 15px;" ><%out.write(i + ""); %></span>
                            </time>
                            <!--<img alt="Independence Day" src="https://farm4.staticflickr.com/3100/2693171833_3545fb852c_q.jpg" />-->
                            <div class="info">
                                <h2 class="title">Title : <% out.write(ss[0]); %></h2>
                                <p class="desc">Author : <% out.write(elem.getUser().getUsername()); %></p>
                            </div>
                            <div class="social">
                                <ul>
                                    <li class="facebook" style="width: 33%"><a href="EXam.jsp?type=subject&subject=<% out.write(sub); %>&lan=<% out.write(lan); %>&QSI=<% out.write(elem.getIdquestionset() + ""); %>"><img src="https://img.icons8.com/cute-clipart/64/000000/book.png"/></a></li>
                                    <!--                                    <li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
                                                                        <li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
                                                                        <li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>-->
                                </ul>
                            </div>
                            <!--</a>-->
                        </li>


                        <%      i++;
                                }
                            }
                        %>
                    </ul>
                </div>
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

        <!-- Modernizr JS -->
        <script src="assets2/js/modernizr-2.6.2.min.js"></script>

        <!-- jQuery -->
        <script src="assets2/js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="assets2/js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="assets2/js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="assets2/js/jquery.waypoints.min.js"></script>
        <!-- Stellar Parallax -->
        <script src="assets2/js/jquery.stellar.min.js"></script>
        <!-- Flexslider -->
        <script src="assets2/js/jquery.flexslider-min.js"></script>
        <!-- Owl carousel -->
        <script src="assets2/js/owl.carousel.min.js"></script>
        <!-- Magnific Popup -->
        <script src="assets2/js/jquery.magnific-popup.min.js"></script>
        <script src="assets2/js/magnific-popup-options.js"></script>
        <!-- Counters -->
        <script src="assets2/js/jquery.countTo.js"></script>
        <!-- Main -->
        <script src="assets2/js/main.js"></script> 
    </body>
</html>
