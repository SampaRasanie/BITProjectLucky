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

    <body style="background-color:#F7F8FA;">

        <!-- menu -->
        <%@include file="Header.jsp" %>


        <!-- end of menu -->


        <div class="container" style="margin-top:100px;">
            <div class="row">
                <div class="col-md-6 col-12 mx-auto mt-4 pt-4">

                    <div class='alert alert-danger'>Error Message</div>


                    <div class="alert alert-success" role="alert">Success message</div>

                    <h2>Reset Password</h2>


                    <div class="form-group">
                        <label>Old Password</label>
                        <input type="text" class="form-control" placeholder="Old password">

                    </div>
                    <div class="form-group">
                        <label >New Password</label>
                        <input type="password" class="form-control" placeholder="New password">

                    </div>
                    <div class="form-group">
                        <label >Retype Password</label>
                        <input type="password" class="form-control" placeholder="Retype password">

                    </div>

                    <div class="form-group mt-4">

                        <input type="button" class="btn btn-primary mt-3 mb-4 px-5" value="Reset">
                    </div>


                </div>
            </div>
        </div>




        <footer>

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


    <script src="assets/common/scripts.js"></script>
</body>
</html>