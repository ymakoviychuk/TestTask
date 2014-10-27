<html>
	<head>
		<link rel='stylesheet', type='text/css', href='views/style.css'/>
		<script type='text/javascript' src='core/jquery-2.1.1.min.js'></script>
	</head>
	<body>
		<div class='border' id='navbar'>
			<?php require_once 'views/navbar.php'; ?>
			<form id='search_form' action='/MobiDevGitHubBrowser/index.php' method='get'>
				<input type='search' name='search' placeholder='Search. Min 3 symbols' pattern='.{3,}' />
			</form>
		</div>
		<div id='content' class='border'>
			<?php require_once 'views/' . $content . '.php'; ?>
			<div id='clear'></div>
		</div>
		<script type='text/javascript' src='core/like.js'></script>
	</body>
</html>