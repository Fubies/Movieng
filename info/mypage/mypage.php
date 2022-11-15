<?php
session_start();
    $mysqli = mysqli_connect("localhost", "team01", "team01", "team01", "3307")
     or die('데이터 베이스가 없습니다.');

    //$sql = "SELECT bio FROM user, profile WHERE user.user_id=profile.user_id and user.user_id = '{$_SESSION['userid']}'";
    $sql = "SELECT * FROM user, profile WHERE user.user_id=profile.user_id and user.user_id = '{$_SESSION['userid']}'";
    $result = mysqli_query($mysqli, $sql);
     
    $row = mysqli_fetch_array($result);

    $isEdit= false;
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="./mypage.css" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mypage</title>
</head>
<body>
    <div class="profile_container">
        <h1><?php echo $_SESSION['username'] ?>님의 페이지</h1>
        <div class="circle"></div>
        <div class="bio"><?php echo $row['bio']; ?></div>
        <div class="btn_wrap">
            <div class="profile_btn"><a href="./updatebio.html">바이오 수정</a></div>
            <div class="profile_btn"><a href="./withdrawal.php">회원 탈퇴</a></div>
        </div>
        <div class="profile_btn2"><a href="../home/home.php">홈 돌아가기</a></div>
    </div>
    <script>
    </script>
</body>
</html>