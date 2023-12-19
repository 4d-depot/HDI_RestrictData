Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		Form:C1466.connect:={hostname: "127.0.0.1:8044"}
		Form:C1466.ds:=Open datastore:C1452(Form:C1466.connect; "remoteDS")
		
		Form:C1466.ds.clearSession()
		
		Form:C1466.categoryA:=True:C214
		
		Form:C1466.salesPersons:=Form:C1466.ds.SalesPersons.all()
		
		Form:C1466.selectedSales:=Form:C1466.salesPersons.first()
		
		
		//$formula:=Formula(This.workings.length=2)
		
		//$companies:=Form.selectedSales.companies.query($formula)
		
		//Form.companies:={values: Form.ds.Companies.all().minus($companies).orderBy("name").name}
		Form:C1466.companies:={values: Form:C1466.ds.Companies.all().name}
		
		
		Use (Storage:C1525)
			Storage:C1525.allCustomers:=Form:C1466.ds.Customers.all()
		End use 
		
		Form:C1466.allCustomers:=Storage:C1525.allCustomers
		
		
		Form:C1466.meta:=New object:C1471("fill"; "#cae8d7")
		
		LISTBOX SELECT ROW:C912(*; "SalesLB"; 1; lk replace selection:K53:1)
		
		LISTBOX SELECT ROWS:C1715(*; "CustomersLB"; Form:C1466.selectedSales.theCustomers; lk replace selection:K53:1)
		
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		If (FORM Get current page:C276=2)
			Form:C1466.ds.clearSession()
		End if 
		
		
		If (FORM Get current page:C276=3)
			LISTBOX SELECT ROW:C912(*; "SalesLB2"; 1; lk replace selection:K53:1)
			Form:C1466.identifier:=Form:C1466.selectedSales.users.first().identifier
			Form:C1466.password:="a"
		End if 
		
		
		If (FORM Get current page:C276=4)
			Form:C1466.companies.currentValue:=""
			Form:C1466.companies.index:=-1
		End if 
		
End case 

