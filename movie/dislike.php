<?php
include 'list.php'; //$mysqli 변수 포함

//$user_id = $_SESSION['userid']; //로그인한 유저 id
$user_id = 2;
$movie_id = $_GET['movie']; //영화 아이디

if(!empty($movie_id)) {
    $exist_sql = "select * from bad where user_id = '{$_SESSION['userid']}' and movie_id = '$movie_id'";
    $count = mysqli_num_rows($mysqli->query($exist_sql));
    
    if($count == 0) {
        $insert_sql = "insert into bad(user_id, movie_id) values('{$_SESSION['userid']}', '$movie_id');";
        $insert_res = $mysqli->query($insert_sql);

        $plus_sql = "update movie set dislike_count = dislike_count + 1 where movie_id='$movie_id'";
        $plus_res = $mysqli->query($plus_sql);

        echo "<script type='text/javascript'>alert('싫어요');";
        echo "window.location.href = 'list.php';";
        echo "</script>";
    } else {
        $delete_sql = "delete from bad where user_id='{$_SESSION['userid']}' and movie_id='$movie_id'";
        $delete_res = $mysqli->query($delete_sql);
        
        $minus_sql = "update movie set dislike_count = dislike_count-1 where movie_id='$movie_id'";
        $minus_res = $mysqli->query($minus_sql);

        echo "<script type='text/javascript'>alert('싫어요 취소');";
        echo "window.location.href = 'list.php';";
        echo "</script>";
    }
}