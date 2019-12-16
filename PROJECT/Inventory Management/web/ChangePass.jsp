<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="db.Dbconn"%>
<%@include file="sessioncheck.jsp"%>
<%@include file="links.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/structure.css">
         <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
          <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
           <link href="css/create.css" rel="stylesheet" />
         <title>Change Password</title>
         <style>
   .details {
  height: 60vh;
  top: 20vh;
  left: 25vw;
  border: 1px solid black;
  border-radius: 5px;
  width: 60vw;
}
.input {
  height: 6vh;
  width: 100%;
  margin-top: 2vh;
  border-radius: 5px;
}
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
.heading{
    height: 10vh;
    width:10vw;
    font-size: 5vw;
    color: black;
    top: 20vh;
}
         </style>
    </head>
    <body style="font-size:3vh;" >
        <div class="container-fluid" >
      <div class="row">
        <nav class="navbar bg-dark fixed-top">
            <div style="height:8vh; width=10vw;border: 1px solid wheat;left: 2vw;position: fixed;"><h1><a class="navbar-brand" href="index.jsp">OIMS<sub>(EVEREST INDUSTRIES)</sub></a></h1>  </div>
          <a class="btn btn-danger logout " href="logout.jsp">
            Log out
          </a>
        </nav>
          <div class="navbar bg-dark fixed-bottom"></div>
          <section id="dashboard-menu" class="dashboard-menu col-lg-2" style="font-size:3vh;">
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
        
            <section class="col-lg-10">
              <div class="details col-lg-4">
                 
                     <center><h1>Change Password</h1></center>
           
                  <form action="" method="post">
                  
                  <div class="col-lg-12 text-center">
                    <div class="input">
                  <input type="password" name="oldpass" class="input" placeholder="Enter Previous Password">
                  </div>
                  <div class="input">
                  <input type="password"  class="input" name="newpass" placeholder="Enter New Password">
                  </div>
                  <div class="input">
                  <input type="password"  class="input" name="confirmpass" placeholder="Confirm Password">
                  </div>
                  
                   
                    <button class="btn btn-primary input" id="submit" style="margin-top:5vh;">Change Password</button>
                  
                  </div>
                  </form>
     </div>
            </section>
</div>  
       
      </div>
    <%
    try {
//CONNECTING DATABASE
                    Dbconn db=new Dbconn();
                    Connection con =Dbconn.connect();
                    //out.println(con);
                    Statement st = con.createStatement();
                    String UT=(String) session.getAttribute("UserType");
                    System.out.println("user type: "+UT);
                
                    String UN=(String) session.getAttribute("username");
                    String oldpass =request.getParameter("oldpass");
                    //if user has inserted sm data
                    if(oldpass!=null && UN != null)
                    {    
                        ResultSet RS = st.executeQuery("SELECT * FROM "+UT+"_users where user_name='" +UN+ "' AND password='" +oldpass+ "';");
                        //if user exists
                        if(RS.next()){

                            String newpass =(String) request.getParameter("newpass");

                            String confirmpass =(String) request.getParameter("confirmpass");
                            //pass and confirm pass match
                            if(newpass.equals(confirmpass)){
                                String sql1 = "UPDATE "+UT+"_users set password ='"+newpass+"' WHERE user_name ='"+UN+"';";

                                int rs=st.executeUpdate(sql1);
                                if(rs!=0){
                                    %>
                                    <div class="container"><br><br>
                                        <div class="alert alert-success">
                                               <button class="close" data-dismiss="alert"></button>
                                                <strong>Password changed!</strong> 
                                        </div>
                                    </div>
                                    <%
                                } 
                            }else{
                            %>
                            <div class="container"><br><br>
                                <div class="alert alert-warning">
                                       <button class="close" data-dismiss="alert"></button>
                                        <strong>Old and new passwords dont match!</strong> 
                                </div>
                            </div>
                            <%
                            }
                        }else{
                            %><br><br><br><br><br><br><br><br>
                            <div class="container"><br><br>
                                <div class="alert alert-danger">
                                       <button class="close" data-dismiss="alert"></button>
                                        <strong>Old password is incorrect!</strong> 
                                </div>
                            </div>
                            <%
                        }
                    }    
    }catch (Exception e) {
        System.out.println("ex occured while changing password:      "+e);
    }finally{
        out.close();
    }
    %>
   
</body>
</html>