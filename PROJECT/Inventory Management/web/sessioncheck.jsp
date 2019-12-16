<%-- 
    Document   : sessioncheck
    Created on : 6 Jan, 2018, 9:24:06 PM
    Author     : *
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String scheck=(String) session.getAttribute("UserType");
   if(scheck==null){
   response.sendRedirect("index.jsp");
   }
%>
