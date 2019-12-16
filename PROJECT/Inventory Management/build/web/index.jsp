<%--
    Document   : index
    Created on : 19 Feb, 2019, 12:58:02 AM
    Author     : manas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "links.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SIMS</title>
        <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/create.css" rel="stylesheet" />
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="js/index.js"></script>
       <script src="lib/jquery/jquery.min.js"></script>
        <style>
            .navbar {
  height: 8vh;
  width: 100vw;
}
          .logout {
  height: 5vh;
  width: 10vw;
  /*top: 1vh;*/
  padding: 0px;
  font-size: 2vw;
  margin-top: 0vh;
  margin-left: 85vw;
}
/* dsahboard */
.dashboard-menu {
  top: 8vh;
  height: 86vh;
  background-color: rgb(216, 218, 211);
}
.menu {
  height: 86vh;
  width: 100%;
  top: 7vh;
  overflow-y: auto;
}
::-webkit-scrollbar {
  width: 0px;
}
.user {
  height: 26vh;
  background-color: rgb(241, 233, 233);
  width: 100%;
  display: flex;
  justify-content: center;
}
.user-icon {
  height: 70%;
  width: 100%;
  padding: 5px;
  display: flex;
  justify-content: center;
}
.icon {
  height: 18vh;
  width: 18vh;
  border-radius: 50%;
}
.user-name {
  height: 30%;
  width: 100%;
  padding: 1vh;
}

.a.highlight:hover {
  color: #3c2088;
  top: 0vh;
  padding: 5px;
  height: 6vh;
  width: 100%;
  color: white;
  background-color: rgb(183, 173, 240);
}
.option {
  top: 10vh;
  padding: 1vh;
  height: 6vh;
  width: 100%;
  color: white;
  background-color: rgb(183, 173, 240);
}
        </style>
    </head>
    <body>
      <%
    String u =(String) session.getAttribute("UserType"); 
    if(u != null)      
    {
      %>  
     <div class="container-fluid" >
      <div class="row">
        <nav class="navbar bg-dark fixed-top">
            <div style="height:8vh; width=10vw;border: 1px solid wheat;left: 2vw;position: fixed;"><h1><a class="navbar-brand" href="index.jsp">OIMS<sub>(EVEREST INDUSTRIES)</sub></a></h1>  </div>
          <a class="btn btn-danger logout text-center" href="logout.jsp">
            Log out
          </a>
        </nav>
        <nav class="navbar bg-dark fixed-bottom"></nav>
        <section id="dashboard-menu" class="dashboard-menu col-lg-2">
          <div class="menu">
            <div class="col" >
              <div class="user">
                <div class="col">
                  <div class="user-icon">
                    <img src="logo/user-icon.png" class="img-responsive icon" />
                  </div>
                  <div class="user-name text-center">
                    <h4><%=session.getAttribute("username")%></h4>
                  </div>
                </div>
              </div>

              <%@include  file="managedash.jsp"%>
              
            </div>
          </div>
        </section>
      </div>
     </div>
     <%
     }else{
     %>
     <div class="container-fluid">
      <div class="row">
          
          <div class="navbar bg-dark fixed-top" >
         <a class="btn btn-danger logout text-center" href="login.jsp">
            Log in
          </a>
         <script>
             $(window).on("load",function(){
                 location.replace("login.jsp");
             });
             
          </script>     
     </div>
          </div>
         </div>
     <%}%>
    </body>
</html>