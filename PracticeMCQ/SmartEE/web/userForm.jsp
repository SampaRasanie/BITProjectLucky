<%@page import="pojo.EnumUserType"%>
<%@page import="pojo.EnumSecurityQuestions"%>
<%@page import="java.util.List"%>
<%@page import="moduls.NewClass"%>
<%@page import="pojo.NewHibernateUtil"%>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <title>PracticeMCQ/title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">

        <!-- Font -->
        <!-- Stylesheets -->      
        <link href="assets/fonts/ionicons.css" rel="stylesheet">

        <!-- Stylesheets -->
        <link href="assets/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
        <link href="assets/common/styles.css" rel="stylesheet">      
        <link href="assets/fontawesome/css/all.min.css" rel="stylesheet">
        <link href="assets/common/sb-admin-2.css" rel="stylesheet">


    </head>

    <body id="page-top">
        <%@include file="headerdash.jsp" %>



        <form action="Signup" method="Post">
            <div class="container" style="margin-top:100px;">
                <div class="row">
                    <div class="col-12">
                        <div class='alert alert-danger d-none' id="error"></div>
                        <%                            String s = request.getParameter("p");
                            if (s != null) {
                                if (s.equals("fail")) {
                                    String s1 = request.getParameter("re");
                        %>
                        <div class='alert alert-danger' id="ror"><% out.write(s1); %></div>
                        <%
                                }
                            }

                        %>
                        <div class="alert alert-success d-none" role="alert" id="su">Success message</div>
                        <!--<h2 class="py-2" style="text-align:center;"> Let's Get Started</h2>-->

                    </div>
                </div>
                <div class="row ">
                    <div class="col-6 py-2">

                        <label for="fieald-a">First name</label>
                        <input type="text" name="fname" class="form-control" id="fieald-a" placeholder="First name" required>
                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-b">Last name</label>
                        <input type="text" name="lname" class="form-control" id="fieald-b" placeholder="Last name" required>

                    </div>
                    <div class="col-6 py-2">

                        <label for="fieald-c">Email Address</label>
                        <input type="email" name="email" class="form-control" id="fieald-c" placeholder="Your email" required>
                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-d">Username</label>
                        <input type="text" name="un"  class="form-control" id="fieald-d" placeholder="Username" required>

                    </div>
                    <div class="col-6 py-2">

                        <label for="fieald-e">Password</label>
                        <input type="text" onkeypress="fpass()" id="pw" name="pw" class="form-control" id="fieald-e" placeholder="minimum 8 charactors" required>
                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-f">Retype Password</label>
                        <input type="text" id="repw" onfocusout="repass()" name="repw" class="form-control" id="fieald-f" placeholder="Retype password" required>

                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-g">Security Question</label>
                        <select name="security_question" class="form-control" id="fieald-g" >
                            <%                                List<EnumSecurityQuestions> l = new NewClass().getSequ();
                                for (EnumSecurityQuestions e : l) {

                            %>
                            <option value="<% out.write(e.getQuestion()); %>"><% out.write(e.getQuestion()); %></option>

                            <%
                                }
                            %>



                        </select>

                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-h">Security Question Answer</label>
                        <input type="text" class="form-control" id="fieald-h" name="answer" placeholder="Your answer" required>

                    </div>
                </div>
                <div class="col-6 py-2">
                    <label for="fieald-g">User Type</label>
                    <select name="Usertype" class="form-control" id="fieald-g" >
                        <%
                            List<EnumUserType> l1 = new NewClass().getusty();
                            for (EnumUserType e : l1) {

                        %>
                        <option value="<% out.write(e.getUsertype()); %>"><% out.write(e.getUsertype()); %></option>

                        <%
                            }
                        %>



                    </select>

                </div>
                <div class="row">

                    <div class="col-6 my-4">

                        <button type="submit" id="sub" disabled class="btn btn-outline-primary  px-5">Sign Up</button>

                    </div>

                </div>
            </div>
        </form>





        <%@include file="footerdash.jsp" %>
        <!-- SCRIPTS -->

        <script>

            function repass() {

                var pw = document.getElementById("pw").value;
                var re = document.getElementById("repw").value;
                if (pw === re) {
                    document.getElementById("su").className = "alert alert-success";
                    document.getElementById("su").innerHTML = "Password Is Match";
                    document.getElementById("error").className = "alert alert-danger d-none";
                    document.getElementById("sub").disabled = false;
                } else {
                    document.getElementById("error").className = "alert alert-danger";
                    document.getElementById("error").innerHTML = "Not Match Passwords";
                    document.getElementById("su").className = "alert alert-success d-none";
                    document.getElementById("sub").disabled = true;
                }

            }
            function fpass() {
                var pw = document.getElementById("pw").value;
                if (pw.length >= 7) {
                    document.getElementById("error").className = "d-none";
                } else {
                    document.getElementById("error").className = "alert alert-danger";
                    document.getElementById("error").innerHTML = "Must Ented 8 Caracter";
                    document.getElementById("su").className = "alert alert-success d-none";
                    document.getElementById("sub").disabled = true;
                }
            }

        </script>

        <script src="assets/plugin-frameworks/popper.js"></script>
        <script src="assets/plugin-frameworks/jquery-3.2.1.min.js"></script>

        <script src="assets/plugin-frameworks/bootstrap.min.js"></script>

    </body>
</html>