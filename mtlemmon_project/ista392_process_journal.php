<?php


    $request_body = file_get_contents('php://input');

    $jsonArray = json_decode($request_body, true);


    if ($jsonArray != NULL) {
        
        if (array_key_exists("image", $jsonArray[0])) {
            

             $image = $jsonArray[0]["image"];


             $resultImage = base64_decode($image);

             file_put_contents("ista392_process_journal_image " . time() . ".png", $resultImage);

        }

    }

    file_put_contents("ista392_process_journal_jsondump_data_" . time() . ".json", $request_body);
    
    echo("Server says: Got it!");

?>