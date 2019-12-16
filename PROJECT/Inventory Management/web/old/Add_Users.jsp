<%-- 
    Document   : Add_Users
    Created on : 23 Feb, 2019, 11:55:09 PM
    Author     : manas
--%>
<%@include file="sessioncheck.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file = "links.jsp"%>

        <title>Add Users</title>
    </head>
    <body>
    <center>
        <form method="POST" action="Ucreation"><br><br><br><br>
            
            <label>Select Department</label>
           <select name="dept" style="font: bold" class="btn btn-default" >
                <option>IT</option>
                <option>ADMIN</option>
                <option>INVENTORY</option>
                <option>PURCHASE</option>
            </select>
            <br><label>Enter Employee Name</label>
            <input type="text" name="name" value="" placeholder = "Name" required/>
            <br><label>Enter Employee Number</label>
            <input type="text" name="empno" value="" placeholder = "Employee Number" required/>
            <br><label>Enter Employee Contact Number</label>
            <input type="number" name="phno" required/>
            <br><label>Enter Employee Email</label>
            <input type="email" name="mail" required/>
            <br><label>Password</label>
            <input type="password" name="password" value="" />  
            <br><input type="submit" value="Create Account" />
        </form>
        
        <%@include file="flash.jsp" %>
    
    </center>
    </body>
</html>
