
<%
    if (request.getParameter("email") == null) {


%>
<div class="row">
    <div class="col-12">
        <form method="GET" >
            <div class="form-group">

                <label >Verify Code </label>
                <input type="text" id="verifyz" class="form-control" placeholder="Verify Code">
            </div>
            <div class="form-group mt-4">
                <input type="button" id="vari" onclick="verifya()" class="btn btn-primary mt-3 mb-4 px-5" value="Reset">
            </div>
        </form>
    </div>
</div>
<%} else {
    String email = request.getParameter("email");
%>
<div class="row">
    <div class="col-12">
        <form action="resetpass" method="post" >
            <div class="form-group">
                <input type="hidden" class="d-none" name="email" value="<% out.write(email); %>"/>
                <label >New Password</label>
               <input type="text" id="newpass" name="newpass" class="form-control" placeholder="New Password" required/>
                <label >Retype New Password</label>
                <input type="text" id="repass" class="form-control" placeholder="Retype New Password" required/>
            </div>
            <div class="form-group mt-4">
                <input type="button" id="newpa" onclick="repassva()" class="btn btn-primary mt-3 mb-4 px-5" value="Reset">
            </div>
        </form>
    </div>
</div>

<%
    }

%>