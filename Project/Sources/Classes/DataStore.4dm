Class extends DataStoreImplementation




exposed Function authenticate($identifier : Text; $password : Text) : Text
	
	//exposed Function authenticate($params : Object) : Text
	
	//$identifier:=$params.identifier
	//$password:=$params.password
	
	var $user : cs:C1710.UsersEntity
	
	
	$user:=ds:C1482.Users.query("identifier = :1"; $identifier).first()
	
	If ($user#Null:C1517)
		If (Verify password hash:C1534($password; $user.password))
			Session:C1714.clearPrivileges()
			//Session.setPrivileges(New object("roles"; $user.role; "userName"; $user.firstname+" "+$user.lastname))
			Use (Session:C1714.storage)
				Session:C1714.storage.info:=New shared object:C1526()
				Use (Session:C1714.storage.info)
					Session:C1714.storage.info.salesPerson:=ds:C1482.SalesPersons.newSelection().add($user.salesPerson).copy(ck shared:K85:29)
				End use 
			End use 
			return "OK"
		Else 
			return "Authentication failed: wrong password"
		End if 
	Else 
		return "Authentication failed: wrong user"
	End if 
	
	
exposed Function selectCompany($company : cs:C1710.CompaniesEntity)
	Use (Session:C1714.storage.info)
		Session:C1714.storage.info.selectedCompany:=ds:C1482.Companies.newSelection().add($company).copy(ck shared:K85:29)
	End use 
	
exposed Function getSalesPerson() : cs:C1710.SalesPersonsEntity
	return Session:C1714.storage.info.salesPerson.first()