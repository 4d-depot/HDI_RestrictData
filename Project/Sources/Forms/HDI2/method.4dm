Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		Form:C1466.connect:={hostname: "127.0.0.1:8044"}
		Form:C1466.ds:=Open datastore:C1452(Form:C1466.connect; "remoteDS")
		
		
		Form:C1466.identifier:="user1@4d.com"
		Form:C1466.password:="a"
		
		Form:C1466.categories:={values: ["A"; "B"]}
		
		Form:C1466.salesPersons:=Form:C1466.ds.SalesPersons.all().slice(0; 3)
		
		Form:C1466.selectedSales:=Form:C1466.salesPersons.first()
		
		
		$formula:=Formula:C1597(This:C1470.workings.length=2)
		
		$companies:=Form:C1466.selectedSales.companies.query($formula)
		
		Form:C1466.companies:=Form:C1466.ds.Companies.all().minus($companies).orderBy("name")
		
End case 

