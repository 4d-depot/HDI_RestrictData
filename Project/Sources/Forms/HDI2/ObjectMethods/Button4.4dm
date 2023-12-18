




//Form.request:="http://127.0.0.1:8044/rest/$catalog/authenticate"

//Form.body:=New collection(Form.identifier; Form.password)

//Form.body:={identifier: Form.identifier; password: Form.password}

$result:=Form:C1466.ds.authenticate(Form:C1466.identifier; Form:C1466.password)

If ($result="OK")
	Form:C1466.salesPerson:=Form:C1466.ds.getSalesPerson()
	FORM GOTO PAGE:C247(4)
Else 
End if 
//RESTRequest