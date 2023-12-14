


Form:C1466.selectedCompany:=Form:C1466.ds.Companies.query("name = :1"; Form:C1466.companiesData.currentValue).first()

Form:C1466.ds.selectCompany(Form:C1466.selectedCompany)

