<%-- 
    Document   : Header
    Created on : Jul 26, 2019, 1:51:39 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="pb-0">
    <div class="container">
        <a class="logo" href="Index.jsp"><img class="img-responsive" src="assets/images/tt.png" alt="ICT AL"></a>
        <div class="right-area">
            <%
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
            %>
            <a class='plr-20' href='Login.jsp'>&nbsp;  LOGIN  </a> |
            <a href='registration.jsp'>SIGN UP</a></li>
            <%                }
            %>
        </div><!-- right-area -->
        <ul class="main-menu font-mountainsre float-right" id="main-menu">
            <!--<li><a href=Contactus.jsp">Contact Us</a></li>-->
            <li><a href="Aboutus.jsp">About Us</a> |</li>
            <!--<li><a href="">How to use</a></li>-->
            <!--<li><a href="">Take practice question</a></li>-->
        </ul>
        <div class="clearfix"></div>
    </div><!-- container -->
</header>