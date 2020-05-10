<%-- 
    Document   : Login
    Created on : Jul 24, 2019, 10:13:25 PM
    Author     : User
--%>

<%@page import="pojo.Question"%>
<%@page import="java.util.Random"%>
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
        <title>PracticeMCQ</title>
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

        <%            String quizsubject = (String) request.getParameter("quizsubject");

            String userid = "";
            Cookie[] cookies = request.getCookies();
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("id")) {
                    userid = cooky.getValue();
                }
            }
            System.out.println("Take quiz " + quizsubject);

        %>




        <label  id="quizsubject" style="display:  none;"><% out.write(quizsubject); %></label>

        <div class="container-fluid">
            <h2> PRACTICE QUIZ</h2>
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
                                        for (int i = 1; i <= 10; i++) {

                                    %>
                                    <button type="button" class="btn btn-secondary col-1" onclick="selectque(<% out.write(i + "");  %>)"><% out.write(i + "");  %></button>
                                    <%                                        }
                                    %>


                                </div>

                            </div>

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
                                                        var quizsubject = document.getElementById("quizsubject").innerHTML;
                                                        var answerarr = new Array();
                                                        var quesidglobal;
                                                        // var pro = document.getElementById("pro");

                                                                //            pro.value = qe;

                                                                        function loadernext(qe) {
                                                                        console.log("qe " + qe);
                                                                                // var qeset = document.getElementById("qsis").innerHTML;
                                                                                var xhttp = new XMLHttpRequest();
                                                                                xhttp.onreadystatechange = function() {
                                                                                if (this.readyState === 4 && this.status === 200) {
                                                                                document.getElementById("question").innerHTML = xhttp.responseText;
                                                                                console.log(xhttp.responseText);
                                                                                        // var ii = $('#nextbtn').data('numberii');

                                                                                        // checkAnswerButton(answerarr[quesidglobal]);

                                                                                }
                                                                                };
                                                                                xhttp.open("Post", "AquestionQuizVI.jsp", true);
                                                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                                                xhttp.send("QeSet=" + quizsubject + "&type=" + "time" + "&Qe=" + qe + "&command=" + 1);
                                                                        }

                                                                function checkAnswerButton(markedanswer) {
                                                                console.log("markedanswer");
                                                                        console.log(markedanswer);
                                                                        if (markedanswer == "AnswerA") {

                                                                $("#option1").attr("checked", "checked");
                                                                        var eventHander = $("#option1").closest("label");
                                                                        eventHander.addClass("active");
                                                                        $("#option2,#option3,#option4,#option5").removeClass("active");
                                                                } else if (markedanswer == "AnswerB") {
                                                                $("#option2").attr("checked", "checked");
                                                                        var eventHander = $("#option2").closest("label");
                                                                        eventHander.addClass("active");
                                                                        $("#option1,#option3,#option4,#option5").removeClass("active");
                                                                } else if (markedanswer == "AnswerC") {
                                                                $("#option3").attr("checked", "checked");
                                                                        var eventHander = $("#option3").closest("label");
                                                                        eventHander.addClass("active");
                                                                        $("#option1,#option2,#option4,#option5").removeClass("active");
                                                                } else if (markedanswer == "AnswerD") {
                                                                $("#option4").attr("checked", "checked");
                                                                        var eventHander = $("#option4").closest("label");
                                                                        eventHander.addClass("active");
                                                                        $("#option1,#option2,#option3,#option5").removeClass("active");
                                                                } else if (markedanswer == "AnswerE") {
                                                                $("#option5").attr("checked", "checked");
                                                                        var eventHander = $("#option5").closest("label");
                                                                        eventHander.addClass("active");
                                                                        $("#option1,#option2,#option3,#option4").removeClass("active");
                                                                } else {
                                                                console.log("else");
                                                                }
                                                                document.getElementById("nextbtn").disabled = "";
                                                                }

                                                                function loaderback() {
                                                                //var qeset = document.getElementById("qsis").innerHTML;
                                                                var xhttp = new XMLHttpRequest();
                                                                        console.log("back " + qe);
                                                                        xhttp.onreadystatechange = function() {
                                                                        if (this.readyState === 4 && this.status === 200) {
                                                                        document.getElementById("question").innerHTML = xhttp.responseText;
                                                                                document.getElementById("showanswer").disabled = "";
                                                                                //document.getElementById("nextbtn").disabled = "";
                                                                                // showAnswer();
                                                                                // checkAnswerButton(answerarr[quesidglobal]);

                                                                                //    document.getElementById("answerblock").style.visibility = "visible";
                                                                                //  document.getElementById("answerblockpara").style.visibility = "visible";

                                                                        }
                                                                        };
                                                                        xhttp.open("Post", "AquestionQuizVI.jsp", true);
                                                                        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                                        xhttp.send("QeSet=" + quizsubject + "&type=" + "time" + "&Qe=" + qe + "&command=" + 2);
                                                                }

                                                                function next(q, ii) {

                                                                var selectedoption = $("input[name='options']:checked").val();
//                                            if (answerarr.length <= q + 1) {

                                                                        answerarr[ii] = selectedoption;
                                                                        var xhttp = new XMLHttpRequest();
                                                                        xhttp.onreadystatechange = function() {
                                                                        if (this.readyState === 4 && this.status === 200) {
                                                                        }
                                                                        };
                                                                        if (qe < 10) {
                                                                if (qe === 9) {

                                                                } else {
                                                                qe = ++q; //2
                                                                        loadernext(qe);
                                                                }
                                                                }

                                                                //// pro.value = q;
                                                                //  pro.style = "width:" + (qe * 2) + "%;";
                                                                //  pro.innerHTML = "question completion:" + qe;
                                                                //  

                                                                setTimeout(function() {
                                                                var qnext = $('#nextbtn').data('quesno');
                                                                        console.log("array next values " + answerarr);
                                                                        for (quesid in answerarr) {
                                                                console.log("array qid " + quesid); //138
                                                                        console.log("ii " + qnext); //220
                                                                        if (quesid == qnext) {
                                                                quesidglobal = quesid;
                                                                        console.log("text " + answerarr[quesid]);
                                                                        checkAnswerButton(answerarr[quesid]);
                                                                        break;
                                                                }
                                                                else {
                                                                quesidglobal = - 1;
                                                                }
                                                                }

                                                                }, 1000);
//

                                                                        ////////////////////////////////////////////////////////////////////////////voice ///////////////////////


                                                                       
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
                                                                                 var answera = 'Answer A is ' + $('#answer1').text();
                                                                        questonSetReady(answera);
                                                                        var answerb = 'Answer B is ' + $('#answer2').text();
                                                                        questonSetReady(answerb);
                                                                        var answerc = 'Answer C is ' + $('#answer3').text();
                                                                        questonSetReady(answerc);
                                                                        var answerd = 'Answer D is ' + $('#answer4').text();
                                                                        questonSetReady(answerd);
                                                                        var answere = 'Answer E is ' + $('#answer5').text();
                                                                        questonSetReady(answere);
                                                                        }, 3000);
                                                                                /////////////////////////////////////////////////////end voice////////////////////////



                                                                        }

                                                                function back(iii, queno) {
                                                                console.log(answerarr);
                                        }

                                                                        if (qe !== 0) {
                                                                qe = --iii;
                                                                        loaderback();
                                                                        //                                                       pro.style = "width:" + (qe * 2) + "%;";
                                                                        //                                                    pro.innerHTML = "question completion:" + qe;

                                                                }


                                                                setTimeout(function() {
                                                                var qback = $('#backbtn').data('quesno');
                                                                        console.log("array back values " + answerarr);
                                                                        for (quesid in answerarr) {
                                                                console.log("array qid " + quesid); //138
                                                                        console.log("ii " + qback); //220
                                                                        if (quesid == qback) {
                                                                quesidglobal = quesid;
                                                                        console.log("text " + answerarr[quesid]);
                                                                        checkAnswerButton(answerarr[quesid]);
                                                                        break;
                                                                }
                                                                else {
                                                                quesidglobal = - 1;
                                                                }
                                                                }



                                                                }, 1000);
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
                                                                        document.getElementById("nextbtn").disabled = "";
                                                                                document.getElementById("showanswer").disabled = "";
                                                                        }

                                                                function showAnswer() {
                                                                document.getElementById("answerblock").style.visibility = "visible";
                                                                        document.getElementById("answerblockpara").style.visibility = "visible";
                                                                }


                                                                window.onload = loadernext(0);</script>


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
                                            console.log('buttn enable');
                                            $('#btn').on('click', function(){
                                            console.log('instructions')
                                                    //tell instructions answers prounce as A, B, C, D, E
                                                    startMessage('hello student, Please follow instrction to navigate through questions.., Use term  "Repeat" to repeat the question, use term "A", "B", "C", "D", "E", to select the answer,.. use term, "NEXT" to move next questions, use term,  "Back" to move previous question. ');
                                                    var questionTitle = $('#qu').text();
                                                    var questionNumber = $('.card-title').text();
                                                    startMessage(questionNumber);
                                                    startMessage(questionTitle);
                                                    var answera = 'Answer A is ' + $('#answer1').text();
                                                    startMessage(answera);
                                                    var answerb = 'Answer B is ' + $('#answer2').text();
                                                    startMessage(answerb);
                                                    var answerc = 'Answer C is ' + $('#answer3').text();
                                                    startMessage(answerc);
                                                    var answerd = 'Answer D is ' + $('#answer4').text();
                                                    startMessage(answerd);
                                                    var answere = 'Answer E is ' + $('#answer5').text();
                                                    startMessage(answere);
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
                                                if ($.trim(interimTranscript) == 'a' || $.trim(interimTranscript) == 'hey' || $.trim(interimTranscript) == 'A'){
                                        previousWord = $.trim(interimTranscript);
                                                $("#option1").attr("checked", "checked");
                                                var eventHander = $("#option1").closest("label");
                                                eventHander.addClass("active");
                                                eventHander.trigger('click');
                                                //$("#option2,#option3,#option4,#option5").removeClass("active");
                                                $("#lbl2,#lbl3,#lbl4,#lbl5").removeClass("active");
                                                missInstruction = true;
                                                questonSetReady('Answer A selected');
                                                console.log(interimTranscript);
                                        } else if ($.trim(interimTranscript) == 'b' || $.trim(interimTranscript) == 'B'){
                                        previousWord = $.trim(interimTranscript);
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
                                        } else if ($.trim(interimTranscript) == 'c' || $.trim(interimTranscript) == 'see' || $.trim(interimTranscript) == 'C'){
                                        previousWord = $.trim(interimTranscript);
                                                $("#option3").attr("checked", "checked");
                                                var eventHander = $("#option3").closest("label");
                                                eventHander.addClass("active");
                                                eventHander.trigger('click');
                                                $("#lbl1,#lbl2,#lbl4,#lbl5").removeClass("active");
                                                missInstruction = true;
                                                questonSetReady('Answer C selected');
                                                console.log($.trim(interimTranscript));
                                        } else if ($.trim(interimTranscript) == 'd' || $.trim(interimTranscript) == 'D'){
                                        previousWord = $.trim(interimTranscript);
                                                $("#option4").attr("checked", "checked");
                                                var eventHander = $("#option4").closest("label");
                                                eventHander.addClass("active");
                                                eventHander.trigger('click');
                                                $("#lbl1,#lbl2,#lbl3,#lbl5").removeClass("active");
                                                missInstruction = true;
                                                questonSetReady('Answer D selected');
                                                console.log($.trim(interimTranscript));
                                        } else if ($.trim(interimTranscript) == 'e' || $.trim(interimTranscript) == 'E'){
                                        previousWord = $.trim(interimTranscript);
                                                var eventHander = $("#option5").closest("label");
                                                eventHander.addClass("active");
                                                eventHander.trigger('click');
                                                $("#lbl1,#lbl2,#lbl3,#lbl4").removeClass("active");
                                                missInstruction = true;
                                                questonSetReady('Answer E selected');
                                        }
                                        if ($.trim(interimTranscript) == 'question'){
                                        previousWord = $.trim(interimTranscript);
                                                var questionNumber = $('.card-title').text();
                                                var questionTitle = $('#qu').text();
                                                console.log('repeat work' + questionNumber);
                                                missInstruction = true;
                                                questonSetReady(questionNumber);
                                                questonSetReady(questionTitle);
                                            
                                        }
                                        if ($.trim(interimTranscript) == 'instruction'){
                                        previousWord = $.trim(interimTranscript);
                                                missInstruction = true;
                                                questonSetReady('Please follow instrction to navigate through questions.., Use term,  "Repeat", to repeat the question, use term "A", "B", "C", "D", "E", to select the answer,.. use term, "NEXT" to move next questions, use term,  "Back" to move previous question. ');
                                        }
                                        if ($.trim(interimTranscript) == 'stop'){
                                        previousWord = $.trim(interimTranscript);
                                                questonSetReady('stop');
                                        }
                                        if ($.trim(interimTranscript) == 'next' && $.trim(previousWord) != $.trim(interimTranscript)){
                                        //$('#next').trigger('click');
                                        missInstruction = true;
                                                previousWord = $.trim(interimTranscript);
                                                var nextQueId = $('#nextbtn').data('nextquestionid');
                                                var ii = $('#nextbtn').data('quesno');
                                                console.log(nextQueId);
                                                console.log(ii);
                                                next(nextQueId, ii);
                                        } else if ($.trim(interimTranscript) == 'back' && $.trim(previousWord) != $.trim(interimTranscript)){
                                
                                        missInstruction = true;
                                                previousWord = $.trim(interimTranscript);
                                                var prevQueId = $('#backbtn').data('nextquestionid');
                                                var ii = $('#backbtn').data('quesno');
                                                console.log(prevQueId);
                                                console.log(ii);
                                                back(prevQueId, ii);
                                        } else if ($.trim(interimTranscript) == 'answer'){
                                        // $('#submit').trigger('click');  
                                        missInstruction = true;
                                                previousWord = $.trim(interimTranscript);
                                                var selectedanswer = $("input[name='options']:checked").val();
                                                var answer = $('#answerblockpara').data('answer');
                                                var description = $('#answerblockpara').data('description');
                                                if (selectedanswer == answer){
                                                    questonSetReady("Your answer is correct");
                                                } else{
                                                        questonSetReady("Your answer is wrong, correct answer is" + answer);
                                                        questonSetReady("Answer description is, " + description);
                                                }
                                            }

                                        }

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
                                                setInterval(function(){
                                                console.log(recognizing);
                                                        if (!recognizing){recognizing = true; }
                                                if (recognizing) {
                                                recognition.start()
                                                }; }, 5000);
                                        });

            </script>




















    </body>
</html>
