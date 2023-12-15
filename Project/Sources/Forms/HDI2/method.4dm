Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		Form:C1466.connect:={hostname: "127.0.0.1:8044"}
		Form:C1466.ds:=Open datastore:C1452(Form:C1466.connect; "remoteDS")
		
		
		Form:C1466.identifier:="user1@4d.com"
		Form:C1466.password:="a"
		
		Form:C1466.categories:={values: ["A"; "B"]}
		
		Form:C1466.salesPersons:=Form:C1466.ds.SalesPersons.all()
		
		Form:C1466.selectedSales:=Form:C1466.salesPersons.first()
		
		
		$formula:=Formula:C1597(This:C1470.workings.length=2)
		
		$companies:=Form:C1466.selectedSales.companies.query($formula)
		
		Form:C1466.companies:={values: Form:C1466.ds.Companies.all().minus($companies).orderBy("name").name}
		
		Form:C1466.customers:=Form:C1466.ds.Customers.all()
		
		
		
		
	: (Form event code:C388=On Page Change:K2:54)
		Form:C1466.ds.clearSession()
		
		LISTBOX SELECT ROW:C912(*; "SalesLB"; 1; lk replace selection:K53:1)
		
		LISTBOX SELECT ROWS:C1715(*; "CustomersLB"; Form:C1466.selectedSales.theCustomers; lk replace selection:K53:1)
		
End case 

