<!DOCTYPE html>
<html>
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
    
    <!-- FileUpload -->
    <link href="/static/css/fileinput.min.css" rel="stylesheet">
    <script src="/static/js/file-input-js/fileinput.min.js"></script>
    
    
</head>

<body>

<div class="container">

	<form class="form-horizontal">
	<fieldset>

	<!-- Form Name -->
	<legend>New Charter Service</legend>

	<!-- Text input-->
	<div class="control-group">
	  <label class="control-label" for="name">Name</label>
	  <div class="controls">
		<input id="name" name="name" placeholder="Hellcat X2" class="input-xlarge" type="text">
		<p class="help-block">Name of Aircraft</p>
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="control-group">
	  <label class="control-label" for="make">Make</label>
	  <div class="controls">
		<input id="make" name="make" placeholder="Airbus" class="input-xlarge" type="text">
		<p class="help-block">Make or detail</p>
	  </div>
	</div>

	<!-- Text input-->
	<div class="control-group">
	  <label class="control-label" for="location">Location</label>
	  <div class="controls">
		<input id="location" name="location" placeholder="32.33221, 23.42113" class="input-xlarge" type="text">
		<p class="help-block">Coordinates of aircraft</p>
	  </div>
	</div>

	<!-- Select Basic -->
	<div class="control-group">
	  <label class="control-label" for="passcount">Max Passengers</label>
	  <div class="controls">
		<select id="passcount" name="passcount" class="input-xlarge">
		  <option>1</option>
		  <option>2</option>
		  <option>3</option>
		  <option>4</option>
		  <option>5</option>
		  <option>6</option>
		  <option>7</option>
		  <option>8</option>
		  <option>9</option>
		  <option>10</option>
		  <option>11</option>
		  <option>12</option>
		</select>
	  </div>
	</div>

	<!-- File Button --> 
	<label class="control-label">Select File</label>
    <input id="input-2" name="input2[]" type="file" class="file input-xlarge" multiple data-show-upload="false" data-show-caption="true">

	</fieldset>
	</form>

</div>
</body>
</html>
