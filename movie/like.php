<?php

include 'list.php'; //$mysqli 변수 포함

//$user_id = $_SESSION['userid']; //로그인한 유저 id
$user_id = 2;
$movie_id = $_GET['movie']; //영화 아이디

if(!empty($movie_id)) {
    $exist_sql = "select * from good where user_id = '$user_id' and movie_id = '$movie_id'";
    $count = mysqli_num_rows($mysqli->query($exist_sql));
    
    if($count == 0) {
        //좋아요 기록이 없는 경우 -> 좋아요 등록
        $insert_sql = "insert into good(user_id, movie_id) values('$user_id', '$movie_id');";
        $insert_res = $mysqli->query($insert_sql);

        //movie 테이블 업데이트
        $plus_sql = "update movie set like_count = like_count + 1 where movie_id='$movie_id'";
        $plus_res = $mysqli->query($plus_sql);

        //echo $insert_res && $plus_res? "like" : "failed";
        echo "<script type='text/javascript'>alert('좋아요');";
        echo "window.location.href = 'list.php';";
        echo "</script>";
    } else {
        //이미 좋아요를 누른 경우 -> 좋아요 취소
        $delete_sql = "delete from good where user_id='$user_id' and movie_id='$movie_id'";
        $delete_res = $mysqli->query($delete_sql);
        
        //movie 테이블 업데이트
        $minus_sql = "update movie set like_count = like_count-1 where movie_id='$movie_id'";
        $minus_res = $mysqli->query($minus_sql);
        //echo $delete_res && $minus_res? "unlike" : failed;

        echo "<script type='text/javascript'>alert('좋아요 취소');";
        echo "window.location.href = 'list.php';";
        echo "</script>";
    }
}