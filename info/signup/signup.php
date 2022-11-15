<?php 
    $mysqli = mysqli_connect('localhost', 'team01', 'team01', 'team01', '3306')
     or die('데이터 베이스가 없습니다.');

     $hashedPassword = password_hash($_POST['userpw'], PASSWORD_DEFAULT);
     echo $hashedPassword;
     $insertsql = "
         INSERT INTO user
         (email, password, nickname)
         VALUES('{$_POST['useremail']}', '{$hashedPassword}', '{$_POST['username']}'
         )";
     $insertresult = mysqli_query($mysqli, $insertsql);
     
     $selectsql = "SELECT user_id FROM user WHERE email='{$_POST['useremail']}'";
     $selectresult = mysqli_query($mysqli, $selectsql);
     $row = mysqli_fetch_array($selectresult);

     $biosettingsql = "
     INSERT INTO profile
     (user_id,bio) VALUES('{$row['user_id']}','Hello.')";
     $bioresult = mysqli_query($mysqli, $biosettingsql);
     
     if ($bioresult === false) {
         echo "회원 가입에 실패하였습니다.";
         echo mysqli_error($mysqli);
     } else {
     ?>
         <script>
             alert("회원가입이 완료되었습니다");
             location.href = "../home/home.php";
         </script>
     <?php
     }
     ?>