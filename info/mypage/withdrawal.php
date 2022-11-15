<?php 
session_start();

    $mysqli = mysqli_connect('localhost', 'team01', 'team01', 'team01', '3307')
     or die('데이터 베이스가 없습니다.');

     $sql = "
         Delete from user
         WHERE user_id='{$_SESSION['userid']}'";
     echo $sql;
     $result = mysqli_query($mysqli, $sql);

     $sql2 = "Delete from profile WHERE user_id='{$_SESSION['userid']}'";
     $result2 = mysqli_query($mysqli, $sql);
     
     if ($result === false || $result2 === false) {
         echo "회원 탈퇴에  실패하였습니다.";
         echo mysqli_error($mysqli);
     } else {
        session_destroy();
    ?>
         <script>
             alert("회원 탈퇴가 완료되었습니다");
             location.href = "../home/home.php";
         </script>
     <?php
     }
     ?>