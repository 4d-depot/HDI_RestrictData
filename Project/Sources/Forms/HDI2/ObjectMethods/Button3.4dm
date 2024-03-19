

If (btnTrace)
	TRACE:C157
End if 

var $work : cs:C1710.WorkingEntity
var $works : cs:C1710.WorkingSelection
var $status : Object




$works:=Form:C1466.selectedSales.workings.query("company.name = :1"; Form:C1466.selectedCompany.name)

If ($works.length=0)
	$work:=Form:C1466.ds.Working.new()
	$work.salesPerson:=Form:C1466.selectedSales
	$work.company:=Form:C1466.selectedCompany
	$status:=$work.save()
	
	$status:=Form:C1466.selectedSales.reload()
	
	
	LISTBOX SELECT ROWS:C1715(*; "CustomersLB"; Form:C1466.selectedSales.customers; lk replace selection:K53:1)
	
	
End if 





