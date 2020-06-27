<!DOCTYPE html>
<html>
  
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
     
      <title>Phalcon PHP Framework</title>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link rel="stylesheet" href="{{ url('css/materialize.min.css') }}">
      <link rel="stylesheet" href="{{ url('css/style.css') }}">
  </head>

  <body>

    <!-- Header -->
    <header>
      <nav class="yellow">
        <div class="nav-wrapper container">
          <a href="#!" class="brand-logo">Fabelio Internship Test</a>
          <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
          <ul class="right hide-on-med-and-down">
  
            {% if session.get('auth') == null %}
              <li><a class="modal-trigger" href="#modal-login">Login</a></li>
            {% else %}
              <li><a class="" href="{{ url('/user/logout') }}">Logout</a></li>
            {% endif %}

          </ul>
        </div>
      </nav>
      <ul class="sidenav" id="mobile-demo">
        <li><a href="sass.html">Sass</a></li>
      </ul>
    </header>
    <!-- Header -->

    {% block content %} 
    
    {% endblock %}

    <!-- Modal Structure -->
    <div id="modal-login" class="modal" style="max-width: 500px;">
      <div class="modal-content">
        <div class="row right-align">
          <i class="material-icons prefix modal-close">close</i>
        </div>
        
        <div class="center-align">
          <div class="row">
            <h5>Login</h5>
          </div>
        </div>

        <form action="/" method="post">

          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">account_circle</i>
              <input id="username" type="text" class="validate" name="username">
              <label for="username">Username</label>
            </div>
          </div>

          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">lock</i>
              <input id="password" type="password" class="validate" name="password">
              <label for="password">Password</label>
            </div>
          </div>
          
          <div class="row">    
            <div class="col s6 offset-s3" style="">
              <button class="btn yellow" style="width:100%" type="submit" name="action">Login
                <i class="material-icons">send</i>
              </button>  
            </div>
          </div>

        </form>
      </div>
    </div>
    <!-- Modal Structure -->
      
    <!-- Footer -->
    <footer class="page-footer yellow">
      <div class="container">
      </div>
    </footer>
    <!-- Footer -->

      
    <script src="{{ url('js/materialize.min.js') }}"></script> -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="{{ url('js/materialize.min.js') }}"></script>
    <script src="{{ url('js/init.js') }}"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
    <script>
      $(document).ready(function(){
        $('.modal').modal();
      });
      $(document).ready( function () {
          $('#table_3').DataTable();
      });
    </script>

  </body>
</html>