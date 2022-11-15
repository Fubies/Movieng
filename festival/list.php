<?php
session_start();

$mysqli = mysqli_connect("localhost", "root", "", "team01", "3306");

if(mysqli_connect_errno()){
    printf("Connected failed : %s\n", mysqli_connect_error());
    exit();
} else {
    $sql = "SELECT * FROM festival ORDER BY kor_title";
    $res = mysqli_query($mysqli, $sql);
}
?>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <link rel="stylesheet" href="./list.css" />
        <link rel="stylesheet" href="./base.css" />
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
                            <li><a href="../movie/list.php">영화 살펴보기</a></li>
                            <li><a href="./list.php">영화제 살펴보기</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="logo" onclick="location.href='../info/home/home.php';"><h2>MOVIENG</h2></div>
                <div class="profile">
                    <nav>
                        <a href="../info/mypage/mypage.php">프로필</a>
                    </nav>
                </div>
            </header>
        </div>

        <div class = "content">
            <div class="festival_container">
                <div class="festival_title_container"><span class="festival_title">영화제 목록</span></div>
                <?php 
                    if ($res) {
                        while($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC)) { ?>
                            <div class="festival_list_container">
                                <span class="festival_title"  onclick="window.location.href='./detail.php?festival_id=<?=$newArray['festival_id']?>'"><?php $title = $newArray['kor_title']; echo $title;?></span></br></br>
                                <span class="festival_nation"  onclick="window.location.href='./detail.php?festival_id=<?=$newArray['festival_id']?>'"><?php $nation = $newArray['nation']; echo $nation;?></span>
                                <span class="festival_city"  onclick="window.location.href='./detail.php?festival_id=<?=$newArray['festival_id']?>'"><?php $city = $newArray['city']; echo $city;?></span></br></br>
                                <button class="festival_interest_btn" onclick="window.location.href='./interest.php?festival_id=<?=$newArray['festival_id']?>'">
                                    가고 싶어요
                                    <?php $interest_count = $newArray['interest_count'];?></a>
                                    <span class="festival_interest_cnt">
                                        <?php echo $interest_count;?>
                                    </span>
                                </button>
                            </div>

                        <?php }
                        mysqli_free_result($res);
                    } else {
                        printf("결과를 불러오는 데 실패하였습니다 : %s\n", mysqli_error($mysqli));
                    } ?>
            </div>
        </div>
    </body>
</html>