package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/flash.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\" />\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("    <meta name=\"viewport\" content=\"width-device-width,initial-scale-1\" />\n");
      out.write("    <title>Login</title>\n");
      out.write("    <link href=\"lib/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"lib/bootstrap/css/bootstrap.css\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"css/customstyle.css\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"css/Mycustomstyle.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("    <style>\n");
      out.write("      .customDiv {\n");
      out.write("        height: 80vh;\n");
      out.write("        top: 10vh;\n");
      out.write("        padding: 5vh;\n");
      out.write("        background-color: rgba(90, 85, 83, 0.534);\n");
      out.write("        text-align: center;\n");
      out.write("        position: relative;\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      .MycustomDiv {\n");
      out.write("        height: 10vh;\n");
      out.write("        margin-top: 1vh;\n");
      out.write("        padding: 1vh;\n");
      out.write("        background-color: rgba(243, 241, 241, 0.959);\n");
      out.write("        text-align: left;\n");
      out.write("      }\n");
      out.write("      #ForgotPass,\n");
      out.write("      #RememberMe {\n");
      out.write("        width: 20vw;\n");
      out.write("      }\n");
      out.write("      #usertype,\n");
      out.write("      #Username,\n");
      out.write("      #Password {\n");
      out.write("        height: 8vh;\n");
      out.write("        margin-left: 10%;\n");
      out.write("        width: 80%;\n");
      out.write("      }\n");
      out.write("      img {\n");
      out.write("        margin-top: 0vh;\n");
      out.write("        height: 10vw;\n");
      out.write("        width: 10vw;\n");
      out.write("        border-radius: 50%;\n");
      out.write("      }\n");
      out.write("      .forgot {\n");
      out.write("        height: 10vh;\n");
      out.write("        width: 100%;\n");
      out.write("      }\n");
      out.write("      .navbar {\n");
      out.write("        height: 7vh;\n");
      out.write("      }\n");
      out.write("    </style>\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("      <div class=\"navbar bg-dark fixed-top\">\n");
      out.write("      <div style=\"height:8vh; width=10vw;border: 1px solid wheat;left: 2vw;position: fixed;\"><h1><a class=\"navbar-brand\" href=\"index.jsp\">OIMS<sub>(EVEREST INDUSTRIES)</sub></a></h1>  </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"row\" style=\"top: 30vh\">\n");
      out.write("        <div class=\"col-lg-4 customDiv\" style=\"background-color:white\"></div>\n");
      out.write("        \n");
      out.write("        <div class=\"col-lg-4 customDiv\">\n");
      out.write("          <img\n");
      out.write("            src=\"logo/user-icon.png\"\n");
      out.write("            class=\"img-responsive\"\n");
      out.write("            alt=\"Profile Picture\"\n");
      out.write("            width=\"50vh\"\n");
      out.write("            height=\"50vh\"\n");
      out.write("          />\n");
      out.write("          <form method =\"POST\" action=\"Ulogin\">\n");
      out.write("          <select\n");
      out.write("            class=\"btn MycustomDiv btn-block text-center\"\n");
      out.write("            name=\"usertype\"\n");
      out.write("            type=\"input\"\n");
      out.write("          >\n");
      out.write("            <ul class=\"text-center\">\n");
      out.write("              <center>\n");
      out.write("                <option>Select User Type</option>\n");
      out.write("                <option>Admin</option>\n");
      out.write("                <option>IT</option>\n");
      out.write("                <option>Inventory</option>\n");
      out.write("                <option>Purchase</option>\n");
      out.write("              </center>\n");
      out.write("            </ul></select>\n");
      out.write("\n");
      out.write("          <input\n");
      out.write("            class=\"btn MycustomDiv btn-block\"\n");
      out.write("            name=\"Username\"\n");
      out.write("            type=\"input\"\n");
      out.write("            placeholder=\"Username\"\n");
      out.write("          />\n");
      out.write("          <input\n");
      out.write("            class=\"btn MycustomDiv btn-block\"\n");
      out.write("            name=\"Password\"\n");
      out.write("            type=\"password\"\n");
      out.write("            placeholder=\"Password\"\n");
      out.write("          />\n");
      out.write("          <div class=\"row\" style=\"padding: 1vh\">\n");
      out.write("            <div class=\"col-lg-12 mx-auto\">\n");
      out.write("              <center>\n");
      out.write("                <button\n");
      out.write("                  class=\"btn btn-primary btn-block btn-lg\"\n");
      out.write("                  name=\"Submit\"\n");
      out.write("                  type=\"submit\"\n");
      out.write("                  value=\"Login\"\n");
      out.write("                  style=\"width: 30vh\"\n");
      out.write("                >\n");
      out.write("                 Login\n");
      out.write("                </button>\n");
      out.write("                  \n");
      out.write("              </center>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-lg-4 \"></div>\n");
      out.write("          </div>\n");
      out.write("          </form>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-4 customDiv\" style=\"background-color: white\"></div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("     ");
  //checking if flash message is set
    String flash_message = (String) session.getAttribute("flash_message");
    if (flash_message != null) {
        String flash_type = (String) session.getAttribute("flash_type");
        if (flash_type == null) {
            flash_type = "success";
        }
        session.setAttribute("flash_message",null);
        session.setAttribute("flash_type",null);

      out.write("\n");
      out.write("<div class=\"container\"><br><br>\n");
      out.write("    <div class=\"alert alert-");
      out.print(flash_type);
      out.write("\">\n");
      out.write("        <button class=\"close\" data-dismiss=\"alert\"></button>\n");
      out.write("        <strong>");
      out.print(flash_type);
      out.write("!</strong> ");
      out.print(flash_message);
      out.write("\n");
      out.write("    </div>\n");
      out.write("</div>\n");
}

      out.write("\n");
      out.write("  </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
