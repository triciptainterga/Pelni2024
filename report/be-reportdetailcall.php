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

function generate_url($row) {
    $date = $row['calldate'];
    list($tgl, $waktu) = explode(' ', $date);
    $path = str_replace("-", "/", trim($tgl));

    //return "https://sip.uidesk.id/stream.php?file=/var/spool/asterisk/monitor/".$path."/".$row['recordingfile'];
    return "https://sip.uidesk.id/stream.php?file=".$row['recordingfile'];
}

$add_query = "";
if(isset($_GET['search']) && !empty($_GET['search'])) $add_query .= "AND uniqueid LIKE '%".$_GET['search']."%' or dst LIKE '%".$_GET['search']."%'";
if(isset($_GET['start_date']) && !empty($_GET['start_date']) && isset($_GET['end_date']) && !empty($_GET['end_date'])) $add_query .= " AND (calldate BETWEEN '".$_GET['start_date']."' AND '".$_GET['end_date']." 23:59:59')";
// echo $add_query;
// die;

if($_GET['q']=="table"){
$three_days_ago = date("Y-m-d 00:00:00", strtotime("-3 days", time()));
$result = $mysqli -> query("SELECT
  uniqueid,
  Source=(select src from asteriskcdrdb.cdr where asteriskcdrdb.cdr.uniqueid=asteriskcdrdb.cel.uniqueid),
  MAX(CASE WHEN eventtype = 'CHAN_START' THEN eventtime END) AS CHAN_START,
  MAX(CASE WHEN eventtype = 'ANSWER' THEN eventtime END) AS ANSWER,
  MAX(CASE WHEN eventtype = 'BRIDGE_ENTER' THEN eventtime END) AS BRIDGE_ENTER,
  MAX(CASE WHEN eventtype = 'BRIDGE_EXIT' THEN eventtime END) AS BRIDGE_EXIT,
  MAX(CASE WHEN eventtype = 'HANGUP' THEN eventtime END) AS HANGUP,
  MAX(CASE WHEN eventtype = 'CHAN_END' THEN eventtime END) AS CHAN_END,
  MAX(CASE WHEN eventtype = 'LINKEDID_END' THEN eventtime END) AS LINKEDID_END
FROM asteriskcdrdb.cel where eventtime between '2023-12-27 08:00:00' and '2023-12-27 09:00:00'  
GROUP BY uniqueid order by id desc");

}
$data = [];
while ($row = $result->fetch_assoc()) {
    $row['recordingfile_url'] = "https://sip.uidesk.id/stream.php?file=/var/spool/asterisk/monitor/".str_replace("-", "/", trim($row['Tgl']))."/".$row['recordingfile'];
    $data[] = $row;
}

echo json_encode($data);
?>