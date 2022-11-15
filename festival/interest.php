<?php
include 'list.php';

$user_id = $_SESSION['userid'];
$festival_id = $_GET['festival_id'];

if(!empty($festival_id)) {
    $exist_sql = "SELECT * FROM interest WHERE user_id = '{$_SESSION['userid']}' AND festival_id = '$festival_id'";
    $count = mysqli_num_rows($mysqli->query($exist_sql));
    
    if($count == 0) {
        $insert_sql = "INSERT INTO interest(user_id, festival_id) VALUES ('{$_SESSION['userid']}', '$festival_id');";
        $insert_res = $mysqli->query($insert_sql);

        //festival 테이블 업데이트
        $plus_sql = "UPDATE festival SET interest_count = interest_count + 1 where festival_id='$festival_id'";
        $plus_res = $mysqli->query($plus_sql);

        echo "<script type='text/javascript'>alert('가고 싶어요 등록');";
        echo "window.location.href = 'list.php';";
        echo "</script>";
    } else {
        $delete_sql = "DELETE FROM interest WHERE user_id='{$_SESSION['userid']}' and festival_id='$festival_id'";
        $delete_res = $mysqli->query($delete_sql);
        
        //festival 테이블 업데이트
        $minus_sql = "UPDATE festival SET interest_count = interest_count-1 WHERE festival_id='$festival_id'";
        $minus_res = $mysqli->query($minus_sql);

        echo "<script type='text/javascript'>alert('가고 싶어요 취소');";
        echo "window.location.href = 'list.php';";
        echo "</script>";
    }
}