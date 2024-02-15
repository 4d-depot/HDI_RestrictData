

Form:C1466.ds.changeCurrentUser(Form:C1466.selectedSales2)

Form:C1466.salesPerson:=Form:C1466.ds.getSalesPerson()
Form:C1466.selectedSalesCustomers:=Form:C1466.salesPerson.theCustomers

FORM GOTO PAGE:C247(5)
