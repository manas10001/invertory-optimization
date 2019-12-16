<%-- 
    Document   : createUser.jsp
    Created on : 21 Feb, 2019, 12:38:16 AM
    Author     : manas
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sessioncheck.jsp"%>
<html>
  <head>
    <title>
      SIH
    </title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/create.css" rel="stylesheet" />
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="js/index.js"></script>
  </head>

  <body>
    <div class="container-fluid">
      <div class="row">
        <nav class="navbar bg-dark fixed-top">
            <div style="height:8vh; width=10vw;border: 1px solid wheat;left: 2vw;position: fixed;"><h1><a class="navbar-brand" href="index.jsp">OIMS<sub>(EVEREST INDUSTRIES)</sub></a></h1>  </div>
          <a class="btn btn-danger logout text-center" href="logout.jsp">
            Log out
          </a>
        </nav>
          
        <nav class="navbar bg-dark fixed-bottom" style="z-index:-1;"></nav>
        <section id="dashboard-menu" class="dashboard-menu col-lg-2">
          <div class="menu">
            <div class="col">
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

        <section id="main" class="main col-lg-10">
          <div class="row">
            <div class="col-lg-12 create col">
              <div class="heading text-center">
                <h3>
                  Create New User
                </h3>
              </div>
              <div class="row">
              <div class="col-lg-4"></div>
              <div class="details col-lg-4 text-center">
                  <form action="Ucreation" method="post">
                  <select
                  class=" usertype text-center"
                  id="usertype"
                  name="dept"
                  type="input"
                >
                  <ul class="text-center">
                    <center>
                      <option value="null">Select User Type</option>
                      <option value="admin">Admin</option>
                      <option value="it">IT</option>
                      <option value="inventory">Inventory</option>
                      <option value="purchase">Purchase</option>
                    </center>
                  </ul></select>
                  <div class="col">
                    <div class="input">
                  <input type="text" name="employee_Name" class="input" placeholder="Enter Employee Name">
                  </div>
                  <div class="input">
                  <input type="text" maxlength="20" class="input" name="employee_no" placeholder="Enter Employee Number">
                  </div>
                  <div class="input">
                  <input type="text" maxlength="10" class="input" name="employee_pno" placeholder="Enter Employee Contact Number">
                  </div>
                  <div class="input">
                  <input type="email" name="employee_email"  class="input" placeholder="Enter Employee Email Id">
                  </div>
                  <div class="input">
                  <input type="password" name="password" class="input" placeholder="Password">
                  </div>
                   
                    <button class="btn btn-primary input" id="submit" style="margin-top:5vh;">Submit</button>
                  
                  </div>
                  </form>
              </div>
              </div>
            </div>
          </div>
        </div>
        </section>
      </div>
    </div>
    <%@include file="flash.jsp" %>
  </body>
</html>