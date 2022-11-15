<?php
session_start();
$mysqli = mysqli_connect("localhost", "team01", "team01", "team01", "3306");
$id = $_GET['movie'];

if(mysqli_connect_errno()) {
    printf("Connected failed : %s\n",mysqli_connect_error());
    exit();
}
else {
    $sql = "select * from movie where movie_id = '".$id."'";
    $res = mysqli_query($mysqli, $sql);
    $newArray = mysqli_fetch_array($res, MYSQLI_ASSOC);

    $sql2 = "select * from review where movie_id = '".$id."'";
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
                  <li><a href="./list.php">영화 살펴보기</a></li>
                  <li><a href="">영화제 살펴보기</a></li>
              </ul>
          </nav>
          </div>
          <h2>MOVIENG</h2>
          <div class="profile">
            <nav>
              <a href="../heejin/mypage/mypage.php">프로필</a>
            </nav>
          </div>
        </header>
      </div>
      <div class="content">
        <div class="movie_detail_container">
            <div class="title_container"><span class="title"><h2><?php echo $newArray['title'] ?></h2></span></div>
            <div class="content_container">
              <div class ="description_container">
                <div class="description">
                  <span class="date">개봉일: <?php echo $newArray['released_date'] ?></span>
                  <span class="nation">국가: <?php echo $newArray['nation'] ?></span>
                  <span class="status">개봉여부: <?php echo $newArray['movie_status'] ?></span>
                  <span class="type">영화타입: <?php echo $newArray['movie_type'] ?></span>
                </div><br>
                <div class="description">
                  <span class="director">감독: <?php echo $newArray['director'] ?></span>
                  <span class="production">영화사: <?php echo $newArray['production'] ?></span>
                </div><br>
                <div class="description">
                  <span class="like">좋아요 - <?php echo $newArray['like_count'] ?></span>
                  <span class="dislike">싫어요 - <?php echo $newArray['dislike_count'] ?></span>
                </div>
              </div>
              <br>
              <div class="review_list_container">
                <div class="review_title"> <a href="./review/write.html?movie=<?php echo $id ?>">리뷰 작성하기</a></div>
                <?php if($res) {
                  while($newArray = mysqli_fetch_array($res2, MYSQLI_ASSOC)) { ?>
                    <div class="review_container">
                      <span class="user"><?php $user = $newArray['user_id']; 
                        $sql3 = "select nickname from user where user_id = '".$user."'";
                        $res3 = mysqli_query($mysqli, $sql3);
                        $newArray3 = mysqli_fetch_array($res3, MYSQLI_ASSOC);
                        echo $newArray3['nickname']; ?></span>
                      <span class="text"><?php echo $newArray['content'] ?></span>
                      <span class="score"><?php echo $newArray['score']?></span>
                      <button class="delete_button" onclick="location.href='./review.php?movie=<?=$id?>&review=<?=$newArray['review_id']?>';">
                        삭제                    
                      </button>
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