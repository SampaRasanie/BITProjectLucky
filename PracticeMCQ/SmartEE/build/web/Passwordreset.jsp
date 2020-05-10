<%@page import="pojo.User"%>
<%@page import="moduls.Getting"%>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <title>PracticeMCQ</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">

        <!-- Font -->
        <!-- Stylesheets -->      
        <link href="assets/fonts/ionicons.css" rel="stylesheet">

        <!-- Stylesheets -->
        <link href="assets/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
        <link href="assets/common/styles.css" rel="stylesheet">

    </head>

    <body>
        <%@include file="Header.jsp" %>
        <div class="container" style="margin-top:100px;">
            <div class="row">
                <div class="col-md-6 col-12 mx-auto mt-4 pt-4">
                    <!-- menu -->
                    <%                        String vals = "";
                        User u = null;
                        if (request.getCookies() != null) {
                            Cookie c1[] = request.getCookies();
                            for (Cookie elem : c1) {
                                String name = elem.getName();
                                if (name.equals("id")) {
                                    vals = elem.getValue();
                                }
                            }
                        }
                        if (vals != "") {
                            u = new Getting().getUserById(vals);
                        }
                    %>

                    <h1 class="d-none" id="userid"><% out.write("" + vals);%></h1>
                    <!--<div class='alert alert-danger d-none' id="error">Email Not Registered</div>-->
                    <div class="d-none" role="alert" id="succ">Email is Registered, You Can Password Registered</div>

                    <h2 >Reset Password</h2>
                    <div class="container" id="reset" style="margin-top:10px;">
                        <div class="row">
                            <div class="col-12">
                                <form action="emailchack" method="GET" >
                                    <div class="form-group">

                                        <label >Email </label>
                                        <input type="email" name="email" id="email" class="form-control" placeholder="Email">
                                    </div>
                                    <div class="form-group mt-4">
                                        <input type="button" id="su" onclick="checkemail()" class="btn btn-primary mt-3 mb-4 px-5" value="Reset">
                                    </div>
                                </form>
                          
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


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

    <script>
        function checkemail() {
            var xhttp = new XMLHttpRequest();
            var email = document.getElementById("email").value;

            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    if (xhttp.responseText == "true") {
                        document.getElementById("succ").className = "alert alert-danger";
                        document.getElementById("succ").innerHTML = "Email Not Registered";
                    } else {
                        document.getElementById("succ").className = "alert alert-success";
                        document.getElementById("succ").innerHTML = "Email is Registered, You Can Password Reset";
                        sendemail(generate(6));
                    }
                }
            };
            xhttp.open("Post", "emailchack", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("email=" + email);
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
        var email = "";
        function sendemail(code) {
            email = document.getElementById("email").value;
            var type = "Complete Reset";
            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    if (xhttp.responseText == "true") {
                        resets(code, email);
                    } else {
                        document.getElementById("succ").className = "alert alert-danger";
                        document.getElementById("succ").innerHTML = "Email Not Send";
                    }
                }
            };
            xhttp.open("get", "https://demo.lakshitha.xyz/Auth/index.php", true);
            xhttp.withCredentials = false;
            xhttp.send("email= " + email + "&type=" + type + "&code=" + code);
        }
        var flag = false;
        var mcode = "";
        var memail = "";

        function resets(code, email) {
            var xhttps = new XMLHttpRequest();

            xhttps.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    mcode = code;
                    memail = email;
                    document.getElementById("succ").className = "d-none";
                    document.getElementById("reset").innerHTML = xhttps.responseText;
                }
            };
            xhttps.open("get", "newPassword.jsp", true);
            xhttps.send();
        }
        function newpasss(email) {
            var xhttps = new XMLHttpRequest();

            xhttps.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("succ").className = "d-none";
                    document.getElementById("reset").innerHTML = xhttps.responseText;
                }
            };
            xhttps.open("get", "newPassword.jsp?email=" + email, true);
            xhttps.send();
        }
        function verifya() {
            if (document.getElementById("verifyz").value === mcode) {
                flag = true;
                document.getElementById("succ").className = "alert alert-success";
                document.getElementById("succ").innerHTML = "Verify Code Is Correct";
                newpasss(email);
            } else {
                document.getElementById("succ").className = "alert alert-danger";
                document.getElementById("succ").innerHTML = "Verify Code Is Incorrect";
                flag = false;
            }
        }
        function repassva() {

            var pw = document.getElementById("newpass").value;
            var re = document.getElementById("repass").value;
            if (pw === re) {
                document.getElementById("succ").className = "alert alert-success";
                document.getElementById("succ").innerHTML = "Password Is Match";
                document.getElementById("newpa").type = "submit";
                document.getElementById("newpa").click();
            } else {
                document.getElementById("succ").className = "alert alert-danger";
                document.getElementById("succ").innerHTML = "Not Match Passwords";
            }

        }
      
    </script>

    <script src="assets/plugin-frameworks/popper.js"></script>
    <script src="assets/plugin-frameworks/jquery-3.2.1.min.js"></script>

    <script src="assets/plugin-frameworks/bootstrap.min.js"></script>
    <script src="assets/plugin-frameworks/canvasjs.min.js"></script>


    <!-- <script src="common/scripts.js"></script> -->
    <script src="assets/common/scripts.js"></script>
</body>
</html>