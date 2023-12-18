


Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		Form:C1466.identifier:=Form:C1466.selectedSales.users.first().identifier
		Form:C1466.password:="a"
		
		Case of 
			: (Form event code:C388=On Selection Change:K2:29)
				
				LISTBOX SELECT ROWS:C1715(*; "CustomersLB2"; Form:C1466.selectedSales.theCustomers; lk replace selection:K53:1)
				
				
		End case 
		
End case 