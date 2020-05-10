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

    <body id="page-top">
        <%@include file="headerdash.jsp" %>

        <!-- Begin Page Content -->
        <div class="container-fluid">
            <h2>Registered List</h2>
            <div class="row">
                <div class="col-12">
                    <table class="table table-hover" id="user">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">User Name</th>
                                <th scope="col">User Type</th>
                                <th scope="col">Email</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                int i = 1;
                                List<User> alluser = new Getting().getallRegisteredUsers();
                                for (User u : alluser) {


                            %>
                            <tr>
                                <th scope="row"><% out.write("" + i); %></th>
                                <td><% out.write("" + u.getFirstname()); %></td>
                                <td><% out.write("" + u.getLastname()); %></td>
                                <td><% out.write("" + u.getUsername()); %></td>
                                <td><% out.write("" + u.getEnumUserType().getUsertype()); %></td>
                                <td><% out.write("" + u.getEmail()); %></td>
                                <td><% out.write("" + u.getEnumUserStatus().getStatus()); %></td>
                            </tr>
                            <%      i++;
                                }

                            %>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- staff footer -->
    <!-- Footer -->
    <footer class="sticky-footer bg-white" onload="on()">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Examination Immulator</span>
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
   $(document).ready( function () {
    $('#user').DataTable();
} );
</script>
</body>
</html>