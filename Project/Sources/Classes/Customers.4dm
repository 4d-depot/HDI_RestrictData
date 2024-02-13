Class extends DataClass


Function event restrict() : cs:C1710.CustomersSelection
	
	var $result : cs:C1710.CustomersSelection
	
	var $selectedCompany : cs:C1710.CompaniesEntity
	var $salesPerson : cs:C1710.SalesPersonsEntity
	var $categories : Collection
	
	
	Case of 
			
			// Web context - There is a web session
		: (Session:C1714#Null:C1517)
			
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
			
			
			// C/S
			// There is no web session
		: (Current user:C182()#"")
			
			If (Storage:C1525.userInfo[Current user:C182]#Null:C1517)
				//Selected company stored in the Storage
				$selectedCompany:=Storage:C1525.userInfo[Current user:C182]["company"].first()
				
				//Sales person stored in the Storage
				$salesPerson:=ds:C1482.SalesPersons.query("userName = :1"; Current user:C182())
				
				//Categories of customers affected to this sales person for the selected company
				$categories:=$salesPerson.workings.and($selectedCompany.workings).category
				
				//$result is the applied filter
				$result:=$selectedCompany.customers.query("category IN :1"; $categories)
				
			End if 
			
			
	End case 
	
	return $result
	