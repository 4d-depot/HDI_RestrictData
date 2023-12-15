Class extends DataClass



//Function event restrict() : cs.CustomersSelection

//var $result : cs.CustomersSelection

//Case of 
//: (Session.storage#Null)

////Selected company in the Session
//$selectedCompany:=Session.storage.selectedCompany.first()

////Customers of the selected company
//$companyCustomers:=$selectedCompany.customers

////Sales person in the Session
//$salesPerson:=Session.storage.salesPerson.first()

////Categories affected to this sales person for the selected company
//$workings:=$salesPerson.workings.and($selectedCompany.workings)

//$targetCustomers:=This.newSelection()

//For each ($work; $workings)
//$result.add($companyCustomers.query("category = :1"; $work.category))
//End for each 

//$companyCustomers:=Session.storage.selectedCompany.first().theCustomers

//Else 

//return Null

//End case 

//return $result


Function event restrict() : cs:C1710.CustomersSelection
	
	var $result : cs:C1710.CustomersSelection
	
	$result:=Null:C1517
	
	Case of 
		: (Session:C1714.storage.info#Null:C1517)
			
			If (Session:C1714.storage.info.selectedCompany#Null:C1517)
				//Selected company in the Session
				$selectedCompany:=Session:C1714.storage.info.selectedCompany.first()
				
				//Customers of the selected company
				$companyCustomers:=$selectedCompany.customers
				
				//Sales person in the Session
				$salesPerson:=Session:C1714.storage.info.salesPerson.first()
				
				//Categories affected to this sales person for the selected company
				$workings:=$salesPerson.workings.and($selectedCompany.workings)
				
				$result:=This:C1470.newSelection()
				
				For each ($work; $workings)
					$result.add($companyCustomers.query("category = :1"; $work.category))
				End for each 
			End if 
			
	End case 
	
	return $result