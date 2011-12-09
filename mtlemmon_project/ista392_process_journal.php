<?php


    $request_body = file_get_contents('php://input');

    file_put_contents("jsondump_data_" . time() . ".txt", $request_body);

?>