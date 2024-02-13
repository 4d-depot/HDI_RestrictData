

Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		Form:C1466.selectedCompany:=Form:C1466.ds.Companies.query("name = :1"; Form:C1466.companies.currentValue).first()
		
		Form:C1466.ds.selectCompany(Form:C1466.selectedCompany)
		
		OBJECT SET ENABLED:C1123(*; "AllCustomers"; True:C214)
		
		OBJECT SET ENABLED:C1123(*; "ClearStorage"; Application type:C494=4D Remote mode:K5:5)
		OBJECT SET ENABLED:C1123(*; "ClearSession"; Application type:C494#4D Remote mode:K5:5)
		
End case 




