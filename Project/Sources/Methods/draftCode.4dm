//%attributes = {}


$cust:=ds:C1482.Customers.all()

$connect:={hostname: "127.0.0.1:8044"}
$ds:=Open datastore:C1452($connect; "remoteDS2")

$cust:=$ds.Customers.all()