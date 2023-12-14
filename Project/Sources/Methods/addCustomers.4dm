//%attributes = {}


SET DATABASE PARAMETER:C642([Customers:5]; Table sequence number:K37:31; 0)



$notDropped:=ds:C1482.Customers.all().drop()

$file:=File:C1566("/RESOURCES/customers.json")

$coll:=JSON Parse:C1218($file.getText(); Is collection:K8:32)

$customers:=ds:C1482.Customers.fromCollection($coll)

$i:=1
For each ($customer; ds:C1482.Customers.all())
	
	If ($i<=5)
		$customer.company:=ds:C1482.Companies.get(1)
	Else 
		$customer.company:=ds:C1482.Companies.get(2)
	End if 
	
	$i:=$i+1
	
	$status:=$customer.save()
End for each 

