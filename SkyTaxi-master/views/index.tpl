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

		<div class="row">
  			<div class="col-sm-6">
  				<h1>Welcome to SkyTaxi.</h1>
  				<div>
  					 <img src="/static/web_imgs/index.png" alt="SkyTaxi" height="42" width="42"> 
  				</div>
  				
  			</div>
			<div class="col-sm-6">
				<form role="form">
  					<div class="form-group">
    					<input type="email" class="form-control" id="email" placeholder="Email or Username">
  					</div>
  					<div class="form-group">
    					<input type="password" class="form-control" id="pwd" placeholder="Password">
  					</div>
  					<div class="checkbox">
    					<label><input type="checkbox"> Remember me</label>
  					</div>
  					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
  			
		</div><!-- /.row -->

		{{.Count}}
		{{.User}}
    </div><!-- /.container -->
    
	
  </body>
  
  	

</html>
