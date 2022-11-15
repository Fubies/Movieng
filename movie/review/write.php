<?php
session_start();
$mysqli = mysqli_connect("localhost", "root", "", "team01", "3306");

echo "<script>console.log('consoletest : ". $_POST["movieId"]. "');</script>";

if(mysqli_connect_errno()) {
    printf("Connected failed : %s\n",mysqli_connect_error());
    exit();
}
else {
    $date = new DateTime();
    $stringDate = $date->format('Y-m-d H:i:s');
    $sql = "insert into review (user_id, movie_id, content, score, created_date, modified_date) 
    values ('{$_SESSION['userid']}', '".$_POST["movieId"]."', '".$_POST["reviewtext"]."', 
    '".$_POST["reviewscore"]."', '".$stringDate."', '".$stringDate."')" ;
    
    $res = mysqli_query($mysqli, $sql);
}

if($res) {?>
    <script>
        alert("리뷰 작성에 성공하였습니다.")
        location.href = "../detail.php?movie=<?php echo $_POST["movieId"]?>";
    </script>
<?php } 
else {
    printf("결과 불러오는 데에 실패 : %s\n", mysqli_error($mysqli));
}?>