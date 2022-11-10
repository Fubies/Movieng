<?php

$mysqli = mysqli_connect("localhost", "team01", "team01", "team01", "3307");

if(mysqli_connect_errno()) {
    printf("Connected failed : %s\n",mysqli_connect_error());
    exit();
}
else {
    $sql = "select * from movie order by like_count desc, title";
    $res = mysqli_query($mysqli, $sql);

    // if($res) {
    //     $rank = 0;
    //     while($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC)) {
    //         $rank++;
    //         $id = $newArray['movie_id'];
    //         $title = $newArray['title'];
            
    //         $like_count = $newArray['like_count'];
    //         // echo '<td class="like-container"><button type="button" class="btn-like" data-article-id="'.$id.'">'
    //         //             .'<span class="heart-shape">♡</span> <span class="like-count">'.$like_count.'</span></button></td>';

    //     }
    // } else {
    //     printf("결과 불러오는 데에 실패 : %s\n", mysqli_error($mysqli));
    // }
    // mysqli_free_result($res);
    // mysqli_close($mysqli);
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
      <div class="content">
        <div class="genre_like_container">
            <div class="title_genre_container"><span class="title_genre">장르별 좋아요 수 TOP3</span></div>
            <div class="content_genre_container">
              <div class="rank_container">
                <span class="rank_title">[스릴러 좋아요 총합] 전체 - 39</span>
                <span class="rank">[스릴러] 2021년 - 20</span>
                <span class="rank">[스릴러] 2022년 - 12</span>
                <span class="rank">[스릴러] 2022년 - 07</span>
              </div>
              <div class="rank_container">
                <span class="rank_title">[코미디 좋아요 총합] 전체 - 39</span>
                <span class="rank">[코미디] 2021년 - 20</span>
                <span class="rank">[코미디] 2022년 - 12</span>
                <span class="rank">[코미디] 2022년 - 07</span>
              </div>
              <div class="rank_container">
                <span class="rank_title">[로맨스 좋아요 총합] 전체 - 39</span>
                <span class="rank">[로맨스] 2021년 - 20</span>
                <span class="rank">[로맨스] 2022년 - 12</span>
                <span class="rank">[로맨스]] 2022년 - 07</span>
              </div>
            </div>
          </div>
        <div class="movie_rank_container">
          <div class="movie_rank_title_container"><span class="movie_rank_title">영화 목록</span></div>
          <div class="movie_list_container">
            <div class="movie_container">
                <?php if($res) {
                            $rank = 0;
                            while($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC)) { ?>
                <span class="movie_rank"><?php $rank++; echo $rank;?></span>
                <span class="movie_title"><?php $title = $newArray['title']; echo $title;?></span>
                <button class="movie_like_btn" onclick="window.location.href='./like.php?movie=<?=$newArray['movie_id']?>'">좋아요<?php $like_count = $newArray['like_count'];?></a><span class="movie_like_cnt"><?php echo $like_count?></span></button>
                <button class="movie_dislike_btn" onclick="window.location.href='./dislike.php?movie=<?=$newArray['movie_id']?>'">싫어요<?php $dislike_count = $newArray['dislike_count'];?><span class="movie_like_cnt"><?php echo $dislike_count?></span></button></br>
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
