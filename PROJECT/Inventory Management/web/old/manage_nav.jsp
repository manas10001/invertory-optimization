<%-- 
    Document   : manage_nav
    Created on : 20 Feb, 2019, 11:42:37 PM
    Author     : manas
--%>
<%
    try{
%>
<ul class="nav navbar-nav navbar-right">
    <%
        //Getting User Type Set In Sesssion
        String userType = null;
        if(session.getAttribute("userType")!="" || session.getAttribute("userType")!=null)
            userType = (String) session.getAttribute("UserType");
        if (userType == null) {
    %>
            <!--DEFAULT NAVBAR-->
            <li><a href="login.jsp" >Login</a></li>
            
    <%  }
        //in case smbody is logged in
        else {
            if (userType.equals("admin")) {
        %>
                <!--ADMIN NAVBAR-->
                
                <li><a href="createUser.jsp" style="color: #FCFCFC">Add Users</a></li>
        <%
            }
            //if user is of it department
            else if(userType.equals("it")) { 
        %>
                <!--DEVELOPER/IT NAVBAR-->
                <li><a href="createUser.jsp" style="color: #FCFCFC">Add Users</a></li>
        <%
            //if user is of inventory department
            }else if(userType.equals("inventory")){
        %>
                <!-- INVENTORY DEPT NAVBAR -->
                <li><a href="" style="color: #FCFCFC">Inventory Buttons here</a></li>
                 
        <%
            //if user is of purcahse department
            }else if(userType.equals("purchase")){
        %>
                <!-- PURCHASE DEPT NAVBAR -->
                <li><a href="" style="color: #FCFCFC">View Todays Purchase List</a></li>
                <li><a href="" style="color: #FCFCFC">View Past Purchases</a></li>
                
        <%
            }
        %>
        
        <!-- LOGOUT BUTTON FOR EVERYONE -->
        <li><a href="ChangePass.jsp" style="color: #FCFCFC">Change Password</a></li>
        <li><a href="logout.jsp" class="btn btn-danger" style="color: #FCFCFC">Logout [<%= session.getAttribute("UserType") %>]</a></li>
        
    <%
        }//end of else
    %>
             
</ul>
<%
    }catch(Exception e){
        out.println(e.toString());
    }

%>