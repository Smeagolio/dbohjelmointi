<?php
require('./dbcontroller.php');


function registerUser($uname, $pw){
    $db = createDbConnection();

    $pw = password_hash($pw, PASSWORD_DEFAULT);

    $sql = "INSERT INTO account (usname, pswd) VALUES (?,?)";
    $statement = $db->prepare($sql);
    $statement->execute(array($uname, $pw));
}

function checkUser($uname, $pw){
    $db = createDbConnection();
    $sql = "SELECT pswd FROM account WHERE usname=?";
    $statement = $db->prepare($sql);
    $statement->execute(array($uname));
    $hashedpw = $statement->fetchColumn();

    if(isset($hashedpw)){
        return password_verify($pw, $hashedpw) ? $uname : null;
    }

    return null;
}
