<%@page import="pojo.Answers"%>
<%@page import="java.util.Random"%>
<%@page import="pojo.Question"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pojo.EnumSubject"%>
<%@page import="java.util.List"%>
<%@page import="moduls.Getting"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PracticeMCQ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">

        <!-- Animate.css -->
        <link rel="stylesheet" href="assets2/css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="assets2/css/icomoon.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="assets2/css/bootstrap.css">

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="assets2/css/magnific-popup.css">

        <!-- Flexslider  -->
        <link rel="stylesheet" href="assets2/css/flexslider.css">

        <!-- Owl Carousel -->
        <link rel="stylesheet" href="assets2/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets2/css/owl.theme.default.min.css">

        <!-- Flaticons  -->
        <link rel="stylesheet" href="assets2/fonts/flaticon/font/flaticon.css">

        <!-- Theme style  -->
        <link rel="stylesheet" href="assets2/css/style.css">

        <!-- Modernizr JS -->
        <script src="assets2/js/modernizr-2.6.2.min.js"></script>

    </head>
    <body>

        <div class="colorlib-loader"></div>

        <div id="page">
            <nav class="colorlib-nav" role="navigation">
                <div class="top-menu">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2">
                                <div id="colorlib-logo"><a href="Index.jsp">PracticeMCQ</a></div>
                            </div>
                            <div class="col-md-10 text-right menu-1">
                                <ul>
                                    <li class="active"><a href="IndexVI.jsp">Support Mode</a></li>
                                    <li class="active"><a href="dashboard.jsp">Dashboard</a></li>
                                    <li><a href="Login.jsp">Login</a></li>
                                        <%

                                            String name1 = "";
                                            boolean b = false;
                                            if (request.getCookies() != null) {
                                                Cookie c[] = request.getCookies();
                                                myloop:
                                                for (Cookie co : c) {
                                                    if (co.getName().equals("id")) {
                                                        name1 = co.getValue();
                                                        b = true;
                                                        break myloop;
                                                    }
                                                }

                                            }
                                            if (!b) {
                                        %>

                                    <li class="btn-cta"><a href="registration.jsp"><span>Sign Up</span></a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <aside id="colorlib-hero">
                <div class="flexslider">
                    <ul class="slides">
                        <li style="background-image: url(assets2/images/img_bg_1.jpg);">
                            <div class="overlay"></div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-8 col-sm-12 col-md-offset-2 col-xs-12 col-md-pull-1 slider-text">
                                        <div class="slider-text-inner">
                                            <div class="desc">
                                                <h2>PracticeMCQ</h2>
                                                <h1>Better Way To Exams</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li style="background-image: url(assets2/images/img_bg_5.jpg);">
                            <div class="overlay"></div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-8 col-sm-12 col-md-offset-2 col-xs-12 col-md-pull-1 slider-text">
                                        <div class="slider-text-inner">
                                            <div class="desc">
                                                <h2>PracticeMCQ</h2>
                                                <h1>Better Way To Exams</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li style="background-image: url(assets2/images/img_bg_3.jpg);">
                            <div class="overlay"></div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-8 col-sm-12 col-md-offset-2 col-xs-12 col-md-pull-1 slider-text">
                                        <div class="slider-text-inner">
                                            <div class="desc">
                                                <h2>PracticeMCQ</h2>
                                                <h1>Better Way To Exams</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li style="background-image: url(assets2/images/img_bg_4.jpg);">
                            <div class="overlay"></div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-8 col-sm-12 col-md-offset-2 col-xs-12 col-md-pull-1 slider-text">
                                        <div class="slider-text-inner">
                                            <div class="desc">
                                                <h2>PracticeMCQ</h2>
                                                <h1>Better Way To Exams</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>	
                    </ul>
                </div>
            </aside>

            <div class="colorlib-search">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 search-wrap">
                            <div class="search-wrap-2">
                                <form method="post" class="colorlib-form" action="Search.jsp">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="form-field">
                                                    <input type="text" id="search" name="text" class="form-control" placeholder="Search Papers">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="form-field">
                                                    <i class="icon icon-arrow-down3"></i>
                                                    <select name="Subjectss" id="people" class="form-control">
                                                        <%
                                                            List<EnumSubject> l = new Getting().getallsubject();
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
                                                <div class="form-field">
                                                    <i class="icon icon-arrow-down3"></i>
                                                    <select name="people" id="people" class="form-control">
                                                        <option value="sin">සිංහල</option>
                                                        <option value="en">English</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="submit" name="Search Paper" id="submit" value="Search Papers" class="btn btn-primary btn-block">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="colorlib-services">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 services-wrap">
                            <div class="row">
                                <div class="col-md-4 col-sm-6 text-center animate-box">
                                    <a class="services" onclick="return dad()" id="time"  >
                                        <span class="icon">
                                            <i><img src="https://img.icons8.com/cute-clipart/64/000000/hourglass-sand-bottom.png"></i>
                                        </span>
                                        <div class="desc">
                                            <h3>Practice <br>Quizzes</h3>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4 col-sm-6 text-center animate-box">
                                    <a  id="subjectsss"  class="services" onclick="return dad()" >
                                        <span class="icon">
                                            <i ><img src="https://img.icons8.com/cute-clipart/64/000000/book.png"></i>
                                        </span>
                                        <div class="desc">
                                            <h3>Take <br>Examination</h3>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4 col-sm-6 text-center animate-box">
                                    <a  id="add"  class="services" onclick="return dad()" >
                                        <span class="icon">
                                            <i><img src="https://img.icons8.com/cute-clipart/64/000000/paper.png"></i>
                                        </span>
                                        <div class="desc">
                                            <h3>Add  <br>Examination Paper</h3>
                                        </div>
                                    </a>
                                </div>
                             
                            </div>
                        </div>
                     
                    </div>
                </div>
            </div>



























            <div class="container">
                <!--                <h2>Modal Example</h2>-->
                <!-- Trigger the modal with a button -->
                <!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>-->

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

<!--                         Timed Modal content
                        <div class="modal-content">
                            <form action="Exam.jsp" method="GET">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title" id="modal_title">sasd</h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="type" id="model_type" class="d-none"/>
                                    <select name="subject"  id="subs" class="form-control"  >
                                        <%
                                            List<EnumSubject> qwe = new Getting().getallsubject();
                                            for (EnumSubject row : qwe) {

                                        %>
                                        <option value="<%out.write(row.getSubject()); %>"><%out.write(row.getSubject()); %></option>
                                        <%                                                            }
                                        %>

                                    </select>

                                    <select name="lan" id="people" class="form-control">
                                        <option value="sin">සිංහල</option>
                                        <option value="en">English</option>
                                    </select>

                                </div>
                                <div class="modal-footer">
                                    <button type="submit"  class="btn btn-default" >Submitss</button>
                                    <button type="button"  class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>




-->








                        <!-- Modal content-->
                        <div class="modal-content">
                            <form action="searchPapersResult.jsp" method="GET">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title" id="modal_title">sasd</h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="type" id="model_type" class="d-none"/>
                                    <select name="subject"  id="subs" class="form-control"  >
                                        <%
                                            List<EnumSubject> que = new Getting().getallsubject();
                                            for (EnumSubject row : que) {

                                        %>
                                        <option value="<%out.write(row.getSubject()); %>"><%out.write(row.getSubject()); %></option>
                                        <%                                                            }
                                        %>

                                    </select>

                                    <select name="lan" id="people" class="form-control">
                                        <option value="sin">සිංහල</option>
                                        <option value="en">English</option>
                                    </select>

                                </div>
                                <div class="modal-footer">
                                    <button type="submit"  class="btn btn-default" >Submit</button>
                                    <button type="button"  class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>

            </div>

            <!--            <div class="colorlib-classes">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
                                        <h1 class="heading-big"> Sample Questions </h1>
                                        <h2> Sample Questions </h2>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 animate-box">
                                        <div class="owl-carousel">
            <%
                List<Question> q = new Getting().getAllQuestions("", true);
       //         if (q.size() != 0) {

           //         Random r = new Random();
//                                   //     for (int i = 0; i <= 10; i++) {
//                                            Question qu = q.get(r.nextInt(q.size()));
//                                            String[] s = qu.getImgpath().split("uploads");
//
//                                            Answers a = new Getting().getAnswersesByQuetionId(qu);
//                                            String[] qs = a.getText().split("_");
//
//                                            int j = a.getIscorrect() - 1;
            %>
            <div class="item">
                <div class="classes">
                    <div class="classes-img" style="background-image: url(<%//  out.write("uploads" + s[1] + ".jpg");  %>);">
                    </div>
                    <div class="wrap">
                        <div class="desc">
                            <span class="teacher"><% // out.write(qu.getQuestionSet().getUser().getUsername());  %></span>
                            <h3><a href="#"><%// out.write(qu.getQuestiontext()); %></a></h3>
                        </div>
                        <div class="pricing">
                            <p><span class="price"><% //out.write(qs[j]); %></span> 
            <%
                //for (int h = 0; h <= 4; h++) {
                //  if (h != j) {
            %>
            <span class="price old-price"><% //out.write(qs[h]); %></span>
            <%
                //  }
                //  }
            %>
            <span class="more"><a href="#"><i class="icon-link"></i></a></span></p>
    </div>
</div>
</div>
</div>

            <%                                   // }
                //  }

            %>

        </div>
    </div>
</div>
</div>	
</div>
<div id="colorlib-counter" class="colorlib-counters">
<div class="container">
<div class="col-md-7">
    <div class="about-desc">
        <div class="about-img-1 animate-box" style="background-image: url(assets2/images/about-img-2.jpg);"></div>
        <div class="about-img-2 animate-box" style="background-image: url(assets2/images/about-img-1.jpg);"></div>
    </div>
</div>
<div class="col-md-5">
    <div class="row">
        <div class="col-md-12 colorlib-heading animate-box">
            <h1 class="heading-big">Who are we</h1>
            <h2>Who are we</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 animate-box">
            <p><strong>Even the all-powerful Pointing has no control about the blind texts</strong></p>
            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
        </div>
        <div class="col-md-6 col-sm-6 animate-box">
            <div class="counter-entry">
                <div class="desc">
                    <span class="colorlib-counter js-counter" data-from="0" data-to="<% out.write(new Getting().getPapersCount() + ""); %>" data-speed="5000" data-refresh-interval="50"></span>
                    <span class="colorlib-counter-label">Papers</span>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6 animate-box">
            <div class="counter-entry">
                <div class="desc">
                    <span class="colorlib-counter js-counter" data-from="0" data-to="<% out.write(new Getting().getQuestionsCount() + ""); %>" data-speed="5000" data-refresh-interval="50"></span>
                    <span class="colorlib-counter-label">Questions</span>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6 animate-box">
            <div class="counter-entry">
                <div class="desc">
                    <span class="colorlib-counter js-counter" data-from="0" data-to="<% out.write(new Getting().getUserCount() + ""); %>" data-speed="5000" data-refresh-interval="50"></span>
                    <span class="colorlib-counter-label">Users</span>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6 animate-box">
            <div class="counter-entry">
                <div class="desc">
                    <span class="colorlib-counter js-counter" data-from="0" data-to="<% out.write(new Getting().getEditorscount() + "");%>" data-speed="5000" data-refresh-interval="50"></span>
                    <span class="colorlib-counter-label">Editors</span>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<div id="colorlib-testimony" class="testimony-img" style="background-image: url(assets2/images/img_bg_2.jpg); margin-bottom: 4em;" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
<div class="container-fluid">
<div class="row">
    <div class="col-md-12 center-heading text-center colorlib-heading animate-box">
        <h1 class="heading-big">What are the students says</h1>
        <h2>What are the students says</h2>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="testimony-flex">
            <div class="one-fifth animate-box">
                <span class="icon"><i class="icon-quotes-left"></i></span>
                <div class="testimony-wrap">
                    <blockquote>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    </blockquote>
                    <div class="desc">
                        <div class="figure-img" style="background-image: url(assets2/images/person1.jpg);"></div>
                        <h3>Dave Henderson</h3>
                    </div>
                </div>
            </div>
            <div class="one-fifth animate-box">
                <span class="icon"><i class="icon-quotes-left"></i></span>
                <div class="testimony-wrap">
                    <blockquote>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics.</p>
                    </blockquote>
                    <div class="desc">
                        <div class="figure-img" style="background-image: url(assets2/images/person2.jpg);"></div>
                        <h3>Dave Henderson</h3>
                    </div>
                </div>
            </div>
            <div class="one-fifth animate-box">
                <span class="icon"><i class="icon-quotes-left"></i></span>
                <div class="testimony-wrap">
                    <blockquote>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                    </blockquote>
                    <div class="desc">
                        <div class="figure-img" style="background-image: url(assets2/images/person3.jpg);"></div>
                        <h3>Dave Henderson</h3>
                    </div>
                </div>
            </div>
            <div class="one-fifth animate-box">
                <span class="icon"><i class="icon-quotes-left"></i></span>
                <div class="testimony-wrap">
                    <blockquote>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
                    </blockquote>
                    <div class="desc">
                        <div class="figure-img" style="background-image: url(assets2/images/person1.jpg);"></div>
                        <h3>Dave Henderson</h3>
                    </div>
                </div>
            </div>
            <div class="one-fifth animate-box">
                <span class="icon"><i class="icon-quotes-left"></i></span>
                <div class="testimony-wrap">
                    <blockquote>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics.</p>
                    </blockquote>
                    <div class="desc">
                        <div class="figure-img" style="background-image: url(assets2/images/person1.jpg);"></div>
                        <h3>Dave Henderson</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<div class="colorlib-trainers">
<div class="container">
<div class="row">
    <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
        <h1 class="heading-big">Our Instructor</h1>
        <h2>Our Instructor</h2>
    </div>
</div>
<div class="row">
    <div class="col-md-3 col-sm-3 animate-box">
        <div class="trainers-entry">
            <div class="desc">
                <h3>Olivia Young</h3>
                <span>instructor</span>
            </div>
            <div class="trainer-img" style="background-image: url(assets2/images/person1.jpg)"></div>
        </div>
    </div>

    <div class="col-md-3 col-sm-3 animate-box">
        <div class="trainers-entry">
            <div class="desc">
                <h3>Daniel Anderson</h3>
                <span>Instructor</span>
            </div>
            <div class="trainer-img" style="background-image: url(assets2/images/person2.jpg)"></div>
        </div>
    </div>

    <div class="col-md-3 col-sm-3 animate-box">
        <div class="trainers-entry">
            <div class="desc">
                <h3>David Brook</h3>
                <span>Instructor</span>
            </div>
            <div class="trainer-img" style="background-image: url(assets2/images/person3.jpg)"></div>
        </div>
    </div>

    <div class="col-md-3 col-sm-3 animate-box">
        <div class="trainers-entry">
            <div class="desc">
                <h3>Brigeth Smith</h3>
                <span>instructor</span>
            </div>
            <div class="trainer-img" style="background-image: url(assets2/images/person4.jpg)"></div>
        </div>
    </div>
</div>
</div>
</div>-->

       

            <div id="colorlib-subscribe" class="subs-img" style="background-image: url(assets2/images/img_bg_2.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
               
            </div>
            <footer id="colorlib-footer">
                <div class="container">
                    <div class="row row-pb-md">
                        <div class="col-md-3 colorlib-widget">
                            <h4>Contact Info</h4>
                            <ul class="colorlib-footer-links">
                                <li>No: 160/24, Kirimandala Mw, <br> , Col-5 Sri Lanka</li>
                                <li><a href="tel://+94-11-2369099"><i class="icon-phone"></i> +94-11-2369099</a></li>
                                <!--<li><a href="mailto:info@yoursite.com"><i class="icon-envelope"></i> info@yoursite.com</a></li>-->
                                <!--<li><a href="http://luxehotel.com"><i class="icon-location4"></i> yourwebsite.com</a></li>-->
                            </ul>
                        </div>
                        <!--                        <div class="col-md-2 colorlib-widget">
                        <h4>Programs</h4>
                        <p>
                        <ul class="colorlib-footer-links">
                        <li><a href="#"><i class="icon-check"></i> Diploma Degree</a></li>
                        <li><a href="#"><i class="icon-check"></i> BS Degree</a></li>
                        <li><a href="#"><i class="icon-check"></i> Beginner</a></li>
                        <li><a href="#"><i class="icon-check"></i> Intermediate</a></li>
                        <li><a href="#"><i class="icon-check"></i> Advance</a></li>
                        <li><a href="#"><i class="icon-check"></i> Difficulty</a></li>
                        </ul>
                        </p>
                        </div>
                        <div class="col-md-2 colorlib-widget">
                        <h4>Useful Links</h4>
                        <p>
                        <ul class="colorlib-footer-links">
                        <li><a href="#"><i class="icon-check"></i> About Us</a></li>
                        <li><a href="#"><i class="icon-check"></i> Testimonials</a></li>
                        <li><a href="#"><i class="icon-check"></i> Courses</a></li>
                        <li><a href="#"><i class="icon-check"></i> Event</a></li>
                        <li><a href="#"><i class="icon-check"></i> News</a></li>
                        <li><a href="#"><i class="icon-check"></i> Contact</a></li>
                        </ul>
                        </p>
                        </div>

                        <div class="col-md-2 colorlib-widget">
                        <h4>Support</h4>
                        <p>
                        <ul class="colorlib-footer-links">
                        <li><a href="#"><i class="icon-check"></i> Documentation</a></li>
                        <li><a href="#"><i class="icon-check"></i> Forums</a></li>
                        <li><a href="#"><i class="icon-check"></i> Help &amp; Support</a></li>
                        <li><a href="#"><i class="icon-check"></i> Scholarship</a></li>
                        <li><a href="#"><i class="icon-check"></i> Student Transport</a></li>
                        <li><a href="#"><i class="icon-check"></i> Release Status</a></li>
                        </ul>
                        </p>
                        </div>-->

                        <!--                        <div class="col-md-3 colorlib-widget">
                        <h4>Recent Post</h4>
                        <div class="f-blog">
                        <a href="blog.html" class="blog-img" style="background-image: url(assets2/images/blog-1.jpg);">
                        </a>
                        <div class="desc">
                        <h2><a href="blog.html">Creating Mobile Apps</a></h2>
                        <p class="admin"><span>18 April 2018</span></p>
                        </div>
                        </div>
                        <div class="f-blog">
                        <a href="blog.html" class="blog-img" style="background-image: url(assets2/images/blog-2.jpg);">
                        </a>
                        <div class="desc">
                        <h2><a href="blog.html">Creating Mobile Apps</a></h2>
                        <p class="admin"><span>18 April 2018</span></p>
                        </div>
                        </div>
                        </div>-->
                    </div>
                </div>
                <div class="copy">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <p>
                                    <!--                                    <small class="block">&copy;  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. 
                                 Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                     Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. </small><br> 
                                     <small class="block">Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a>, <a href="http://pexels.com/" target="_blank">Pexels</a></small>-->
                                    <a ><i></i>@ 2019 ICTA. All Rights Reserved</a>
                                    <a ><i ></i>Visite ICTA Main Site</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
        </div>

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
        <script>
                                        document.addEventListener('DOMContentLoaded', function() {
                                            document.getElementById('time').addEventListener('click', function() {
                                                document.getElementById("modal_title").innerHTML = "Practice Quizzes";
                                                document.getElementById("model_type").value = "time";
                                                $("#myModal").modal();
                                            }, false);
                                        }, false);
                                        
                                        document.addEventListener('DOMContentLoaded', function() {
                                            document.getElementById('subjectsss').addEventListener('click', function() {
                                                document.getElementById("modal_title").innerHTML = "Take Examintion";
                                                document.getElementById("model_type").value = "subject";
                                                $("#myModal").modal();
                                            }, false);
                                        }, false);
                                        document.addEventListener('DOMContentLoaded', function() {
                                            document.getElementById('add').addEventListener('click', function() {
                                                window.location.href = "AddExamPaper.jsp";
//                                               
                                            }, false);
                                        }, false);
                                        function dad() {
//                                            alert("time");
                                        }

        </script>

    </body>
</html>

