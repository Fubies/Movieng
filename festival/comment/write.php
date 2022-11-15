<?php
session_start();

$post_id = $_POST['post_id']; 

$mysqli = mysqli_connect("localhost", "root", "", "team01", "3306");

echo "<script>console.log('consoletest : $post_id');</script>";

if(mysqli_connect_errno()) {
    printf("Connected failed : %s\n",mysqli_connect_error());
    exit();
}
else {
    $sql = "INSERT INTO comment (user_id, post_id, content)
    values ('{$_SESSION['userid']}', '".$post_id."', '".$_POST["commentContent"]."')";
    
    $res = mysqli_query($mysqli, $sql);
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