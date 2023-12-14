


var $works : cs:C1710.WorkingSelection


$works:=Form:C1466.selectedSales.workings.query("company.name = :1 and category = :2"; Form:C1466.selectedCompany.name; Form:C1466.categories.currentValue)

If ($works.length=0)
	$work:=Form:C1466.ds.Working.new()
	
	$work.salesPerson:=Form:C1466.selectedSales
	$work.category:=Form:C1466.categories.currentValue
	$work.company:=Form:C1466.selectedCompany
	
	$status:=$work.save()
	
	$status:=Form:C1466.selectedSales.reload()
	
	
	$formula:=Formula:C1597(This:C1470.workings.length=2)
	
	$companies:=Form:C1466.selectedSales.companies.query($formula)
	
	Form:C1466.companies:=Form:C1466.ds.Companies.all().minus($companies).orderBy("name")
	
End if 





