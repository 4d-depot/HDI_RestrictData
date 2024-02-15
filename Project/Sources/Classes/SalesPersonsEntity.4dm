Class extends Entity


exposed Alias customers workings.company.customers





exposed Function get fullName() : Text
	return This:C1470.firstname+" "+This:C1470.lastname
	
	
	//----------------------------------------------
	// QODLY
	//----------------------------------------------
exposed Function associateSalesCompany($company : cs:C1710.CompaniesEntity)
	
	var $work : cs:C1710.WorkingEntity
	var $works : cs:C1710.WorkingSelection
	var $status : Object
	
	$works:=This:C1470.workings.query("company.name = :1"; $company.name)
	
	If ($works.length=0)
		$work:=ds:C1482.Working.new()
		$work.salesPerson:=This:C1470
		//$work.category:=$category
		$work.company:=$company
		$status:=$work.save()
		$work.company.reload()
		This:C1470.reload()
	End if 
	
	
	
	