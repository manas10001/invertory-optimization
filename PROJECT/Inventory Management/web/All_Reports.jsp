<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>                                          
<%@page import="java.sql.DriverManager"%>
<%@page import="db.Dbconn"%>
<%@include file="sessioncheck.jsp"%>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="css/table_page.css" rel="stylesheet" />
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <script src="js/index.js"></script>
        <title>All Reports</title>
  </head>

  <body>
    <div class="container-fluid">
      <div class="row">
        <nav class="navbar bg-dark fixed-top">
            <div style="height:8vh; width=10vw;border: 1px solid wheat;left: 2vw;position: fixed;"><h1><a class="navbar-brand" href="index.jsp">OIMS<sub>(EVEREST INDUSTRIES)</sub></a></h1>  </div>
          <a class="btn btn-danger logout " href="logout.jsp">
            Log out
          </a>
        </nav>
        <nav class="navbar bg-dark fixed-bottom"></nav>
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
           <center><h3>All Purchase Reports</h3></center>
          <div class="row">
            <div class="col-lg-12">
              <table class="table table-striped text-center">
                <thead>
                  <th>Sr No.</th>
                  <th>Order Id</th>
                  <th>Item</th>
                  <th>Quantity</th>
                  <th>Issue Date</th>
                </thead>
                <tbody>
		 <%
           Dbconn db=new Dbconn();
           Connection conn = Dbconn.connect();
           Statement stmt = conn.createStatement();
           Statement stmt2 = conn.createStatement();  
        
           ResultSet rs1 = null;
           ResultSet rs2 = null;
           
           try
           {
               String query = "select * from `order_log`";
               rs1 = stmt.executeQuery(query);
               int i=1;
               while(rs1.next())
               {
                   String getDate = "select * from `orders` where `order_id`="+rs1.getString("order_id");
                   rs2 = stmt2.executeQuery(getDate);
                   
                   rs2.next();
                   String date = rs2.getString("issue");
        %>
                   <tr> 
                       <td>
                           <%=i++%>
                          
                       <td>
                           <%=rs1.getString("item")%>
                       </td>
                       
                       <td>
                           <%=rs1.getInt("quantity")%>
                       </td>    
                       
                       <td>
                           <%=rs1.getInt("order_id")%>
                       </td>
                       
                       <td>
                           <%=date%>
                       </td>
                   </tr>
                   
        <%                  
               }
           }catch(Exception e)
           {
               System.out.println("\nException Occured:"+e);
           }
        %>
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </div>
  </body>
</html>
