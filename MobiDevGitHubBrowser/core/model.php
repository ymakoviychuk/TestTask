<?php
	class Model
	{
		private function connection()
		{
			$host = 'localhost';
			$user = 'root';
			$db = 'gitdb';
			$pass = '';
			
			try
			{
			  $db = new PDO('mysql:host='.$host.';dbname='.$db, $user, $pass);
			  
			  $db->query("set_client='utf8'");
			  $db->query("set character_set_results='utf8'");
			  $db->query("set collation_connection='utf8_general_ci'");
			  $db->query("SET NAMES utf8");
			  
			  return $db;
			}
			catch (PDOException $e)
			{
			  die( $e->getMessage() );
			}
		}
		
		public function get_project($id)
		{
			$db = $this->connection();
			
			$result = $db->query("SELECT projects.*, users.Nickname
				FROM projects
					INNER JOIN users
						ON projects.IdOwner = users.IdUser
				WHERE projects.IdProject = '$id'");
				
			return $result->fetchAll();
		}
		
		public function get_user($id)
		{
			$db = $this->connection();
			
			$result = $db->query("SELECT *
				FROM users
				WHERE IdUser = '$id'");
				
			return $result->fetchAll();
		}
		
		public function get_project_users($id_project)
		{
			$db = $this->connection();
			
			$result = $db->query("SELECT users.IdUser, users.Nickname
				FROM projectsusers
					INNER JOIN users
						ON projectsusers.IdUser = users.IdUser
				WHERE IdProject = '$id_project'");
				
			return $result;
		}
		
		public function set_like($table, $id, $status)
		{
			$db = $this->connection();
			
			$result = $db->exec("UPDATE $table
				SET IsLiked = '$status'
				WHERE Id = '$id'");
		}
		
		public function find($subject)
		{
			$db = $this->connection();
			
			$result = $db->query("SELECT projects.*, users.Nickname
				FROM projects
					INNER JOIN users
						ON projects.IdOwner = users.IdUser
				WHERE projects.Name LIKE '%$subject%'");
				
			return $result->fetchAll();
		}
	}
?>