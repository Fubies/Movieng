<?php
session_start();

$post_id = $_POST['post_id']; 

$mysqli = mysqli_connect("localhost", "team01", "team01", "team01");

echo "<script>console.log('consoletest : $post_id');</script>";

if(mysqli_connect_errno()) {
    printf("Connected failed : %s\n",mysqli_connect_error());
    exit();
}

$mysqli->begin_transaction();

try {
    $sql = "INSERT INTO comment (user_id, post_id, content)
    values ('{$_SESSION['userid']}', '".$post_id."', '".$_POST["commentContent"]."')";
    
    // post 테이블 업데이트
    $plus_sql = "UPDATE post SET comment_cnt = comment_cnt + 1 WHERE post_id='$post_id'";
    $plus_res = $mysqli->query($plus_sql);

    $res = mysqli_query($mysqli, $sql);

    $mysqli->commit();
    echo 'commit';
} catch (mysqli_sql_exception $exception) {
    $mysqli->rollback();
    echo 'rollback';
}

if($res) {?>
    <script>
        alert("댓글 작성에 성공하였습니다.")
        location.href = "../post/detail.php?post_id=<?php echo $post_id?>";
    </script>
<?php } 
else {
    printf("결과를 불러오는 데 실패했습니다 : %s\n", mysqli_error($mysqli));
}?>