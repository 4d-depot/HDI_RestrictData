Class extends Entity


//exposed Alias companies workings.company


exposed Function get theCustomers($event : Object) : cs:C1710.CustomersSelection
	
	
	$customers:=ds:C1482.Customers.newSelection()
	
	For each ($work; This:C1470.workings)
		$temp:=$work.company.customers.query("category = :1"; $work.category)
		
		If ($temp.length#0)
			$customers.add($temp)
		End if 
	End for each 
	
	return $customers
	
	
exposed Function get fullName() : Text
	return This:C1470.firstname+" "+This:C1470.lastname
	
	
	//----------------------------------------------
	// QODLY
	//----------------------------------------------
	
	
exposed Function associateSalesCompany($category : Text; $company : cs:C1710.CompaniesEntity)
	
	var $works : cs:C1710.WorkingSelection
	
	$works:=This:C1470.workings.query("company.name = :1 and category = :2"; $company.name; $category)
	
	If ($works.length=0)
		$work:=ds:C1482.Working.new()
		$work.salesPerson:=This:C1470
		$work.category:=$category
		$work.company:=$company
		$status:=$work.save()
		
		//$status:=This.reload()
		
	End if 
	
	
	