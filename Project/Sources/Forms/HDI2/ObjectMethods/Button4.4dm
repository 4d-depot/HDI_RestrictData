


$result:=Form:C1466.ds.authenticate(Form:C1466.identifier; Form:C1466.password)

Form:C1466.salesPerson:=Form:C1466.ds.getSalesPerson()
Form:C1466.selectedSalesCustomers:=Form:C1466.salesPerson.theCustomers

FORM GOTO PAGE:C247(4)
