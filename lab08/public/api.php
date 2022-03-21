<?php
$data = [
    "version" => "1.1",
    "name" => "Lab08 API",
];

header('Content-Type: application/json');
http_response_code(200);
echo json_encode($data);

