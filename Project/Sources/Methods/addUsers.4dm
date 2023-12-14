//%attributes = {}


SET DATABASE PARAMETER:C642([Users:3]; Table sequence number:K37:31; 0)



$notDropped:=ds:C1482.Users.all().drop()

$i:=1

For each ($sp; ds:C1482.SalesPersons.all())
	$user:=ds:C1482.Users.new()
	$user.identifier:="user"+String:C10($i)+"@4d.com"
	$user.password:=Generate password hash:C1533("a")
	
	$user.salesPerson:=ds:C1482.SalesPersons.get($i)
	
	$status:=$user.save()
	$i:=$i+1
End for each 

