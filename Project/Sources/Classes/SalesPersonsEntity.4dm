Class extends Entity


exposed Alias companies workings.company


exposed Function get theCustomers($event : Object) : cs:C1710.CustomersSelection
	
	
	$customers:=ds:C1482.Customers.newSelection()
	
	For each ($work; This:C1470.workings)
		$temp:=$work.company.customers.query("category = :1"; $work.category)
		
		If ($temp.length#0)
			$customers.add($temp)
		End if 
	End for each 
	
	return $customers
	