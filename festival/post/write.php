<?php
session_start();

$festival_id = $_POST['festival_id']; 

$mysqli = mysqli_connect("localhost", "root", "", "team01", "3306");

echo "<script>console.log('consoletest : $festival_id');</script>";

if(mysqli_connect_errno()) {
    printf("Connected failed : %s\n",mysqli_connect_error());
    exit();
}

$mysqli->begin_transaction();

try {
    $date = new DateTime();
    $stringDate = $date->format('Y-m-d H:i:s');
    $sql = "INSERT INTO post (user_id, festival_id, title, content, created_date, modified_date) 
    values ('{$_SESSION['userid']}', '".$festival_id."', '".$_POST["postTitle"]."', 
    '".$_POST["postContent"]."', '".$stringDate."', '".$stringDate."')" ;
    
    $res = mysqli_query($mysqli, $sql);

    $mysqli->commit();
    echo 'commit';
} catch (mysqli_sql_exception $exception) {
    $mysqli->rollback();
    echo 'rollback';
}

if($res) {?>
    <script>
        alert("리뷰 작성에 성공하였습니다.")
        location.href = "../detail.php?festival_id=<?php echo $festival_id?>";
    </script>
<?php } 
else {
    printf("결과를 불러오는 데 실패했습니다 : %s\n", mysqli_error($mysqli));
}?>