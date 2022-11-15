<?php

$mysqli = mysqli_connect("localhost", "team01", "team01", "team01", "3307");

if(mysqli_connect_errno()){
    printf("Connected failed : %s\n", mysqli_connect_error());
    exit();
} else {
    $sql = "select * from festival order by kor_title";
    $res = mysqli_query($mysqli, $sql);
}
?>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <link rel="stylesheet" href="./list.css" />
        <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <div class="header_container">
            <header>
                <div class="navigator">
                    <nav>
                        <ul>
                            <li><a href="">영화 살펴보기</a></li>
                            <li><a href="">영화제 살펴보기</a></li>
                        </ul>
                    </nav>
                </div>
                <h2>MOVIENG</h2>
                <div class="profile">
                    <nav>
                        <a href="">프로필</a>
                    </nav>
                </div>
            </header>
        </div>
        <div class="festival_container">
            <div class="festival_title_container"><span class="festival_title">영화제 목록</span></div>
            <?php 
                if ($res) {
                    while($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC)) { ?>
                        <div class="festival_container">
                            <span class="festival_title"><?php $title = $newArray['kor_title']; echo $title;?></span></br>
                            <span class="festival_nation"><?php $nation = $newArray['nation']; echo $nation;?></span>
                            <span class="festival_city"><?php $city = $newArray['city']; echo $city;?></span></br>
                            <span class="festival_url"><?php $url = $newArray['url']; echo $url;?></span></br>
                        </div>
                    <?php }
                    mysqli_free_result($res);
                } else {
                    printf("결과를 불러오는 데 실패하였습니다 : %s\n", mysqli_error($mysqli));
                } ?>
        </div>
    </body>
</html>