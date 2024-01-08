Class extends DataClass


Function event restrict() : cs:C1710.CustomersSelection
	
	var $result : cs:C1710.CustomersSelection
	
	var $selectedCompany : cs:C1710.CompaniesEntity
	var $salesPerson : cs:C1710.SalesPersonsEntity
	var $categories : Collection
	
	//Id $result is Null no filter is applied
	$result:=Null:C1517
	
	Case of 
		: (Session:C1714.storage.info#Null:C1517)
			
			If (Session:C1714.storage.info.selectedCompany#Null:C1517)
				
				//Selected company stored in the Session
				$selectedCompany:=Session:C1714.storage.info.selectedCompany.first()
				
				//Sales person stored in the Session
				$salesPerson:=Session:C1714.storage.info.salesPerson.first()
				
				//Categories of customers affected to this sales person for the selected company
				$categories:=$salesPerson.workings.and($selectedCompany.workings).category
				
				//$result is the applied filter
				$result:=$selectedCompany.customers.query("category IN :1"; $categories)
				
			End if 
			
	End case 
	
	return $result
	