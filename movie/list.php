<?php
session_start();
$mysqli = mysqli_connect("localhost", "team01", "team01", "team01", "3306");

if(mysqli_connect_errno()) {
    printf("Connected failed : %s\n",mysqli_connect_error());
    exit();
}
else {
    $sql = "select * from movie order by like_count desc, title";
    $res = mysqli_query($mysqli, $sql);

    $sql2 = "SELECT 
    COALESCE(m.nation, 'ALL NATION') AS nation, COALESCE(m.title, 'ALL MOVIE') AS title, COUNT(m.title) like_count
    FROM movie m , good g WHERE m.movie_id = g.movie_id AND nation IN ('한국', '일본', '미국') GROUP BY m.nation DESC, m.title WITH ROLLUP";
    $res2 = mysqli_query($mysqli, $sql2);

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
                  <li><a href="./list.php">영화 살펴보기</a></li>
                  <li><a href="">영화제 살펴보기</a></li>
              </ul>
          </nav>
          </div>
          <div class="logo" onclick="location.href='../heejin/home/home.php';"><h2>MOVIENG</h2></div>
          <div class="profile">
            <nav>
              <a href="../heejin/mypage/mypage.php">프로필</a>
            </nav>
          </div>
        </header>
      </div>
      <div class="content">
        <div class="genre_like_container">
          <div class="title_genre_container"><span class="title_genre">[한국-일본-미국] 좋아요 수</span></div>
          <?php if($res2) {
            $flag = true;
            $newArray = "dummy";
            while($flag) { 
              if($newArray == null) break; ?>
              <div class="content_genre_container">
                <?php while($newArray = mysqli_fetch_array($res2, MYSQLI_ASSOC)) { ?>
                  <div class="rank_container">
                    <span class="nation"><?php $nation = $newArray['nation']; echo $nation;?></span>
                    <span class="movie_title"><?php $title = $newArray['title']; echo $title;?></span>
                    <span class="like_count"><?php $count = $newArray['like_count']; echo $count;?></span>
                  </div>
                  <?php 
                  if($newArray['title'] == 'ALL MOVIE') break;
                } ?>
              </div><br>
              <?php if($newArray!=null && $newArray['nation']=='ALL NATION') break;
              }
            } else {
              printf("결과 불러오는 데에 실패 : %s\n", mysqli_error($mysqli));
          }?>
        </div>
        
        <div class="movie_rank_container">
          <div class="movie_rank_title_container"><span class="movie_rank_title">영화 목록</span></div>
            <?php if($res) {
                            $rank = 0;
                            while($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC)) { ?>
              <div class="movie_container">
                  <span class="movie_rank"><?php $rank++; echo $rank;?></span></br></br>
                  <span class="movie_title" onclick="location.href='./detail.php?movie=<?php $link = $newArray['movie_id']; echo $link ?>';"><?php $title = $newArray['title']; echo $title;?></span></br>
                  <button class="movie_like_btn" onclick="window.location.href='./like.php?movie=<?=$newArray['movie_id']?>'">좋아요<?php $like_count = $newArray['like_count'];?></a><span class="movie_like_cnt"><?php echo $like_count?></span></button>
                  <button class="movie_dislike_btn" onclick="window.location.href='./dislike.php?movie=<?=$newArray['movie_id']?>'">싫어요<?php $dislike_count = $newArray['dislike_count'];?><span class="movie_like_cnt"><?php echo $dislike_count?></span></button></br>
                  
              </div>
           
            <?php }
                    mysqli_free_result($res);
                } else {
                    printf("결과 불러오는 데에 실패 : %s\n", mysqli_error($mysqli));
                }?>

        </div>   
      </div>
  </body>
</html>
