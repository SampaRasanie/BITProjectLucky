<%@page import="java.util.List"%>
<%@page import="pojo.EnumSubject"%>
<%@page import="moduls.Getting"%>
<%@page import="moduls.NewClass"%>
<%@page import="pojo.NewHibernateUtil"%>
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
        <link href="assets/fontawesome/css/all.min.css" rel="stylesheet">
        <link href="assets/common/sb-admin-2.css" rel="stylesheet">


    </head>

    <body id="page-top">
        <%@include file="headerdash.jsp" %>
        <div class="container-fluid">
            <h2>Manage Subjects</h2>
            <div class="row">
                <div class="col-4">
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Subject</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                int i = 1;
                                List<EnumSubject> sub = new Getting().getallsubject();
                                for (EnumSubject q : sub) {

                            %>
                            <tr>
                                <th scope="row"><% out.write("" + i); %></th>
                                <td><% out.write(q.getSubject()); %></td>
                            </tr>
                            <%       i++;
                                }
                            %>


                        </tbody>
                    </table>
                </div>
                <div class="col-6">


                    <form action="checksubject" method="GET">
                        <div class="container" style="margin-top:100px;">
                            <div class="row">
                                <div class="col-12">
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
                                    <div class="d-none" role="alert" id="succ">Success message</div>

                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-6 py-2">

                                    <label for="fieald-a">Subject</label>
                                    <input type="text" name="subject" class="form-control" id="subject" onkeyup="checksubject()" placeholder="subject" required>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-6 my-4">

                                    <button type="button" id="sub" onclick="checktypes()" class="btn btn-outline-primary  px-5">Save</button>

                                </div>

                            </div>
                        </div>
                    </form>
                </div>
            </div>



        </div>
        <!-- /.container-fluid -->





        <%@include file="footerdash.jsp" %>
        <!-- SCRIPTS -->

        <script>

            function checksubject() {

                var text = document.getElementById("subject").value;

                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        if (xhttp.responseText == "true") {
                            document.getElementById("sub").type = "button";
                            document.getElementById("succ").className = "alert alert-danger";
                            document.getElementById("succ").innerHTML = "Subject Name Already Use";
                        } else {
                            document.getElementById("sub").type = "submit";
                            document.getElementById("succ").className = "alert alert-success";
                            document.getElementById("succ").innerHTML = "Subject Is Not Use";


                        }
                    }
                };
                xhttp.open("Post", "checksubject", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("subject=" + text);
            }

        </script>

        <script src="assets/plugin-frameworks/popper.js"></script>
        <script src="assets/plugin-frameworks/jquery-3.2.1.min.js"></script>

        <script src="assets/plugin-frameworks/bootstrap.min.js"></script>

    </body>
</html>