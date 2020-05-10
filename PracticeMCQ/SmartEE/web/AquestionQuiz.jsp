
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
                    for (int i = 0; i < ans.size(); i++) {

                        Answers ansoption = ans.get(i);
                        if (ansoption.getIscorrect() == 1) {
                            correctanswer = ansoption;
                            correctanswernum = i + 1;
                        }
                    }
                    if (correctanswernum == 1) {
                        correctansweroption = "Answer A";
                    } else if (correctanswernum == 2) {
                        correctansweroption = "Answer B";
                    } else if (correctanswernum == 3) {
                        correctansweroption = "Answer C";
                    } else if (correctanswernum == 4) {
                        correctansweroption = "Answer D";
                    } else if (correctanswernum == 5) {
                        correctansweroption = "Answer E";
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
                    <p>Select Your Answer:</p>

                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-warning" onclick="selectanswer(1,<%out.write(qe+"");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option1" value="AnswerA"  autocomplete="off"> Answer A
                        </label>
                        <label class="btn btn-warning"  onclick="selectanswer(2,<%out.write(qe+"");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option2" value="AnswerB" autocomplete="off"> Answer B
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(3,<%out.write(qe+"");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option3" value="AnswerC"  autocomplete="off"> Answer C
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(4,<%out.write(qe+"");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
                            <input type="radio" name="options" id="option4" value="AnswerD" autocomplete="off"> Answer D
                        </label>
                        <label class="btn btn-warning" onclick="selectanswer(5,<%out.write(qe+"");%>,<% out.write(quizques.getIdquestion() + ""); %>)">
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
                        <button type="button" id="backbtn" class="btn btn-success" data-quesno="<% out.write(quizques.getIdquestion() + ""); %>"  onclick="back(<% out.write(qe + ""); %>,<% out.write(quizques.getIdquestion() + ""); %>)">Back</button>
                        <button type="button" id="nextbtn" class="btn btn-danger" data-quesno="<% out.write(quizques.getIdquestion() + ""); %>" onclick="next(<% out.write(qe + "");%>,<% out.write(quizques.getIdquestion() + ""); %>)" disabled=""><%out.write(nextsubmitbtnname);%> </button>
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

            <p class="card-text" id="answerblockpara" style="color: green" style="visibility: hidden"><% out.write(correctansweroption);  %> <br> <% out.write(correctanswer.getDescription());  %></p>
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





<!--div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer A</div>
        <div class="card-body text-dark">

            <p class="card-text" id="answer1"><%// out.write(que[0]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer B</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer2"><% //out.write(que[1]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer C</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer3"><% //out.write(que[2]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer D</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer4"><% //out.write(que[3]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer E</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer5"><%// out.write(que[4]);  %>.</p>
        </div>
    </div>
</div-->
<%
    // }

//        else {
//
//    String idqeset = request.getParameter("QeSet");
//    int id = Integer.parseInt(request.getParameter("Qe"));
//    int command = Integer.parseInt(request.getParameter("command"));
//
//    System.out.println(id);
//    if (idqeset.equals("")) {
////        response.sendRedirect("EXam.jsp");
//    } else {
//
//        QuestionSet qs = new Getting().getAQuestionSetById(idqeset);
//        List<Question> q = new Getting().getQuestionByQuestionset(qs);
//
//        Question q1 = q.get(id);
//        String[] s = q1.getImgpath().split("uploads");
//
//        List<Answers> answer = new Getting().getAnswerListByQuetionId(q1);
//
//        System.out.println("command " + command);
//
//        if (command == 2) {
//            System.out.println("in if");
//
//            String quessetid = "";
//            Cookie[] cookiesqs = request.getCookies();
//            for (Cookie cooky : cookiesqs) {
//                if (cooky.getName().equals("practicequestionset")) {
//                    quessetid = cooky.getValue();
//                }
//            }
//            System.out.println("quessetid " + quessetid);
//            System.out.println("quetion no  " + id);
//            Getting getting = new Getting();
//            PracticeQuestionSet prquesetbyid = getting.getPracticeQuestionSetById(Integer.parseInt(quessetid));
//            System.out.println("prquesetbyid " + prquesetbyid.getIdpracticeQuestionHistory());
//
//            PracticeQuestion practicequestion = getting.getPracticeQuestionByPracticeQuestionsetIDandQNO(prquesetbyid, id + 1 + "");
//
//            System.out.println("practicequestion " + practicequestion.getIdpracticeQuestion());
//
//            AnswersHistory answershistory = getting.getAnswersHistoryByPracticeQuetionId(practicequestion);
//            answertext = answershistory.getAnswer();
//            System.out.println("answer " + answertext);
////
////            if (answertext.equalsIgnoreCase("AnswerA")) {
////                answernum = 1;
////            } else if (answertext.equalsIgnoreCase("AnswerB")) {
////                answernum = 2;
////            } else if (answertext.equalsIgnoreCase("AnswerC")) {
////                answernum = 3;
////            } else if (answertext.equalsIgnoreCase("AnswerD")) {
////                answernum = 4;
////            } else if (answertext.equalsIgnoreCase("AnswerE")) {
////                answernum = 5;
////            }
////            System.out.println("answernum " + answernum);
//
//        }
//%>

<!--
//
//<label  id="markedanswer" style="display:  none;"><%//out.write(answertext);%> </label>
//<label  id="commandbutton" style="display:  none;"><%//out.write(command); %> </label>
//
//<div class="col-12">
//    <div class="card mb-3" >
//        <div class="row no-gutters">
//            <!-- remove this div if there are no image to show 
//            <div class="col-md-4">
//                <img src="<% // out.write("uploads" + s[1] + ".jpg");  %>" class="card-img"  height="300"alt="...">
//            </div>
//            <div class="col-md-8">
//                <div class="card-body">
//                    <h5 class="card-title">Question No <%// out.write((id + 1) + ""); %> </h5>
//                    <p class="card-text" id="qu"><%// out.write(q1.getQuestiontext()); %>.</p>
//                    <p>Select Your Answer:</p>
//                    <!--                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
//                                            <input type="button" class="btn btn-warning col-3" value="Answer A"  style="margin-right: 5px" onclick="selectanswer(1,<% //out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option1" autocomplete="off">   
//                                            <input type="button"  class="btn btn-warning col-3" value="Answer B"  style="margin-right: 5px" onclick="selectanswer(2,<% //out.write(q1.getIdquestion() + ""); %>)" name="options" id="option2" autocomplete="off">   
//                                            <input type="button"  class="btn btn-warning col-3" value="Answer C" style="margin-right: 5px"  onclick="selectanswer(3,<% //out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option3" autocomplete="off">  
//                                            <input type="button"  class="btn btn-warning col-3" value="Answer D" style="margin-right: 5px"  onclick="selectanswer(4,<%// out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option4" autocomplete="off">  
//                                            <input type="button" class="btn btn-warning col-3" value="Answer E" style="margin-right: 5px"  onclick="selectanswer(5,<% //out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option5" autocomplete="off">  
//                    
//                                        </div>
//
//
//
//                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
//                        <label class="btn btn-warning" onclick="selectanswer(1,<% //out.write(q1.getIdquestion() + ""); %>)">
//                            <input type="radio" name="options" id="option1" value="AnswerA"  autocomplete="off"> Answer A
//                        </label>
//                        <label class="btn btn-warning"  onclick="selectanswer(2,<% //out.write(q1.getIdquestion() + ""); %>)">
//                            <input type="radio" name="options" id="option2" value="AnswerB" autocomplete="off"> Answer B
//                        </label>
//                        <label class="btn btn-warning" onclick="selectanswer(3,<%//out.write(q1.getIdquestion() + ""); %>)">
//                            <input type="radio" name="options" id="option3" value="AnswerC"  autocomplete="off"> Answer C
//                        </label>
//                        <label class="btn btn-warning" onclick="selectanswer(4,<% //out.write(q1.getIdquestion() + ""); %>)">
//                            <input type="radio" name="options" id="option4" value="AnswerD" autocomplete="off"> Answer D
//                        </label>
//                        <label class="btn btn-warning" onclick="selectanswer(5,<% //out.write(q1.getIdquestion() + ""); %>)">
//                            <input type="radio" name="options" id="option5" value="AnswerE"  autocomplete="off"> Answer E
//                        </label>
//                    </div>
//                    <%
//                        String nextsubmitbtnname = "Next";
//                        System.out.println("Submit " + id);
//
//                        if (id == 49) {
//                            System.out.println("Submit" + id);
//                            nextsubmitbtnname = "SUBMIT";
//                        }
//
//                    %>
//
//
//                    <div class="btn-group float-right" role="group" aria-label="Third group">
//                        <button type="button" class="btn btn-success" onclick="back(<% //out.write(id + ""); %>)">Back</button>
//                        <button type="button" id="nextbtn" class="btn btn-danger" onclick="next(<% //out.write(id + "");%>,<% //out.write(q1.getIdquestion() + ""); %>)" disabled=""><%//out.write(nextsubmitbtnname);%> </button>
//
//                    </div>
//                </div>
//            </div>
//        </div>
//    </div>
//</div>
//<div class="col-6">
//    <div class="card border-dark mb-3" >
//        <div class="card-header">Answer A</div>
//        <div class="card-body text-dark">
//
//            <p class="card-text" id="answer1"><%//out.write(answer.get(0).getText());  %>.</p>
//        </div>
//    </div>
//</div>
//<div class="col-6">
//    <div class="card border-dark mb-3" >
//        <div class="card-header">Answer B</div>
//        <div class="card-body text-dark">
//
//            <p class="card-text"id="answer2"><%// out.write(answer.get(1).getText());  %>.</p>
//        </div>
//    </div>
//</div>
//<div class="col-6">
//    <div class="card border-dark mb-3" >
//        <div class="card-header">Answer C</div>
//        <div class="card-body text-dark">
//
//            <p class="card-text"id="answer3"><%// out.write(answer.get(2).getText());  %>.</p>
//        </div>
//    </div>
//</div>
//<div class="col-6">
//    <div class="card border-dark mb-3" >
//        <div class="card-header">Answer D</div>
//        <div class="card-body text-dark">
//
//            <p class="card-text"id="answer4"><% //out.write(answer.get(3).getText());  %>.</p>
//        </div>
//    </div>
//</div>
//<div class="col-6">
//    <div class="card border-dark mb-3" >
//        <div class="card-header">Answer E</div>
//        <div class="card-body text-dark">
//
//            <p class="card-text"id="answer5"><%// out.write(answer.get(4).getText());  %>.</p>
//        </div>
//    </div>
</div-->

<% 
    //  }
    //}
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