

If (btnTrace)
	TRACE:C157
End if 



Form:C1466.selectedCompany:=Form:C1466.ds.Companies.query("name = :1"; Form:C1466.companies.currentValue).first()
