<?php
	
	include('core/init.php');

	if(isset($_POST['btnAttendance'])){

		$code = $globalclass->validateInput($_POST['code']);
		$course_code = $globalclass->validateInput($_POST['course_code']);
		$lecturer_id = $globalclass->validateInput($_POST['lecturer_id']);
		$course_id = $globalclass->validateInput($_POST['course_id']);
		$session = $globalclass->validateInput($_POST['session']);
		$semester = $globalclass->validateInput($_POST['semester']);
		$matricno = $globalclass->validateInput($_POST['matricno']);

		$date = date("d M Y");
		$time_in = date("g:i A");
		$time_out = date("g:i A");

		if($globalclass->selectByOneColumn('matricno','tbluser',$matricno)){

			if($attendance->checkAttendance($matricno,$lecturer_id,$course_code,date('Y-m-d')) === true){
				echo "<script>alert('Attendance already taken')</script>";
			}else if($attendance->checkAttendance($matricno,$lecturer_id,$course_code,date('Y-m-d')) === false){
				if($attendance->addAttendance($matricno,$lecturer_id,$course_code,$date,$time_in,$time_out,$session,$semester) === true){
					$_SESSION['attendance_status'] = true;
					$_SESSION['sid'] = $matricno;
					header('location: take-attendance?code='.$code);
				}
			}

		}else if(!$globalclass->selectByOneColumn('matricno','tbluser',$matricno)){
			echo "<script>alert('Student Record Does Not Exist')</script>";
			#unset($_SESSION['ErrorMessage']);
			header('location: take-attendance?code='.$code);
		}		

	}

?>