<%--
    Document   : nav
    Created on : 20 Feb, 2019, 11:36:30 PM
    Author     : manas
--%>

<!--NAVIGATION BAR-->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <%
                String u =(String) session.getAttribute("UserType"); 
                if(u == null)      
                {
            %>  
                    <a class="navbar-brand" href="index.jsp">SIMS <sub>EVEREST INDUSTRIES</sub></a>
            <%
                }else{
            %>    
                    <a class="navbar-brand" href="dash.jsp">SIMS <sub>EVEREST INDUSTRIES</sub></a>
            <%
                }
            %>
                <div class="nav-collapse collapse-out">
                <%@include file="manage_nav.jsp"%>
                </div><!--/.nav-collapse -->
        </div><!-- /.navbar-inner -->
    </div><!-- /.navbar -->
</div> <!-- /.container -->
 <!--NAVBAR END-->