//%attributes = {}


var $business : cs:C1710.BusinessEntity


SET DATABASE PARAMETER:C642([Business:7]; Table sequence number:K37:31; 0)


$notDropped:=ds:C1482.Business.all().drop()



For each ($comp; ds:C1482.Companies.all().slice(0; 3))
	
	For ($i; 10; 8; -1)
		
		$business:=ds:C1482.Business.new()
		
		$business.company:=$comp
		$customer:=ds:C1482.Customers.get($i)
		$business.customer:=$customer
		
		$status:=$business.save()
		
	End for 
	
End for each 


For each ($comp; ds:C1482.Companies.all().slice(7; 10))
	
	For ($i; 1; 3)
		
		$business:=ds:C1482.Business.new()
		
		$business.company:=$comp
		$customer:=ds:C1482.Customers.get($i)
		$business.customer:=$customer
		
		$status:=$business.save()
		
	End for 
	
End for each 