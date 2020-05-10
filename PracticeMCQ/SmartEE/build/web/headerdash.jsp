<%-- 
    Document   : headerdash
    Created on : Aug 3, 2019, 5:12:17 AM
    Author     : User
--%>

<%@page import="pojo.User"%>
<%@page import="moduls.NewClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String name1 = "";
    boolean admin = false;
    boolean Editor = false;

    if (request.getCookies() == null) {
        response.sendRedirect("Login.jsp");
    } else {
        boolean b = false;
        Cookie c[] = request.getCookies();
        for (Cookie co : c) {
            if (co.getName().equals("id")) {
                name1 = co.getValue();
                b = true;
                break;
            }
        }
        if (!b) {
            response.sendRedirect("Login.jsp");
        } else {
            User u = new NewClass().getUserbyid(name1);
            name1 = u.getUsername();
            if (u.getEnumUserType().getUsertype().equals("Admin")) {
                admin = true;
            } else if (u.getEnumUserType().getUsertype().equals("Editor")) {
                admin = false;
                Editor = true;
            } else if (u.getEnumUserType().getUsertype().equals("User")) {
                response.sendRedirect("Index.jsp");
            }
        }
    }
    if (admin || Editor) {
%>

<!-- Page Wrapper -->
<div id="wrapper">
    <!-- load left mnue -->

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-icon">
                <i class="fas fa-university"></i>
            </div>
            <div class="sidebar-brand-text mx-3">PracticeMCQ</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="dashboardstudent.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
            <a class="nav-link" href="Index.jsp">
                <i class="fas fa-fw fa-university"></i>
                <span>Home Page</span></a>
            <a class="nav-link" href="studentHistory.jsp">
                <i class="fas fa-fw fa-university"></i>
                <span>Examination History</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Activities
        </div>
        <!-- Nav Item - Manager Collapse Menu -->

        <!-- Nav Item - Staff Collapse Menu -->
        <%
            if (admin) {
        %>

        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities0">
                <i class="fas fa-fw fa-wrench"></i>
                <span>User</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities0" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">User :</h6>
                    <a class="collapse-item" href="userForm.jsp">Registration Form</a>
                    <a class="collapse-item" href="registorlist.jsp">Registered Users</a>
                    <a class="collapse-item" href="userTypes.jsp">User Types</a>
                  
                </div>
            </div>
        </li> <%
            }
        %>
    
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Papers</span>
            </a>
            <div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Papers :</h6>
                    <%
                        if (admin) {
                    %>
                    <a class="collapse-item" href="Subject.jsp">Subject</a>
                    <%
                        }
                    %>
                    <a class="collapse-item" href="manegePapers.jsp">Manage Papers</a>
                    <%      %>
                </div>
            </div>
        </li> 
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities3" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Question</span>
            </a>
            <div id="collapseUtilities3" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Question :</h6>
                    <a class="collapse-item" href="AddExamPaper.jsp">Add Examination Paper</a>
                    <a class="collapse-item" href="ManegeQuestion.jsp">Manage Question</a>
                </div>
            </div>
        </li> 
        <%
            if (admin) {
        %>
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities4" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Security Question</span>
            </a>
            <div id="collapseUtilities4" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Add Security Question</h6>
                    <a class="collapse-item" href="ManegeSecurity.jsp">Manage Security Question</a>
                </div>
            </div>
        </li> 
        <%
            }
        %>
        <!-- Divider -->
        <hr class="sidebar-divider">


    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- staff top menu -->

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
        
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%                                out.write(name1); 
                                %></span>
                            <img class="img-profile rounded-circle" src="assets/images/staff-profile.png">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">

                            <a class="dropdown-item" href="logout">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <%
                }
            %>
