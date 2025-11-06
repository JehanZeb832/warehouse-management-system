<?php 
	require_once '../init.php';

	if (isset($_POST)) {
		$username = $_POST['username'];
		$password = $_POST['password'];
		$password = md5($password);
		$user_role = $_POST['user_role'];


		if (!empty($username) && !empty($password) && !empty($user_role)  ) {
				$query = array('username' => $username , 'password' => $password, 'user_role' => $user_role);

               		  $res = $obj->create('user' , $query);

               		 if ($res) {
               		 	echo "User Data added Successful";
               		 }else{
               		 	echo "Data added failed";
               		 }
		}else{
			echo "all_field must be field out";
		}
	}

 ?>