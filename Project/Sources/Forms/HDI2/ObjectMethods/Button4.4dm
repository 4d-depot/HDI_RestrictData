


$result:=Form:C1466.ds.authenticate(Form:C1466.identifier; Form:C1466.password)

If ($result="OK")
	Form:C1466.salesPerson:=Form:C1466.ds.getSalesPerson()
	Form:C1466.selectedSalesCustomers:=Form:C1466.salesPerson.theCustomers
	OBJECT SET VISIBLE:C603(*; "Error"; False:C215)
	FORM GOTO PAGE:C247(4)
Else 
	Form:C1466.result:=$result
	OBJECT SET VISIBLE:C603(*; "Error"; True:C214)
End if 
//RESTRequest