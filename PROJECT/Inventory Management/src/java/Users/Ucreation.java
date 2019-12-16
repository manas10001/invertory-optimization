/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

import db.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author manas
 */
public class Ucreation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        
        try {          
//GETTING PARAMETERS
            String name = request.getParameter("employee_Name");
            String username = request.getParameter("employee_no");
            String password = request.getParameter("password");
            String dept = request.getParameter("dept").toLowerCase();
            String mail  = request.getParameter("employee_email");
            String phno = request.getParameter("employee_pno");
//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con = Dbconn.connect();
            Statement statement = con.createStatement();
//CHECK FOR USERNAME BEING ALREADY PRESENT IN DATABASE
            ResultSet resultSet = statement.executeQuery("SELECT * FROM "+dept+"_users where user_name='" + username+ "' AND password='" + password + "';");
            if (resultSet.next()) {
//IF USER ALREADY EXIXTS DISPLAY FLASH
                session.setAttribute("flash_message", "User account already exists!");
                session.setAttribute("flash_type", "danger");
                response.sendRedirect("createUser.jsp");
            } else {
//IF USER ACCOUNT IS TO BE CREATED
                int rs = statement.executeUpdate("INSERT INTO "+dept+"_users (name,user_name,password,email,contact) VALUES ('"+name+"','"+username+"','"+password+"','"+mail+"','"+phno+"');");
                if(rs>0)
                {
                    session.setAttribute("flash_message", "Account Created Successfully");
                    session.setAttribute("flash_type", "success");
                    session.setAttribute("nwun", username);
                    session.setAttribute("nwpass", password);
                    session.setAttribute("nwdept", dept);
                    session.setAttribute("nwnme", name);
                    response.sendRedirect("createUser.jsp");
                }else{
                    session.setAttribute("flash_message", "Account Creation Failed");
                    session.setAttribute("flash_type", "danger");
                    response.sendRedirect("createUser.jsp");
                }
            }
    
        } catch (Exception ex) {
              System.out.println("exception="+ex.toString());
              response.sendRedirect("createUser.jsp");
           
        } finally {
            out.close();
        }
    
    }    
}