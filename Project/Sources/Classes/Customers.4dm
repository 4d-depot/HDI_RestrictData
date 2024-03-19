Class extends DataClass


Function event restrict() : cs:C1710.CustomersSelection
	
	var $result : cs:C1710.CustomersSelection
	
	var $selectedCompany : cs:C1710.CompaniesEntity
	var $salesPerson : cs:C1710.SalesPersonsEntity
	var $match : Boolean
	
	
	Case of 
			
		: (Session:C1714#Null:C1517)
			
			If (Session:C1714.storage.selectedCompany#Null:C1517)
				//Selected company stored in the Session
				$selectedCompany:=Session:C1714.storage.selectedCompany.first()
				
				//Sales person stored in the Session
				$salesPerson:=Session:C1714.storage.salesPerson.first()
				
				//Does the selected company is managed by the sales person stored in the session?
				$match:=($salesPerson.workings.and($selectedCompany.workings).length#0)
				
				If ($match)
					// We return the customers of the selected company
					$result:=$selectedCompany.customers
				Else 
					// The sales person does not manage this company
					$result:=This:C1470.newSelection()
				End if 
			End if 
			
	End case 
	
	return $result
	