<?php
session_start();
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="./home.css" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movieng</title>
</head>
<body>
    <div class="home_profile_container">
        <?php
            if (isset($_SESSION['useremail'])) {
        ?>
            <div class="profile_content"><h1><?php echo $_SESSION['username'] ?>님, <br/> 반갑습니다 </h1></div>
            <div class="profile_btn"><a href="../mypage/mypage.php">마이 페이지</a></div>
            <div class="profile_btn"><a href="./logout.php">로그아웃</a></div>
        <?php
            } else {
        ?>
            <div class="profile_content"><h1>지금 바로, <br/> 무빙과 함께 해요</h1></div>
            <div class="profile_btn"><a href="../signup/signup.html">회원 가입</a></div>
            <div class="profile_btn"><a href="../login/login.html">로그인</a></div>
        <?php
            }
        ?>
    </div>
    <div class="home_title_container">
        <div class="home_content">영화인들을 위한 종합 영화 커뮤니티</div>
        <div class="home_title"><a class="title_txt" href="">MOVIENG</a></div>
        <div class="home_content">영화 리뷰 | 영화제 동행 모집</div>
    </div>
    <div class="home_menu_container">
    </div>
</body>
</html>