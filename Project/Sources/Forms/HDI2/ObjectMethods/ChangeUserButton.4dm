


Form:C1466.ds.changeCurrentUser(Form:C1466.selectedSales2)

//CHANGE CURRENT USER(Form.selectedSales2.userName; "a")

Form:C1466.salesPerson:=Form:C1466.ds.getSalesPerson()
Form:C1466.selectedSalesCustomers:=Form:C1466.salesPerson.customers

FORM GOTO PAGE:C247(5)
