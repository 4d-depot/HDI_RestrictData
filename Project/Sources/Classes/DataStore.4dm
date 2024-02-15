Class extends DataStoreImplementation



//We are in a web context
//
exposed Function authentify($identifier : Text; $password : Text) : Text
	
	var $sp : cs:C1710.SalesPersonsEntity
	
	
	$sp:=This:C1470.SalesPersons.query("identifier = :1"; $identifier).first()
	
	If ($sp#Null:C1517)
		If (Verify password hash:C1534($password; $sp.password))
			
			Use (Session:C1714.storage)
				Session:C1714.storage.salesPerson:=New shared object:C1526()
				Use (Session:C1714.storage.salesPerson)
					Session:C1714.storage.salesPerson:=This:C1470.SalesPersons.newSelection().add($sp).copy(ck shared:K85:29)
				End use 
			End use 
			return "OK"
		Else 
			return "Authentication failed: wrong password"
		End if 
	Else 
		return "Authentication failed: wrong user"
	End if 
	
	
	//Client server
	//
exposed Function changeCurrentUser($sales : cs:C1710.SalesPersonsEntity)
	CHANGE CURRENT USER:C289($sales.userName; "a")
	
	
	
exposed Function selectCompany($company : cs:C1710.CompaniesEntity)
	//
	//We are in a web context
	If (Session:C1714#Null:C1517)
		Use (Session:C1714.storage)
			Session:C1714.storage.selectedCompany:=This:C1470.Companies.newSelection().add($company).copy(ck shared:K85:29)
		End use 
		
		//
		//Client server
	Else 
		Use (Storage:C1525.userInfo)
			Storage:C1525.userInfo[Current user:C182]:=New shared object:C1526("company"; This:C1470.Companies.newSelection().add($company).copy(ck shared:K85:29))
		End use 
	End if 
	
	
	
exposed Function getSalesPerson() : cs:C1710.SalesPersonsEntity
	
	//
	//We are in a web context
	If (Session:C1714#Null:C1517)
		If (Session:C1714.storage.salesPerson#Null:C1517)
			return Session:C1714.storage.salesPerson.first()
		End if 
	Else 
		//
		//Client server
		return This:C1470.SalesPersons.query("userName = :1"; Current user:C182).first()
	End if 
	
	
exposed Function getSelectedCompany() : cs:C1710.CompaniesEntity
	
	//
	//We are in a web context
	If (Session:C1714#Null:C1517)
		If (Session:C1714.storage.selectedCompany#Null:C1517)
			return Session:C1714.storage.selectedCompany.first()
		End if 
	Else 
		//
		//Client server
		If (Storage:C1525.userInfo[Current user:C182]["company"]#Null:C1517)
			Storage:C1525.userInfo[Current user:C182]["company"].first()
		End if 
	End if 
	
	
	// Web context
	// There is a web session
exposed Function clearSession()
	If (Session:C1714#Null:C1517)
		Use (Session:C1714.storage)
			Session:C1714.storage.salesPerson:=Null:C1517
			Session:C1714.storage.selectedCompany:=Null:C1517
		End use 
	End if 
	
	
	// Client server context
exposed Function clearStorage()
	Use (Storage:C1525)
		Storage:C1525.userInfo:=New shared object:C1526
	End use 
	
	
	
	//----------------------------------------------
	// QODLY
	//----------------------------------------------
	
exposed Function hide($ref : Text)
	Web Form:C1735[$ref].removeCSSClass("showItem")
	Web Form:C1735[$ref].addCSSClass("hideItem")
	
exposed Function show($ref : Text)
	Web Form:C1735[$ref].removeCSSClass("hideItem")
	Web Form:C1735[$ref].addCSSClass("showItem")
	