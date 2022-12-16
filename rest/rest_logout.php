<?php
require('./headers.php');
session_start();
session_destroy();
unset($_SESSION["usname"]);

http_response_code(200);
echo "Loged out";