<div id='pos30'></div>
<div>
	<h3>For search term "<?php echo $snd_arg; ?>" found</h3>
	<div class='search border'>
		Name homepage owner</br>
		description</br>
		watchers forks
	</div>
	<?php
		foreach($fst_arg as $row)
		{
			echo "<div class='search border'>
				<a href='index.php?project=$row[IdProject]'>$row[Name]</a> 
				<a href='$row[HomePage]'>$row[HomePage]</a>
				<a href='index.php?user=$row[IdOwner]'>$row[Nickname]</a></br>
				$row[Description]</br>
				watchers: $row[Watchers] forks: $row[Forks]
				</div>";
		}
	?>
</div>