<?php
$mysqli = new mysqli("sip.uidesk.id","root","zimam@0306!!","asteriskcdrdb");
/*

user : root
pass : zimam@0306!!
user : uidesk
pass : Uidesk123!
*/
// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}


$add_query = "";

$three_days_ago = date("Y-m-d 00:00:00", strtotime("-3 days", time()));
$result = $mysqli -> query("select * from asterisk.users where name='ROATEX' limit 6 , 10");

$data = [];
while ($row = $result->fetch_assoc()) {
   
    $data[] = $row;
}

echo json_encode($data);
?>