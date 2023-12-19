


var $works : cs:C1710.WorkingSelection

$category:=Form:C1466.categoryA ? "A" : "B"



$works:=Form:C1466.selectedSales.workings.query("company.name = :1 and category = :2"; Form:C1466.selectedCompany.name; $category)

If ($works.length=0)
	$work:=Form:C1466.ds.Working.new()
	$work.salesPerson:=Form:C1466.selectedSales
	$work.category:=Form:C1466.categoryA ? "A" : "B"
	$work.company:=Form:C1466.selectedCompany
	$status:=$work.save()
	
	$status:=Form:C1466.selectedSales.reload()
	
	
	//$formula:=Formula(This.workings.length=2)
	//$companies:=Form.selectedSales.companies.query($formula)
	
	//Form.companies:={values: Form.ds.Companies.all().minus($companies).orderBy("name").name}
	
	
	LISTBOX SELECT ROWS:C1715(*; "CustomersLB"; Form:C1466.selectedSales.theCustomers; lk replace selection:K53:1)
	
	
End if 





