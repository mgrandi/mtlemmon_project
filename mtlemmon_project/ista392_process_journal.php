<?php


    $request_body = file_get_contents('php://input');

    file_put_contents("ista392_jsondump_data_" . time() . ".txt", $request_body);
    
    echo("Server says: Got it!");

?>