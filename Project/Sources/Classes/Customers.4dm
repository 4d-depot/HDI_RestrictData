Class extends DataClass


Function event restrict() : cs:C1710.CustomersSelection
	
	var $result : cs:C1710.CustomersSelection
	
	var $selectedCompany : cs:C1710.CompaniesEntity
	var $salesPerson : cs:C1710.SalesPersonsEntity
	var $categories : Collection
	
	
	Case of 
			
			// Web context - There is a web session
		: (Session:C1714#Null:C1517)
			
			If (Session:C1714.storage.selectedCompany#Null:C1517)
				//Selected company stored in the Session
				$selectedCompany:=Session:C1714.storage.selectedCompany.first()
				
				//Sales person stored in the Session
				$salesPerson:=Session:C1714.storage.salesPerson.first()
				
				//Categories of customers affected to this sales person for the selected company
				$categories:=$salesPerson.workings.and($selectedCompany.workings).category
				
				//$result is the applied filter - We return the concerned customers
				$result:=$selectedCompany.customers.query("category IN :1"; $categories)
			End if 
			
			
			// Client server - There is no web session
		: (Current user:C182()#"")
			
			If (Storage:C1525.userInfo[Current user:C182]#Null:C1517)
				//Selected company for the current user (stored in the Storage on the server)
				$selectedCompany:=Storage:C1525.userInfo[Current user:C182]["company"].first()
				
				//Sales person matching the current user
				$salesPerson:=ds:C1482.SalesPersons.query("userName = :1"; Current user:C182())
				
				//Categories of customers affected to this sales person for the selected company
				$categories:=$salesPerson.workings.and($selectedCompany.workings).category
				
				//$result is the applied filter - We return the concerned customers
				$result:=$selectedCompany.customers.query("category IN :1"; $categories)
				
			End if 
			
			
	End case 
	
	return $result
	