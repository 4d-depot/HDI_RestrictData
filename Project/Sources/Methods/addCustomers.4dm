//%attributes = {}


SET DATABASE PARAMETER:C642([Customers:5]; Table sequence number:K37:31; 0)



$notDropped:=ds:C1482.Customers.all().drop()

$file:=File:C1566("/RESOURCES/customers.json")

$coll:=JSON Parse:C1218($file.getText(); Is collection:K8:32)

For each ($obj; $coll)
	$customer:=ds:C1482.Customers.new()
	$customer.firstname:=$obj.firstname
	$customer.lastname:=$obj.lastname
	$status:=$customer.save()
End for each 

