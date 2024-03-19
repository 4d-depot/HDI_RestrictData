
If (btnTrace)
	TRACE:C157
End if 


var $result : Text

$result:=Form:C1466.ds.authentify(Form:C1466.selectedSales.identifier; "a")

Form:C1466.salesPerson:=Form:C1466.ds.getSalesPerson()
Form:C1466.selectedSalesCustomers:=Form:C1466.salesPerson.customers

FORM GOTO PAGE:C247(5)
