




//Form.request:="http://127.0.0.1:8044/rest/$catalog/authenticate"

//Form.body:=New collection(Form.identifier; Form.password)

//Form.body:={identifier: Form.identifier; password: Form.password}

$result:=Form:C1466.ds.authenticate(Form:C1466.identifier; Form:C1466.password)

Form:C1466.salesPerson:=Form:C1466.ds.getSalesPerson()

Form:C1466.salesPersonsWorking:=Form:C1466.salesPerson.workings


Form:C1466.companiesData:={values: Form:C1466.salesPerson.companies.name}
Form:C1466.companiesData.currentValue:=""


//RESTRequest