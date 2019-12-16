<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>                                          
<%@page import="java.sql.DriverManager"%>
<%@page import="db.Dbconn"%>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="css/table_page.css" rel="stylesheet" />
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <script src="js/index.js"></script>
        <title>Reports</title>
  </head>

  <body>
    <div class="container-fluid">
      <div class="row">
        <nav class="navbar bg-dark fixed-top">
         <div style="height:8vh; width=10vw;border: 1px solid wheat;left: 2vw;"><h1><a class="navbar-brand" href="index.jsp">OIMS<sub>(EVEREST INDUSTRIES)</sub></a></h1>  </div>   
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
           <center><h3>Purchase List</h3></center>
          <div class="row">
            <div class="col-lg-12">
              <table class="table table-striped text-center">
                <thead>
                  <th>Material</th>
                  <th>Description</th>
                  <th>Unit (Measure)</th>
                  <th>Quantity</th>
                  <th>Current Stock</th>    
                  <th>Cost</th>
                  <th>Indent Date</th>
                  <th>PO-Date</th>
                  <th>Material-REC-Date</th>
                  <th>Material-ISSUE-Date</th>
                  <th>Issued</th>
                  <th>Used</th>
                  <th>Currency</th>
                  <th>Material Group</th>
                  <th>Created By</th>
                  <th>Lead Time</th>
                </thead>
                <tbody>
		 <% 
           
            Dbconn db=new Dbconn();
            Connection conn = Dbconn.connect();
            Statement stmt = conn.createStatement();
                  
            ResultSet rs = null;
            try
            {
                        
                String pursel = "select * from `sap_report`"; 
                System.out.println("String="+pursel);
                rs = stmt.executeQuery(pursel);
                while( rs.next())
                {  
                   String mat = rs.getString("material");
                   System.out.println("String="+mat);
        %> 
            <tr>
                    <td>
                    <%=rs.getString(1)%>
                    </td>
                   <td>
                    <%= rs.getString(2)%>
                    </td>
                    <td>
                    <%= rs.getString(3)%>
                    </td>
                     <td>
                    <%= rs.getInt(4)%>
                    </td>
                     <td>
                    <%= rs.getInt(5)%>
                    </td>
                     <td>
                    <%= rs.getInt(6)%>
                    </td>
                     <td>
                    <%= rs.getString(7)%>
                    </td>
                     <td>
                    <%= rs.getString(8)%>
                    </td>
                     <td>
                    <%= rs.getString(9)%>
                    </td>
                     <td>
                    <%= rs.getString(10)%>
                    </td>
                     <td>
                    <%= rs.getInt(11)%>
                    </td>
                     <td>
                    <%= rs.getInt(12)%>
                    </td>
                     <td>
                    <%= rs.getString(13)%>
                    </td>
                     <td>
                    <%= rs.getString(14)%>
                    </td>
                     <td>
                    <%= rs.getString(15)%>
                    </td>
                     <td>
                    <%= rs.getInt(16)%>
                    </td>
                  
                    
            </tr>  
            <%
                }
               }catch(Exception e)
               {
                   System.out.println("Exception:"+e);
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
