<?php
session_start();

$post_id = $_GET['post_id'];

$mysqli = mysqli_connect("localhost", "root", "", "team01", "3306");
if(mysqli_connect_errno()){
    printf("Connected failed : %s\n", mysqli_connect_error());
    exit();
} else {
    $sql = "SELECT * FROM post WHERE post_id='".$post_id."'";
    $res = mysqli_query($mysqli, $sql);
    $info = mysqli_fetch_array($res, MYSQLI_ASSOC);

    $sql2 = "SELECT * FROM comment WHERE post_id='".$post_id."'";
    $res2 = mysqli_query($mysqli, $sql2);
}

?>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <link rel="stylesheet" href="./detail.css" />
        <link rel="stylesheet" href="../base.css" />
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
                    <li><a href="../../movie/list.php">영화 살펴보기</a></li>
                    <li><a href="../list.php">영화제 살펴보기</a></li>
                </ul>
            </nav>
            </div>
            <div class="logo" onclick="location.href='../heejin/home/home.php';"><h2>MOVIENG</h2></div>
            <div class="profile">
                <nav>
                <a href="../../heejin/mypage/mypage.php">프로필</a>
                </nav>
            </div>
            </header>
        </div>

        <div class="content">
            <div class="content_container">
              <div class="description_container">
                <h2><span class="title"><?php $title=$info['title']; echo $title;?></span></h2></br>
                <span class="post_content"><?php $content=$info['content']; echo $content;?></span></br>
                <span class="created_date"><?php $created_date=$info['created_date']; echo "작성 일자: $created_date";?></span></br>
              </div>
              <div class="comment_list_container">
                <div class="comment_write"> <a href="../comment/write.html?post_id=<?php echo $post_id ?>">댓글 작성하기</a></div>
                <?php if($res) {
                  while($info = mysqli_fetch_array($res2, MYSQLI_ASSOC)) { ?>
                    <div class="comment_container">
                      <span class="user"><?php $user = $info['user_id']; 
                        $sql3 = "select nickname from user where user_id = '".$user."'";
                        $res3 = mysqli_query($mysqli, $sql3);
                        $info3 = mysqli_fetch_array($res3, MYSQLI_ASSOC);
                        echo $info3['nickname']; ?></span>
                      <span class="comment_content"><?php echo $info['content'] ?></span>
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