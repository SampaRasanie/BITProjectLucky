
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
    int answernum = 0;
    String type = request.getParameter("type");
    if (type != null) {

        if (type.equals("time")) {
            String subject = request.getParameter("sub");
            String la = request.getParameter("lan");
            String name1 = request.getParameter("id");
            String nu = request.getParameter("no");

            System.out.println(subject + " " + la + " " + name1 + " " + nu);
            if (subject != null && la != null) {

                Getting getting = new Getting();
                Random r = new Random();
                User u = getting.getUserById(name1);
                List<Question> l = getting.getQuestionByQuestionsetlan(la, subject, "time", u);

                System.out.println(l.size());
                Question q1 = l.get(r.nextInt(l.size()));

                String[] s = q1.getImgpath().split("uploads");

                Answers a = new Getting().getAnswersesByQuetionId(q1);
                String[] que = a.getText().split("_");

%>


<%        }
    }
} else {

    String idqeset = request.getParameter("QeSet");
    int id = Integer.parseInt(request.getParameter("Qe"));
    int command = Integer.parseInt(request.getParameter("command"));

    System.out.println(id);
    if (idqeset.equals("")) {

    } else {

        QuestionSet qs = new Getting().getAQuestionSetById(idqeset);
        List<Question> q = new Getting().getQuestionByQuestionset(qs);

        Question q1 = q.get(id);
        String[] s = q1.getImgpath().split("uploads");

        List<Answers> answer = new Getting().getAnswerListByQuetionId(q1);

        System.out.println("command " + command);

        if (command == 2) {
            System.out.println("in if");

            String quessetid = "";
            Cookie[] cookiesqs = request.getCookies();
            for (Cookie cooky : cookiesqs) {
                if (cooky.getName().equals("practicequestionset")) {
                    quessetid = cooky.getValue();
                }
            }
            System.out.println("quessetid " + quessetid);
            System.out.println("quetion no  " + id);
            Getting getting = new Getting();
            PracticeQuestionSet prquesetbyid = getting.getPracticeQuestionSetById(Integer.parseInt(quessetid));
            System.out.println("prquesetbyid " + prquesetbyid.getIdpracticeQuestionHistory());

            PracticeQuestion practicequestion = getting.getPracticeQuestionByPracticeQuestionsetIDandQNO(prquesetbyid, id + 1 + "");

            System.out.println("practicequestion " + practicequestion.getIdpracticeQuestion());

            AnswersHistory answershistory = getting.getAnswersHistoryByPracticeQuetionId(practicequestion);
            answertext = answershistory.getAnswer();
            System.out.println("answer " + answertext);

        }
%>

<label  id="markedanswer" style="display:  none;"><%out.write(answertext);%> </label>
<label  id="commandbutton" style="display:  none;"><%out.write(command); %> </label>

<div class="col-12">
    <div class="card mb-3" >
        <div class="row no-gutters">
            <!-- remove this div if there are no image to show -->
            <div class="col-md-4">
                <img src="<%  out.write("uploads" + s[1] + ".jpg");  %>" class="card-img"  height="300"alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">Question No <% out.write((id + 1) + ""); %> </h5>
                    <p class="card-text" id="qu"><% out.write(q1.getQuestiontext()); %>.</p>
                    <button id='btn'>Instruction</button>
                    <p>Select Your Answer:</p>


                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-warning" onclick="selectanswer(1,<% out.write(q1.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option1" value="AnswerA"  autocomplete="off"> Answer A
                        </label>
                        <label class="btn btn-warning"  onclick="selectanswer(2,<% out.write(q1.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option2" value="AnswerB" autocomplete="off"> Answer B
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(3,<% out.write(q1.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option3" value="AnswerC"  autocomplete="off"> Answer C
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(4,<% out.write(q1.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option4" value="AnswerD" autocomplete="off"> Answer D
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(5,<% out.write(q1.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option5" value="AnswerE"  autocomplete="off"> Answer E
                        </label>
                    </div>
                    <%
                        String nextsubmitbtnname = "Next";
                        System.out.println("Submit " + id);

                        if (id == 49) {
                            System.out.println("Submit" + id);
                            nextsubmitbtnname = "SUBMIT";
                        }

                    %>


                    <div class="btn-group float-right" role="group" aria-label="Third group">
                        <button type="button" class="btn btn-success" onclick="back(<% out.write(id + ""); %>)">Back</button>
<!--                        <button type="button" id="nextbtn" class="btn btn-danger" onclick="next(<% //out.write(id + "");%>,<% //out.write(q1.getIdquestion() + ""); %>)" disabled=""><%//out.write(nextsubmitbtnname);%> </button>-->
                        <button type="button" id="nextbtn" class="btn btn-danger" data-nextquestionid="<% out.write(id + ""); %>" data-numberii ="<% out.write(q1.getIdquestion() + ""); %>" onclick="next(<% out.write(id + ""); %>,<% out.write(q1.getIdquestion() + ""); %>)" disabled=""><% out.write(nextsubmitbtnname);%> </button>
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

            <p class="card-text" id="answer1"><%out.write(answer.get(0).getText());  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer B</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer2"><% out.write(answer.get(1).getText());  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer C</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer3"><% out.write(answer.get(2).getText());  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer D</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer4"><% out.write(answer.get(3).getText());  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer E</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer5"><% out.write(answer.get(4).getText());  %>.</p>
        </div>
    </div>
</div>
<% }
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