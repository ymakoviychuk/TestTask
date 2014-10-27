<div id='project'>
	<div>
		<?php
			echo '<h2>' . $fst_arg[0]['Name'] . '</h2>' . 
				'<p>Owner: <a href = index.php?user=' . $fst_arg[0]['IdOwner'] . '>' . $fst_arg[0]['Nickname'] . '</a></p>' . 
				'<p>Description: ' . $fst_arg[0]['Description'] . '</p>' . 
				'<p>Watchers: ' . $fst_arg[0]['Watchers'] . '</p>' . 
				'<p>Forks: ' . $fst_arg[0]['Forks'] . '</p>' . 
				'<p>Open issues: ' . $fst_arg[0]['OpenIssues'] . '</p>' . 
				'<p>Homepage: <a href = ' . $fst_arg[0]['HomePage'] . '>' . $fst_arg[0]['HomePage'] . '</a></p>' . 
				'<p>GitHub repo: <a href = ' . $fst_arg[0]['GitHubRepo'] . '>' . $fst_arg[0]['GitHubRepo'] .'</a></p>' . 
				'<p>created at: ' . $fst_arg[0]['DateCreation'] . '</p>' .
				'<input id = like type = button name = ' . $fst_arg[0]['IdProject'] . 'P value = ' . $fst_arg[0]['IsLiked'] . ' />';
		?>
	</div>
</div>
<div id='users'>
	<div>
		<h2>Contributors:</h2>
			<?php
				foreach($snd_arg as $row)
				{
					echo '<p><a href = index.php?user=' . $row['IdUser'] . '>' . $row['Nickname'] . '</a></p>';
				}
			?>
	</div>
</div>