<?php
include 'detail.php'; //$mysqli 변수 포함

$review_id = $_GET['review']; //영화 아이디
$movie_id = $_GET['movie'];

if(!empty($review_id)) {
    $exist_sql = "select * from review where review_id = '$review_id'";
    $count = mysqli_num_rows($mysqli->query($exist_sql));
    
    if($count == 0) {
        echo "<script type='text/javascript'>alert('리뷰가 존재하지 않습니다');";
        echo "window.location.href = 'detail.php?movie=$id';";
        echo "</script>";
    } else {
        $delete_sql = "delete from review where review_id='$review_id'";
        $delete_res = $mysqli->query($delete_sql);

        echo "<script type='text/javascript'>alert('리뷰를 삭제했습니다');";
        echo "window.location.href = 'detail.php?movie=$id';";
        echo "</script>";
    }
}