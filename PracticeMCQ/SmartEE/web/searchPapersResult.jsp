<%@page import="pojo.EnumSubject"%>
<%@page import="pojo.QuestionSet"%>
<%@page import="javafx.scene.layout.Background"%>
<%@page import="pojo.Question"%>
<%@page import="java.util.List"%>
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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">


    </head>

    <body id="page-top" onload="javascript:ScaleSize();" onresize="history.go(0)">
        <%@include file="headerdash.jsp" %>

        <!-- Begin Page Content -->
        <%  String subject = request.getParameter("subject");
            String lan = request.getParameter("lan");
            String type = request.getParameter("type");
            if (type.equalsIgnoreCase("time")) {
                System.out.println("search subject " + subject);
        %>     
        <div class="container-fluid">
            <h2>Practice Quiz</h2>
            <div class="row">
                <div class="col-12">
                    <table class="table table-hover" id="Question">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <!--     <th scope="col">Image</th>  -->
                                <th scope="col">Subject</th>
                                <th scope="col">No of Questions</th>           
                                <th scope="col">Practice</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="center-text">
                                <th scope="row" class="center-text"></th>
                                <td class="center-text"><% out.write("" + subject);%></td>
                                <td class="center-text">10</td>
                                <td class="center-text">
                                    <a class="btn btn-danger btn-primary" style="background-color: red" href="TakeQuiz.jsp?quizsubject=<%out.write(subject+"");%>">START</a>
                                </td>           
                        </tbody>
                    </table>
                </div>
            </div>


        </div>


        <%
        } else if (type.equalsIgnoreCase("subject")) {
        %>

        <div class="container-fluid">
            <h2>Take Examination</h2>
            <div class="row">
                <div class="col-12">
                    <table class="table table-hover" id="Question">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Subject</th>
                                <th scope="col">Paper Title</th>
                                <th scope="col">Author</th>
                                <th scope="col">Status</th>
                                <th scope="col">Practice</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                EnumSubject subjectobj = new Getting().getSubjectIdBySuject(subject);
                                int i = 1;
                                List<QuestionSet> qs = new Getting().getQuestionSetBySubjectAndlan(subjectobj, lan);
                                for (QuestionSet q : qs) {
                                    if (q.getEnumQuestionSetStatus().getStatus().equals("Active")) {
                            %>

                            <tr class="center-text">
                                <th scope="row" class="center-text"><% out.write("" + i); %></th>
                              
                                <td class="center-text"><% out.write("" + q.getEnumSubject().getSubject());%></td>
                                <td class="center-text"><% out.write("" + q.getName()); %></td>
                                <td class="center-text"><% out.write("" + q.getUser().getUsername()); %></td>
                                <td class="center-text"><% out.write("" + q.getEnumQuestionSetStatus().getStatus()); %></td>
                                <td class="center-text">

                                    <input type="text" class="d-none" name="qsid" value="<% out.write(q.getIdquestionset()+""); %>">

                                    <a class="btn btn-danger btn-primary" style="background-color: red" href="TakeExam.jsp?qsi=<% out.write(q.getIdquestionset()+"");%>">START</a>

                                    <%
                                            }
                                        }
                                    %>

                            </td>

                        </tbody>
                    </table>
                </div>

                <%
                    }
                %>

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

    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function() {
            $('#Question').DataTable();
        });
    </script>
    <script>
        function ScaleSize() {
            document.getElementById("imgTag").style.width = document.body.clientWidth;
            document.getElementById("imgTag").style.height = document.body.clientHeight;
        }
    </script>
    <script>
        function chenageColour(btn) {
            if (document.getElementById("btnactivatedeactivate").value === "Activate") {
               
            }
        }
    </script>
</body>
</html>