<!DOCTYPE html>
<head>
  <script id="digits-sdk" src="https://cdn.digits.com/1/sdk.js" async></script>
</head>

<script>
/* Initialize Digits for Web using your application's consumer key that Fabric generated */
document.getElementById('digits-sdk').onload = function() {
  Digits.init({ consumerKey: 'yourConsumerKey' });
};

/* Launch the Login to Digits flow. */
function onLoginButtonClick(event){
  Digits.logIn()
    .done(onLogin) /*handle the response*/
    .fail(onLoginFailure);
}

/* Validate and log use in. */
function onLogin(loginResponse){
  // Send headers to your server and validate user by calling Digits’ API
  var oAuthHeaders = loginResponse.oauth_echo_headers;
  var verifyData = {
    authHeader: oAuthHeaders['X-Verify-Credentials-Authorization'],
    apiUrl: oAuthHeaders['X-Auth-Service-Provider']
  };

  $.post('/verify', verifyData)
    .done(function(){ window.reload(); });
}

</script>



</html>