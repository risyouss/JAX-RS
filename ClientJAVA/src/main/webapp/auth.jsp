<!DOCTYPE html>
 <head> 
<meta charset="UTF-8">
</head>
<body>
<center>
<h1>Login Page</h1> 
<script>

 function statusChangeCallback(response) {
 console.log('statusChangeCallback');
 console.log(response);

 if (response.status === 'connected') {

 testAPI();
 } else if (response.status === 'not_authorized') {
 // The person is logged into Facebook, but not your app.
 document.getElementById('status').innerHTML = 'Login with Facebook ';
 } else {
 // The person is not logged into Facebook, so we're not sure if
 // they are logged into this app or not.
 document.getElementById('status').innerHTML = 'Login with Facebook ';
 }
 }
 // This function is called when someone finishes with the Login
 // Button. See the onlogin handler attached to it in the sample
 // code below.
 function checkLoginState() {
 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 }
 window.fbAsyncInit = function() {
 FB.init({ 
 appId : '748099770285691',
 cookie : true, // enable cookies to allow the server to access 
 // the session
 xfbml : true, // parse social plugins on this page
 version : 'v2.2' // use version 2.2
 });

 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 };
 // Load the SDK asynchronously
 (function(d, s, id) {
 var js, fjs = d.getElementsByTagName(s)[0];
 if (d.getElementById(id)) return;
 js = d.createElement(s); js.id = id;
 js.src = "//connect.facebook.net/en_US/sdk.js";
 fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk')); 

 // Here we run a very simple test of the Graph API after login is
 // successful. See statusChangeCallback() for when this call is made.
 function testAPI() { 
 console.log('Welcome! Fetching your information.... ');
 FB.api('/me?fields=name,email', function(response) {
 console.log('Successful login for: ' + response.name); 
 
 document.getElementById("status").innerHTML = '<p>Welcome '+response.name+'! <a href=index.jsp?user_name='+ response.name.replace(" ", "_") +'&user_email='+ response.email +'>Continue with facebook login</a></p>'
 });
 } 
</script> 
<!--
 Below we include the Login Button social plugin. This button uses
 the JavaScript SDK to present a graphical Login button that triggers
 the FB.login() function when clicked.
-->
<br><br>
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
<div id="status">
</div> 
 <script type="text/javascript">
</script>
</center>
</body>
</html>