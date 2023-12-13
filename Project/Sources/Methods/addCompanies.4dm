//%attributes = {}


SET DATABASE PARAMETER:C642([Companies:2]; Table sequence number:K37:31; 0)


$notDropped:=ds:C1482.Companies.all().drop()


$file:=File:C1566("/RESOURCES/companies")

$coll:=JSON Parse:C1218($file.getText(); Is collection:K8:32)

For each ($name; $coll)
	$comp:=ds:C1482.Companies.new()
	$comp.name:=$name
	$status:=$comp.save()
End for each 
