<%-- 
    Document   : acccreated
    Created on : 24 Feb, 2019, 3:28:13 PM
    Author     : manas
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sessioncheck.jsp"%>
<%@include file="links.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <title>User Report</title>
        <style>
            .result{
                height: 20vh;
                width: 100%;
                box-shadow: 2px 2px 20px 2px black inset;
                color: black;
                top: 10vh;
                display: flex;
                justify-content: center;    
            }
            
        </style>
    </head>
    <body>
                 
        <%@include file="flash.jsp" %>
        <%
            String name = (String) session.getAttribute("nwnme");
            String usname = (String) session.getAttribute("nwun");
            String passwd = (String) session.getAttribute("nwpass");    
            String dpt = (String) session.getAttribute("nwdept");
            if(name != null && usname !=null && passwd != null &&dpt != null )
            {
                String sum = "</br>Account for user "+name+" has been crerated successfully.</br>Details are as follows:</br>Department = "+dpt.toUpperCase()+"</br>Username = "+usname+"</br>Password = "+passwd+"</br>Do change your password at next login!</br>";  
        %>
                <div class="col-lg-4" style="top: 10vh; left:34vw ">
                    <p class="result" name="summary" id = "message" rows="4" cols="20" readonly="readonly">
                       <%=sum%>
                    </p> 
                    <input  class="btn btn-info" style="margin-top:5vh; margin-left:9vw " onClick="cpy()" value="Copy Text" />
                </div>
                <script>
                    function cpy()
                    {
                        var cpytxt = document.getElementById("message");
                        cpytxt.select();
                        document.execCommand("copy");
                        alert("Text copied");
                    }
                </script>
        <%
           }
            session.removeAttribute("nwnme");
            session.removeAttribute("nwun");
            session.removeAttribute("nwpass");
            session.removeAttribute("nwdept");
        %>
    </body>
</html>
