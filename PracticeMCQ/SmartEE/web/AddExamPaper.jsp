<%-- 
    Document   : registration
    Created on : Jul 27, 2019, 11:24:20 PM
    Author     : User
--%>

<%@page import="pojo.EnumSubject"%>
<%@page import="java.util.List"%>
<%@page import="moduls.Getting"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <style>


            /*           .question-set:nth-child(1){
                            background: red ;
                        }*/
            .question-set:nth-child(3),
            .question-set:nth-child(4),
            .question-set:nth-child(5),
            .question-set:nth-child(6){    
                display: none;
            }


        </style>

    </head>

    <body id="page-top">
        <%@include file="headerdash.jsp" %>

        <!-- end of menu -->


        <section style="margin-top: 50px;" id="tabs">
            <div class="container">
                <div class="row">
                    <div class="col-12 ">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <!--a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="false">සීංහල</a>-->
                                <a class="nav-item nav-link active" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="true">English</a>
                                <!--<a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">සීංහල</a>-->
                            </div>
                        </nav>
<!--                        <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <form method="POST" action="Addpaper_en" enctype="multipart/form-data">
                                    <div class="container">
                                        <div class="col-12 py-2 center-text">
                                            <label for="titele-sin">මාතෘකාව</label>
                                            <input type="text" name="titele-sin" class="form-control text-center" id="titele-sin" placeholder="මාතෘකාව"  required>
                                        </div>
                                        <div class="col-12 py-2 center-text">
                                            <label for="subject-sin">වීශය</label>
                                            <select name="subject-sin" class="form-control" id="subject-sin" >
                                                <%                                                    List<EnumSubject> li = new Getting().getallsubject();
                                                    for (EnumSubject l : li) {
                                                        out.write("<option value=" + l.getSubject() + ">" + l.getSubject() + "</option>");
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="row col-12 py-2" >
                                            <label for="subject-sin center-text">ප්‍රශ්න සියල්ල ඇතුලත් කරන්න </label>
                                            <%
                                                for (int i = 1; i <= 50; i++) {
                                            %>
                                            <%
                                                if (i == 1 || i == 11 || i == 21 || i == 31 || i == 41) {

                                            %>
                                            <div class="question-set row">
                                                <%                                                   }
                                                %> 
                                                <div class="col-12">
                                                    <div class="card mb-3" >
                                                        <div class="row no-gutters">
                                                             remove this div if there are no image to show 
                                                            <div class="col-md-4">

                                                                <center> 
                                                                    <img src="https://via.placeholder.com/300x150" class="card-img" alt="..." id="sin_img_<% out.write("" + i); %>">
                                                                    <br/>
                                                                    <br>
                                                                    <input type="file" accept="image/jpeg" class="btn btn-outline-primary px-10" oninput ="simages(this,<% out.write("" + i); %>)" name="sin_file_<% out.write("" + i); %>" id="sin_file_<% out.write("" + i); %>" required />
                                                                </center>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="card-body">
                                                                    <h5 class="card-title">ප්‍රශන අංකය : <% out.write("" + i); %></h5>
                                                                    <input class="form-control"  type="text" required placeholder="ප්‍රශ්නය" id="sin_que_<% out.write("" + i); %>" name="sin_que_<% out.write("" + i); %>"/>
                                                                    <p>ඔබෙ පිලිතූර තොරන්න:</p>
                                                                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                                                        <label class="btn btn-warning"  id="sin_<% out.write("" + i); %>optionls1">
                                                                            <input type="radio" value="1" name="sin_<% out.write("" + i); %>options" id="sin_<% out.write("" + i); %>option1" autocomplete="off"> පිලිතුර A
                                                                        </label>
                                                                        <label class="btn btn-warning"id="sin_<% out.write("" + i); %>optionls2">
                                                                            <input type="radio" value="2" name="sin_<% out.write("" + i); %>options" id="sin_<% out.write("" + i); %>option2" autocomplete="off"> පිලිතුර B
                                                                        </label>
                                                                        <label class="btn btn-warning"id="sin_<% out.write("" + i); %>optionls3">
                                                                            <input type="radio" value="3"  name="sin_<% out.write("" + i); %>options" id="sin_<% out.write("" + i); %>option3" autocomplete="off"> පිලිතුර C
                                                                        </label>
                                                                        <label class="btn btn-warning"id="sin_<% out.write("" + i); %>optionls4">
                                                                            <input type="radio" value="4" name="sin_<% out.write("" + i); %>options" id="sin_<% out.write("" + i); %>option4" autocomplete="off"> පිලිතුර D
                                                                        </label>
                                                                        <label class="btn btn-warning"id="sin_<% out.write("" + i); %>optionls5">
                                                                            <input type="radio" value="5" name="sin_<% out.write("" + i); %>options" id="sin_<% out.write("" + i); %>option5" autocomplete="off"> පිලිතුර E
                                                                        </label>
                                                                    </div>
                                                                 
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="card border-dark mb-3" >
                                                        <div class="card-header">පිලිතුර A</div>
                                                        <div class="card-body text-dark">
                                                            <input type="text" class="form-control" placeholder="පිලිතුර A" id="sin_<% out.write("" + i); %>_A" name="sin_<% out.write("" + i); %>_A"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="card border-dark mb-3" >
                                                        <div class="card-header">පිලිතුර B</div>
                                                        <div class="card-body text-dark">

                                                            <input type="text" class="form-control" placeholder="පිලිතුර B" id="sin_<% out.write("" + i); %>_B" name="sin_<% out.write("" + i); %>_B"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="card border-dark mb-3" >
                                                        <div class="card-header">පිලිතුර C</div>
                                                        <div class="card-body text-dark">

                                                            <input type="text" class="form-control" placeholder="පිලිතුර C" id="sin_<% out.write("" + i); %>_C" name="sin_<% out.write("" + i); %>_C"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="card border-dark mb-3" >
                                                        <div class="card-header">පිලිතුර D</div>
                                                        <div class="card-body text-dark">

                                                            <input type="text" class="form-control" placeholder="පිලිතුර D" id="sin_<% out.write("" + i); %>_D" name="sin_<% out.write("" + i); %>_D"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="card border-dark mb-3" >
                                                        <div class="card-header">පිලිතුර E</div>
                                                        <div class="card-body text-dark">

                                                            <input type="text" class="form-control" placeholder="පිලිතුර E" id="sin_<% out.write("" + i); %>_E" name="sin_<% out.write("" + i); %>_E"/>
                                                        </div>
                                                    </div>
                                                </div>


                                                <%
                                                    if (i == 10 || i == 20 || i == 30 || i == 40) {
                                                %>  
                                                <div class="col-12">

                                                    <lable class="btn btn-outline-primary px-10" onclick="showPrevSet(<% out.write("" + i); %>)">Show Previous Paper Set</lable>
                                                    <lable class="btn btn-outline-primary px-10" onclick="showNextSet(<% out.write("" + i); %>)">Show Next Paper Set</lable>

                                                </div>
                                            </div>
                                            <%
                                            } else if (i == 50) {
                                            %>
                                            <div class="col-12">
                                                <lable class="btn btn-outline-primary px-10" onclick="showPrevSet(<% out.write("" + i); %>)">Show Previous Paper Set</lable>
                                                <input type="button" name="submit" id="sub-en" onclick="checkallen()" class="btn btn-outline-primary px-10" value="Add Paper"/>
                                            </div>
                                        </div>
                                        <%
                                                }
                                            }
                                        %>
                                        <div class="col-12 py-2 center-text">
                                   
                                        </div>
                                    </div>
                                </form>
                            </div>


                        </div>
                                        -->
                                        
                                        
                        <div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <form method="POST" action="Addpaper_en" enctype="multipart/form-data">
                                <div class="container">
                                    <div class="col-12 py-2 center-text">
                                        <label for="titele-en">Title</label>
                                        <input type="text" name="titele-en" class="form-control text-center" id="titele-en" placeholder="Title"  required>
                                    </div>
                                    <div class="col-12 py-2 center-text">
                                        <label for="subject-en">Subject</label>
                                        <select name="subject-en" class="form-control" id="subject-en" >
                                            <%
                                                for (EnumSubject l : li) {
                                                    out.write("<option value=" + l.getSubject() + ">" + l.getSubject() + "</option>");
                                                }
                                            %>

                                        </select>
                                    </div>
                                    <div class="row col-12 py-2" >
                                        <div class="col-12">
                                            <label for="subject-sin center-text" id="fill-all">Fill All Questions </label>
                                        </div>

                                        <%
                                                //
                                            for (int i = 1; i <= 50; i++) {
                                        %>

                                        <%
                                            if (i == 1 || i == 11 || i == 21 || i == 31 || i == 41) {

                                        %>
                                        <div class="question-set row">
                                            <%                                                   }
                                            %> 
                                            <div class="col-12">
                                                <div class="card mb-3" >
                                                    <div class="row no-gutters">
                                                        <!-- remove this div if there are no image to show -->
                                                        <div class="col-md-4">

                                                            <center> 
                                                                <img src="https://via.placeholder.com/300x150" class="card-img" alt="..." id="en_img_<% out.write("" + i); %>">
                                                                <br/>
                                                                <br>
                                                                <input type="file" accept="image/jpeg" class="btn btn-outline-primary px-10" oninput ="simagesen(this,<% out.write("" + i); %>)" name="en_file_<% out.write("" + i); %>" id="en_file_<% out.write("" + i); %>"  />
                                                            </center>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="card-body">
                                                                <h5 class="card-title">Question No : <% out.write("" + i); %></h5>
                                                                <input class="form-control" value="question"  type="text" required placeholder="Question" id="en_que_<% out.write("" + i); %>" name="en_que_<% out.write("" + i); %>"/>
                                                                <p>Select the Correct Answer :</p>
                                                                <div class="btn-group btn-group-toggle" data-toggle="buttons">

                                                                    <label class="btn btn-warning"  id="en_<% out.write("" + i); %>optionls1">
                                                                        <input type="radio" value="1" checked="checked" name="en_<% out.write("" + i); %>options" id="en_<% out.write("" + i); %>option1" autocomplete="off"> Answer A
                                                                    </label>
                                                                    <label class="btn btn-warning"id="en_<% out.write("" + i); %>optionls2">
                                                                        <input type="radio" value="2" name="en_<% out.write("" + i); %>options" id="en_<% out.write("" + i); %>option2" autocomplete="off" checked="true"> Answer B
                                                                    </label>
                                                                    <label class="btn btn-warning"id="en_<% out.write("" + i); %>optionls3">
                                                                        <input type="radio" value="3"  name="en_<% out.write("" + i); %>options" id="en_<% out.write("" + i); %>option3" autocomplete="off"> Answer C
                                                                    </label>
                                                                    <label class="btn btn-warning"id="en_<% out.write("" + i); %>optionls4">
                                                                        <input type="radio" value="4" name="en_<% out.write("" + i); %>options" id="en_<% out.write("" + i); %>option4" autocomplete="off"> Answer D
                                                                    </label>
                                                                    <label class="btn btn-warning"id="en_<% out.write("" + i); %>optionls5">
                                                                        <input type="radio" value="5" name="en_<% out.write("" + i); %>options" id="en_<% out.write("" + i); %>option5" autocomplete="off"> Answer E
                                                                    </label>

                                                                </div>
                                                                <div class="col-6">
                                                                    <div class="card border-dark mb-3" >
                                                                        <div class="card-body text-dark">
                                                                            <input type="text" id="en_<% out.write("" + i); %>_ansdesc" name="en_<% out.write("" + i); %>_ansdesc" value="Correct Answer Description" class="form-control" required="">
                                                                        
                                                                        </div></div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="card border-dark mb-3" >
                                                    <div class="card-header">Answer A</div>
                                                    <div class="card-body text-dark">
                                                        <input type="text" class="form-control" value="Answer A" va id="en_<% out.write("" + i); %>_A" name="en_<% out.write("" + i); %>_A"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="card border-dark mb-3" >
                                                    <div class="card-header">Answer B</div>
                                                    <div class="card-body text-dark">

                                                        <input type="text" class="form-control" value="Answer B" id="en_<% out.write("" + i); %>_B" name="en_<% out.write("" + i); %>_B"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="card border-dark mb-3" >
                                                    <div class="card-header">Answer C</div>
                                                    <div class="card-body text-dark">

                                                        <input type="text" class="form-control" value="Answer C"  id="en_<% out.write("" + i); %>_C" name="en_<% out.write("" + i); %>_C"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="card border-dark mb-3" >
                                                    <div class="card-header">Answer D</div>
                                                    <div class="card-body text-dark">

                                                        <input type="text" class="form-control" value="Answer D"  id="en_<% out.write("" + i); %>_D" name="en_<% out.write("" + i); %>_D"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="card border-dark mb-3" >
                                                    <div class="card-header">Answer E</div>
                                                    <div class="card-body text-dark">

                                                        <input type="text" class="form-control" value="Answer E" id="en_<% out.write("" + i); %>_E" name="en_<% out.write("" + i); %>_E"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                                if (i == 10 || i == 20 || i == 30 || i == 40) {
                                            %>  
                                            <div class="col-12">

                                                <lable class="btn btn-outline-primary px-10" onclick="showPrevSet(<% out.write("" + i); %>)">Show Previous Paper Set</lable>
                                                <lable class="btn btn-outline-primary px-10" onclick="showNextSet(<% out.write("" + i); %>)">Show Next Paper Set</lable>

                                            </div>
                                        </div>
                                        <%
                                        } else if (i == 50) {
                                        %>
                                        <div class="col-12">
                                            <lable class="btn btn-outline-primary px-10" onclick="showPrevSet(<% out.write("" + i); %>)">Show Previous Paper Set</lable>
                                            <input type="submit" name="submit" id="sub-en"  class="btn btn-outline-primary px-10" value="Add Paper"/>
                                        </div>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>
                                    <div class="col-12 py-2 center-text">
                                     
                                    </div>
                                </div>
                            </form>
                        </div>



                    </div>
                
                </div>

            </div>
        </div>
    </div>
</section>


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
                    <span aria-hidden="true">Ã</span>
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




<!-- SCRIPTS -->



<script src="assets/plugin-frameworks/popper.js'"></script>
<script src="assets/plugin-frameworks/jquery-3.2.1.min.js"></script>

<script src="assets/plugin-frameworks/bootstrap.min.js"></script>
<script src="assets/plugin-frameworks/canvasjs.min.js"></script>


<!-- <script src="common/scripts.js"></script> -->
<script src="assets/common/scripts.js"></script>
<script>
                                                function checkall() {
                                                    var flag = true;

                                                    for (var i = 1; i <= max; i++) {
                                                        var q = true;
                                                        var q1 = true;
                                                        var q2 = false;
                                                        var q3 = true;

                                                        var c = document.getElementById("sin_que_" + i).value;
                                                        if (c === null || c === "") {
                                                            q = false;
                                                            document.getElementById("sin_que_" + i).className = "form-control border-danger"
                                                        }
                                                        var c1a = document.getElementById("sin_" + i + "_A").value;
                                                        var c1b = document.getElementById("sin_" + i + "_B").value;
                                                        var c1c = document.getElementById("sin_" + i + "_C").value;
                                                        var c1d = document.getElementById("sin_" + i + "_D").value;
                                                        var c1e = document.getElementById("sin_" + i + "_E").value;
                                                        document.getElementById("sin_" + i + "_A").className = "form-control";
                                                        document.getElementById("sin_" + i + "_B").className = "form-control";
                                                        document.getElementById("sin_" + i + "_C").className = "form-control";
                                                        document.getElementById("sin_" + i + "_D").className = "form-control";
                                                        document.getElementById("sin_" + i + "_E").className = "form-control";
                                                        if ((c1a === null || c1a === "") || (c1b === null || c1b === "") || (c1c === null || c1c === "") || (c1d === null || c1d === "") || (c1e === null || c1e === "")) {
                                                            q1 = false;
                                                            if (c1a === null || c1a === "") {
                                                                document.getElementById("sin_" + i + "_A").className = "form-control border-danger";
                                                            }
                                                            if (c1b === null || c1b === "") {
                                                                document.getElementById("sin_" + i + "_B").className = "form-control border-danger";
                                                            }
                                                            if (c1c === null || c1c === "") {
                                                                document.getElementById("sin_" + i + "_C").className = "form-control border-danger";
                                                            }
                                                            if (c1d === null || c1d === "") {
                                                                document.getElementById("sin_" + i + "_D").className = "form-control border-danger";
                                                            }
                                                            if (c1e === null || c1e === "") {
                                                                document.getElementById("sin_" + i + "_E").className = "form-control border-danger";
                                                            }
                                                        }

                                                        for (var ii = 1; ii <= 5; ii++) {                                                         
                                                            document.getElementById("sin_" + i + "optionls" + ii).className = "btn btn-warning";
                                                            var c1 = document.getElementById("sin_" + i + "option" + ii).checked;
                                                            if (c1) {
                                                                q2 = true;                                                         
                                                            }

                                                        }

                                                        if (!q2) {
                                                            for (var ii = 1; ii <= 5; ii++) {
                                                                document.getElementById("sin_" + i + "optionls" + ii).className = "btn btn-danger";
                                                            }
                                                        }
                                                        if (document.getElementById("sin_img_" + i).src === "https://via.placeholder.com/300x150") {
                                                            document.getElementById("sin_file_" + i).className = "btn btn-outline-danger px-10";
                                                            q3 = false;
                                                        } else {
                                                            document.getElementById("sin_file_" + i).className = "btn btn-outline-primary px-10";
                                                        }

                                                        if (q && q1 && q2 && q3) {

                                                            flag = true;
                                                        } else {
                                                            flag = false;

                                                        }
                                                    }
                                                    if (flag) {
                                                        document.getElementById("sub").type = "submit";
                                                        document.getElementById("sub").click();
                                                    }

                                                }

                                                var max = 50;
                                                function checkallen() {
                                                    var flaga = true;

//                                                    
                                                    if (flaga) {
                                                        document.getElementById("sub-en").type = "submit";
                                                        document.getElementById("sub-en").click();
                                                    }

                                                }

</script>
<script>

    function simages(input, id) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById("sin_img_" + id).src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }

    }
    function simagesen(input, id) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById("en_img_" + id).src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }

    }
</script>
<script>


    function showNextSet(number) {
        console.log(number);
        if (number == 10) {
            $('.question-set:nth-child(2),.question-set:nth-child(4),.question-set:nth-child(5),.question-set:nth-child(6)').css({"display": "none"});
            $('.question-set:nth-child(3)').css({"display": "inherit"});
            $('#en_que_11').focus();
            $('#sin_que_11').focus();
        }
        if (number == 20) {
            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(5),.question-set:nth-child(6)').css({"display": "none"});
            $('.question-set:nth-child(4)').css({"display": "inherit"});
            $('#en_que_21').focus();
            $('#sin_que_21').focus();
        }
        if (number == 30) {
            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(4),.question-set:nth-child(6)').css({"display": "none"});
            $('.question-set:nth-child(5)').css({"display": "inherit"});
            $('#en_que_31').focus();
            $('#sin_que_31').focus();
        }
        if (number == 40) {
            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(4),.question-set:nth-child(5)').css({"display": "none"});
            $('.question-set:nth-child(6)').css({"display": "inherit"});
            $('#en_que_41').focus();
            $('#sin_que_41').focus();
        }


    }
    function showPrevSet(number) {
        console.log(number);
        if (number == 20) {
            $('.question-set:nth-child(3),.question-set:nth-child(4),.question-set:nth-child(5),.question-set:nth-child(6)').css({"display": "none"});
            $('.question-set:nth-child(2)').css({"display": "inherit"});
            $('#en_que_1').focus();
            $('#sin_que_1').focus();
        }
        if (number == 30) {
            $('.question-set:nth-child(2),.question-set:nth-child(4),.question-set:nth-child(5),.question-set:nth-child(6)').css({"display": "none"});
            $('.question-set:nth-child(3)').css({"display": "inherit"});
            $('#en_que_11').focus();
            $('#sin_que_11').focus();
        }
        if (number == 40) {
            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(5),.question-set:nth-child(6)').css({"display": "none"});
            $('.question-set:nth-child(4)').css({"display": "inherit"});
            $('#en_que_21').focus();
            $('#sin_que_21').focus();
        }
        if (number == 50) {
            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(4),.question-set:nth-child(6)').css({"display": "none"});
            $('.question-set:nth-child(5)').css({"display": "inherit"});
            $('#en_que_31').focus();
            $('#sin_que_31').focus();
        }

    }

</script>
</body>
</html>
