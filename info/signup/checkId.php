<?php 
    $mysqli = mysqli_connect("localhost", "team01", "team01", "team01")

     or die('데이터 베이스가 없습니다.');

    $userid = $_GET['useremail'];
    $sql = "select user_id from user where email='$userid'";
    $result = mysqli_query($mysqli, $sql);
    $data = mysqli_fetch_array($result);

    echo isset($data['user_id']) ? "X" : "O";

?>