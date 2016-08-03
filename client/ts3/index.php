<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>TimeSync Login</title>
    <link rel="stylesheet" href="login_style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

  </head>
<body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>TimeSync</h1>
			</div>

			<div class="login-form">
				<div class="control-group">
				<input type="text" class="login-field" value="" placeholder="username" id="login-name" required>
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>

				<div class="control-group">
				<input type="password" class="login-field" value="" placeholder="password" id="login-pass" required>
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>

				<a type='button' class="btn btn-primary btn-large btn-block" id='btnLogin'>Login</a>
				<a class="login-link" href="#">Lost your password?</a>
			</div>
		</div>
	</div>

    <script>
    $('#btnLogin').click(function(e) {
    	e.preventDefault();
    	var data = {"userid": $('#login-name').val(), "credential": $('#login-pass').val()};
			console.log(data);    	
			$.post('/_ts3/token', {"auth": JSON.stringify(data)}, function(result) {
				var jwt = result.jwt;
				//login failed
				if (typeof jwt === 'undefined') {
					localStorage.removeItem('jwt');
					alert('login failed');
				}
				else {
					localStorage.setItem('jwt', jwt);
					window.location.href="/ts3/app.php?t="+jwt;
					// $.ajax({
					// 	url: '/beta/app.php', 
					// 	beforeSend: function(request) {
					// 		request.setRequestHeader('Authorization', 'Bearer ' + jwt);
					// 	},
					// 	type: 'GET',
					// 	success: function(appdat) {
					// 		document.write(appdat);
					// 	},
					// 	error: function() {
					// 		alert('error');
					// 	}
					// });
				}
			})
			.fail(function(){
				localStorage.removeItem('jwt');
				console.log("Failed to log in");
				alert('login failed');
			});
		});
    </script>

</body>

</html>
