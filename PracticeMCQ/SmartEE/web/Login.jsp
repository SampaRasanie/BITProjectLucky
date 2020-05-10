<%-- 
    Document   : Login
    Created on : Jul 24, 2019, 10:13:25 PM
    Author     : User
--%>

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

    </head>

    <body style="background-color:#F7F8FA; margin-bottom: 100px;" >

        <!-- menu -->
        <%@include file="Header.jsp" %>
        <!-- end of menu -->
        <form action="login" method="GET">
           
            <div class="container" style="margin-top:100px;">
                <div class="row">
                    <div class="col-md-6 col-12 mx-auto mt-4 pt-4">
                        <%                            String val1 = "";
                            Cookie c[] = request.getCookies();
                            for (Cookie elem : c) {
                                String name = elem.getName();
                                if (name.equals("id")) {
                                    val1 = elem.getValue();
                                }
                            }
                            if (val1.isEmpty()) {

                                String s = request.getParameter("p");
                                if (s != null) {
                                    if (s.equals("pass")) {
                        %>
                        <div class="alert alert-success" role="alert">Success message</div>
                        <%
                            response.sendRedirect("signup.html");
                        } else {
                        %>
                        <div class='alert alert-danger'>UserName Or Password Incorrect !</div>
                        <%
                                    }
                                }
                            } else {
//                                response.sendRedirect("Index.jsp");
                            }
                        %>


                        <h2>Login</h2>
                        <p class='mb-4'>enter the email address</p>
                        <div class="form-group">
                            <label>E-mail</label>
                            <input type="text" class="form-control" name="username" required placeholder="Username or Email address"/>
                        </div>
                        <div class="form-group">
                            <label >Password</label>
                            <input type="password" class="form-control" name="password" placeholder="password" required/>
                        </div>

                        <div class="form-group mt-4">
                            <input type="submit" class="btn btn-primary mt-3 mb-4 px-5" value="Login"/>
                            <a href="Passwordreset.jsp" >Forget's Password </a>
                        </div>
                    </div>
                </div>
            </div>

        </form>
                        <br>
                            
                        </br>
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
    </body>
</html>
