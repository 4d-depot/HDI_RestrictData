//%attributes = {}


SET DATABASE PARAMETER:C642([SalesPersons:4]; Table sequence number:K37:31; 0)



$notDropped:=ds:C1482.SalesPersons.all().drop()

$file:=File:C1566("/RESOURCES/salesPersons.json")

$coll:=JSON Parse:C1218($file.getText(); Is collection:K8:32)

$sales:=ds:C1482.SalesPersons.fromCollection($coll)

$i:=1

For each ($sp; $sales)
	$sp.userName:="sp"+String:C10($i)
	$i:=$i+1
	$status:=$sp.save()
End for each 

