<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>SkyTaxi</title>

    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
	<link href="/static/css/bootstrap-theme.min.css" rel="stylesheet">
	
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/static/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="/static/css/custom.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="/static/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/static/js/ie10-viewport-bug-workaround.js"></script>

  </head>
  <body>
  
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="container-fluid">
				<div class="navbar-header">
					
					<a class="navbar-brand brandimg" href="#">
						<span><img alt="Brand" src="/static/web_imgs/index.png" height="32" width="32"></span> Home
					</a>
					
				</div>
<!-- 
			<ul class="nav navbar-nav">
			  	<li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
    		</ul>
 -->
	  		</div>
		</div>
	</nav>


    <div class="container">
	
	{{.LayoutContent}}

    </div><!-- /.container -->
    
	
  </body>
  
  	

</html>
