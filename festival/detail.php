<?php
session_start();

$festival_id = $_GET['festival_id'];

$mysqli = mysqli_connect("localhost", "root", "", "team01", "3306");
if(mysqli_connect_errno()){
    printf("Connected failed : %s\n", mysqli_connect_error());
    exit();
} else {
    $sql = "SELECT * FROM festival WHERE festival_id='".$festival_id."'";
    $res = mysqli_query($mysqli, $sql);
    $info = mysqli_fetch_array($res, MYSQLI_ASSOC);

    $sql2 = "SELECT * FROM post WHERE festival_id='".$festival_id."'";
    $res2 = mysqli_query($mysqli, $sql2);
}

?>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <link rel="stylesheet" href="./detail.css" />
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

        <div class="content">
        <div class="festival_detail_container">
            <div class="title_container">
                <span class="kor_title"><?php $kor_title=$info['kor_title']; echo $kor_title;?></span></br>
                <span class="eng_title"><?php $eng_title=$info['eng_title']; echo $eng_title;?></span></br></br>
            </div>
        
            <div class="content_container">
              <div class="description_container">
                <span class="continent"><?php $continent=$info['continent']; echo "대륙 : $continent";?></span></br>
                <span class="nation"><?php $nation=$info['nation']; echo "나라 : $nation";?></span></br>
                <span class="city"><?php $city=$info['city']; echo "도시 : $city";?></span></br></br>
                <?php  $url=$info['url']; ?>
                <span class="url"><a href="<?php $url?>"><?php echo $url;?></a></span>
              </div>
              <div class="post_list_container">
                <div class="post_title"> <a href="./post/write.html?festival_id=<?php echo $festival_id ?>">동행글 작성하기</a></div>
                <?php if($res) {
                  while($info = mysqli_fetch_array($res2, MYSQLI_ASSOC)) { ?>
                    <div class="post_container" onclick="window.location.href='./post/detail.php?post_id=<?=$info['post_id']?>'">
                      <span class="user"><?php $user = $info['user_id']; 
                        $sql3 = "select nickname from user where user_id = '".$user."'";
                        $res3 = mysqli_query($mysqli, $sql3);
                        $info3 = mysqli_fetch_array($res3, MYSQLI_ASSOC);
                        echo $info3['nickname']; ?></span>
                      <span class="title"><?php echo $info['title'] ?></span>
                      <span class="comment_cnt"><?php $comment_cnt=$info['comment_cnt']; echo "댓글 : $comment_cnt"; ?></span>
                    </div>
                    <br>
                  <?php }
                    mysqli_free_result($res);
                } else {
                    printf("결과 불러오는 데에 실패 : %s\n", mysqli_error($mysqli));
                }?>
              </div>
            </div>
          </div>
      </div>
    </body>
</html>
