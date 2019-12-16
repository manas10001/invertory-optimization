<%-- 
    Document   : managedash
    Created on : 3 Mar, 2019, 4:28:05 AM
    Author     : manas
--%>
<%
try
{
    String userType = null;
        if(session.getAttribute("userType")!="" || session.getAttribute("userType")!=null)
            userType = (String) session.getAttribute("UserType");
        if (userType != null) {
            if(userType.equals("admin")){
            %>    
                <div
                    class="btn option text-center btn-block"
                    style="background-color:rgb(44, 93, 228);color:white;"
                >
                  <a href="createUser.jsp" style="color:white;"><h5>Create User</h5></a>
                </div>
                <div
                    class="btn option text-center btn-block"
                    style="background-color: rgb(129, 127, 127);color:white;"
                >
                    <a href="View_Reports.jsp" style="color:white;"><h5>View Purchase List</h5></a>
                </div>
                <div
                    class="btn option text-center btn-block"
                    style="background-color:rgb(44, 93, 228);color:white;"
                >
                  <a href="All_Reports.jsp" style="color:white;"><h5>View All previous purchase</h5></a>
                </div>
                <div
                    class="btn option text-center btn-block"
                    style="background-color:rgb(44, 93, 228);color:white;"
                >
                  <a href="Sap_report.jsp" style="color:white;"><h5>Sap Report</h5></a>
                </div>
            <%
            }else if(userType.equals("it")){
            %>
                <div
                    class="btn option text-center btn-block"
                    style="background-color:rgb(44, 93, 228);color:white;"
                >
                  <a href="createUser.jsp" style="color:white;"><h5>Create User</h5></a>
                </div>

            <%
            }else if(userType.equals("inventory")){
            %>
                <div
                class="btn option text-center btn-block"
                style="background-color: rgb(129, 127, 127);color:white; "
                >
                    <a href="View_Reports.jsp" style="color:white;"><h5>View Purchase List</h5></a>
                </div>
                <div
                    class="btn option text-center btn-block"
                    style="background-color:rgb(44, 93, 228);color:white;"
                >
                  <a href="Sap_report.jsp" style="color:white;"><h5>Sap Report</h5></a>
                </div>
            <%
            }else if(userType.equals("purchase")){
            %>
                <div
                    class="btn option text-center btn-block"
                    style="background-color: rgb(129, 127, 127) ;color:white;"
                >
                    <a href="View_Reports.jsp"><h5>View Purchase List</h5></a>
                </div>
                <div
                    class="btn option text-center btn-block"
                    style="background-color:rgb(44, 93, 228);color:white;"
                >
                  <a href="All_Reports.jsp" style="color:white;"><h5>View All previous purchase</h5></a>
                </div> 
            <%
            }
        %>
            <div
                    class="btn option text-center btn-block"
                    style="background-color:rgb(44, 93, 228);color:white;"
                >
                  <a href="ChangePass.jsp" style="color:white;"><h5>Change Password</h5></a>
                </div> 
                
        <%
        }
%>
    
<%    
}catch(Exception e)
{
    System.out.println(e.toString());
}
%>