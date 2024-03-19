

If (btnTrace)
	TRACE:C157
End if 


Form:C1466.ds.clearSession()

Form:C1466.salesPerson:=Form:C1466.ds.getSalesPerson()
Form:C1466.company:=Form:C1466.ds.getSelectedCompany()

Form:C1466.companies.currentValue:=""
Form:C1466.companies.index:=-1

Form:C1466.customers:=Null:C1517