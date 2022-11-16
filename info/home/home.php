<?php
session_start();

$mysqli = mysqli_connect("localhost", "team01", "team01", "team01", "3307");

if(mysqli_connect_errno()) {
    printf("Connected failed : %s\n",mysqli_connect_error());
    exit();
}
else {
    //$sql = "select released_date, title from movie order by released_date desc limit 5";
    $sql = "select released_date, title, rank() over (order by released_date desc) as 'rank' from movie limit 5";
    $res = mysqli_query($mysqli, $sql);

    $sql2 = "select kor_title, city from festival where main='예' limit 5";
    $res2 = mysqli_query($mysqli, $sql2);

}
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
        <div class="home_title"><a class="title_txt" href="../../movie/list.php">MOVIENG</a></div>
        <div class="home_content"><a class="title_txt" href="../../movie/list.php">영화 리뷰 | 영화제 동행 모집</div>
    </div>
    <div class="home_menu_container">
        <div class="movies_home">
            <div class="menu_movie_upperWrap">
                <h2 class="menu_movie_title">최신 영화 리스트</h2>
                <a class="menu_movie_href" href="../../movie/list.php">더보기</a>
            </div>
            <hr />
            <div class="menu_movie_list">
                <table>
                    <tr>
                        <td><h4>제목</h4></td>
                        <td><h4>개봉년도</h4></td>
                    </tr>
                <?php if($res) {
                    while($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC)) { ?>
                    <tr>
                        <td><div class="menu_content"><?php $title = $newArray['title']; echo $title;?></div></td>
                        <td><div><?php $date = $newArray['released_date']; echo $date;?></div></td>
                    </tr>
                    <?php }
                        mysqli_free_result($res);
                    } else {
                        printf("결과 불러오는 데에 실패 : %s\n", mysqli_error($mysqli));
                    }?>
                </table>
            </div>
        </div>
        <div class="festivals_home">
                <div class="menu_movie_upperWrap">
                    <h2 class="menu_movie_title">주요 영화제 리스트</h2>
                    <a class="menu_movie_href" href="../../festival/list.php">더보기</a>
                </div>
                <hr />
                <div class="menu_movie_list">
                    <table>
                        <tr>
                            <td><h4>축제 이름</h4></td>
                            <td><h4>도시명</h4></td>
                        </tr>
                <?php if($res) {
                        while($newArray = mysqli_fetch_array($res2, MYSQLI_ASSOC)) { ?>
                        <tr>
                            <td><div class="menu_content_fest"><?php $title = $newArray['kor_title']; echo $title;?></div></td>
                            <td><div><?php $date = $newArray['city']; echo $date;?></div></td>
                        </tr>
                        <?php }
                            mysqli_free_result($res2);
                        } else {
                            printf("결과 불러오는 데에 실패 : %s\n", mysqli_error($mysqli));
                        }?>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>