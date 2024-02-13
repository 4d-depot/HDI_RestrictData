Class extends DataStoreImplementation



//We are in a web context
//
exposed Function authenticate($identifier : Text; $password : Text) : Text
	
	var $user : cs:C1710.UsersEntity
	
	
	$user:=ds:C1482.Users.query("identifier = :1"; $identifier).first()
	
	If ($user#Null:C1517)
		If (Verify password hash:C1534($password; $user.password))
			Session:C1714.clearPrivileges()
			//Session.setPrivileges(New object("roles"; $user.role; "userName"; $user.firstname+" "+$user.lastname))
			Use (Session:C1714.storage)
				Session:C1714.storage.info:=New shared object:C1526()
				Use (Session:C1714.storage.info)
					Session:C1714.storage.info.salesPerson:=This:C1470.SalesPersons.newSelection().add($user.salesPerson).copy(ck shared:K85:29)
				End use 
			End use 
			return "OK"
		Else 
			return "Authentication failed: wrong password"
		End if 
	Else 
		return "Authentication failed: wrong user"
	End if 
	
	
	//
	//C/S
exposed Function changeCurrentUser($sales : cs:C1710.SalesPersonsEntity)
	
	CHANGE CURRENT USER:C289($sales.userName; "a")
	//Use (Storage.userInfo)
	//Storage.userInfo[Current user]:=New shared object("salesPerson"; This.SalesPersons.query("userName = :1"; Current user).copy(ck shared))
	//End use 
	
	
exposed Function selectCompany($company : cs:C1710.CompaniesEntity)
	
	//
	//We are in a web context
	If (Session:C1714#Null:C1517)
		Use (Session:C1714.storage.info)
			Session:C1714.storage.info.selectedCompany:=ds:C1482.Companies.newSelection().add($company).copy(ck shared:K85:29)
		End use 
		
		//
		//C/S
	Else 
		Use (Storage:C1525.userInfo)
			Storage:C1525.userInfo[Current user:C182]:=New shared object:C1526("company"; ds:C1482.Companies.newSelection().add($company).copy(ck shared:K85:29))
		End use 
	End if 
	
	
	
	
exposed Function getSalesPerson() : cs:C1710.SalesPersonsEntity
	
	//
	//We are in a web context
	If (Session:C1714#Null:C1517)
		If (Session:C1714.storage.info.salesPerson#Null:C1517)
			return Session:C1714.storage.info.salesPerson.first()
		End if 
	Else 
		//
		//C/S
		return This:C1470.SalesPersons.query("userName = :1"; Current user:C182).first()
	End if 
	
	
exposed Function getSelectedCompany() : cs:C1710.CompaniesEntity
	
	//
	//We are in a web context
	If (Session:C1714#Null:C1517)
		If (Session:C1714.storage.info.selectedCompany#Null:C1517)
			return Session:C1714.storage.info.selectedCompany.first()
		End if 
	Else 
		//
		//C/S
		If (Storage:C1525.userInfo[Current user:C182]["company"]#Null:C1517)
			Storage:C1525.userInfo[Current user:C182]["company"].first()
		End if 
	End if 
	
	
	// Web context
	// There is a web session
exposed Function clearSession()
	If (Session:C1714#Null:C1517)
		Use (Session:C1714.storage)
			Session:C1714.storage.info:=New shared object:C1526
		End use 
	End if 
	
	
	// C/S context
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
	