//%attributes = {}

var $work : cs:C1710.WorkingEntity


SET DATABASE PARAMETER:C642([Working:6]; Table sequence number:K37:31; 0)


$notDropped:=ds:C1482.Working.all().drop()



For each ($sp; ds:C1482.SalesPersons.all().slice(0; 3))
	
	For ($i; 10; 8; -1)
		
		$work:=ds:C1482.Working.new()
		
		$work.salesPerson:=$sp
		$comp:=ds:C1482.Companies.get($i)
		$work.company:=$comp
		
		$status:=$work.save()
		
	End for 
	
End for each 


For each ($sp; ds:C1482.SalesPersons.all().slice(7; 10))
	
	For ($i; 1; 3)
		
		$work:=ds:C1482.Working.new()
		
		$work.salesPerson:=$sp
		$comp:=ds:C1482.Companies.get($i)
		$work.company:=$comp
		
		$status:=$work.save()
		
	End for 
	
End for each 
