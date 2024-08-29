<?php 
   
   require('core/init.php'); 
   include('asset/phpqrcode/qrlib.php'); 

   if(isset($_GET['code']) AND !empty($_GET['code'])){

      $lecture_code = $_GET['code'];

      $getCodeInfo = $globalclass->selectByOneColumn('code','tblcode',$lecture_code);
      $getCourseData = $globalclass->selectByOneColumn('course_code','tblcourse',$getCodeInfo->course_code);

      $date = date('Y-m-d');
      $time = date("g:i A");
      $course_id = $getCodeInfo->course_id;
      $course_code = $getCodeInfo->course_code;
      $semester = $getCodeInfo->semester;
      $session = $getCodeInfo->session;
      $lecturer_id = $getCodeInfo->lecturer_id;

      $_SESSION['attendance_status'] = false;

      $getAttendanceData = $getCodeInfo = $globalclass->selectByOneColumn('code','tblcode',$lecture_code);
      $getDate = $globalclass->timeAgo($getAttendanceData->created_at);

      #echo $getDate;exit();

   }else{
      header('location: ./');
   }

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

         if($attendance->checkAttendance($matricno,$lecturer_id,$course_code,$date) === true){
            echo "<script>alert('Attendance already taken')</script>";
         }else if($attendance->checkAttendance($matricno,$lecturer_id,$course_code,$date) === false){
            if($attendance->addAttendance($matricno,$lecturer_id,$course_code,$date,$time_in,$time_out,$session,$semester,$code) === true){
               $_SESSION['attendance_status'] = true;
               $_SESSION['sid'] = $matricno;
            }
         }

      }else if(!$globalclass->selectByOneColumn('matricno','tbluser',$matricno)){
         echo "<script>alert('Student Record Does Not Exist')</script>";
      }     

   }

?>
<!DOCTYPE html>
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="asset/css/bootstrap.min.css">
      <style>
         .popup {
             position: fixed;
             top: 0;
             width: 100vw;
             height: 100vh;
             background-color: rgba(0, 0, 0, .3);
             display: grid;
             place-content: center;
             opacity: 0;
             pointer-events: none;
             transition: 200ms ease-in-out opacity;
             color: black;
         }
         .popup-content {
             width: clamp(300px, 90vw, 500px);
             background-color: #fff;
             padding: clamp(1.5rem, 100vw, 3rem);
             box-shadow: 0 0 .5em rgba(0, 0, 0, .5);
             border-radius: .5em;
             opacity: 0;
             transform: translateY(20%);
             transition: 200ms ease-in-out opacity,
                         200ms ease-in-out transform;
             position: relative;
             color: black;
         }
         .popup h1 {
             position: absolute;
             top: 2rem;
             right: 2rem;
             line-height: 1;
             cursor: pointer;
             user-select: none;
         }
         .popup h1:active {
             transform: scale(.9);
         }

         .showPopup {
             opacity: 1;
             transform: translateY(0);
             pointer-events: all;
         }
      </style>
   </head>
   <body>

      <div class="container-fluid">
         <h2 class="mt-3 mb-3 text-center">Student Attendance System Using QR Code</h2>
         <p class="mt-3 mb-3 text-center">(A Case Study of Computer Science Department)</p>
         <p class="mt-3 mb-3 text-center">Course Title: <?= strtoupper($getCourseData->course_title); ?></p>
         <p class="mt-3 mb-3 text-center">Course Code: <?= ucwords($course_code); ?></p>
         <p class="mt-3 mb-3 text-center">Session: <?= ucwords($session); ?></p>

         <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 mt-1">
               <?php if($getDate == "2"): ?>
               <p style="font-weight: bold;text-align: center;">Enter your matric number in the text field below</p>
               <form method="POST" id="myForm" class="form-horizontal">
                  <div class="form-group">
                     <label hidden>QR Code</label>
                     <input class="form-control" type="hidden" name="code" id="code" value="<?= $_GET['code']; ?>" readonly="">
                     <input class="form-control" type="hidden" name="course_code" id="course_code" value="<?= $getCourseData->course_code; ?>" readonly="">
                     <input class="form-control" type="hidden" name="lecturer_id" id="lecturer_id" value="<?= $lecturer_id; ?>" readonly="">
                     <input class="form-control" type="hidden" name="course_id" id="course_id" value="<?= $course_id; ?>" readonly="">
                     <input class="form-control" type="hidden" name="session" id="session" value="<?= $session; ?>" readonly="">
                     <input class="form-control" type="hidden" name="semester" id="semester" value="<?= $semester; ?>" readonly="">
                     <input class="form-control" type="text" name="matricno" id="matricno" placeholder="Please input your matric number" >
                     <input type="submit" name="btnAttendance" value="Submit" class="btn btn-primary mt-2">
                  </div>
               </form>
               <?php endif; ?>

               <?php if($getDate == "expire"): ?>
                  <h3 class="text-center text-info h1">Attendance has closed</h3>
               <?php endif; ?>
            </div>
            <div class="col-md-3"></div>

            <?php 
               if($_SESSION['attendance_status'] === true){ 

                  if($globalclass->selectByOneColumn('matricno','tbluser',$_SESSION['sid'])){ 

                        $getStudentDetails = $globalclass->selectByOneColumn('matricno','tbluser',$_SESSION['sid']);
                  
               ?>
               <?php if(isset($getStudentDetails)): ?>
               <div class="popup">
                  <div class="popup-content">
                     <h1>x</h1>
                     <h2 style="text-align: center;">Student Information</h2>
                     <center><img class="img-profile m-2" src="image/<?= $getStudentDetails->picture; ?>" width="150px" height="150px"></center>
                     <p style="text-align: center;">
                        Matric No: <?= $getStudentDetails->matricno; ?> <br>
                        Full Name: <?= strtoupper($getStudentDetails->fullname); ?> <br>
                        Gender: <?= $getStudentDetails->gender; ?> <br>
                        Level: <?= $getStudentDetails->level; ?> <br>
                        Program: <?= $getStudentDetails->program; ?> <br>
                        Department: <?= $getStudentDetails->department; ?> <br>
                        Faculty: <?= $getStudentDetails->faculty; ?> <br>
                        <span class="badge bg-success text-white">Attendance Marked</span>
                     </p>
                  </div>
               </div>
               <?php 
                     endif; 
                  }
               }
               ?>

         </div>
      </div>

      <script>
        const popup = document.querySelector('.popup');
        const x = document.querySelector('.popup-content h1')

        window.addEventListener('load', () => {
            popup.classList.add('showPopup');
            popup.childNodes[1].classList.add('showPopup');
        })
        x.addEventListener('click', () => {
            popup.classList.remove('showPopup');
            popup.childNodes[1].classList.remove('showPopup');
        })
      </script>

   </body>
</html>