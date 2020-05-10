<%-- 
    Document   : registration
    Created on : Jul 27, 2019, 11:24:20 PM
    Author     : User
--%>

<%@page import="pojo.EnumSecurityQuestions"%>
<%@page import="java.util.List"%>
<%@page import="moduls.Getting"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <title>PracticeMCQ</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">

        <!-- Font -->
        <!-- Stylesheets -->      
        <link href="assets/fontawesome/css/all.min.css" rel="stylesheet">

        <!-- Stylesheets -->
        <link href="assets/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
        <link href="assets/common/styles.css" rel="stylesheet">

    </head>

    <body style="background-color:#F7F8FA;">

        <!-- menu -->
        <%@include file="Header.jsp" %>

        <!-- end of menu -->

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
                        <label for="fieald-c">Please Enter the Email Verification Code</label>
                        <input type="text" id="verifyq" class="form-control col-4" placeholder="Verification Code" required/>
                        <button type="button" id="ontimes" class="btn btn-primary col-3"  onclick="sendemail()">Send Email</button>
                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-d">Username</label>
                        <input type="text" name="un"  class="form-control" id="fieald-d" placeholder="Username" required>

                    </div>
                    <div class="col-6 py-2">

                        <label for="fieald-e">Password</label>
                        <input type="password" onkeypress="fpass()" id="pw" name="pw" class="form-control" id="fieald-e" placeholder="minimum 8 charactors" required>
                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-f">Retype Password</label>
                        <input type="password" id="repw" onfocusout="repass()" name="repw" class="form-control" id="fieald-f" placeholder="Retype password" required>

                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-g">Security Question</label>
                        <select name="security_question" class="form-control" id="fieald-g" >
                            <%                                List<EnumSecurityQuestions> li = new Getting().getallquestion();
                                for (EnumSecurityQuestions l : li) {
                                    if (l.getIsactive() == 1) {
                            %>
                            <option value="<% out.write(l.getQuestion()); %>"><% out.write(l.getQuestion()); %> </option>
                            <%
                                    }
                                }
                            %>

                        </select>

                    </div>
                    <div class="col-6 py-2">
                        <label for="fieald-h">Security Question Answer</label>
                        <input type="text" class="form-control" id="fieald-h" name="answer" placeholder="Your answer" required>

                    </div>
                </div>
                <div class="row">

                    <div class="col-6 my-4">

                        <button type="button" id="sub" onclick="verifyss()" disabled class="btn btn-outline-primary  px-5">Sign Up</button>

                    </div>

                </div>
            </div>
        </form>



        <footer class="fixed-bottom">

            <div class="container">
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
                            var code = "";
                            var b = true;
                            function repass() {

                                var pw = document.getElementById("pw").value;
                                var re = document.getElementById("repw").value;
                                if (pw === re) {
                                    document.getElementById("su").className = "alert alert-success";
                                    document.getElementById("su").innerHTML = "Password Is Match";
                                    document.getElementById("error").className = "alert alert-danger d-none";
                                    document.getElementById("sub").disabled = false;
                                    b = true;
                                } else {
                                    document.getElementById("error").className = "alert alert-danger";
                                    document.getElementById("error").innerHTML = "Not Match Passwords";
                                    document.getElementById("su").className = "alert alert-success d-none";
                                    document.getElementById("sub").disabled = true;
                                    b = fasle;
                                }

                            }
                            function fpass() {
                                var pw = document.getElementById("pw").value;
                                if (pw.length >= 7) {
                                    document.getElementById("error").className = "d-none";
                                    b = true;
                                } else {
                                    document.getElementById("error").className = "alert alert-danger";
                                    document.getElementById("error").innerHTML = "Must Ented 8 Caracter";
                                    document.getElementById("su").className = "alert alert-success d-none";
                                    document.getElementById("sub").disabled = true;
                                    b = false;
                                }
                            }
                            function sendemail() {
                                var email = document.getElementById("fieald-c").value;
                                if (email !== null) {
                                    var type = "Complete Verification";
                                    var xhttp = new XMLHttpRequest();
                                    code = generate(6);
                                    xhttp.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {
                                            if (xhttp.responseText == "true") {
                                                b = true;
                                                document.getElementById("ontimes").disabled = true;
                                            } else {
                                                b = false;
                                                document.getElementById("su").className = "alert alert-danger";
                                                document.getElementById("su").innerHTML = "Email Not Send";
                                                document.getElementById("ontimes").disabled = fasle;
                                            }
                                        }
                                    };
                                    xhttp.open("get", "https://demo.lakshitha.xyz/Auth/index.php?email=" + email + "&type=" + type + "&code=" + code, true);
//            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    xhttp.withCredentials = false;
                                    xhttp.send();
                                } else {
                                    b = false;
                                    document.getElementById("su").className = "alert alert-danger";
                                    document.getElementById("su").innerHTML = "Email is Invalide";
                                }
                            }
                            function generate(n) {
                                var add = 1, max = 12 - add;   // 12 is the min safe number Math.random() can generate without it starting to pad the end with zeros.   

                                if (n > max) {
                                    return generate(max) + generate(n - max);
                                }

                                max = Math.pow(10, n + add);
                                var min = max / 10; // Math.pow(10, n) basically
                                var number = Math.floor(Math.random() * (max - min + 1)) + min;

                                return ("" + number).substring(add);
                            }

                            function verifyss() {
                                var r = document.getElementById("verifyq").value;
                                if (code === r) {
                                    document.getElementById("su").className = "alert alert-success";
                                    document.getElementById("su").innerHTML = "Successfull!";
                                    document.getElementById("sub").type = "submit";
                                    document.getElementById("sub").click()
                                } else {
                                    document.getElementById("su").className = "alert alert-danger";
                                    document.getElementById("su").innerHTML = "Somthing wrong !";
                                }
                            }
    </script>
</body>
</html>
