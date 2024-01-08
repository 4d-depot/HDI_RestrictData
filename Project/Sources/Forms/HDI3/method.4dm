//

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ST SET ATTRIBUTES:C1093(LinesCode{3}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 18)
		
		Form:C1466.customersDC:=LinesCode{3}
		
End case 