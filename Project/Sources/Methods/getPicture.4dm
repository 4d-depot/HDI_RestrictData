//%attributes = {}

C_PICTURE:C286($0; $pict)
C_TEXT:C284($path)



If (Picture size:C356($pict)=0)
	//$path:=Get 4D folder(Current resources folder)+"Images"+Folder separator+"Info.png"
	
	
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"trash-can-solid.svg"
	READ PICTURE FILE:C678($path; $pict)
End if 


$0:=$pict



