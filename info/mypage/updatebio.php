<?php 
session_start();

    $mysqli = mysqli_connect("localhost", "team01", "team01", "team01", "3307")
     or die('데이터 베이스가 없습니다.');

     $sql = "
         UPDATE profile
         SET bio='{$_POST['userbio']}'
         WHERE user_id='{$_SESSION['userid']}'";
     echo $sql;
     $result = mysqli_query($mysqli, $sql);
     
     if ($result === false) {
         echo "바이오 수정에 실패하였습니다.";
         echo mysqli_error($mysqli);
     } else {
     ?>
         <script>
             alert("바이오 수정이 완료되었습니다");
             location.href = "./mypage.php";
         </script>
     <?php
     }
     ?>