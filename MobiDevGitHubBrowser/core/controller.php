<?php
	class Controller
	{
		private $model;
		private $view;
		
		public function __construct()
		{
			$this->model = new Model;
			$this->view = new View;
		}
		public function main($id_project = 1)
		{
			$project = $this->model->get_project($id_project);
			$users = $this->model->get_project_users($id_project);
			
			$this->view->generate('Main', $project, $users);
		}
		public function get_user($id_user)
		{
			$user = $this->model->get_user($id_user);
			
			$this->view->generate('User', $user);
		}
		public function search($subject)
		{
			$result = $this->model->find($subject);
			
			$this->view->generate('Search', $result, $subject);
		}
		public function like($name, $status)
		{
			$table = substr($name, strlen($name)-1, strlen($name));
			$id = substr($name, 0, -1);
			
			switch($table)
			{
				case 'P':
					$table = 'projects';
					$field = 'IdProject';
					break;
				case 'U':
					$table = 'users';
					$field = 'IdUser';
					break;
			}
			
			switch($status)
			{
				case 'Unlike':
					$status = 0;
					break;
				case 'Like':
					$status = 1;
					break;
			}
			
			$this->model->set_like($table, $field, $id, $status);
			
			echo $status;
		}
	}
?>
