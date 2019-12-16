package Users;

import db.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Ulogin extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        
        try {          
//GETTING PARAMETERS AND CONNECTING DATABASE
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            String dept = request.getParameter("usertype").toLowerCase();
            System.out.println(dept);
            //out.println(dept);
//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con = Dbconn.connect();
            //out.println(con);
            Statement statement = con.createStatement();
//VERIFYING USER-NAME AND PASSWORD
            ResultSet resultSet = statement.executeQuery("SELECT * FROM "+dept+"_users where user_name='" + username+ "' AND password='" + password + "';");
            if (resultSet.next()) {
//SETTING SESSION ATTRIBUTES IF LOGIN IS SUCCESSFULL
                session.setAttribute("username", username);
                session.setAttribute("UserType", dept);
                session.setAttribute("flash_message", "Logged in successfully !!!");
                session.setAttribute("flash_type", "success");
                response.sendRedirect("index.jsp");
                //response.sendRedirect("dash.jsp");
                //out.println("login success");
            } else {
//UNSUCCESSFULL LOGIN
                session.setAttribute("flash_message", "Failed. try again");
                session.setAttribute("flash_type", "danger");
                response.sendRedirect("login.jsp");
                //out.println("sorry unsuccessfull login");                
            }
    
        } catch (Exception ex) {
              System.out.println("exception="+ex);
              response.sendRedirect("login.jsp");
           
        } finally {
            out.close();
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}