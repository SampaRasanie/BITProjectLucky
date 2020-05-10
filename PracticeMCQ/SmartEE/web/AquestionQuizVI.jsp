
<%@page import="servlets.Answered"%>
<%@page import="pojo.AnswersHistory"%>
<%@page import="pojo.PracticeQuestion"%>
<%@page import="pojo.PracticeQuestionSet"%>
<%@page import="servlets.BackAnswers"%>
<%@page import="pojo.User"%>
<%@page import="java.util.Random"%>
<%@page import="pojo.Answers"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Question"%>
<%@page import="pojo.QuestionSet"%>
<%@page import="moduls.Getting"%>
<%
    String answertext = "";
    // int answernum = 0;
    // Question quizques = null;
    String type = request.getParameter("type");
    int command = Integer.parseInt(request.getParameter("command"));
    //  int id = Integer.parseInt(request.getParameter("Qe"));

    System.out.println("type " + type);

    if (type != null) {

        try {
            if (type.equals("time")) {
                System.out.println("type " + type);
                String quizsubject = request.getParameter("QeSet");
                String strqe = request.getParameter("Qe");
                System.out.println("strqe " + strqe);
                int qe = Integer.parseInt(strqe);
                System.out.println("subject " + quizsubject + "");

                if (quizsubject != null) {
                    System.out.println("quizsubject " + quizsubject);
                    Getting getting = new Getting();
                    List<Question> questionlist = getting.getQuestionsBySubject(quizsubject);

                    for (Question q : questionlist) {
                        System.out.println(q.getIdquestion() + " ");

                    }
                    System.out.println("queslist ");

                    System.out.println("qe " + qe);

                    Question quizques = questionlist.get(qe);
                    System.out.println("quizques " + quizques.getQuestiontext());

                    String[] s = quizques.getImgpath().split("uploads");

                    List<Answers> ans = new Getting().getAnswerListByQuetionId(quizques);

                    Answers correctanswer = null;
                    int correctanswernum = 0;
                    String correctansweroption = "";
                    String voicecorrectansweroption = "";
                    for (int i = 0; i < ans.size(); i++) {

                        Answers ansoption = ans.get(i);
                        if (ansoption.getIscorrect() == 1) {
                            correctanswer = ansoption;
                            correctanswernum = i + 1;
                        }
                    }
                    if (correctanswernum == 1) {
                        correctansweroption = "Answer A";
                        voicecorrectansweroption = "AnswerA";
                    } else if (correctanswernum == 2) {
                        correctansweroption = "Answer B";
                        voicecorrectansweroption = "AnswerB";
                    } else if (correctanswernum == 3) {
                        correctansweroption = "Answer C";
                        voicecorrectansweroption = "AnswerC";
                    } else if (correctanswernum == 4) {
                        correctansweroption = "Answer D";
                        voicecorrectansweroption = "AnswerD";
                    } else if (correctanswernum == 5) {
                        correctansweroption = "Answer E";
                        voicecorrectansweroption = "AnswerE";
                    }

                    if (command == 2) {
                        System.out.println("in if");

                    }


%>
<div class="col-12">
    <div class="card mb-3" >
        <div class="row no-gutters">
            <!-- remove this div if there are no image to show -->
            <div class="col-md-4">
                <img src="<%  out.write("uploads" + s[1] + ".jpg");  %>" class="card-img"  height="300" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title"> Question No <% out.write((qe + 1) + ""); %> </h5>
                    <p class="card-text" id="qu"><% out.write(quizques.getQuestiontext()); %>.</p>
                    <button id='btn'>Instruction</button>
                    <p>Select Your Answer:</p>

                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-warning" onclick="selectanswer(1,<%out.write(qe + "");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option1" value="AnswerA"  autocomplete="off"> Answer A
                        </label>
                        <label class="btn btn-warning"  onclick="selectanswer(2,<%out.write(qe + "");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option2" value="AnswerB" autocomplete="off"> Answer B
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(3,<%out.write(qe + "");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option3" value="AnswerC"  autocomplete="off"> Answer C
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(4,<%out.write(qe + "");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option4" value="AnswerD" autocomplete="off"> Answer D
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(5,<%out.write(qe + "");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option5" value="AnswerE"  autocomplete="off"> Answer E
                        </label>
                    </div>

                    <%
                        String nextsubmitbtnname = "Next";
                        System.out.println("Submit " + qe);

                        if (qe == 9) {
                            System.out.println("Submit" + qe);
                            nextsubmitbtnname = "FINISH";
                        }

                    %>


                    <div class="btn-group float-right" role="group" aria-label="Third group">
                        <button type="button" id="backbtn" class="btn btn-success" data-nextquestionid="<% out.write(qe + ""); %>" data-quesno="<% out.write(quizques.getIdquestion() + ""); %>"  onclick="back(<% out.write(qe + ""); %>,<% out.write(quizques.getIdquestion() + ""); %>)">Back</button>
                        <button type="button" id="nextbtn" class="btn btn-danger" data-nextquestionid="<% out.write(qe + ""); %>" data-quesno="<% out.write(quizques.getIdquestion() + ""); %>" onclick="next(<% out.write(qe + "");%>,<% out.write(quizques.getIdquestion() + ""); %>)" disabled=""><%out.write(nextsubmitbtnname);%> </button>
                    </div>
                    <br><br>
                    <div class="btn-group float-right" role="group" aria-label="Third group">
<!--                        <button type="button" class="btn btn-success" onclick="back(<% //out.write(qe + ""); %>)">Back</button>-->
                        <button type="button" id="showanswer" class="btn btn-success" style="background-color: #17a2b8" onclick="showAnswer()" disabled=""><%out.write("Show Correct Answer");%> </button>


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

            <p class="card-text" id="answer1"><%out.write(ans.get(0).getText());  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer B</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer2"><% out.write(ans.get(1).getText());  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer C</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer3"><% out.write(ans.get(2).getText());  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer D</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer4"><% out.write(ans.get(3).getText());  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer E</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer5"><% out.write(ans.get(4).getText());  %>.</p>
        </div>
    </div>
</div>        

<div class="col-6" id="answerblock" style="visibility: hidden">
    <div class="card border-dark mb-3" >
        <div class="card-header" style="color: #006600"><b>Correct Answer</b></div>
        <div class="card-body text-dark">

            <p class="card-text" id="answerblockpara" data-answer="<% out.write(voicecorrectansweroption);  %>" data-description="<% out.write(correctanswer.getDescription()); %>" style="color: green" style="visibility: hidden"><% out.write(correctansweroption);  %> <br> <% out.write(correctanswer.getDescription());  %></p>
        </div>
    </div>
</div>  

<%
                   
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
%>


<script>
    alert("ok");
    function showBackAnswer() {
        alert("showBackAnswer");
        var commandbutton = document.getElementById("commandbutton").innerHTML;

        if (commandbutton === 2) {
            var markedanswer = document.getElementById("markedanswer").innerHTML;
            if (markedanswer === "AnswerA") {
                document.getElementById("option1").click();
            } else if (markedanswer === "AnswerB") {
                document.getElementById("option2").click();
            } else if (markedanswer === "AnswerC") {
                document.getElementById("option3").click();
            } else if (markedanswer === "AnswerD") {
                document.getElementById("option4").click();
            } else if (markedanswer === "AnswerE") {
                document.getElementById("option5").click();
            } else if (markedanswer === null) {

            }
        }
    }
    showBackAnswer();


//    window.onload = showBackAnswer();


</script>