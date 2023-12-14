//%attributes = {}


SET DATABASE PARAMETER:C642([SalesPersons:4]; Table sequence number:K37:31; 0)



$notDropped:=ds:C1482.SalesPersons.all().drop()

$file:=File:C1566("/RESOURCES/salesPersons.json")

$coll:=JSON Parse:C1218($file.getText(); Is collection:K8:32)

$sales:=ds:C1482.SalesPersons.fromCollection($coll)

//For each ($obj; $coll)
//$sp:=ds.SalesPersons.new()
//$sp.firstname:=$obj.firstname
//$sp.lastname:=$obj.lastname
//$status:=$sp.save()
//End for each 

