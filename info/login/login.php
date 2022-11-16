<?php 
    $mysqli = mysqli_connect("localhost", "team01", "team01", "team01", "3307")

     or die('데이터 베이스가 없습니다.');

    $email = $_POST['useremail'];
    $password = $_POST['userpw'];

    $sql = "SELECT * FROM user WHERE email ='{$email}'";
    $result = mysqli_query($mysqli, $sql);
     
    $row = mysqli_fetch_array($result);
    $hashedPassword = $row['password'];
    echo $row['email'];

    $passwordResult = password_verify($password, $hashedPassword);
    if ($passwordResult === true) {
         session_start(); //로그인 시 유저 기억하는 세션 시작
         $_SESSION['useremail'] = $row['email'];
         $_SESSION['username']=$row['nickname'];
         $_SESSION['userid']=$row['user_id'];
         print_r($_SESSION);
         echo $_SESSION['useremail'];
         
     ?>
         <script>
             alert("로그인에 성공하였습니다.")
             location.href = "../home/home.php";
         </script>
     <?php
     } else {
         // 로그인 실패 
     ?>
         <script>
             alert("로그인에 실패하였습니다");
             history.back();
         </script>
     <?php
     }
     ?>
