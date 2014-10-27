<?php
	class View
	{
		private $navbar = array('MobiDev GitHub Browser >> ');
		
		public function generate($navbar, $fst_arg, $snd_arg = null)
		{
			$this->navbar[] = $navbar;
			$content = strtolower($navbar);
			
			require_once 'views/template.php';
		}
	}
?>
