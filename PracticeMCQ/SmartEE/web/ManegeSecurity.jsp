<%@page import="java.util.List"%>
<%@page import="pojo.EnumSecurityQuestions"%>
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

        <!-- Begin Page Content -->
        <div class="container-fluid">
            <h2>Manage Security</h2>
            <div class="row">
                <div class="col-4">
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Question</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                int i = 1;
                                List<EnumSecurityQuestions> questions = new Getting().getAllEnumSecurityQuestionses();
                                for (EnumSecurityQuestions q : questions) {
                                    String a = "Active";

                                    if (q.getIsactive() != 1) {
                                        a = "Deactive";
                                    }
                            %>
                            <tr>
                                <th scope="row"><% out.write("" + i); %></th>
                                <td><% out.write(q.getQuestion()); %></td>
                                <td><% out.write(a); %></td>
                            </tr>
                            <%       i++;
                                }
                            %>


                        </tbody>
                    </table>
                </div>
                            <div class="col-6">
                                 <form action="addSecu" method="GET">
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
                        <!--<h2 class="py-2" style="text-align:center;"> Let's Get Started</h2>-->

                    </div>
                </div>
                <div class="row ">
                    <div class="col-6 py-2">

                        <label for="fieald-a">Security Question</label>
                        <input type="text" name="que" class="form-control" id="subject" onkeyup="checkque()" placeholder="Security Question" required>
                    </div>

                </div>
                <div class="row">

                    <div class="col-6 my-4">

                        <button type="button" id="sub" onclick="checkque()" class="btn btn-outline-primary  px-5">Save</button>

                    </div>

                </div>
            </div>
        </form>
                            </div>
                <!--                <div class="col-6">
                                    <table class="table table-hover">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">First</th>
                                                <th scope="col">Last</th>
                                                <th scope="col">Handle</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                
                                        </tbody>
                                    </table>
                
                
                
                                </div>-->


            </div>



        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- staff footer -->
    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Smart EE</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->



<!-- staff script -->


<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- SCRIPTS -->



<script src="assets/plugin-frameworks/popper.js"></script>
<script src="assets/plugin-frameworks/jquery-3.2.1.min.js"></script>

<script src="assets/plugin-frameworks/bootstrap.min.js"></script>
<script>
                            function checkque() {

                                var text = document.getElementById("subject").value;

                                var xhttp = new XMLHttpRequest();

                                xhttp.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        if (xhttp.responseText == "true") {
                                            document.getElementById("sub").type = "button";
                                            document.getElementById("succ").className = "alert alert-danger";
                                            document.getElementById("succ").innerHTML = "Security Question Already Use";
                                        } else {
                                            document.getElementById("sub").type = "submit";
                                            document.getElementById("succ").className = "alert alert-success";
                                            document.getElementById("succ").innerHTML = "Security Question Is Not Use";
                                        }
                                    }
                                };
                                xhttp.open("Post", "addSecu", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("que=" + text);
                            }
</script>

</body>
</html>