<?php
	class Router
	{
		public static function start()
		{	
			$controller = new Controller();
			
			if(!empty($_GET['project']))
			{
				$controller->main($_GET['project']);
			}
			else if(!empty($_GET['user']))
			{
				$controller->get_user($_GET['user']);
			}
			else if(!empty($_GET['search']))
			{
				$controller->search($_GET['search']);
			}
			else if(!empty($_GET['name']))
			{
				$controller->like($_GET['name'], $_GET['val']);
			}
			else
			{
				$controller->main();
			}
		}
	}
?>