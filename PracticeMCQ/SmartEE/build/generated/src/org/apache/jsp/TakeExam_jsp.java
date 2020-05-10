package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import pojo.PracticeQuestion;
import servlets.Answered;
import org.hibernate.HibernateException;
import java.text.ParseException;
import java.io.IOException;
import moduls.Setting;
import java.text.SimpleDateFormat;
import java.util.Date;
import pojo.PracticeQuestionSet;
import pojo.AnswersHistory;
import pojo.User;
import java.util.List;
import pojo.QuestionSet;
import pojo.EnumSubject;
import moduls.Getting;
import moduls.NewClass;

public final class TakeExam_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Header.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\"\n");
      out.write("      xmlns:h=\"http://xmlns.jcp.org/jsf/html\" lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <title>PracticeMCQ</title>\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n");
      out.write("        <meta charset=\"UTF-8\"/>\n");
      out.write("\n");
      out.write("        <!-- Font -->\n");
      out.write("        <!-- Stylesheets -->      \n");
      out.write("        <link href=\"assets/fonts/ionicons.css\" rel=\"stylesheet\"/>\n");
      out.write("\n");
      out.write("        <!-- Stylesheets -->\n");
      out.write("        <link href=\"assets/plugin-frameworks/bootstrap.min.css\" rel=\"stylesheet\"/>\n");
      out.write("        <link href=\"assets/common/styles.css\" rel=\"stylesheet\"/>\n");
      out.write("        <style>\n");
      out.write("            .progress{\n");
      out.write("                background-color: #4e5256 !important;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body style=\"background-color:#F7F8FA; margin-top: 100px; margin-bottom:100px;\">\n");
      out.write("\n");
      out.write("        <!-- menu -->\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<header class=\"pb-0\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <a class=\"logo\" href=\"Index.jsp\"><img class=\"img-responsive\" src=\"assets/images/tt.png\" alt=\"ICT AL\"></a>\n");
      out.write("        <div class=\"right-area\">\n");
      out.write("            ");

                String val = "";
                if (request.getCookies() == null) {
                    response.sendRedirect("Login.jsp");
                } else {
                    Cookie c1[] = request.getCookies();
                    for (Cookie elem : c1) {
                        String name = elem.getName();
                        if (name.equals("id")) {
                            val = elem.getValue();
                        }
                    }
                }
                if (val.equals("")) {
            
      out.write("\n");
      out.write("            <a class='plr-20' href='Login.jsp'>&nbsp;  LOGIN  </a> |\n");
      out.write("            <a href='registration.jsp'>SIGN UP</a></li>\n");
      out.write("            ");
                }
            
      out.write("\n");
      out.write("        </div><!-- right-area -->\n");
      out.write("        <ul class=\"main-menu font-mountainsre float-right\" id=\"main-menu\">\n");
      out.write("            <!--<li><a href=Contactus.jsp\">Contact Us</a></li>-->\n");
      out.write("            <li><a href=\"Aboutus.jsp\">About Us</a> |</li>\n");
      out.write("            <!--<li><a href=\"\">How to use</a></li>-->\n");
      out.write("            <!--<li><a href=\"\">Take practice question</a></li>-->\n");
      out.write("        </ul>\n");
      out.write("        <div class=\"clearfix\"></div>\n");
      out.write("    </div><!-- container -->\n");
      out.write("</header>");
      out.write("\n");
      out.write("        <!-- end of menu -->\n");
      out.write("\n");
      out.write("        ");
          
            String qsid = (String) request.getParameter("qsi");
            int pqid = 0;
            System.out.println("id " + qsid);

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
          
        
      out.write("\n");
      out.write("\n");
      out.write("        <label  id=\"qsis\" style=\"visibility: hidden;\">");
out.write(qsid); 
      out.write("</label>\n");
      out.write("        <label  id=\"prqueset\" style=\"visibility: hidden;\">");
out.write(strpqid); 
      out.write(" </label>\n");
      out.write("\n");
      out.write("        ");

            } catch (Exception e) {
                e.printStackTrace();
            }
        
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <h2>TAKE PRACTICE EXAMINATION</h2>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-10 py-4\">\n");
      out.write("\n");
      out.write("                    <div class=\"progress\">\n");
      out.write("                        <div class=\"progress-bar bg-warning\" id=\"pro\" role=\"progressbar\" style=\"width:0%;\" aria-valuenow=\"2\" aria-valuemin=\"0\" aria-valuemax=\"100\">Question Completion:0</div>\n");
      out.write("                    </div>\n");
      out.write("                    <hr>\n");
      out.write("                        <p>\n");
      out.write("                            <button class=\"btn btn-primary\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">\n");
      out.write("                                Question Navigator <span class=\"badge badge-light\">50</span>\n");
      out.write("                            </button>\n");
      out.write("                        </p>\n");
      out.write("                        <div class=\"collapse\" id=\"collapseExample\">\n");
      out.write("                            <div class=\"card card-body col-12\">\n");
      out.write("                                <div class=\"btn-group\" role=\"group\" aria-label=\"Basic example\">\n");
      out.write("                                    ");

                                        for (int i = 1; i <= 25; i++) {

                                    
      out.write("\n");
      out.write("                                    <button type=\"button\" class=\"btn btn-secondary col-1\" onclick=\"selectque(");
 out.write(i + "");  
      out.write(")\">");
 out.write(i + "");  
      out.write("</button>\n");
      out.write("                                    ");
                                        }
                                    
      out.write("\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                                <hr>\n");
      out.write("                                    <div class=\"btn-group\" role=\"group\" aria-label=\"Basic example\">\n");
      out.write("                                        ");

                                            for (int i = 26; i <= 50; i++) {
                                        
      out.write("\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-secondary col-1\" onclick=\"selectque(");
 out.write(i + "");  
      out.write(")\">");
 out.write(i + "");  
      out.write("</button>\n");
      out.write("                                        ");
                                        }
                                        
      out.write("\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("             \n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\" id=\"question\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <footer class=\"fixed-bottom\">\n");
      out.write("\n");
      out.write("            <div class=\"container \">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-6 py-4\">\n");
      out.write("                        <div>\n");
      out.write("                            <p>\n");
      out.write("                                @ 2019 ICTA. All Rights Reserved<br>\n");
      out.write("                                    Visit ICTA main site\n");
      out.write("                            </p>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-6 py-4\">\n");
      out.write("                        <div class=\"float-md-right\">\n");
      out.write("                            <p>\n");
      out.write("                                No: 160/24, Kirimandala Mw, Col-5 Sri Lanka <br>\n");
      out.write("                                    Voice:  +94-11-2369099\n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>  \n");
      out.write("            </div><!-- container -->\n");
      out.write("        </footer>\n");
      out.write("\n");
      out.write("        <!-- SCRIPTS -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"assets/plugin-frameworks/popper.js'\"></script>\n");
      out.write("        <script src=\"assets/plugin-frameworks/jquery-3.2.1.min.js\"></script>\n");
      out.write("\n");
      out.write("        <script src=\"assets/plugin-frameworks/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"assets/plugin-frameworks/canvasjs.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- <script src=\"common/scripts.js\"></script> -->\n");
      out.write("        <script src=\"assets/common/scripts.js\"></script>\n");
      out.write("        <script>\n");
      out.write("\n");
      out.write("                                            var qe = 0;\n");
      out.write("                                            // var pro = document.getElementById(\"pro\");\n");
      out.write("\n");
      out.write("                                            //            pro.value = qe;\n");
      out.write("\n");
      out.write("                                            function loadernext() {\n");
      out.write("                                                var qeset = document.getElementById(\"qsis\").innerHTML;\n");
      out.write("                                                var xhttp = new XMLHttpRequest();\n");
      out.write("                                                xhttp.onreadystatechange = function() {\n");
      out.write("                                                    if (this.readyState === 4 && this.status === 200) {\n");
      out.write("                                                        document.getElementById(\"question\").innerHTML = xhttp.responseText;\n");
      out.write("                                                         checkAnswerButton();\n");
      out.write("                                                    }\n");
      out.write("                                                };\n");
      out.write("                                                xhttp.open(\"Post\", \"Aquestion.jsp\", true);\n");
      out.write("                                                xhttp.setRequestHeader(\"Content-type\", \"application/x-www-form-urlencoded\");\n");
      out.write("                                                xhttp.send(\"QeSet=\" + qeset + \"&Qe=\" + qe + \"&command=\" + 1);\n");
      out.write("                                            }\n");
      out.write("\n");
      out.write("                                            function checkAnswerButton() {\n");
      out.write("\n");
      out.write("                                                var markedanswer = document.getElementById(\"markedanswer\").innerHTML;\n");
      out.write("                                                                                            \n");
      out.write("                                                if (markedanswer.trim() == \"AnswerA\") {\n");
      out.write("                                                    $(\"#option1\").attr(\"checked\", \"checked\");\n");
      out.write("                                                    var eventHander = $(\"#option1\").closest(\"label\");\n");
      out.write("                                                    eventHander.addClass(\"active\");\n");
      out.write("                                                } else if (markedanswer.trim() == \"AnswerB\") {\n");
      out.write("                                                    $(\"#option2\").attr(\"checked\", \"checked\");\n");
      out.write("                                                    var eventHander = $(\"#option2\").closest(\"label\");\n");
      out.write("                                                    eventHander.addClass(\"active\");\n");
      out.write("                                                } else if (markedanswer.trim() == \"AnswerC\") {\n");
      out.write("                                                    $(\"#option3\").attr(\"checked\", \"checked\");\n");
      out.write("                                                    var eventHander = $(\"#option3\").closest(\"label\");\n");
      out.write("                                                    eventHander.addClass(\"active\");\n");
      out.write("                                                } else if (markedanswer.trim() == \"AnswerD\") {\n");
      out.write("                                                    $(\"#option4\").attr(\"checked\", \"checked\");\n");
      out.write("                                                    var eventHander = $(\"#option4\").closest(\"label\");\n");
      out.write("                                                    eventHander.addClass(\"active\");\n");
      out.write("                                                } else if (markedanswer.trim() == \"AnswerE\") {\n");
      out.write("                                                    $(\"#option5\").attr(\"checked\", \"checked\");\n");
      out.write("                                                    var eventHander = $(\"#option5\").closest(\"label\");\n");
      out.write("                                                    eventHander.addClass(\"active\");\n");
      out.write("                                                }else{\n");
      out.write("                                                   \n");
      out.write("                                                }\n");
      out.write("\n");
      out.write("                                            }\n");
      out.write("\n");
      out.write("                                            function loaderback() {\n");
      out.write("                                                var qeset = document.getElementById(\"qsis\").innerHTML;\n");
      out.write("                                                var xhttp = new XMLHttpRequest();\n");
      out.write("                                                xhttp.onreadystatechange = function() {\n");
      out.write("                                                    if (this.readyState === 4 && this.status === 200) {\n");
      out.write("                                                        document.getElementById(\"question\").innerHTML = xhttp.responseText;\n");
      out.write("                                                        checkAnswerButton();\n");
      out.write("                                                    }\n");
      out.write("                                                };\n");
      out.write("                                                xhttp.open(\"Post\", \"Aquestion.jsp\", true);\n");
      out.write("                                                xhttp.setRequestHeader(\"Content-type\", \"application/x-www-form-urlencoded\");\n");
      out.write("                                                xhttp.send(\"QeSet=\" + qeset + \"&Qe=\" + qe + \"&command=\" + 2);\n");
      out.write("                                            }\n");
      out.write("\n");
      out.write("                                            function next(q, ii) {\n");
      out.write("\n");
      out.write("                                                var prqueset = document.getElementById(\"prqueset\").innerHTML;\n");
      out.write("                                                var answerValue = $(\"input[name='options']:checked\").val();\n");
      out.write("                                             \n");
      out.write("                                                var xhttp = new XMLHttpRequest();\n");
      out.write("                                                xhttp.onreadystatechange = function() {\n");
      out.write("                                                    if (this.readyState === 4 && this.status === 200) {\n");
      out.write("                                                     \n");
      out.write("                                                    var result=xhttp.responseText;\n");
      out.write("                                                    var resultarr= result.split(\"_\");\n");
      out.write("                                                     console.log(result);\n");
      out.write("                                                     if(resultarr[0]==\"SUBMIT \"){\n");
      out.write("                                                     console.log(resultarr);\n");
      out.write("                                                     document.location = \"results.jsp?finalscore=\"+resultarr[1]+\"&userid=\"+resultarr[2];    \n");
      out.write("                                                        \n");
      out.write("                                                  }\n");
      out.write("                                                    }\n");
      out.write("                                                };\n");
      out.write("//                                             \n");
      out.write("                                               \n");
      out.write("                                                var nextorsubmit = document.getElementById(\"nextbtn\").innerHTML;\n");
      out.write("                                                xhttp.open(\"Post\", \"Answered\", true);\n");
      out.write("                                                xhttp.setRequestHeader(\"Content-type\", \"application/x-www-form-urlencoded\");\n");
      out.write("                                                xhttp.send(\"Que=\" + ii + \"&number=\" + q + \"&answer=\" + answerValue + \"&type=practice\" + \"&prqueset=\" + prqueset + \"&nextorsubmit=\" + nextorsubmit);\n");
      out.write("                                                if (qe < 50) {\n");
      out.write("                                                    if (qe === 49) {\n");
      out.write("\n");
      out.write("                                                    } else {\n");
      out.write("                                                        qe = ++q;\n");
      out.write("                                                        loadernext();\n");
      out.write("                                                    }\n");
      out.write("                                                }\n");
      out.write("\n");
      out.write("                                                ////                    pro.value = q;\n");
      out.write("                                                //                                                    pro.style = \"width:\" + (qe * 2) + \"%;\";\n");
      out.write("                                                //                                                    pro.innerHTML = \"question completion:\" + qe;\n");
      out.write("                                                //                                                    \n");
      out.write("                                            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                            function back(ii) {\n");
      out.write("                                                if (qe !== 0) {\n");
      out.write("\n");
      out.write("                                                    qe = --ii;\n");
      out.write("                                                 \n");
      out.write("                                                    loaderback();\n");
      out.write("                                                 \n");
      out.write("\n");
      out.write("//                                                      pro.style = \"width:\" + (qe * 2) + \"%;\";\n");
      out.write("//                                                    pro.innerHTML = \"question completion:\" + qe;\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                }\n");
      out.write("//                                                xhttp.open(\"Post\", \"BackAnswers\", true);\n");
      out.write("//                                                xhttp.setRequestHeader(\"Content-type\", \"application/x-www-form-urlencoded\");\n");
      out.write("//                                                xhttp.send(\"Que=\" + qe);\n");
      out.write("//\n");
      out.write("                                            }\n");
      out.write("                                            function selectque(ii) {\n");
      out.write("                                                qe = ii - 1;\n");
      out.write("                                                loader();\n");
      out.write("                                            }\n");
      out.write("                                            var clicked = 0;\n");
      out.write("                                            function selectanswer(ii, q) {\n");
      out.write("                                           \n");
      out.write("                                                if (clicked !== 0) {\n");
      out.write("                                                    clicked = 0;\n");
      out.write("                                                    document.getElementById(\"option\" + ii).click();\n");
      out.write("                                                    clicked = ii;\n");
      out.write("                                                }\n");
      out.write("                                                if (clicked === 0) {\n");
      out.write("                                                    clicked = ii;\n");
      out.write("                                                }\n");
      out.write("                                                document.getElementById(\"nextbtn\").disabled = \"\";\n");
      out.write("                                           \n");
      out.write("    }\n");
      out.write("                                            window.onload = loadernext();\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
