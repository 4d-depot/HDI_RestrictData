Class extends DataStoreImplementation



exposed Function authentify($identifier : Text; $password : Text) : Text
	
	var $salesPersons : cs:C1710.SalesPersonsSelection
	var $sp : cs:C1710.SalesPersonsEntity
	
	$salesPersons:=This:C1470.SalesPersons.query("identifier = :1"; $identifier)
	$sp:=$salesPersons.first()
	
	If ($sp#Null:C1517)
		If (Verify password hash:C1534($password; $sp.password))
			
			Use (Session:C1714.storage)
				Session:C1714.storage.salesPerson:=$salesPersons
			End use 
			
			return "OK"
		Else 
			return "Authentication failed: wrong password"
		End if 
	Else 
		return "Authentication failed: wrong user"
	End if 
	
	
	
	
exposed Function selectCompany($company : cs:C1710.CompaniesEntity)
	
	If (Session:C1714#Null:C1517)
		Use (Session:C1714.storage)
			Session:C1714.storage.selectedCompany:=This:C1470.Companies.newSelection().add($company).copy(ck shared:K85:29)
		End use 
	End if 
	
	
	
exposed Function getSalesPerson() : cs:C1710.SalesPersonsEntity
	
	If (Session:C1714#Null:C1517)
		If (Session:C1714.storage.salesPerson#Null:C1517)
			return Session:C1714.storage.salesPerson.first()
		End if 
	End if 
	
	
exposed Function getSelectedCompany() : cs:C1710.CompaniesEntity
	
	If (Session:C1714#Null:C1517)
		If (Session:C1714.storage.selectedCompany#Null:C1517)
			return Session:C1714.storage.selectedCompany.first()
		End if 
	End if 
	
	
exposed Function clearSession()
	If (Session:C1714#Null:C1517)
		Use (Session:C1714.storage)
			Session:C1714.storage.salesPerson:=Null:C1517
			Session:C1714.storage.selectedCompany:=Null:C1517
		End use 
	End if 
	
	
	//----------------------------------------------
	// QODLY
	//----------------------------------------------
	
exposed Function hide($ref : Text)
	Web Form:C1735[$ref].removeCSSClass("showItem")
	Web Form:C1735[$ref].addCSSClass("hideItem")
	
exposed Function show($ref : Text)
	Web Form:C1735[$ref].removeCSSClass("hideItem")
	Web Form:C1735[$ref].addCSSClass("showItem")
	