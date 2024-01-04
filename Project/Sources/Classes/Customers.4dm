Class extends DataClass



Function event restrict() : cs:C1710.CustomersSelection
	
	var $result : cs:C1710.CustomersSelection
	
	$result:=Null:C1517
	
	
	Case of 
		: (Session:C1714.storage.info#Null:C1517)
			
			
			If (Session:C1714.storage.info.selectedCompany#Null:C1517)
				//Selected company in the Session
				$selectedCompany:=Session:C1714.storage.info.selectedCompany.first()
				
				//Sales person in the Session
				$salesPerson:=Session:C1714.storage.info.salesPerson.first()
				
				//Categories affected to this sales person for the selected company
				$categories:=$salesPerson.workings.and($selectedCompany.workings).category
				
				$result:=$selectedCompany.customers.query("category IN :1"; $categories)
				
			End if 
			
	End case 
	
	
	//$result:=ds.Customers.all().slice(0; 2)
	
	return $result
	