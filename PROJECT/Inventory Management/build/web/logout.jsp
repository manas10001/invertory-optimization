<%
//RESETTING ALL SESSION ATTRIBUTES.
    session.setAttribute("UserType", null);
    session.setAttribute("username", null);
    session.setAttribute("flash_message", "Logged out successfully !!!");
    session.setAttribute("flash_type", "info");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

