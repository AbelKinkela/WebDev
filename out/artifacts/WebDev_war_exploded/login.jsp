<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login Page</title>

  <!-- Font Icon -->
  <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

  <!-- Main css -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/pricing/">

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <!-- Favicons -->
  <meta name="theme-color" content="#563d7c">
</head>
<body>

<div class="main">

  <!-- Sing in  Form -->
  <section class="sign-in">
    <div class="container">
      <div class="signin-content">
        <div class="signin-image">
          <figure><img src="views/images/signin-image.jpg" alt="sing up image"></figure>
          <a href="#" class="signup-image-link">Login</a>
        </div>

        <div class="signin-form">
          <h2 class="form-title">Login</h2>
          <form method="POST" class="register-form" id="login-form" action="/dashboard">
            <div class="form-group">
              <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
              <input type="text" name="your_name" id="your_name" placeholder="Your Name" required/>
            </div>
            <div class="form-group">
              <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
              <input type="password" name="your_pass" id="your_pass" placeholder="Password" required/>
            </div>
            <div class="form-group form-button">
              <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
            </div>
          </form>
          </div>
        </div>
      </div>
  </section>


</div>
    </div>
  </section>
</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<jsp:include page="footer.jsp"/>
</body>
</html>
