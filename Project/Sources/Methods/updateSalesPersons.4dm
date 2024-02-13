//%attributes = {}


For each ($sp; ds:C1482.SalesPersons.all())
	
	$sp.identifier:=$sp.firstname+"."+$sp.lastname+"@acme.com"
	
	
	
	
	$sp.password:=$sp.users.first().password
	$sp.internalId:=$sp.ID
	
	$status:=$sp.save()
	
End for each 