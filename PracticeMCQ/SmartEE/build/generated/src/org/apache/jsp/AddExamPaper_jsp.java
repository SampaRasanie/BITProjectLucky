package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import pojo.EnumSubject;
import java.util.List;
import moduls.Getting;
import moduls.NewClass;
import pojo.NewHibernateUtil;
import pojo.User;
import moduls.NewClass;

public final class AddExamPaper_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/headerdash.jsp");
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
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>PracticeMCQ</title>\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("\n");
      out.write("        <!-- Font -->\n");
      out.write("        <!-- Stylesheets -->      \n");
      out.write("        <link href=\"assets/fonts/ionicons.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Stylesheets -->\n");
      out.write("        <link href=\"assets/plugin-frameworks/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"assets/common/styles.css\" rel=\"stylesheet\">      \n");
      out.write("        <link href=\"assets/fontawesome/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"assets/common/sb-admin-2.css\" rel=\"stylesheet\">\n");
      out.write("        <style>\n");
      out.write("\n");
      out.write("\n");
      out.write("            /*           .question-set:nth-child(1){\n");
      out.write("                            background: red ;\n");
      out.write("                        }*/\n");
      out.write("            .question-set:nth-child(3),\n");
      out.write("            .question-set:nth-child(4),\n");
      out.write("            .question-set:nth-child(5),\n");
      out.write("            .question-set:nth-child(6){    \n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body id=\"page-top\">\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

      out.write("\n");
      out.write("\n");
      out.write("<!-- Page Wrapper -->\n");
      out.write("<div id=\"wrapper\">\n");
      out.write("    <!-- load left mnue -->\n");
      out.write("\n");
      out.write("    <!-- Sidebar -->\n");
      out.write("    <ul class=\"navbar-nav bg-gradient-primary sidebar sidebar-dark accordion\" id=\"accordionSidebar\">\n");
      out.write("\n");
      out.write("        <!-- Sidebar - Brand -->\n");
      out.write("        <a class=\"sidebar-brand d-flex align-items-center justify-content-center\" href=\"index.html\">\n");
      out.write("            <div class=\"sidebar-brand-icon\">\n");
      out.write("                <i class=\"fas fa-university\"></i>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"sidebar-brand-text mx-3\">PracticeMCQ</div>\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("        <!-- Divider -->\n");
      out.write("        <hr class=\"sidebar-divider my-0\">\n");
      out.write("\n");
      out.write("        <!-- Nav Item - Dashboard -->\n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("            <a class=\"nav-link\" href=\"dashboardstudent.jsp\">\n");
      out.write("                <i class=\"fas fa-fw fa-tachometer-alt\"></i>\n");
      out.write("                <span>Dashboard</span></a>\n");
      out.write("            <a class=\"nav-link\" href=\"Index.jsp\">\n");
      out.write("                <i class=\"fas fa-fw fa-university\"></i>\n");
      out.write("                <span>Home Page</span></a>\n");
      out.write("            <a class=\"nav-link\" href=\"studentHistory.jsp\">\n");
      out.write("                <i class=\"fas fa-fw fa-university\"></i>\n");
      out.write("                <span>Examination History</span></a>\n");
      out.write("        </li>\n");
      out.write("\n");
      out.write("        <!-- Divider -->\n");
      out.write("        <hr class=\"sidebar-divider\">\n");
      out.write("\n");
      out.write("        <!-- Heading -->\n");
      out.write("        <div class=\"sidebar-heading\">\n");
      out.write("            Activities\n");
      out.write("        </div>\n");
      out.write("        <!-- Nav Item - Manager Collapse Menu -->\n");
      out.write("\n");
      out.write("        <!-- Nav Item - Staff Collapse Menu -->\n");
      out.write("        ");

            if (admin) {
        
      out.write("\n");
      out.write("\n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("            <a class=\"nav-link collapsed\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseUtilities\" aria-expanded=\"true\" aria-controls=\"collapseUtilities0\">\n");
      out.write("                <i class=\"fas fa-fw fa-wrench\"></i>\n");
      out.write("                <span>User</span>\n");
      out.write("            </a>\n");
      out.write("            <div id=\"collapseUtilities\" class=\"collapse\" aria-labelledby=\"headingUtilities0\" data-parent=\"#accordionSidebar\">\n");
      out.write("                <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("                    <h6 class=\"collapse-header\">User :</h6>\n");
      out.write("                    <a class=\"collapse-item\" href=\"userForm.jsp\">Registration Form</a>\n");
      out.write("                    <a class=\"collapse-item\" href=\"registorlist.jsp\">Registered Users</a>\n");
      out.write("                    <a class=\"collapse-item\" href=\"userTypes.jsp\">User Types</a>\n");
      out.write("                  \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </li> ");

            }
        
      out.write("\n");
      out.write("    \n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("            <a class=\"nav-link collapsed\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseUtilities2\" aria-expanded=\"true\" aria-controls=\"collapseUtilities\">\n");
      out.write("                <i class=\"fas fa-fw fa-wrench\"></i>\n");
      out.write("                <span>Papers</span>\n");
      out.write("            </a>\n");
      out.write("            <div id=\"collapseUtilities2\" class=\"collapse\" aria-labelledby=\"headingUtilities\" data-parent=\"#accordionSidebar\">\n");
      out.write("                <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("                    <h6 class=\"collapse-header\">Papers :</h6>\n");
      out.write("                    ");

                        if (admin) {
                    
      out.write("\n");
      out.write("                    <a class=\"collapse-item\" href=\"Subject.jsp\">Subject</a>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("                    <a class=\"collapse-item\" href=\"manegePapers.jsp\">Manage Papers</a>\n");
      out.write("                    ");
      
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </li> \n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("            <a class=\"nav-link collapsed\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseUtilities3\" aria-expanded=\"true\" aria-controls=\"collapseUtilities\">\n");
      out.write("                <i class=\"fas fa-fw fa-wrench\"></i>\n");
      out.write("                <span>Question</span>\n");
      out.write("            </a>\n");
      out.write("            <div id=\"collapseUtilities3\" class=\"collapse\" aria-labelledby=\"headingUtilities\" data-parent=\"#accordionSidebar\">\n");
      out.write("                <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("                    <h6 class=\"collapse-header\">Question :</h6>\n");
      out.write("                    <a class=\"collapse-item\" href=\"AddExamPaper.jsp\">Add Examination Paper</a>\n");
      out.write("                    <a class=\"collapse-item\" href=\"ManegeQuestion.jsp\">Manage Question</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </li> \n");
      out.write("        ");

            if (admin) {
        
      out.write("\n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("            <a class=\"nav-link collapsed\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseUtilities4\" aria-expanded=\"true\" aria-controls=\"collapseUtilities\">\n");
      out.write("                <i class=\"fas fa-fw fa-wrench\"></i>\n");
      out.write("                <span>Security Question</span>\n");
      out.write("            </a>\n");
      out.write("            <div id=\"collapseUtilities4\" class=\"collapse\" aria-labelledby=\"headingUtilities\" data-parent=\"#accordionSidebar\">\n");
      out.write("                <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("                    <h6 class=\"collapse-header\">Add Security Question</h6>\n");
      out.write("                    <a class=\"collapse-item\" href=\"ManegeSecurity.jsp\">Manage Security Question</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </li> \n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("        <!-- Divider -->\n");
      out.write("        <hr class=\"sidebar-divider\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    </ul>\n");
      out.write("    <!-- End of Sidebar -->\n");
      out.write("\n");
      out.write("    <!-- Content Wrapper -->\n");
      out.write("    <div id=\"content-wrapper\" class=\"d-flex flex-column\">\n");
      out.write("\n");
      out.write("        <!-- Main Content -->\n");
      out.write("        <div id=\"content\">\n");
      out.write("\n");
      out.write("            <!-- staff top menu -->\n");
      out.write("\n");
      out.write("            <!-- Topbar -->\n");
      out.write("            <nav class=\"navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow\">\n");
      out.write("\n");
      out.write("                <!-- Sidebar Toggle (Topbar) -->\n");
      out.write("                <button id=\"sidebarToggleTop\" class=\"btn btn-link d-md-none rounded-circle mr-3\">\n");
      out.write("                    <i class=\"fa fa-bars\"></i>\n");
      out.write("                </button>\n");
      out.write("        \n");
      out.write("                <ul class=\"navbar-nav ml-auto\">\n");
      out.write("\n");
      out.write("                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->\n");
      out.write("                    <li class=\"nav-item dropdown no-arrow d-sm-none\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"searchDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            <i class=\"fas fa-search fa-fw\"></i>\n");
      out.write("                        </a>\n");
      out.write("                        <!-- Dropdown - Messages -->\n");
      out.write("                        <div class=\"dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in\" aria-labelledby=\"searchDropdown\">\n");
      out.write("                            <form class=\"form-inline mr-auto w-100 navbar-search\">\n");
      out.write("                                <div class=\"input-group\">\n");
      out.write("                                    <input type=\"text\" class=\"form-control bg-light border-0 small\" placeholder=\"Search for...\" aria-label=\"Search\" aria-describedby=\"basic-addon2\">\n");
      out.write("                                    <div class=\"input-group-append\">\n");
      out.write("                                        <button class=\"btn btn-primary\" type=\"button\">\n");
      out.write("                                            <i class=\"fas fa-search fa-sm\"></i>\n");
      out.write("                                        </button>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <div class=\"topbar-divider d-none d-sm-block\"></div>\n");
      out.write("\n");
      out.write("                    <!-- Nav Item - User Information -->\n");
      out.write("                    <li class=\"nav-item dropdown no-arrow\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"userDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            <span class=\"mr-2 d-none d-lg-inline text-gray-600 small\">");
                                out.write(name1); 
                                
      out.write("</span>\n");
      out.write("                            <img class=\"img-profile rounded-circle\" src=\"assets/images/staff-profile.png\">\n");
      out.write("                        </a>\n");
      out.write("                        <!-- Dropdown - User Information -->\n");
      out.write("                        <div class=\"dropdown-menu dropdown-menu-right shadow animated--grow-in\" aria-labelledby=\"userDropdown\">\n");
      out.write("\n");
      out.write("                            <a class=\"dropdown-item\" href=\"logout\">\n");
      out.write("                                <i class=\"fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                                Logout\n");
      out.write("                            </a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                </ul>\n");
      out.write("\n");
      out.write("            </nav>\n");
      out.write("            <!-- End of Topbar -->\n");
      out.write("\n");
      out.write("            ");

                }
            
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("        <!-- end of menu -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <section style=\"margin-top: 50px;\" id=\"tabs\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-12 \">\n");
      out.write("                        <nav>\n");
      out.write("                            <div class=\"nav nav-tabs nav-fill\" id=\"nav-tab\" role=\"tablist\">\n");
      out.write("                                <a class=\"nav-item nav-link active\" id=\"nav-home-tab\" data-toggle=\"tab\" href=\"#nav-home\" role=\"tab\" aria-controls=\"nav-home\" aria-selected=\"false\">සීංහල</a>\n");
      out.write("                                <a class=\"nav-item nav-link\" id=\"nav-profile-tab\" data-toggle=\"tab\" href=\"#nav-profile\" role=\"tab\" aria-controls=\"nav-profile\" aria-selected=\"true\">English</a>\n");
      out.write("                                <!--<a class=\"nav-item nav-link\" id=\"nav-about-tab\" data-toggle=\"tab\" href=\"#nav-about\" role=\"tab\" aria-controls=\"nav-about\" aria-selected=\"false\">සීංහල</a>-->\n");
      out.write("                            </div>\n");
      out.write("                        </nav>\n");
      out.write("<!--                        <div class=\"tab-content py-3 px-3 px-sm-0\" id=\"nav-tabContent\">\n");
      out.write("                            <div class=\"tab-pane fade show active\" id=\"nav-home\" role=\"tabpanel\" aria-labelledby=\"nav-home-tab\">\n");
      out.write("                                <form method=\"POST\" action=\"Addpaper_en\" enctype=\"multipart/form-data\">\n");
      out.write("                                    <div class=\"container\">\n");
      out.write("                                        <div class=\"col-12 py-2 center-text\">\n");
      out.write("                                            <label for=\"titele-sin\">මාතෘකාව</label>\n");
      out.write("                                            <input type=\"text\" name=\"titele-sin\" class=\"form-control text-center\" id=\"titele-sin\" placeholder=\"මාතෘකාව\"  required>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-12 py-2 center-text\">\n");
      out.write("                                            <label for=\"subject-sin\">වීශය</label>\n");
      out.write("                                            <select name=\"subject-sin\" class=\"form-control\" id=\"subject-sin\" >\n");
      out.write("                                                ");
                                                    List<EnumSubject> li = new Getting().getallsubject();
                                                    for (EnumSubject l : li) {
                                                        out.write("<option value=" + l.getSubject() + ">" + l.getSubject() + "</option>");
                                                    }
                                                
      out.write("\n");
      out.write("\n");
      out.write("                                            </select>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"row col-12 py-2\" >\n");
      out.write("                                            <label for=\"subject-sin center-text\">ප්‍රශ්න සියල්ල ඇතුලත් කරන්න </label>\n");
      out.write("                                            ");

                                                for (int i = 1; i <= 50; i++) {
                                            
      out.write("\n");
      out.write("                                            ");

                                                if (i == 1 || i == 11 || i == 21 || i == 31 || i == 41) {

                                            
      out.write("\n");
      out.write("                                            <div class=\"question-set row\">\n");
      out.write("                                                ");
                                                   }
                                                
      out.write(" \n");
      out.write("                                                <div class=\"col-12\">\n");
      out.write("                                                    <div class=\"card mb-3\" >\n");
      out.write("                                                        <div class=\"row no-gutters\">\n");
      out.write("                                                             remove this div if there are no image to show \n");
      out.write("                                                            <div class=\"col-md-4\">\n");
      out.write("\n");
      out.write("                                                                <center> \n");
      out.write("                                                                    <img src=\"https://via.placeholder.com/300x150\" class=\"card-img\" alt=\"...\" id=\"sin_img_");
 out.write("" + i); 
      out.write("\">\n");
      out.write("                                                                    <br/>\n");
      out.write("                                                                    <br>\n");
      out.write("                                                                    <input type=\"file\" accept=\"image/jpeg\" class=\"btn btn-outline-primary px-10\" oninput =\"simages(this,");
 out.write("" + i); 
      out.write(")\" name=\"sin_file_");
 out.write("" + i); 
      out.write("\" id=\"sin_file_");
 out.write("" + i); 
      out.write("\" required />\n");
      out.write("                                                                </center>\n");
      out.write("                                                            </div>\n");
      out.write("                                                            <div class=\"col-md-8\">\n");
      out.write("                                                                <div class=\"card-body\">\n");
      out.write("                                                                    <h5 class=\"card-title\">ප්‍රශන අංකය : ");
 out.write("" + i); 
      out.write("</h5>\n");
      out.write("                                                                    <input class=\"form-control\"  type=\"text\" required placeholder=\"ප්‍රශ්නය\" id=\"sin_que_");
 out.write("" + i); 
      out.write("\" name=\"sin_que_");
 out.write("" + i); 
      out.write("\"/>\n");
      out.write("                                                                    <p>ඔබෙ පිලිතූර තොරන්න:</p>\n");
      out.write("                                                                    <div class=\"btn-group btn-group-toggle\" data-toggle=\"buttons\">\n");
      out.write("                                                                        <label class=\"btn btn-warning\"  id=\"sin_");
 out.write("" + i); 
      out.write("optionls1\">\n");
      out.write("                                                                            <input type=\"radio\" value=\"1\" name=\"sin_");
 out.write("" + i); 
      out.write("options\" id=\"sin_");
 out.write("" + i); 
      out.write("option1\" autocomplete=\"off\"> පිලිතුර A\n");
      out.write("                                                                        </label>\n");
      out.write("                                                                        <label class=\"btn btn-warning\"id=\"sin_");
 out.write("" + i); 
      out.write("optionls2\">\n");
      out.write("                                                                            <input type=\"radio\" value=\"2\" name=\"sin_");
 out.write("" + i); 
      out.write("options\" id=\"sin_");
 out.write("" + i); 
      out.write("option2\" autocomplete=\"off\"> පිලිතුර B\n");
      out.write("                                                                        </label>\n");
      out.write("                                                                        <label class=\"btn btn-warning\"id=\"sin_");
 out.write("" + i); 
      out.write("optionls3\">\n");
      out.write("                                                                            <input type=\"radio\" value=\"3\"  name=\"sin_");
 out.write("" + i); 
      out.write("options\" id=\"sin_");
 out.write("" + i); 
      out.write("option3\" autocomplete=\"off\"> පිලිතුර C\n");
      out.write("                                                                        </label>\n");
      out.write("                                                                        <label class=\"btn btn-warning\"id=\"sin_");
 out.write("" + i); 
      out.write("optionls4\">\n");
      out.write("                                                                            <input type=\"radio\" value=\"4\" name=\"sin_");
 out.write("" + i); 
      out.write("options\" id=\"sin_");
 out.write("" + i); 
      out.write("option4\" autocomplete=\"off\"> පිලිතුර D\n");
      out.write("                                                                        </label>\n");
      out.write("                                                                        <label class=\"btn btn-warning\"id=\"sin_");
 out.write("" + i); 
      out.write("optionls5\">\n");
      out.write("                                                                            <input type=\"radio\" value=\"5\" name=\"sin_");
 out.write("" + i); 
      out.write("options\" id=\"sin_");
 out.write("" + i); 
      out.write("option5\" autocomplete=\"off\"> පිලිතුර E\n");
      out.write("                                                                        </label>\n");
      out.write("                                                                    </div>\n");
      out.write("                                                                 \n");
      out.write("                                                                </div>\n");
      out.write("                                                            </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-6\">\n");
      out.write("                                                    <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                        <div class=\"card-header\">පිලිතුර A</div>\n");
      out.write("                                                        <div class=\"card-body text-dark\">\n");
      out.write("                                                            <input type=\"text\" class=\"form-control\" placeholder=\"පිලිතුර A\" id=\"sin_");
 out.write("" + i); 
      out.write("_A\" name=\"sin_");
 out.write("" + i); 
      out.write("_A\"/>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-6\">\n");
      out.write("                                                    <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                        <div class=\"card-header\">පිලිතුර B</div>\n");
      out.write("                                                        <div class=\"card-body text-dark\">\n");
      out.write("\n");
      out.write("                                                            <input type=\"text\" class=\"form-control\" placeholder=\"පිලිතුර B\" id=\"sin_");
 out.write("" + i); 
      out.write("_B\" name=\"sin_");
 out.write("" + i); 
      out.write("_B\"/>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-6\">\n");
      out.write("                                                    <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                        <div class=\"card-header\">පිලිතුර C</div>\n");
      out.write("                                                        <div class=\"card-body text-dark\">\n");
      out.write("\n");
      out.write("                                                            <input type=\"text\" class=\"form-control\" placeholder=\"පිලිතුර C\" id=\"sin_");
 out.write("" + i); 
      out.write("_C\" name=\"sin_");
 out.write("" + i); 
      out.write("_C\"/>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-6\">\n");
      out.write("                                                    <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                        <div class=\"card-header\">පිලිතුර D</div>\n");
      out.write("                                                        <div class=\"card-body text-dark\">\n");
      out.write("\n");
      out.write("                                                            <input type=\"text\" class=\"form-control\" placeholder=\"පිලිතුර D\" id=\"sin_");
 out.write("" + i); 
      out.write("_D\" name=\"sin_");
 out.write("" + i); 
      out.write("_D\"/>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-6\">\n");
      out.write("                                                    <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                        <div class=\"card-header\">පිලිතුර E</div>\n");
      out.write("                                                        <div class=\"card-body text-dark\">\n");
      out.write("\n");
      out.write("                                                            <input type=\"text\" class=\"form-control\" placeholder=\"පිලිතුර E\" id=\"sin_");
 out.write("" + i); 
      out.write("_E\" name=\"sin_");
 out.write("" + i); 
      out.write("_E\"/>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                ");

                                                    if (i == 10 || i == 20 || i == 30 || i == 40) {
                                                
      out.write("  \n");
      out.write("                                                <div class=\"col-12\">\n");
      out.write("\n");
      out.write("                                                    <lable class=\"btn btn-outline-primary px-10\" onclick=\"showPrevSet(");
 out.write("" + i); 
      out.write(")\">Show Previous Paper Set</lable>\n");
      out.write("                                                    <lable class=\"btn btn-outline-primary px-10\" onclick=\"showNextSet(");
 out.write("" + i); 
      out.write(")\">Show Next Paper Set</lable>\n");
      out.write("\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");

                                            } else if (i == 50) {
                                            
      out.write("\n");
      out.write("                                            <div class=\"col-12\">\n");
      out.write("                                                <lable class=\"btn btn-outline-primary px-10\" onclick=\"showPrevSet(");
 out.write("" + i); 
      out.write(")\">Show Previous Paper Set</lable>\n");
      out.write("                                                <input type=\"button\" name=\"submit\" id=\"sub-en\" onclick=\"checkallen()\" class=\"btn btn-outline-primary px-10\" value=\"Add Paper\"/>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        ");

                                                }
                                            }
                                        
      out.write("\n");
      out.write("                                        <div class=\"col-12 py-2 center-text\">\n");
      out.write("                                   \n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                                        -->\n");
      out.write("                                        \n");
      out.write("                                        \n");
      out.write("                        <div class=\"tab-pane fade\" id=\"nav-profile\" role=\"tabpanel\" aria-labelledby=\"nav-profile-tab\">\n");
      out.write("                            <form method=\"POST\" action=\"Addpaper_en\" enctype=\"multipart/form-data\">\n");
      out.write("                                <div class=\"container\">\n");
      out.write("                                    <div class=\"col-12 py-2 center-text\">\n");
      out.write("                                        <label for=\"titele-en\">Title</label>\n");
      out.write("                                        <input type=\"text\" name=\"titele-en\" class=\"form-control text-center\" id=\"titele-en\" placeholder=\"Title\"  required>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-12 py-2 center-text\">\n");
      out.write("                                        <label for=\"subject-en\">Subject</label>\n");
      out.write("                                        <select name=\"subject-en\" class=\"form-control\" id=\"subject-en\" >\n");
      out.write("                                            ");

                                                for (EnumSubject l : li) {
                                                    out.write("<option value=" + l.getSubject() + ">" + l.getSubject() + "</option>");
                                                }
                                            
      out.write("\n");
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row col-12 py-2\" >\n");
      out.write("                                        <div class=\"col-12\">\n");
      out.write("                                            <label for=\"subject-sin center-text\" id=\"fill-all\">Fill All Questions </label>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        ");

                                                //
                                            for (int i = 1; i <= 50; i++) {
                                        
      out.write("\n");
      out.write("\n");
      out.write("                                        ");

                                            if (i == 1 || i == 11 || i == 21 || i == 31 || i == 41) {

                                        
      out.write("\n");
      out.write("                                        <div class=\"question-set row\">\n");
      out.write("                                            ");
                                                   }
                                            
      out.write(" \n");
      out.write("                                            <div class=\"col-12\">\n");
      out.write("                                                <div class=\"card mb-3\" >\n");
      out.write("                                                    <div class=\"row no-gutters\">\n");
      out.write("                                                        <!-- remove this div if there are no image to show -->\n");
      out.write("                                                        <div class=\"col-md-4\">\n");
      out.write("\n");
      out.write("                                                            <center> \n");
      out.write("                                                                <img src=\"https://via.placeholder.com/300x150\" class=\"card-img\" alt=\"...\" id=\"en_img_");
 out.write("" + i); 
      out.write("\">\n");
      out.write("                                                                <br/>\n");
      out.write("                                                                <br>\n");
      out.write("                                                                <input type=\"file\" accept=\"image/jpeg\" class=\"btn btn-outline-primary px-10\" oninput =\"simagesen(this,");
 out.write("" + i); 
      out.write(")\" name=\"en_file_");
 out.write("" + i); 
      out.write("\" id=\"en_file_");
 out.write("" + i); 
      out.write("\"  />\n");
      out.write("                                                            </center>\n");
      out.write("                                                        </div>\n");
      out.write("                                                        <div class=\"col-md-8\">\n");
      out.write("                                                            <div class=\"card-body\">\n");
      out.write("                                                                <h5 class=\"card-title\">Question No : ");
 out.write("" + i); 
      out.write("</h5>\n");
      out.write("                                                                <input class=\"form-control\" value=\"question\"  type=\"text\" required placeholder=\"Question\" id=\"en_que_");
 out.write("" + i); 
      out.write("\" name=\"en_que_");
 out.write("" + i); 
      out.write("\"/>\n");
      out.write("                                                                <p>Select the Correct Answer :</p>\n");
      out.write("                                                                <div class=\"btn-group btn-group-toggle\" data-toggle=\"buttons\">\n");
      out.write("\n");
      out.write("                                                                    <label class=\"btn btn-warning\"  id=\"en_");
 out.write("" + i); 
      out.write("optionls1\">\n");
      out.write("                                                                        <input type=\"radio\" value=\"1\" checked=\"checked\" name=\"en_");
 out.write("" + i); 
      out.write("options\" id=\"en_");
 out.write("" + i); 
      out.write("option1\" autocomplete=\"off\"> Answer A\n");
      out.write("                                                                    </label>\n");
      out.write("                                                                    <label class=\"btn btn-warning\"id=\"en_");
 out.write("" + i); 
      out.write("optionls2\">\n");
      out.write("                                                                        <input type=\"radio\" value=\"2\" name=\"en_");
 out.write("" + i); 
      out.write("options\" id=\"en_");
 out.write("" + i); 
      out.write("option2\" autocomplete=\"off\" checked=\"true\"> Answer B\n");
      out.write("                                                                    </label>\n");
      out.write("                                                                    <label class=\"btn btn-warning\"id=\"en_");
 out.write("" + i); 
      out.write("optionls3\">\n");
      out.write("                                                                        <input type=\"radio\" value=\"3\"  name=\"en_");
 out.write("" + i); 
      out.write("options\" id=\"en_");
 out.write("" + i); 
      out.write("option3\" autocomplete=\"off\"> Answer C\n");
      out.write("                                                                    </label>\n");
      out.write("                                                                    <label class=\"btn btn-warning\"id=\"en_");
 out.write("" + i); 
      out.write("optionls4\">\n");
      out.write("                                                                        <input type=\"radio\" value=\"4\" name=\"en_");
 out.write("" + i); 
      out.write("options\" id=\"en_");
 out.write("" + i); 
      out.write("option4\" autocomplete=\"off\"> Answer D\n");
      out.write("                                                                    </label>\n");
      out.write("                                                                    <label class=\"btn btn-warning\"id=\"en_");
 out.write("" + i); 
      out.write("optionls5\">\n");
      out.write("                                                                        <input type=\"radio\" value=\"5\" name=\"en_");
 out.write("" + i); 
      out.write("options\" id=\"en_");
 out.write("" + i); 
      out.write("option5\" autocomplete=\"off\"> Answer E\n");
      out.write("                                                                    </label>\n");
      out.write("\n");
      out.write("                                                                </div>\n");
      out.write("                                                                <div class=\"col-6\">\n");
      out.write("                                                                    <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                                        <div class=\"card-body text-dark\">\n");
      out.write("                                                                            <input type=\"text\" id=\"en_");
 out.write("" + i); 
      out.write("_ansdesc\" name=\"en_");
 out.write("" + i); 
      out.write("_ansdesc\" value=\"Correct Answer Description\" class=\"form-control\" required=\"\">\n");
      out.write("                                                                        \n");
      out.write("                                                                        </div></div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                            </div>\n");
      out.write("\n");
      out.write("                                                        </div>\n");
      out.write("\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                    <div class=\"card-header\">Answer A</div>\n");
      out.write("                                                    <div class=\"card-body text-dark\">\n");
      out.write("                                                        <input type=\"text\" class=\"form-control\" value=\"Answer A\" va id=\"en_");
 out.write("" + i); 
      out.write("_A\" name=\"en_");
 out.write("" + i); 
      out.write("_A\"/>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                    <div class=\"card-header\">Answer B</div>\n");
      out.write("                                                    <div class=\"card-body text-dark\">\n");
      out.write("\n");
      out.write("                                                        <input type=\"text\" class=\"form-control\" value=\"Answer B\" id=\"en_");
 out.write("" + i); 
      out.write("_B\" name=\"en_");
 out.write("" + i); 
      out.write("_B\"/>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                    <div class=\"card-header\">Answer C</div>\n");
      out.write("                                                    <div class=\"card-body text-dark\">\n");
      out.write("\n");
      out.write("                                                        <input type=\"text\" class=\"form-control\" value=\"Answer C\"  id=\"en_");
 out.write("" + i); 
      out.write("_C\" name=\"en_");
 out.write("" + i); 
      out.write("_C\"/>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                    <div class=\"card-header\">Answer D</div>\n");
      out.write("                                                    <div class=\"card-body text-dark\">\n");
      out.write("\n");
      out.write("                                                        <input type=\"text\" class=\"form-control\" value=\"Answer D\"  id=\"en_");
 out.write("" + i); 
      out.write("_D\" name=\"en_");
 out.write("" + i); 
      out.write("_D\"/>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card border-dark mb-3\" >\n");
      out.write("                                                    <div class=\"card-header\">Answer E</div>\n");
      out.write("                                                    <div class=\"card-body text-dark\">\n");
      out.write("\n");
      out.write("                                                        <input type=\"text\" class=\"form-control\" value=\"Answer E\" id=\"en_");
 out.write("" + i); 
      out.write("_E\" name=\"en_");
 out.write("" + i); 
      out.write("_E\"/>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");

                                                if (i == 10 || i == 20 || i == 30 || i == 40) {
                                            
      out.write("  \n");
      out.write("                                            <div class=\"col-12\">\n");
      out.write("\n");
      out.write("                                                <lable class=\"btn btn-outline-primary px-10\" onclick=\"showPrevSet(");
 out.write("" + i); 
      out.write(")\">Show Previous Paper Set</lable>\n");
      out.write("                                                <lable class=\"btn btn-outline-primary px-10\" onclick=\"showNextSet(");
 out.write("" + i); 
      out.write(")\">Show Next Paper Set</lable>\n");
      out.write("\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        ");

                                        } else if (i == 50) {
                                        
      out.write("\n");
      out.write("                                        <div class=\"col-12\">\n");
      out.write("                                            <lable class=\"btn btn-outline-primary px-10\" onclick=\"showPrevSet(");
 out.write("" + i); 
      out.write(")\">Show Previous Paper Set</lable>\n");
      out.write("                                            <input type=\"submit\" name=\"submit\" id=\"sub-en\"  class=\"btn btn-outline-primary px-10\" value=\"Add Paper\"/>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");

                                            }
                                        }
                                    
      out.write("\n");
      out.write("                                    <div class=\"col-12 py-2 center-text\">\n");
      out.write("                                     \n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                \n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("\n");
      out.write("<footer class=\"sticky-footer bg-white\">\n");
      out.write("    <div class=\"container my-auto\">\n");
      out.write("        <div class=\"copyright text-center my-auto\">\n");
      out.write("            <span>Copyright &copy; Examination Emulator</span>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</footer>\n");
      out.write("<!-- End of Footer -->\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("<!-- End of Content Wrapper -->\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("<!-- End of Page Wrapper -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- staff script -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Logout Modal-->\n");
      out.write("<div class=\"modal fade\" id=\"logoutModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("    <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("        <div class=\"modal-content\">\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("                <h5 class=\"modal-title\" id=\"exampleModalLabel\">Ready to Leave?</h5>\n");
      out.write("                <button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                    <span aria-hidden=\"true\">Ã</span>\n");
      out.write("                </button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\">Select \"Logout\" below if you are ready to end your current session.</div>\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("                <button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                <a class=\"btn btn-primary\" href=\"login.html\">Logout</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!-- SCRIPTS -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- SCRIPTS -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script src=\"assets/plugin-frameworks/popper.js'\"></script>\n");
      out.write("<script src=\"assets/plugin-frameworks/jquery-3.2.1.min.js\"></script>\n");
      out.write("\n");
      out.write("<script src=\"assets/plugin-frameworks/bootstrap.min.js\"></script>\n");
      out.write("<script src=\"assets/plugin-frameworks/canvasjs.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- <script src=\"common/scripts.js\"></script> -->\n");
      out.write("<script src=\"assets/common/scripts.js\"></script>\n");
      out.write("<script>\n");
      out.write("                                                function checkall() {\n");
      out.write("                                                    var flag = true;\n");
      out.write("\n");
      out.write("                                                    for (var i = 1; i <= max; i++) {\n");
      out.write("                                                        var q = true;\n");
      out.write("                                                        var q1 = true;\n");
      out.write("                                                        var q2 = false;\n");
      out.write("                                                        var q3 = true;\n");
      out.write("\n");
      out.write("                                                        var c = document.getElementById(\"sin_que_\" + i).value;\n");
      out.write("                                                        if (c === null || c === \"\") {\n");
      out.write("                                                            q = false;\n");
      out.write("                                                            document.getElementById(\"sin_que_\" + i).className = \"form-control border-danger\"\n");
      out.write("                                                        }\n");
      out.write("                                                        var c1a = document.getElementById(\"sin_\" + i + \"_A\").value;\n");
      out.write("                                                        var c1b = document.getElementById(\"sin_\" + i + \"_B\").value;\n");
      out.write("                                                        var c1c = document.getElementById(\"sin_\" + i + \"_C\").value;\n");
      out.write("                                                        var c1d = document.getElementById(\"sin_\" + i + \"_D\").value;\n");
      out.write("                                                        var c1e = document.getElementById(\"sin_\" + i + \"_E\").value;\n");
      out.write("                                                        document.getElementById(\"sin_\" + i + \"_A\").className = \"form-control\";\n");
      out.write("                                                        document.getElementById(\"sin_\" + i + \"_B\").className = \"form-control\";\n");
      out.write("                                                        document.getElementById(\"sin_\" + i + \"_C\").className = \"form-control\";\n");
      out.write("                                                        document.getElementById(\"sin_\" + i + \"_D\").className = \"form-control\";\n");
      out.write("                                                        document.getElementById(\"sin_\" + i + \"_E\").className = \"form-control\";\n");
      out.write("                                                        if ((c1a === null || c1a === \"\") || (c1b === null || c1b === \"\") || (c1c === null || c1c === \"\") || (c1d === null || c1d === \"\") || (c1e === null || c1e === \"\")) {\n");
      out.write("                                                            q1 = false;\n");
      out.write("                                                            if (c1a === null || c1a === \"\") {\n");
      out.write("                                                                document.getElementById(\"sin_\" + i + \"_A\").className = \"form-control border-danger\";\n");
      out.write("                                                            }\n");
      out.write("                                                            if (c1b === null || c1b === \"\") {\n");
      out.write("                                                                document.getElementById(\"sin_\" + i + \"_B\").className = \"form-control border-danger\";\n");
      out.write("                                                            }\n");
      out.write("                                                            if (c1c === null || c1c === \"\") {\n");
      out.write("                                                                document.getElementById(\"sin_\" + i + \"_C\").className = \"form-control border-danger\";\n");
      out.write("                                                            }\n");
      out.write("                                                            if (c1d === null || c1d === \"\") {\n");
      out.write("                                                                document.getElementById(\"sin_\" + i + \"_D\").className = \"form-control border-danger\";\n");
      out.write("                                                            }\n");
      out.write("                                                            if (c1e === null || c1e === \"\") {\n");
      out.write("                                                                document.getElementById(\"sin_\" + i + \"_E\").className = \"form-control border-danger\";\n");
      out.write("                                                            }\n");
      out.write("                                                        }\n");
      out.write("\n");
      out.write("                                                        for (var ii = 1; ii <= 5; ii++) {                                                         \n");
      out.write("                                                            document.getElementById(\"sin_\" + i + \"optionls\" + ii).className = \"btn btn-warning\";\n");
      out.write("                                                            var c1 = document.getElementById(\"sin_\" + i + \"option\" + ii).checked;\n");
      out.write("                                                            if (c1) {\n");
      out.write("                                                                q2 = true;                                                         \n");
      out.write("                                                            }\n");
      out.write("\n");
      out.write("                                                        }\n");
      out.write("\n");
      out.write("                                                        if (!q2) {\n");
      out.write("                                                            for (var ii = 1; ii <= 5; ii++) {\n");
      out.write("                                                                document.getElementById(\"sin_\" + i + \"optionls\" + ii).className = \"btn btn-danger\";\n");
      out.write("                                                            }\n");
      out.write("                                                        }\n");
      out.write("                                                        if (document.getElementById(\"sin_img_\" + i).src === \"https://via.placeholder.com/300x150\") {\n");
      out.write("                                                            document.getElementById(\"sin_file_\" + i).className = \"btn btn-outline-danger px-10\";\n");
      out.write("                                                            q3 = false;\n");
      out.write("                                                        } else {\n");
      out.write("                                                            document.getElementById(\"sin_file_\" + i).className = \"btn btn-outline-primary px-10\";\n");
      out.write("                                                        }\n");
      out.write("\n");
      out.write("                                                        if (q && q1 && q2 && q3) {\n");
      out.write("\n");
      out.write("                                                            flag = true;\n");
      out.write("                                                        } else {\n");
      out.write("                                                            flag = false;\n");
      out.write("\n");
      out.write("                                                        }\n");
      out.write("                                                    }\n");
      out.write("                                                    if (flag) {\n");
      out.write("                                                        document.getElementById(\"sub\").type = \"submit\";\n");
      out.write("                                                        document.getElementById(\"sub\").click();\n");
      out.write("                                                    }\n");
      out.write("\n");
      out.write("                                                }\n");
      out.write("\n");
      out.write("                                                var max = 50;\n");
      out.write("                                                function checkallen() {\n");
      out.write("                                                    var flaga = true;\n");
      out.write("\n");
      out.write("//                                                    \n");
      out.write("                                                    if (flaga) {\n");
      out.write("                                                        document.getElementById(\"sub-en\").type = \"submit\";\n");
      out.write("                                                        document.getElementById(\"sub-en\").click();\n");
      out.write("                                                    }\n");
      out.write("\n");
      out.write("                                                }\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("    function simages(input, id) {\n");
      out.write("        if (input.files && input.files[0]) {\n");
      out.write("            var reader = new FileReader();\n");
      out.write("            reader.onload = function(e) {\n");
      out.write("                document.getElementById(\"sin_img_\" + id).src = e.target.result;\n");
      out.write("            };\n");
      out.write("            reader.readAsDataURL(input.files[0]);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    }\n");
      out.write("    function simagesen(input, id) {\n");
      out.write("        if (input.files && input.files[0]) {\n");
      out.write("            var reader = new FileReader();\n");
      out.write("            reader.onload = function(e) {\n");
      out.write("                document.getElementById(\"en_img_\" + id).src = e.target.result;\n");
      out.write("            };\n");
      out.write("            reader.readAsDataURL(input.files[0]);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    function showNextSet(number) {\n");
      out.write("        console.log(number);\n");
      out.write("        if (number == 10) {\n");
      out.write("            $('.question-set:nth-child(2),.question-set:nth-child(4),.question-set:nth-child(5),.question-set:nth-child(6)').css({\"display\": \"none\"});\n");
      out.write("            $('.question-set:nth-child(3)').css({\"display\": \"inherit\"});\n");
      out.write("            $('#en_que_11').focus();\n");
      out.write("            $('#sin_que_11').focus();\n");
      out.write("        }\n");
      out.write("        if (number == 20) {\n");
      out.write("            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(5),.question-set:nth-child(6)').css({\"display\": \"none\"});\n");
      out.write("            $('.question-set:nth-child(4)').css({\"display\": \"inherit\"});\n");
      out.write("            $('#en_que_21').focus();\n");
      out.write("            $('#sin_que_21').focus();\n");
      out.write("        }\n");
      out.write("        if (number == 30) {\n");
      out.write("            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(4),.question-set:nth-child(6)').css({\"display\": \"none\"});\n");
      out.write("            $('.question-set:nth-child(5)').css({\"display\": \"inherit\"});\n");
      out.write("            $('#en_que_31').focus();\n");
      out.write("            $('#sin_que_31').focus();\n");
      out.write("        }\n");
      out.write("        if (number == 40) {\n");
      out.write("            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(4),.question-set:nth-child(5)').css({\"display\": \"none\"});\n");
      out.write("            $('.question-set:nth-child(6)').css({\"display\": \"inherit\"});\n");
      out.write("            $('#en_que_41').focus();\n");
      out.write("            $('#sin_que_41').focus();\n");
      out.write("        }\n");
      out.write("\n");
      out.write("\n");
      out.write("    }\n");
      out.write("    function showPrevSet(number) {\n");
      out.write("        console.log(number);\n");
      out.write("        if (number == 20) {\n");
      out.write("            $('.question-set:nth-child(3),.question-set:nth-child(4),.question-set:nth-child(5),.question-set:nth-child(6)').css({\"display\": \"none\"});\n");
      out.write("            $('.question-set:nth-child(2)').css({\"display\": \"inherit\"});\n");
      out.write("            $('#en_que_1').focus();\n");
      out.write("            $('#sin_que_1').focus();\n");
      out.write("        }\n");
      out.write("        if (number == 30) {\n");
      out.write("            $('.question-set:nth-child(2),.question-set:nth-child(4),.question-set:nth-child(5),.question-set:nth-child(6)').css({\"display\": \"none\"});\n");
      out.write("            $('.question-set:nth-child(3)').css({\"display\": \"inherit\"});\n");
      out.write("            $('#en_que_11').focus();\n");
      out.write("            $('#sin_que_11').focus();\n");
      out.write("        }\n");
      out.write("        if (number == 40) {\n");
      out.write("            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(5),.question-set:nth-child(6)').css({\"display\": \"none\"});\n");
      out.write("            $('.question-set:nth-child(4)').css({\"display\": \"inherit\"});\n");
      out.write("            $('#en_que_21').focus();\n");
      out.write("            $('#sin_que_21').focus();\n");
      out.write("        }\n");
      out.write("        if (number == 50) {\n");
      out.write("            $('.question-set:nth-child(2),.question-set:nth-child(3),.question-set:nth-child(4),.question-set:nth-child(6)').css({\"display\": \"none\"});\n");
      out.write("            $('.question-set:nth-child(5)').css({\"display\": \"inherit\"});\n");
      out.write("            $('#en_que_31').focus();\n");
      out.write("            $('#sin_que_31').focus();\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    }\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("</body>\n");
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
