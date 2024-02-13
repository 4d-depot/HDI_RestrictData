Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfoAndLinesCode
		
		managesTexts
		
		
		If (Application type:C494=4D Remote mode:K5:5)
			Form:C1466.ds:=ds:C1482
		Else 
			Form:C1466.connect:={hostname: "127.0.0.1:8044"}
			Form:C1466.ds:=Open datastore:C1452(Form:C1466.connect; "remoteDS")
		End if 
		
		Form:C1466.ds.clearSession()
		Form:C1466.ds.clearStorage()
		
		Form:C1466.categoryA:=True:C214
		
		Form:C1466.salesPersons:=Form:C1466.ds.SalesPersons.all()
		
		Form:C1466.selectedSales:=Form:C1466.salesPersons.first()
		
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
			Form:C1466.ds.clearStorage()
			
			OBJECT SET ENABLED:C1123(*; "RemoveCompanies"; Form:C1466.selectedWorkings#Null:C1517)
			
		End if 
		
		
		If (FORM Get current page:C276=3)
			
			OBJECT SET ENABLED:C1123(*; "AuthenticateButton"; Application type:C494#4D Remote mode:K5:5)
			OBJECT SET ENABLED:C1123(*; "ChangeUserButton"; Application type:C494=4D Remote mode:K5:5)
			
			If (Application type:C494=4D Remote mode:K5:5)
				LISTBOX SELECT ROW:C912(*; "SalesLB2"; 1; lk replace selection:K53:1)
				Form:C1466.currentUser:=Current user:C182()
			Else 
				LISTBOX SELECT ROW:C912(*; "SalesLB1"; 1; lk replace selection:K53:1)
				Form:C1466.identifier:=Form:C1466.selectedSales.users.first().identifier
				Form:C1466.password:="a"
			End if 
		End if 
		
		
		If (FORM Get current page:C276=4)
			Form:C1466.companies.currentValue:=""
			Form:C1466.companies.index:=-1
			
			OBJECT SET VISIBLE:C603(*; "UserName"; Application type:C494=4D Remote mode:K5:5)
			OBJECT SET ENABLED:C1123(*; "AllCustomers"; False:C215)
			OBJECT SET ENABLED:C1123(*; "ClearSession"; False:C215)
			
			OBJECT SET ENABLED:C1123(*; "ClearStorage"; Application type:C494=4D Remote mode:K5:5)
			OBJECT SET ENABLED:C1123(*; "ClearSession"; Application type:C494#4D Remote mode:K5:5)
			
			Form:C1466.customers:=Null:C1517
			
		End if 
		
		managesTexts
		
End case 

