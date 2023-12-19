



var $work : cs:C1710.WorkingEntity

If (Form:C1466.selectedWorking#Null:C1517)
	
	$status:=Form:C1466.selectedWorking.drop()
	
	$status:=Form:C1466.selectedSales.reload()
	
	
	//$formula:=Formula(This.workings.length=2)
	
	//$companies:=Form.selectedSales.companies.query($formula)
	
	//Form.companies:={values: Form.ds.Companies.all().minus($companies).orderBy("name").name}
	
	LISTBOX SELECT ROWS:C1715(*; "CustomersLB"; Form:C1466.selectedSales.theCustomers; lk replace selection:K53:1)
	
End if 

