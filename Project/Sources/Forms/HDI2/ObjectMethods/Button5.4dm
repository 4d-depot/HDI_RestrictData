



var $work : cs:C1710.WorkingEntity



$status:=Form:C1466.selectedWorking.drop()

$status:=Form:C1466.selectedSales.reload()


$formula:=Formula:C1597(This:C1470.workings.length=2)

$companies:=Form:C1466.selectedSales.companies.query($formula)

Form:C1466.companies:={values: Form:C1466.ds.Companies.all().minus($companies).orderBy("name").name}

LISTBOX SELECT ROWS:C1715(*; "CustomersLB"; Form:C1466.selectedSales.theCustomers; lk replace selection:K53:1)

