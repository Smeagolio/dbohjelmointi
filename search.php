<?php 
require_once("dbcontroller.php");
$db_handle = new DBController();

if($_POST['submit']){
    $key = $_POST['key'];
    $query = $pdo->prepare('select * from tblproduct where name like :keyword');
        $query->bindValue(':keyword', '%' . $key . '%', PDO::PARAM_STR);
        $query->execute();
        $results = $query->fetchAll();
        $rows = $query->rowCount();
}

if($rows!= 0){
    foreach($results as $r){
    echo '<h4>' . $r['name'] . '</h4>';
    }
}

?>