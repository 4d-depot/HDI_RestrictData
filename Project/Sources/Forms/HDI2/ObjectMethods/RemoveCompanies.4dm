


var $notDropped : cs:C1710.WorkingSelection
var $status : Object



If (Form:C1466.selectedWorkings#Null:C1517)
	$notDropped:=Form:C1466.selectedWorkings.drop()
	$status:=Form:C1466.selectedSales.reload()
	LISTBOX SELECT ROWS:C1715(*; "CustomersLB"; Form:C1466.selectedSales.customers; lk replace selection:K53:1)
End if 

