<?php
	echo '<div id=pos30 ></div><div id=avatar ><img src=views/avatar.jpg /><p>
		<input id=like type=button name = ' . $fst_arg[0]['IdUser'] . 
		'U value = ' . $fst_arg[0]['IsLiked'] . ' /></p></div>' . 
		'<div id=user_inf><h2>' . $fst_arg[0]['Name'] . ' ' . $fst_arg[0]['Surname'] . '</h2>' . 
		'<p>' . $fst_arg[0]['Nickname'] . '</p>' . 
		'<p>Company: ' . $fst_arg[0]['Company'] . '</p>' . 
		'<p>Blog: <a href=' . $fst_arg[0]['Blog'] . '>' . $fst_arg[0]['Blog'] . '</a></p>' . 
		'<p>Followers: ' . $fst_arg[0]['Followers'] . '</p></div>'
	;
?>