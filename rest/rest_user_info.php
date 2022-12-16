<?php
require('./headers.php');
session_start();
require('./db_user_controller.php');

if(!isset($_SESSION['usname'])){
    http_response_code(403);
    echo "No access for user data";
    return;
}