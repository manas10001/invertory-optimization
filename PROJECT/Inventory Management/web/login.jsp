
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width-device-width,initial-scale-1" />
    <title>Login</title>
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="css/customstyle.css" rel="stylesheet" />
    <link href="css/Mycustomstyle.css" rel="stylesheet" />

    <style>
      .customDiv {
        height: 80vh;
        top: 10vh;
        padding: 5vh;
        background-color: rgba(90, 85, 83, 0.534);
        text-align: center;
        position: relative;
      }

      .MycustomDiv {
        height: 10vh;
        margin-top: 1vh;
        padding: 1vh;
        background-color: rgba(243, 241, 241, 0.959);
        text-align: left;
      }
      #ForgotPass,
      #RememberMe {
        width: 20vw;
      }
      #usertype,
      #Username,
      #Password {
        height: 8vh;
        margin-left: 10%;
        width: 80%;
      }
      img {
        margin-top: 0vh;
        height: 10vw;
        width: 10vw;
        border-radius: 50%;
      }
      .forgot {
        height: 10vh;
        width: 100%;
      }
      .navbar {
        height: 7vh;
      }
    </style>
  </head>

  <body>
    <div class="container-fluid">
      <div class="navbar bg-dark fixed-top">
      <div style="height:8vh; width=10vw;border: 1px solid wheat;left: 2vw;position: fixed;"><h1><a class="navbar-brand" href="index.jsp">OIMS<sub>(EVEREST INDUSTRIES)</sub></a></h1>  </div>
      </div>
      <div class="row" style="top: 30vh">
        <div class="col-lg-4 customDiv" style="background-color:white"></div>
        
        <div class="col-lg-4 customDiv">
          <img
            src="logo/user-icon.png"
            class="img-responsive"
            alt="Profile Picture"
            width="50vh"
            height="50vh"
          />
          <form method ="POST" action="Ulogin">
          <select
            class="btn MycustomDiv btn-block text-center"
            name="usertype"
            type="input"
          >
            <ul class="text-center">
              <center>
                <option>Select User Type</option>
                <option>Admin</option>
                <option>IT</option>
                <option>Inventory</option>
                <option>Purchase</option>
              </center>
            </ul></select>

          <input
            class="btn MycustomDiv btn-block"
            name="Username"
            type="input"
            placeholder="Username"
          />
          <input
            class="btn MycustomDiv btn-block"
            name="Password"
            type="password"
            placeholder="Password"
          />
          <div class="row" style="padding: 1vh">
            <div class="col-lg-12 mx-auto">
              <center>
                <button
                  class="btn btn-primary btn-block btn-lg"
                  name="Submit"
                  type="submit"
                  value="Login"
                  style="width: 30vh"
                >
                 Login
                </button>
                  
              </center>
            </div>
            <div class="col-lg-4 "></div>
          </div>
          </form>
        </div>
        <div class="col-lg-4 customDiv" style="background-color: white"></div>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <%@include file="flash.jsp" %>
  </body>
</html>