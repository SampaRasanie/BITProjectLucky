<%-- 
    Document   : Login
    Created on : Jul 24, 2019, 10:13:25 PM
    Author     : User
--%>

<%@page import="pojo.PracticeQuestion"%>
<%@page import="servlets.Answered"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.io.IOException"%>
<%@page import="moduls.Setting"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="pojo.PracticeQuestionSet"%>
<%@page import="pojo.AnswersHistory"%>
<%@page import="pojo.User"%>
<%@page import="java.util.List"%>
<%@page import="pojo.QuestionSet"%>
<%@page import="pojo.EnumSubject"%>
<%@page import="moduls.Getting"%>
<%@page import="moduls.NewClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html" lang="en">

    <head>
        <title>Smart EE</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta charset="UTF-8"/>

        <!-- Font -->
        <!-- Stylesheets -->      
        <link href="assets/fonts/ionicons.css" rel="stylesheet"/>

        <!-- Stylesheets -->
        <link href="assets/plugin-frameworks/bootstrap.min.css" rel="stylesheet"/>
        <link href="assets/common/styles.css" rel="stylesheet"/>
        <style>
            .progress{
                background-color: #4e5256 !important;
            }

        </style>

    </head>

    <body style="background-color:#F7F8FA; margin-top: 100px; margin-bottom:100px;">

        <!-- menu -->
        <%@include file="Header.jsp" %>
        <!-- end of menu -->

        <%            String qsid = (String) request.getParameter("qsi");
            int pqid = 0;
//            //      Integer qsidint=Integer.parseInt(qsid);
            System.out.println("id " + qsid);
//
            String userid = "";
            Cookie[] cookies = request.getCookies();
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("id")) {
                    userid = cooky.getValue();
                }
            }
            try {
                Getting getting = new Getting();
                User userById = getting.getUserById(userid);

                QuestionSet qs = getting.getAQuestionSetById(qsid);

                System.out.println("user question");

                String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
                Date parse = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(format);
//
                getting.s.close();
                PracticeQuestionSet pq = new Setting().setPracticeQuestionSet(qs, 0, userById, parse);

                Cookie c1 = new Cookie("practicequestionset", pq.getIdpracticeQuestionHistory() + "");
                response.addCookie(c1);

                System.out.println("practice ques id = " + pq.getIdpracticeQuestionHistory());
                pqid = pq.getIdpracticeQuestionHistory();
                String strpqid = pqid + "";

//                int backpracticequestionsetjs = Answered.backpracticequestionset;
//                int backsavedprquestionjs = Answered.backsavedprquestion;
//                int backsubmitanswernumjs = Answered.backsubmitanswernum;
//                System.out.println("backsubmitanswernumjs " + backsubmitanswernumjs);
        %>

        <label  id="qsis" style="visibility: hidden;"><%out.write(qsid); %></label>
        <label  id="prqueset" style="visibility: hidden;"><%out.write(strpqid); %> </label>


  <!--label  id="type" style="visibility: hidden;"><% //out.write(type); %></label> -->
        <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <div class="container-fluid">
            <h2>TAKE PRACTICE EXAMINATION</h2>
            <div class="row">
                <div class="col-10 py-4">

                    <div class="progress">
                        <div class="progress-bar bg-warning" id="pro" role="progressbar" style="width:0%;" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100">Question Completion:0</div>
                    </div>
                    <hr>
                        <p>
                            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                Question Navigator <span class="badge badge-light">50</span>
                            </button>
                        </p>
                        <div class="collapse" id="collapseExample">
                            <div class="card card-body col-12">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <%
                                        for (int i = 1; i <= 25; i++) {

                                    %>
                                    <button type="button" class="btn btn-secondary col-1" onclick="selectque(<% out.write(i + "");  %>)"><% out.write(i + "");  %></button>
                                    <%                                        }
                                    %>

                                </div>
                                <hr>
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <%
                                            for (int i = 26; i <= 50; i++) {
                                        %>
                                        <button type="button" class="btn btn-secondary col-1" onclick="selectque(<% out.write(i + "");  %>)"><% out.write(i + "");  %></button>
                                        <%                                        }
                                        %>

                                    </div>
                            </div>
                        </div>

                </div>
                <!--                <div class="col-2">
                                    <div id="clockDiv">10:50:30</div>
                                </div>-->
            </div>
            <div class="row" id="question">

            </div>

        </div>

        <footer class="fixed-bottom">

            <div class="container ">
                <div class="row">
                    <div class="col-6 py-4">
                        <div>
                            <p>
                                @ 2019 ICTA. All Rights Reserved<br>
                                    Visite ICTA main site
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

                                                            var qe = 0;
                                                            // var pro = document.getElementById("pro");

                                                                    //            pro.value = qe;

                                                                            function loadernext(qe) {
                                                                          console.log("in loadernext qe "+qe);

                                                                            var qeset = document.getElementById("qsis").innerHTML;
                                                                                    var xhttp = new XMLHttpRequest();
                                                                                    xhttp.onreadystatechange = function() {
                                                                                    if (this.readyState === 4 && this.status === 200) {
                                                                                    document.getElementById("question").innerHTML = xhttp.responseText;
                                                                                    }
                                                                                    };
                                                                                    xhttp.open("Post", "AquestionVI.jsp", true);
                                                                                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                                                    xhttp.send("QeSet=" + qeset + "&Qe=" + qe + "&command=" + 1);
                                                                            }

                                                                    function checkAnswerButton() {

                                                                    var markedanswer = document.getElementById("markedanswer").innerHTML;
                                                                            if (markedanswer.trim() == "AnswerA") {
                                                                    $("#option1").attr("checked", "checked");
                                                                            var eventHander = $("#option1").closest("label");
                                                                            eventHander.addClass("active");
                                                                    } else if (markedanswer.trim() == "AnswerB") {
                                                                    $("#option2").attr("checked", "checked");
                                                                            var eventHander = $("#option2").closest("label");
                                                                            eventHander.addClass("active");
                                                                    } else if (markedanswer.trim() == "AnswerC") {
                                                                    $("#option3").attr("checked", "checked");
                                                                            var eventHander = $("#option3").closest("label");
                                                                            eventHander.addClass("active");
                                                                    } else if (markedanswer.trim() == "AnswerD") {
                                                                    $("#option4").attr("checked", "checked");
                                                                            var eventHander = $("#option4").closest("label");
                                                                            eventHander.addClass("active");
                                                                    } else if (markedanswer.trim() == "AnswerE") {
                                                                    $("#option5").attr("checked", "checked");
                                                                            var eventHander = $("#option5").closest("label");
                                                                            eventHander.addClass("active");
                                                                    } else{

                                                                    }

                                                                    }


                                                                    function loaderback() {
                                                                        
                                                                    var qeset = document.getElementById("qsis").innerHTML;
                                                                            var xhttp = new XMLHttpRequest();
                                                                            xhttp.onreadystatechange = function() {
                                                                            if (this.readyState === 4 && this.status === 200) {
                                                                            document.getElementById("question").innerHTML = xhttp.responseText;
                                                                                    checkAnswerButton();
                                                                            }
                                                                            };
                                                                            xhttp.open("Post", "AquestionVI.jsp", true);
                                                                            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                                            xhttp.send("QeSet=" + qeset + "&Qe=" + qe + "&command=" + 2);
                                                                    }

                                                                    function next(q, ii) {
                                                                    console.log("next call");
                                                                            var prqueset = document.getElementById("prqueset").innerHTML;
                                                                            var answerValue = $("input[name='options']:checked").val();
                                                                            var xhttp = new XMLHttpRequest();
                                                                            xhttp.onreadystatechange = function() {
                                                                            if (this.readyState === 4 && this.status === 200) {
                                                                            }
                                                                            };
//                                             

                                                                            var nextorsubmit = document.getElementById("nextbtn").innerHTML;
                                                                            //xhttp.open("Post", "Answered", true);
                                                                            //xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                                            //xhttp.send("Que=" + ii + "&number=" + q + "&answer=" + answerValue + "&type=practice" + "&prqueset=" + prqueset + "&nextorsubmit=" + nextorsubmit);
                                                                            
        if (qe < 50) {
                                                                    if (qe === 49) {

                                                                    } else {
                                                                    qe = ++q;
                                                                    console.log("in next qe "+qe);
                                                                            loadernext(qe);
                                                                    }
                                                                    }

                                                                    ////                    pro.value = q;
                                                                    //                                                    pro.style = "width:" + (qe * 2) + "%;";
                                                                    //                                                    pro.innerHTML = "question completion:" + qe;
                                                                    //                                                    


                                                                    ////////////////////////////////////////////////////////////////////////////voice ///////////////////////
                                                                    function questonSetReady(message){
                                                                    console.log("voice start");
                                                                            var msg = new SpeechSynthesisUtterance();
                                                                            msg.volume = 1; // 0 to 1
                                                                            msg.rate = 1; // 0.1 to 10
                                                                            msg.pitch = 1; //0 to 2
                                                                            msg.text = message;
                                                                            const voice = speaks[0] // 47 total

                                                                            msg.voiceURI = voice.name;
                                                                            msg.lang = voice.lang;
                                                                            speechSynthesis.speak(msg);
                                                                    }

                                                                    setTimeout(function(){
                                                                    var questionTitle = $('#qu').text();
                                                                            var questionNumber = $('.card-title').text();
                                                                            questonSetReady(questionNumber);
                                                                            questonSetReady(questionTitle);
                                                                    }, 3000);
                                                                            /////////////////////////////////////////////////////end voice////////////////////////

                                                                    }



                                                                    function back(ii) {
                                                                    if (qe !== 0) {

                                                                    qe = --ii;
                                                                            loaderback();
                                                                            // alert("sent")
//                                                    var backpracticequestionsetjs = document.getElementById("backpracticequestionsetjs").innerHTML;
//                                                    alert("ok");
//                                                    var backsavedprquestionjs = document.getElementById("backsavedprquestionjs").innerHTML;
//                                                    var backsubmitanswernumjs = document.getElementById("backsubmitanswernumjs").innerHTML;
//                                                    alert(backsubmitanswernumjs);
//
//                                                    if (backsubmitanswernumjs === 1) {
//                                                        document.getElementById("option1").click(true);
//                                                    } else if (backsubmitanswernumjs === 2) {
//                                                        document.getElementById("option2").click(true);
//                                                    } else if (backsubmitanswernumjs === 3) {
//                                                        document.getElementById("option3").click(true);
//                                                    } else if (backsubmitanswernumjs === 4) {
//                                                        document.getElementById("option4").click(true);
//                                                    } else if (backsubmitanswernumjs === 5) {
//                                                        document.getElementById("option5").click(true);
//                                                    }
//                                                    if (backsubmitanswernumjs === 0) {
//                                                    }

//                                                       pro.style = "width:" + (qe * 2) + "%;";
//                                                    pro.innerHTML = "question completion:" + qe;


                                                                    }
//                                                xhttp.open("Post", "BackAnswers", true);
//                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//                                                xhttp.send("Que=" + qe);
//


                                                                    }
                                                                    function selectque(ii) {
                                                                    qe = ii - 1;
                                                                            loader();
                                                                    }
                                                                    var clicked = 0;
                                                                            function selectanswer(ii, q) {
                                                                            // var cor = "";
                                                                            //var type = document.getElementById("type").innerHTML;
                                                                            //for (var i = 1; i <= 5; i++) {
                                                                            // if(document.getElementById("option" + i).c)
//                                                    if (i != ii) {
//                                                      //  document.getElementById("option" + i).disabled = "true";
//                                                    } else {
                                                                            if (clicked !== 0) {
                                                                            clicked = 0;
                                                                                    document.getElementById("option" + ii).click();
                                                                                    clicked = ii;
                                                                            }
                                                                            if (clicked === 0) {
                                                                            clicked = ii;
                                                                            }
                                                                            // cor = document.getElementById("option" + ii).value;
                                                                            document.getElementById("nextbtn").disabled = "";
                                                                                    //                                                        alert(cor);
                                                                                    // }
                                                                                    // }


                                                                                    //                                                var qeset = document.getElementById("qsis").innerHTML;
                                                                                    //                                                var xhttp = new XMLHttpRequest();
                                                                                    //
                                                                                    //                                                xhttp.onreadystatechange = function() {
                                                                                    //                                                    if (this.readyState == 4 && this.status == 200) {
                                                                                    //                                                        //next(qe);
                                                                                    //                                                    }
                                                                                    //                                                };
                                                                                    //                                                xhttp.open("Post", "Answered", true);
                                                                                    //                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                                                    //                                                xhttp.send("Qe=" + q + "&sele=" + q + "&seleq=" + cor + "&type=" + type);
                                                                            }


                                                                    window.onload = loadernext(0);</script>


        <!--script>


                             $(document).ready(function(){

                            speaks = [
                            {
                            "name": "Alex",
                                    "lang": "en-US"
                            },
                            {
                            "name": "Alice",
                                    "lang": "it-IT"
                            },
                            ];
                                    $('#btn').on('click', function(){

                            startMessage('hello');
                            });
                                    function startMessage(message){
                                    var msg = new SpeechSynthesisUtterance();
                                            msg.volume = 1; // 0 to 1
                                            msg.rate = 1; // 0.1 to 10
                                            msg.pitch = 1; //0 to 2
                                            msg.text = message;
                                            const voice = speaks[0] // 47 total
                                            console.log(`voice: ${voice.name}, language: ${voice.lang}`)
                                            msg.voiceURI = voice.name;
                                            msg.lang = voice.lang;
                                            speechSynthesis.speak(msg);
                                    }

                            });</script-->
        <!--script>
                            $(document).ready(function(){
                    window.SpeechRecognition = window.webkitSpeechRecognition || window.SpeechRecognition;
                            let finalTranscript = '';
                            let recognition = new window.SpeechRecognition();
                            recognition.interimResults = true;
                            recognition.maxAlternatives = 1;
                            recognition.continuous = true;
                            recognition.onresult = (event) = > {
                    let interimTranscript = '';
                            for (let i = event.resultIndex, len = event.results.length; i < len; i++) {
                    let transcript = event.results[i][0].transcript;
                            if (event.results[i].isFinal) {
                    finalTranscript = transcript;
                    } else {
                    interimTranscript = transcript;
                    }
                    }
        
                    //console.log(interimTranscript);
                    //console.log($.trim(interimTranscript));
                    if ($.trim(interimTranscript) == 'a' || $.trim(interimTranscript) == 'hey'){
                    $("#option1").attr("checked", "checked");
                            var eventHander = $("#option1").closest("label");
                            eventHander.addClass("active");
                            eventHander.trigger('click');
                            $("#option2,#option3,#option4,#option5").removeClass("active");
                            console.log(interimTranscript);
                    } else if ($.trim(interimTranscript) == 'b'){

                    $("#option2").attr("checked", "checked");
                            $("#option2").addClass("active");
                            $("#option1,#option3,#option4,#option5").removeClass("active");
                            console.log($.trim(interimTranscript));
                    } else if ($.trim(interimTranscript) == 'c' || $.trim(interimTranscript) == 'see'){
                    $("#option3").attr("checked", "checked");
                            $("#option3").addClass("active");
                            $("#option1,#option2,#option4,#option5").removeClass("active");
                            console.log($.trim(interimTranscript));
                    } else if ($.trim(interimTranscript) == 'd'){
                    $("#option4").attr("checked", "checked");
                            $("#option4").addClass("active");
                            $("#option1,#option2,#option3,#option5").removeClass("active");
                            console.log($.trim(interimTranscript));
                    } else if ($.trim(interimTranscript) == 'e'){
                    $("#option5").attr("checked", "checked");
                            $("#option5").addClass("active");
                            $("#option1,#option2,#option3,#option4").removeClass("active");
                            console.log($.trim(interimTranscript));
                    }
                    if ($.trim(interimTranscript) == 'next'){
                    //$('#next').trigger('click');
                    var nextQueId = $('next').data('nextquestionid');
                            console.log(nextQueId);
                            next(nextQueId);
                            var questionTitle = $('#qu').text();
             var questionNumber = $('.card-title').text();
                            //startMessage(questionNumber);   
                            //startMessage(questionTitle);  
                            questonSetReady(questionNumber);
                            questonSetReady(questionTitle);
                            console.log(questionNumber);
                            console.log($.trim(interimTranscript));
                    } else if ($.trim(interimTranscript) == 'back'){
                    $('#back').trigger('click');
                            questonSetReady('move to previous question');
                            console.log($.trim(interimTranscript));
                    } else if ($.trim(interimTranscript) == 'submit'){
                    // $('#submit').trigger('click');
                    questonSetReady('paper submit successfully');
                            console.log($.trim(interimTranscript));
                    }

                    function questonSetReady(message){
                    var msg = new SpeechSynthesisUtterance();
                            msg.volume = 1; // 0 to 1
                            msg.rate = 1; // 0.1 to 10
                            msg.pitch = 1; //0 to 2
                            msg.text = message;
                            const voice = speaks[0] // 47 total
                            console.log(`voice: ${voice.name}, language: ${voice.lang}`)
                            msg.voiceURI = voice.name;
                            msg.lang = voice.lang;
                            speechSynthesis.speak(msg);
                    }

                    }
                    recognition.start();
                            });



        </script-->

        <script>

                                            /////////////////////////////////////////google voice api/////////////////////
                                            $(document).ready(function(){

                                    speaks = [
                                    {
                                    "name": "Alex",
                                            "lang": "en-US"
                                    },
                                    {
                                    "name": "Alice",
                                            "lang": "it-IT"
                                    },
                                    ];
                                            function startMessage(message){
                                            var msg = new SpeechSynthesisUtterance();
                                                    msg.volume = 1; // 0 to 1
                                                    msg.rate = 1; // 0.1 to 10
                                                    msg.pitch = 1; //0 to 2
                                                    msg.text = message;
                                                    const voice = speaks[0] // 47 total
                                                    console.log(`voice: ${voice.name}, language: ${voice.lang}`)
                                                    msg.voiceURI = voice.name;
                                                    msg.lang = voice.lang;
                                                    speechSynthesis.speak(msg);
                                            }
                                    $(document).ready(function (){
                                    $('#btn').on('click', function(){
                                    console.log('instructions')
                                            //tell instructions answers prounce as A, B, C, D, E
                                            startMessage('hello student, Please follow instrction to navigate through questions.., Use term  "Repeat" to repeat the question, use term "A", "B", "C", "D", "E", to select the answer,.. use term, "NEXT" to move next questions, use term,  "Back" to move previous question. ');
                                            var questionTitle = $('#qu').text();
                                            var questionNumber = $('.card-title').text();
                                            startMessage(questionNumber);
                                            startMessage(questionTitle);
                                    });
                                    });
                                    });</script>

        <script>
                                            $(document).ready(function(){
                                    window.SpeechRecognition = window.webkitSpeechRecognition || window.SpeechRecognition;
                                            let finalTranscript = '';
                                            let previousWord = '';
                                            let recognition = new window.SpeechRecognition();
                                            recognition.interimResults = true;
                                            recognition.maxAlternatives = 1;
                                            recognition.continuous = true;
                                            recognition.onresult = (event) => {
                                    let interimTranscript = '';
                                            var missInstruction = false;
                                            for (let i = event.resultIndex, len = event.results.length; i < len; i++) {
                                    let transcript = event.results[i][0].transcript;
                                            if (event.results[i].isFinal) {
                                    finalTranscript = transcript;
                                    } else {
                                    interimTranscript = transcript;
                                    }
                                    }
                                    function questonSetReady(message){
                                    if (message == 'stop'){
                                    speechSynthesis.cancel();
                                    } else{
                                    var msg = new SpeechSynthesisUtterance();
                                            msg.volume = 1; // 0 to 1
                                            msg.rate = 0.8; // 0.1 to 10
                                            msg.pitch = 0; //0 to 2
                                            msg.text = message;
                                            const voice = speaks[0] // 47 total
                                            console.log(`voice: ${voice.name}, language: ${voice.lang}`)
                                            msg.voiceURI = voice.name;
                                            msg.lang = voice.lang;
                                            speechSynthesis.speak(msg);
                                    }


                                    }
                                    console.log('final word----' + finalTranscript);
                                            console.log($.trim(interimTranscript));
                                            if ($.trim(interimTranscript) == 'a' || $.trim(interimTranscript) == 'hey'){
                                    $("#option1").attr("checked", "checked");
                                            var eventHander = $("#option1").closest("label");
                                            eventHander.addClass("active");
                                            eventHander.trigger('click');
                                            //$("#option2,#option3,#option4,#option5").removeClass("active");
                                            $("#lbl2,#lbl3,#lbl4,#lbl5").removeClass("active");
                                            missInstruction = true;
                                            questonSetReady('Answer A selected');
                                            console.log(interimTranscript);
                                    } else if ($.trim(interimTranscript) == 'b'){

                                    $("#option2").attr("checked", "checked");
                                            var eventHander = $("#option2").closest("label");
                                            eventHander.addClass("active");
                                            eventHander.trigger('click');
                                            $("#lbl1,#lbl3,#lbl4,#lbl5").removeClass("active");
                                            missInstruction = true;
                                            //$("#option2").addClass("active");
                                            //$("#option1,#option3,#option4,#option5").removeClass("active");
                                            questonSetReady('Answer B selected');
                                            console.log($.trim(interimTranscript));
                                    } else if ($.trim(interimTranscript) == 'c' || $.trim(interimTranscript) == 'see'){
                                    $("#option3").attr("checked", "checked");
                                            var eventHander = $("#option3").closest("label");
                                            eventHander.addClass("active");
                                            eventHander.trigger('click');
                                            $("#lbl1,#lbl2,#lbl4,#lbl5").removeClass("active");
                                            missInstruction = true;
                                            questonSetReady('Answer C selected');
                                            console.log($.trim(interimTranscript));
                                    } else if ($.trim(interimTranscript) == 'd'){
                                    $("#option4").attr("checked", "checked");
                                            var eventHander = $("#option4").closest("label");
                                            eventHander.addClass("active");
                                            eventHander.trigger('click');
                                            $("#lbl1,#lbl2,#lbl3,#lbl5").removeClass("active");
                                            missInstruction = true;
                                            questonSetReady('Answer D selected');
                                            console.log($.trim(interimTranscript));
                                    } else if ($.trim(interimTranscript) == 'e'){
                                    var eventHander = $("#option5").closest("label");
                                            eventHander.addClass("active");
                                            eventHander.trigger('click');
                                            $("#lbl1,#lbl2,#lbl3,#lbl4").removeClass("active");
                                            missInstruction = true;
                                            questonSetReady('Answer E selected');
                                    }
                                    if ($.trim(interimTranscript) == 'question'){
                                    var questionNumber = $('.card-title').text();
                                            var questionTitle = $('#qu').text();
                                            console.log('repeat work' + questionNumber);
                                            missInstruction = true;
                                            questonSetReady(questionNumber);
                                            questonSetReady(questionTitle);
//                                 var questionTitle = $('#qu').text();
//                                 var questionNumber = $('.card-title').text(); 
//                                 startMessage(questionNumber);
//                                 startMessage(questionTitle);
                                    }
                                    if ($.trim(interimTranscript) == 'instruction'){

                                    missInstruction = true;
                                            questonSetReady('Please follow instrction to navigate through questions.., Use term,  "Repeat", to repeat the question, use term "A", "B", "C", "D", "E", to select the answer,.. use term, "NEXT" to move next questions, use term,  "Back" to move previous question. ');
                                    }
                                    if ($.trim(interimTranscript) == 'stop'){
                                    questonSetReady('stop');
                                    }
                                    if ($.trim(interimTranscript) == 'next' && $.trim(previousWord) != $.trim(interimTranscript)){
                                    //$('#next').trigger('click');
                                    missInstruction = true;
                                            previousWord = $.trim(interimTranscript);
                                            var nextQueId = $('#nextbtn').data('nextquestionid');
                                            var ii = $('#nextbtn').data('numberii');
                                            console.log(nextQueId);
                                            console.log(ii);
                                            next(nextQueId, ii);
                                    } else if ($.trim(interimTranscript) == 'back' && $.trim(previousWord) != $.trim(interimTranscript)){
//                                 $('#back').trigger('click');
//                                 questonSetReady('move to previous question');
//                                 console.log($.trim(interimTranscript));
                                    missInstruction = true;
                                            var prevQueId = $('#nextbtn').data('nextquestionid');
                                            var ii = $('#nextbtn').data('numberii');
                                            console.log(prevQueId);
                                            console.log(ii);
                                            back(prevQueId, ii);
                                    } else if ($.trim(interimTranscript) == 'submit'){
                                    // $('#submit').trigger('click');  
                                    missInstruction = true;
                                            var nextQueId = $('#nextbtn').data('nextquestionid');
                                            var ii = $('#nextbtn').data('numberii');
//                                 console.log(nextQueId);
//                                 console.log(ii);
                                            next(nextQueId, ii);
                                            questonSetReady('paper submit successfully');
                                            //console.log($.trim(interimTranscript));
                                    }



//                            if(missInstruction == false){
//                                questonSetReady('Repeat the command again !');
//                                missInstruction = true;
//                                
//                        }

                                    }



                                    //var recognition = new webkitSpeechRecognition();
                                    var recognizing = true;
                                            recognition.onstart = function () {
                                            recognizing = true;
                                            };
                                            recognition.onend = function () {
                                            recognizing = false;
                                            };
                                            recognition.onerror = function (event) {
                                            recognizing = false;
                                            };
                                            //start voice recognition every 10 seconds
                                            setInterval(function(){
                                            console.log(recognizing);
                                                    if (!recognizing){recognizing = true; }
                                            if (recognizing) {
                                            recognition.start()
                                            }; }, 10000);
                                    });



        </script>






        <%
                //    }
            // }
//            }
%>
    </body>
</html>
