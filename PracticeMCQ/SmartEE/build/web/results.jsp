<%@page import="java.time.LocalDate"%>
<%@page import="pojo.PracticeQuestionSet"%>
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

        <div class="container-fluid">
            <h2>Practice Examination Results</h2>
            <div class="row">
                <div class="col-12">
                    <table class="table table-hover" id="Question">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Subject</th>
                                <th scope="col">Exam Paper Title</th>
                                <th scope="col">Score (%)</th>
                                <th scope="col">Attempt Date</th>
                                <th scope="col">Author</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
//                               
                                String finalscore = request.getParameter("finalscore");

                                String practicequestionsetidstr = "";
                                Cookie[] cookies = request.getCookies();
                                for (Cookie cooky : cookies) {
                                    if (cooky.getName().equals("practicequestionset")) {
                                        practicequestionsetidstr = cooky.getValue();
                                    }
                                }

                                PracticeQuestionSet prquesset = new Getting().getPracticeQuestionSetById(Integer.parseInt(practicequestionsetidstr));
                                String subject = prquesset.getQuestionSet().getEnumSubject().getSubject();
                                String title = prquesset.getQuestionSet().getName();
                                String attemptdate=  LocalDate.now().toString();
                                String author= prquesset.getQuestionSet().getUser().getUsername();
                                String status= prquesset.getQuestionSet().getEnumQuestionSetStatus().getStatus();

                            %>

                            <tr class="center-text">
                              
                                <td class="center-text"><% out.write("" + subject);%></td>
                                <td class="center-text"><% out.write("" + title); %></td>
                                <td class="center-text"><% out.write("" + finalscore); %></td>
                                <td class="center-text"><% out.write("" + attemptdate); %></td>
                                <td class="center-text"><% out.write("" + author);%></td>
                                <td class="center-text"><% out.write("" + status);%></td>
                            </tr>
                            <%      
                         
                            %>
                        </tbody>
                    </table>
                </div>



                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- staff footer -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Examination Emulator</span>
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
</body>
</html>