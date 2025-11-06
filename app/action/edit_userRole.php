<?php 
	require_once '../init.php';
	if (isset($_POST)) {
		$user_id = $_POST['user_id'];
		$user_role = $_POST['user_role'];
			$query = array(
				'user_role' => $user_role
			);
			$res = $obj->update('user','id',$user_id,$query);

			if ($res) {
				echo " change permission status ";
			}else{
				echo "Failed change permission status  ";
			}
	}
 ?>