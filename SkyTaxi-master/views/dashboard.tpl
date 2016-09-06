
	<script>
		function expandForm(event){
			var fid = event.data.param1 
			console.log(fid+" Pressed!!!");
		
			if( $('#formtaps'+fid).is(':visible') ) {
				$("#formtaps"+fid).css("display", "none");
			}
			else {
				$("#formtaps"+fid).removeAttr("style")
			}
		}
	</script>
	
	<h3>Sites</h3>
	
	<div id="grer" class="row">
	
		<div class="col-sm-12">
			<div class="gr"	>
			
				<input id="pac-input" class="controls" type="text" placeholder="Search Box">
				<div  id="googleMap" style="height:380px;"></div>
				
				<button id="addtaps" type="button" class="btn btn-info btn-sm top-btm-mar"> 
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add location
				</button>
				
			</div>
		</div>
		
		{{range $key, $val := .s}}
		<div id="gr{{$key}}" class="col-xs-12 col-sm-6">
			<div class="gr">
				
				<img class="imgfit" src="/static/uploads/1466004863.781507" >
				
				<div class="row">
				
				<div class="col-xs-6 col-sm-6 col-md-6">
				<div class="">
				<button id="taps{{$key}}" type="button" class="btn btn-info btn-sm top-btm-mar"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit
				</button>
				</div>
				</div>
				
				<div class="col-xs-6 col-sm-6 col-md-6">
				<div class="center">
				<h4>{{$val.Name}}</h4>
				</div>
				</div>
				
				</div>
				
				<div id="formtaps{{$key}}" style="display: none">
				  <form id="formtarget{{$key}}">
				  <fieldset class="form-group">
					<label for="exampleInputEmail1">Main Title</label>
					<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter title" value="{{$val.Name}}">
					<small class="text-muted">The main title for the location.</small>
				  </fieldset>
				  
				  <fieldset class="form-group">
					<label for="exampleInputEmail2">Latitude and Longitude</label>
					<input type="text" class="form-control" id="exampleInputEmail2" placeholder="0.000, 0.000">
					<small class="text-muted">Search a place in the map.</small>
				  </fieldset>
				  
				  <fieldset class="form-group">
					<label for="exampleTextarea">Detail and information</label>
					<textarea class="form-control" id="exampleTextarea" rows="3">{{$val.Description}}</textarea>
					<small class="text-muted">Additional information of the location.</small>
				  </fieldset>
				  
				  <fieldset class="form-group">
					<label for="exampleInputFile">Image File Upload</label>
					<input type="file" class="form-control-file" id="exampleInputFile">
					<small class="text-muted">Add one image at a time. You should see it update above.</small>
				  </fieldset>
				  <div class="radio">
					<label>
					  <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
					  Allow site to be used by other pilots.&mdash;Please read our documentation.
					</label>
				  </div>
				  <div class="radio">
					<label>
					  <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
					  Don't allow others to use this site.&mdash;Please read our documentation.
					</label>
				  </div>
				  
					
					<div class="row">
					
					<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="center">
					<button type="submit" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span> Save</button>
					</div>
					</div>
					
					<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="center">
					<button type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete</button>
					</div>
					</div>
					
					</div> <!-- /formbutton row -->
					<span id="validspan"></span>
				  
				  </form> <!-- /form -->
				</div> <!-- /formtaps{{$key}} -->
				
			</div>
		</div ><!-- /gr[{{$key}}] -->
		
		<!-- JavaScript for this GR
		================================================== -->
		<script>
			$( "#taps{{$key}}" ).click({param1: "{{$key}}", param2: "Hello"}, expandForm);
		</script>
		
		{{end}}
	</div><!-- /.row -->

    
    <!-- Form JavaScript
    ================================================== -->
	<script>
	
	
	$( "#formtarget1" ).submit(function( event ) {
// 		if ( $( "input:first" ).val() === "correct" ) {
//     		$( "span" ).text( "Validated..." ).show();
//     		return;
//     	}
 
  		$( "#validspan" ).text( "Not valid!" ).show().fadeOut( 1000 );
  		event.preventDefault();
	});
		
	$( "#addtaps" ).click(function() {
		//add a gr div
		
		// get the last DIV which ID starts with ^= "gr"
		var $div = $('div[id^="gr"]:last');

		// Read the Number from that DIV's ID (i.e: 3 from "gr3")
		// And increment that number by 1
		var num = parseInt( $div.prop("id").match(/\d+/g), 10 ) +1;

		// Clone it and assign the new ID (i.e: from num 4 to ID "gr4")
		var $gr = $div.clone().prop('id', 'gr'+num );

		// >>> Append $gr to grer
		var grer = $( "#grer" );
		$gr.appendTo( "#grer" );
		
		
	});
	</script>
    
    <!-- GoogleMaps JavaScript
    ================================================== -->
	<script>
	function initialize() {
		
		var myLatLng = {lat: 29.635297, lng: -97.811828};
			
		map = new google.maps.Map(document.getElementById('googleMap'), {
			center: myLatLng,
			zoom: 5,
			mapTypeId:google.maps.MapTypeId.ROADMAP
		});
	  	  
		var marker = new google.maps.Marker({
			position: myLatLng,
			map: map,
			title: 'Hello World!'
		});
		
		// Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
	}
	</script>
	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCe0nP7shAV5llFp0QA19Fa0AYTFcJqFAM&libraries=places&callback=initialize"
         async defer></script>
	
