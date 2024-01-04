//%attributes = {}

C_LONGINT:C283($i; $n)


If (Is Windows:C1573)
	For each ($text; Infos)
		ST SET ATTRIBUTES:C1093($text; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14)
	End for each 
	
	For each ($text; otherInfos)
		ST SET ATTRIBUTES:C1093($text; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14)
	End for each 
	
	
	For each ($text; linesCode)
		ST SET ATTRIBUTES:C1093($text; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 12; Attribute italic style:K65:2; 1)
	End for each 
End if 


If (Is macOS:C1572)
	For each ($text; Infos)
		ST SET ATTRIBUTES:C1093($text; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)
	End for each 
	
	For each ($text; otherInfos)
		ST SET ATTRIBUTES:C1093($text; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)
	End for each 
	
	For each ($text; linesCode)
		ST SET ATTRIBUTES:C1093($text; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14; Attribute italic style:K65:2; 1)
	End for each 
	
End if 